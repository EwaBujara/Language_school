package pl.coderslab.controller.web;

import com.sun.tracing.dtrace.ProviderAttributes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.entity.Comment;
import pl.coderslab.entity.Thread;
import pl.coderslab.entity.User;
import pl.coderslab.repository.CommentRepository;
import pl.coderslab.repository.GroupRepository;
import pl.coderslab.repository.ThreadRepository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@RequestMapping("/forum")
@Controller
public class ThreadController {

    @Autowired
    ThreadRepository threadRepository;

    @Autowired
    GroupRepository groupRepository;

    @Autowired
    CommentRepository commentRepository;

    @GetMapping("/{groupId}")
    public String showAllThreads(Model model, @PathVariable Long groupId){
        model.addAttribute("threads", threadRepository.findAllByGroupId(groupId));
        model.addAttribute("groupId", groupId);
        return "thread/list";
    }

    @GetMapping("/{groupId}/thread/{id}")
    public String showThread(Model model, @PathVariable Long id, @PathVariable Long groupId){
        Thread thread = threadRepository.findOne(id);
        model.addAttribute("thread", thread);
        model.addAttribute("groupId", groupId);
        model.addAttribute("comments", commentRepository.findAllByThreadOrderByCreatedDesc(thread));
        return "thread/thread";
    }

    @GetMapping("/{groupId}/add")
    public String add(Model model, @PathVariable Long groupId){
        model.addAttribute("thread", new Thread());
        model.addAttribute("groupId", groupId);
        return "thread/form";
    }

    @PostMapping("/{groupId}/add")
    public String add(@Valid Thread thread, BindingResult errors,
                      @PathVariable Long groupId,
                      HttpServletRequest request,
                      HttpSession session){

        if(errors.hasErrors()){
            return "thread/form";
        }
        User user = (User)session.getAttribute("currentUser");
        thread.setUser(user);
        thread.setGroup(groupRepository.findOne(groupId));
        threadRepository.save(thread);
        return "redirect:"+request.getContextPath()+"/forum/"+groupId;
    }

    @GetMapping("/{groupId}/thread/{threadId}/addComment")
    public String addComment(Model model, @PathVariable Long threadId, @PathVariable Long groupId){
        Comment comment = new Comment();
        comment.setThread(threadRepository.findOne(threadId));
        model.addAttribute("comment",comment);
        model.addAttribute("groupId", groupId);
        return "comment/form";
    }

    @PostMapping("/{groupId}/thread/{threadId}/addComment")
    public String add(@Valid Comment comment, BindingResult errors,
                      HttpServletRequest request,
                      @PathVariable Long groupId,
                      @PathVariable Long threadId,
                      HttpSession session){

        User user = (User)session.getAttribute("currentUser");
        comment.setUser(user);
        Thread thread = threadRepository.findOne(threadId);
        comment.setThread(thread);

        if(errors.hasErrors()){
            return "comment/form";
        }
        commentRepository.save(comment);
        return "redirect:"+request.getContextPath()+"/forum/"+groupId+"/thread/"+threadId;
    }

    @RequestMapping("/{groupId}/thread/{threadId}/deleteComment/{commentId}")
    public String deleteComment(
            @PathVariable Long groupId,
            @PathVariable Long threadId,
            @PathVariable Long commentId,
            HttpServletRequest request){

        commentRepository.delete(commentRepository.findOne(commentId));
        return "redirect:"+request.getContextPath()+"/forum/"+groupId+"/thread/"+threadId;
    }
}
