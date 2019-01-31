package pl.coderslab.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.entity.Link;
import pl.coderslab.repository.LinkRepository;

public class LinkConverter implements Converter<String, Link> {

    @Autowired
    LinkRepository linkRepository;

    @Override
    public Link convert(String s) {
        return linkRepository.findOne(Long.parseLong(s));
    }
}
