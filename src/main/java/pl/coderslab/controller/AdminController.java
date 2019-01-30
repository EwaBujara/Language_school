package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.entity.Group;
import pl.coderslab.entity.Role;
import pl.coderslab.entity.User;
import pl.coderslab.repository.RoleRepository;
import pl.coderslab.repository.UserRepository;

import javax.transaction.Transactional;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    RoleRepository roleRepository;
    @GetMapping("/edit/{id}")
    @Transactional
    public String add(
            Model model,
            @PathVariable Long id){

        User user = userRepository.findOne(id);
        model.addAttribute("user", user);
        List<Group> groups = user.getGroups();
        model.addAttribute("groups",groups);
        return "admin/completeUserAccount";
    }

    @ModelAttribute("users")
    public List<User> users (){return userRepository.findAll();}

    @ModelAttribute("roles")
    public List<Role> roles(){return roleRepository.findAll();}
}
