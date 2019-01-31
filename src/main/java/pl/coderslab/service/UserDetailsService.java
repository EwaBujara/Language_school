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

    public UserDTO parseToDTO(User user, UserDetails userDetails){

        UserDTO userDTO = new UserDTO();

        userDTO.setUsername(user.getUsername());
        userDTO.setEmail(user.getEmail());
        userDTO.setPassword(user.getPassword());
        userDTO.setEnabled(user.isEnabled());
        userDTO.setRoles(roleRepository.findAllByUsers(Arrays.asList(user)));
        userDTO.setGroups(groupRepository.findByMembers(user));
        if(null == userDetails.getDescription()){
            userDTO.setDescription("");
        }else {

            userDTO.setDescription(userDetails.getDescription());
        }

        if(userDetails.getAddress() == null){
            userDTO.setAddress("");
        }else {

            userDTO.setAddress(userDetails.getAddress());
        }
        if(userDetails.getAccountNumber()==null){
            userDTO.setAccountNumber("");
        }else {

            userDTO.setAccountNumber(userDetails.getAccountNumber());
        }
        return userDTO;
    }

    public User parseToUser(UserDTO userDTO){

        User user = userRepository.findByUsername(userDTO.getUsername());
        user.setEnabled(userDTO.isEnabled());
        user.setGroups(userDTO.getGroups());
        user.setRoles(userDTO.getRoles());
        return user;
    }

    public UserDetails parseToUserDetails(UserDTO userDTO){
        UserDetails userDetails = userDetailsRepository.findByUserUsername(userDTO.getUsername());
        userDetails.setDescription(userDTO.getDescription());
        userDetails.setAddress(userDTO.getAddress());
        userDetails.setAccountNumber(userDTO.getAccountNumber());
        return userDetails;
    }
}
