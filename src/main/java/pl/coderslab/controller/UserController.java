package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.Role;
import pl.coderslab.entity.User;
import pl.coderslab.repository.RoleRepository;
import pl.coderslab.repository.UserRepository;
import pl.coderslab.service.UserService;
import pl.coderslab.validator.NewUserValidator;
import pl.coderslab.validator.UserLogValidator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "user/registration";
    }

    @PostMapping("/registration")
    public String registration(@ModelAttribute("userForm") User userForm,
                               BindingResult bindingResult,
                               HttpSession session) {

        newUserValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "user/registration";
        }

        userService.save(userForm);
        session.setAttribute("currentUser", userForm);
        session.setAttribute("currentUserRoles", userService.getRolesList(userForm));
        return "user/teacher";
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

        return "redirect:"+request.getContextPath()+"/user/list";
    }



    @RequestMapping("/list")
    public String showAll(Model model){
        model.addAttribute("users", userRepository.findAll());
        return "user/list";
    }


    @GetMapping("/edit/{id}")
    public String add(
            Model model,
            @PathVariable Long id){

        model.addAttribute("user", userRepository.findOne(id));
        return "user/account";
    }

    @RequestMapping("/delete/{id}")
    public String delete(
            @PathVariable Long id,
            HttpServletRequest request,
            HttpSession session){
        userService.delete(session,id);
        return "redirect:"+request.getContextPath()+"/home";
    }

    @GetMapping("/student")
    public String home1Sender(){

        return "student";
    }

    @GetMapping("/teacher")
    public String home2Sender(){

        return "teacher";
    }

    @ModelAttribute("users")
    public List<User> users (){return userRepository.findAll();}

    @ModelAttribute("roles")
    public List<Role> roles(){return roleRepository.findAll();}

}

