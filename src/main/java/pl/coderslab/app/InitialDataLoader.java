package pl.coderslab.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import pl.coderslab.entity.Group;
import pl.coderslab.entity.Privilege;
import pl.coderslab.entity.Role;
import pl.coderslab.entity.User;
import pl.coderslab.repository.GroupRepository;
import pl.coderslab.repository.PrivilegeRepository;
import pl.coderslab.repository.RoleRepository;
import pl.coderslab.repository.UserRepository;
import pl.coderslab.service.UserService;

import javax.transaction.Transactional;
import java.util.Arrays;
import java.util.List;

@Component
public class InitialDataLoader implements
        ApplicationListener<ContextRefreshedEvent> {

    boolean alreadySetup = false;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private PrivilegeRepository privilegeRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private GroupRepository groupRepository;

    @Override
    @Transactional
    public void onApplicationEvent(ContextRefreshedEvent event) {

        if (alreadySetup)
            return;
        Privilege adminPrivilege = createPrivilegeIfNotFound("ADMIN_PRIVILEGE");
        Privilege teacherPrivilege = createPrivilegeIfNotFound("TEACHER_PRIVILEGE");
        Privilege studentPrivilege = createPrivilegeIfNotFound("STUDENT_PRIVILEGE");

        Role adminRole = createRoleIfNotFound("Admin", Arrays.asList(adminPrivilege));
        Role teacherRole = createRoleIfNotFound("Teacher", Arrays.asList(teacherPrivilege));
        Role userRole = createRoleIfNotFound("User", Arrays.asList(studentPrivilege));
        Group startGroup = createGroupIfNotFound("Bucket");

        User user = new User();
        user.setUsername("Admin");
        user.setPassword("Password");
        user.setEmail("admin@admin.com");
        user.setRoles(Arrays.asList(adminRole, teacherRole, userRole));
        user.setEnabled(true);
        user.setGroups(Arrays.asList(startGroup));
        userService.save(user);

        alreadySetup = true;
    }

    @Transactional
    public Privilege createPrivilegeIfNotFound(String name) {

        Privilege privilege = privilegeRepository.findByName(name);
        if (privilege == null) {
            privilege = new Privilege();
            privilege.setName(name);
            privilegeRepository.save(privilege);
        }
        return privilege;
    }

    @Transactional
    public Role createRoleIfNotFound(String name, List<Privilege> privileges) {

        Role role = roleRepository.findByName(name);
        if (role == null) {
            role = new Role();
            role.setName(name);
            role.setPrivileges(privileges);
            roleRepository.save(role);
        }
        return role;
    }

    @Transactional
    public Group createGroupIfNotFound(String name){
        Group group = groupRepository.findByName(name);
        if(group == null){
            group = new Group();
            group.setName(name);
            groupRepository.save(group);
        }
        return group;
    }
}
