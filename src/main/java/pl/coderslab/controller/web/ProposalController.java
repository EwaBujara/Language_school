package pl.coderslab.controller.web;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.ArrayList;
import java.util.stream.Collectors;

@Controller
public class ProposalController {

    @RequestMapping("/proposal")
    public String showProposal(Model model) throws IOException {

//        Document doc = Jsoup.connect("https://learnenglish.britishcouncil.org/learnenglish-podcasts").get();
//        Document doc = Jsoup.connect("https://www.bbc.co.uk/podcasts").get();
        Document doc = Jsoup.connect("https://www.podcastsinenglish.com").get();

        ArrayList<String > links = new ArrayList<>();
        links = (ArrayList<String>) doc.select("a")
                .stream()
                .map(element -> String.valueOf(element))
                .filter(element -> element.contains("podcast"))
                .filter(element -> !element.contains("iTun"))
//                .filter(element -> element.contains("all"))
                .limit(10)
                .peek(System.out::println)
                .collect(Collectors.toList());

        model.addAttribute("links", links);
        return "group/proposal";
    }
}
