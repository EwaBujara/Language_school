package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.repository.GroupRepository;
import pl.coderslab.repository.UserRepository;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    GroupRepository groupRepository;

    @Autowired
    UserRepository userRepository;

    @GetMapping
    public String panelAccess(){
        return "admin/panel";
    }

    @GetMapping("/groupList")
    public String showAllGroups(Model model){
        model.addAttribute("groups", groupRepository.findAll());
        return "group/list";
    }

    @RequestMapping("/memberList")
    public String showAllMembers(Model model){
        model.addAttribute("users", userRepository.findAll());
        return "user/list";
    }
}
