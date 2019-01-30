package pl.coderslab.app;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import pl.coderslab.converter.*;

@Configuration
@ComponentScan("pl.coderslab")
@EnableWebMvc
@EnableTransactionManagement
public class FormaterConfig implements WebMvcConfigurer {

    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(getLocalDateConverter());
        registry.addConverter(getUserConverter());
        registry.addConverter(getRoleConverter());
        registry.addConverter(getGroupConverter());
        registry.addConverter(getThreadConverter());
        registry.addConverter(getCommentConverter());
    }

    @Bean
    public LocalDateConverter getLocalDateConverter(){return new  LocalDateConverter();}

    @Bean
    public UserConverter getUserConverter(){return  new UserConverter();}

    @Bean
    public RoleConverter getRoleConverter(){return new RoleConverter();}

    @Bean
    public GroupConverter getGroupConverter(){return new GroupConverter(); }

    @Bean
    public ThreadConverter getThreadConverter(){return new ThreadConverter(); }

    @Bean
    public CommentConverter getCommentConverter(){return new CommentConverter(); }

}

