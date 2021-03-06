package pl.coderslab.service;

import pl.coderslab.entity.Group;
import pl.coderslab.entity.User;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface UserService {
    void save(User user);

    boolean verify(User user);

    void delete(HttpSession session, Long id);

    User findByUsername(String username);

    User findByEmail(String email);

    List<String> getRolesList(User user);

    List<Group> getGroupList(Long id);

    List<String> getGroupsName(User user);

    boolean doesTheListContainsString(List<String> strings,String string);

    boolean whoAmI(User user, String string);

    boolean canI(User user, String privilegeName);
}
