package pl.coderslab.controller.web;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class HomeController {

    @GetMapping("/home")
    public String homeSender(HttpSession session) throws IOException {
        session.invalidate();
        return "index";
    }


}