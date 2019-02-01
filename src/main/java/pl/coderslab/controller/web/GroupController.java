package pl.coderslab.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.Group;
import pl.coderslab.entity.Link;
import pl.coderslab.repository.GroupRepository;
import pl.coderslab.repository.LinkRepository;
import pl.coderslab.repository.UserRepository;
import pl.coderslab.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
@RequestMapping("/group")
public class GroupController {

    @Autowired
    UserService userService;

    @Autowired
    UserRepository userRepository;

    @Autowired
    GroupRepository groupRepository;

    @Autowired
    LinkRepository linkRepository;

    @GetMapping("/{id}")
    public String marketplace(Model model, @PathVariable Long id){
        Group group = groupRepository.findOne(id);
        model.addAttribute("group", group);
        model.addAttribute("links", linkRepository.findAllByGroup(group));
        return "group/marketplace";
    }

    @GetMapping("/{groupId}/addLink")
    public String addNewLink(Model model, @PathVariable Long groupId){
        Link link = new Link();
        model.addAttribute("link", link);
        model.addAttribute("groupId", groupId);
        return "link/form";
    }

    @PostMapping("/{groupId}/addLink")
    public String addNewLink(@Valid Link link, BindingResult errors,
                             @PathVariable Long groupId,
                             HttpServletRequest request){
        if(errors.hasErrors()){
            return "link/form";
        }

        Group group = groupRepository.findOne(groupId);
        link.setGroup(group);
        linkRepository.save(link);
        return "redirect:"+request.getContextPath()+"/group/"+groupId;
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

    @RequestMapping("deleteLink/{id}")
    public String deleteLink(@PathVariable Long id, HttpServletRequest request){
        Link link = linkRepository.findOne(id);
        Long groupId = link.getGroup().getId();
        linkRepository.delete(link);
        return "redirect:"+request.getContextPath()+"/group/"+groupId;
    }
}
