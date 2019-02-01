package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.dto.UserDTO;
import pl.coderslab.entity.Group;
import pl.coderslab.entity.Role;
import pl.coderslab.entity.User;
import pl.coderslab.entity.UserDetails;
import pl.coderslab.repository.GroupRepository;
import pl.coderslab.repository.RoleRepository;
import pl.coderslab.repository.UserDetailsRepository;
import pl.coderslab.repository.UserRepository;
import pl.coderslab.service.UserDetailsService;
import pl.coderslab.service.UserService;
import pl.coderslab.validator.NewUserValidator;
import pl.coderslab.validator.UserLogValidator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    UserService userService;

    @Autowired
    private NewUserValidator newUserValidator;

    @Autowired
    private UserLogValidator userLogValidator;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private GroupRepository groupRepository;

    @Autowired
    private UserDetailsRepository userDetailsRepository;

    @Autowired
    UserDetailsService userDetailsService;

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "user/registration";
    }

    @PostMapping("/registration")
    public String registration(@ModelAttribute("userForm") User userForm,
                               BindingResult bindingResult,
                               HttpServletRequest request,
                               HttpSession session) {

        newUserValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "user/registration";
        }

        userService.save(userForm);
        session.setAttribute("currentUser", userForm);
        session.setAttribute("currentUserRoles", userService.getRolesList(userForm));
        session.setAttribute("currentUserGroups", userService.getGroupsName(userForm));

        return "redirect:"+request.getContextPath()+"/group/1";
    }

    @GetMapping("/login")
    public String login(Model model){
        model.addAttribute("userLog", new User());

        return "user/login";
    }

    @PostMapping("login")
    public String login(@ModelAttribute("userLog") User userLog,
                        BindingResult bindingResult,
                        HttpServletRequest request,
                        HttpSession session){

        userLogValidator.validate(userLog, bindingResult);

        if (bindingResult.hasErrors()){
            return "user/login";
        }

        User currentUser = userRepository.findByEmail(userLog.getEmail());
        session.setAttribute("currentUser", currentUser);
        session.setAttribute("currentUserRoles", userService.getRolesList(currentUser));
        session.setAttribute("currentUserGroups", userService.getGroupsName(currentUser));

        return "redirect:"+request.getContextPath()+"/group/1";
    }



    @GetMapping("/show/{id}")
    @Transactional
    public String show(
            Model model,
            @PathVariable Long id
    ){

        User user = userRepository.findOne(id);
        model.addAttribute("user", user);
        List<Group> groups = userService.getGroupList(id);
        model.addAttribute("groups",groups);
        return "user/account";

    }



//    @Transactional
    @GetMapping("/edit/{userId}")
    public String add(
            Model model,
            @PathVariable Long userId){

        User user = userRepository.findOne(userId);
        UserDetails userDetails = userDetailsRepository.findByUserUsername(user.getUsername());
        UserDTO userDTO = userDetailsService.parseToDTO(user, userDetails);

        model.addAttribute("userDTO",userDTO);
        model.addAttribute("userId", userId);
        return "user/form";
    }

    @PostMapping("/edit/{userId}")
    public String add(@ModelAttribute("userDTO") UserDTO userDTO,
                      @PathVariable Long userId,
                      HttpServletRequest request,
                      HttpSession session){

        userDetailsService.userDataEditor(userDTO, userId, session);

        return "redirect:"+request.getContextPath()+"/user/show/"+userId;
    }

    @ModelAttribute("users")
    public List<User> users (){return userRepository.findAll();}

    @ModelAttribute("roles")
    public List<Role> roles(){return roleRepository.findAll();}

    @ModelAttribute("groups")
    public List<Group> groups(){return groupRepository.findAll();}
}

