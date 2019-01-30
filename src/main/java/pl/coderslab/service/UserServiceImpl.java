package pl.coderslab.service;


import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.entity.Group;
import pl.coderslab.entity.Role;
import pl.coderslab.entity.User;
import pl.coderslab.repository.GroupRepository;
import pl.coderslab.repository.RoleRepository;
import pl.coderslab.repository.UserRepository;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private GroupRepository groupRepository;

    @Override
    public void save(User user) {
        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
        if(user.getRoles().size()==0){
            user.setRoles(Arrays.asList(roleRepository.findByName("User")));
        }
        user.setGroups(Arrays.asList(groupRepository.findByName("Bucket")));
        user.setEnabled(true);
        userRepository.save(user);
    }

    @Override
    public boolean verify(User user) {
        if(userRepository.findByEmail(user.getEmail())!=null){

            return BCrypt.checkpw(user.getPassword(), (userRepository.findByEmail(user.getEmail())).getPassword());
        }
        else return false;
    }

    @Override
    public void delete(HttpSession session, Long id) {
        User user = userRepository.findOne(id);
        User currentUser = (User) session.getAttribute("currentUser");
        if(
                currentUser!=null &&
                        user!=null &&
                        (id.longValue()==currentUser.getId().longValue()
                                || getRolesList(currentUser).contains("ROLE_ADMIN")
                        )
        )
        {
            userRepository.delete(user);
        }
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public List<String> getRolesList(User user) {
        return user.getRoles()
                .stream()
                .map(Role::getName)
                .collect(Collectors.toList());
    }

    @Override
    public List<Group> getGroupList(Long id) {

        User user = userRepository.findOne(id);
        return groupRepository.findByMembers(user);
    }

    @Override
    public List<String> getGroupsName(User user) {
        return getGroupList(user.getId())
                .stream()
                .map(Group::getName)
                .collect(Collectors.toList());
    }
}