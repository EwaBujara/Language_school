package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.repository.ThreadRepository;

@RequestMapping("/forum")
@Controller
public class ThreadController {

    @Autowired
    ThreadRepository threadRepository;

    @GetMapping("/{id}")
    public String showAllThreads(Model model, @PathVariable Long id){
        model.addAttribute("threads", threadRepository.findAllByGroupId(id));
        model.addAttribute("groupId", id);
        return "thread/list";
    }

    @GetMapping("/{groupId}/thread/{id}")
    public String showThread(Model model, @PathVariable Long id, @PathVariable Long groupId){

        return "";
    }
}
