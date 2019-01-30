package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.repository.GroupRepository;
import pl.coderslab.repository.UserRepository;
import pl.coderslab.service.UserService;

@Controller
@RequestMapping("/group")
public class GroupController {

    @Autowired
    UserService userService;

    @Autowired
    UserRepository userRepository;

    @Autowired
    GroupRepository groupRepository;

    @GetMapping("/{id}")
    public String marketplace(Model model, @PathVariable Long id){
        model.addAttribute("group", groupRepository.findOne(id));
        return "group/marketplace";
    }

    @GetMapping("/list/{id}")
    public String showAllUserGroups(Model model, @PathVariable Long id){
        model.addAttribute("groups", userService.getGroupList(id));
        return "group/list";
    }

    @GetMapping("/members/{id}")
    public String showAllGroupUsers(Model model, @PathVariable Long id){

        model.addAttribute("users", userRepository.findAllByGroups(groupRepository.findOne(id)));
        return "user/list";
    }
}
