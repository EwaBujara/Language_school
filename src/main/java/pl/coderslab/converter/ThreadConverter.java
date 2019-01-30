package pl.coderslab.converter;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.entity.Thread;
import pl.coderslab.repository.ThreadRepository;

public class ThreadConverter implements Converter<String, Thread> {

    @Autowired
    private ThreadRepository threadRepository;

    @Override
    public Thread convert(String s) {
        return threadRepository.findOne(Long.parseLong(s));
    }
}
