package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.service.UserService;

@Controller
@RequestMapping("/group")
public class GroupController {

    @Autowired
    UserService userService;


    @GetMapping("/list/{id}")
    public String showAll(Model model, @PathVariable Long id){
        model.addAttribute("groups", userService.getGroupList(id));
        return "group/list";
    }
}
