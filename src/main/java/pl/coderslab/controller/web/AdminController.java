package pl.coderslab.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.entity.Group;
import pl.coderslab.entity.Link;
import pl.coderslab.repository.GroupRepository;
import pl.coderslab.repository.LinkRepository;
import pl.coderslab.repository.UserRepository;

import javax.persistence.GeneratedValue;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    GroupRepository groupRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    LinkRepository linkRepository;

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

    @GetMapping("/addGroup")
    public String addNewGroup(Model model){
        Group group = new Group();
        model.addAttribute("group", group);
        return "group/form";
    }

    @PostMapping("/addGroup")
    public String addNewGroup(@Valid Group group, BindingResult errors,
                              HttpServletRequest request){
        if(errors.hasErrors()){
            return "comment/form";
        }
        groupRepository.save(group);
        return "redirect:"+request.getContextPath()+"/admin";
    }

}
