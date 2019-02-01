package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.dto.UserDTO;
import pl.coderslab.entity.User;
import pl.coderslab.entity.UserDetails;
import pl.coderslab.repository.GroupRepository;
import pl.coderslab.repository.RoleRepository;
import pl.coderslab.repository.UserDetailsRepository;
import pl.coderslab.repository.UserRepository;

import javax.servlet.http.HttpSession;
import java.util.Arrays;

@Service
public class UserDetailsService {

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private GroupRepository groupRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserDetailsRepository userDetailsRepository;

    @Autowired
    private UserService userService;

    public UserDTO parseToDTO(User user, UserDetails userDetails){

        UserDTO userDTO = new UserDTO();

        userDTO.setUsername(user.getUsername());
        userDTO.setEmail(user.getEmail());
//        userDTO.setPassword(user.getPassword());
        userDTO.setEnabled(user.isEnabled());
        userDTO.setRoles(roleRepository.findAllByUsers(Arrays.asList(user)));
        userDTO.setGroups(groupRepository.findByMembers(user));
        if(userDetails!=null){
            userDTO.setDescription(userDetails.getDescription());
            userDTO.setAddress(userDetails.getAddress());
            userDTO.setAccountNumber(userDetails.getAccountNumber());
        }
        return userDTO;
    }

    public User parseToUser(UserDTO userDTO){

        User user = new User();
        user.setUsername(userDTO.getUsername());
        user.setEmail(userDTO.getEmail());
//        user.setPassword(userDTO.getPassword());
        user.setEnabled(userDTO.isEnabled());
        user.setGroups(userDTO.getGroups());
        user.setRoles(userDTO.getRoles());
        return user;
    }

    public UserDetails parseToUserDetails(UserDTO userDTO){
        UserDetails userDetails = new UserDetails();
        userDetails.setDescription(userDTO.getDescription());
        userDetails.setAddress(userDTO.getAddress());
        userDetails.setAccountNumber(userDTO.getAccountNumber());
        return userDetails;
    }

    public void userDataEditor(UserDTO userDTO,  Long userId, HttpSession session){
        User user = parseToUser(userDTO);
        UserDetails userDetails = parseToUserDetails(userDTO);
        User currentUser =(User) session.getAttribute("currentUser");
        User oldUser = userRepository.findOne(userId);
        UserDetails oldUserDetails = userDetailsRepository.findByUserUsername(oldUser.getUsername());

        if(userService.whoAmI(currentUser, "Admin")&&(oldUser.getId()==currentUser.getId())){
            oldUser.setRoles(user.getRoles());
            oldUser.setGroups(user.getGroups());
            oldUser.setEnabled(user.isEnabled());
            userRepository.save(oldUser);
            oldUserDetails.setDescription(userDetails.getDescription());
            oldUserDetails.setAddress(userDetails.getAddress());
            oldUserDetails.setAccountNumber(userDetails.getAccountNumber());
            userDetailsRepository.save(oldUserDetails);

        }else if (userService.whoAmI(currentUser, "Admin")&&(oldUser.getId()!=currentUser.getId()))
        {
            oldUser.setRoles(user.getRoles());
            oldUser.setGroups(user.getGroups());
            oldUser.setEnabled(user.isEnabled());
            userRepository.save(oldUser);

        }else {
            oldUserDetails.setDescription(userDetails.getDescription());
            oldUserDetails.setAddress(userDetails.getAddress());
            oldUserDetails.setAccountNumber(userDetails.getAccountNumber());
            userDetailsRepository.save(oldUserDetails);
        }
    }
}
