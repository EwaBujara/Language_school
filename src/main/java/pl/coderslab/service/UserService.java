package pl.coderslab.service;

import pl.coderslab.entity.User;

import javax.servlet.http.HttpSession;

public interface UserService {
    void save(User user);

    boolean verify(User user);

    void delete(HttpSession session, Long id);

    User findByUsername(String username);

    User findByEmail(String email);
}
