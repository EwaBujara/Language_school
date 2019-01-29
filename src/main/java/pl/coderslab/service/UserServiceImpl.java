package pl.coderslab.service;


import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.entity.User;
import pl.coderslab.repository.UserRepository;

import javax.servlet.http.HttpSession;


@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;


    @Override
    public void save(User user) {
        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
        userRepository.save(user);
    }

    @Override
    public boolean verify(User user) {
        if(userRepository.findByEmail(user.getEmail())!=null){

            return BCrypt.checkpw(user.getPassword(), (userRepository.findByEmail(user.getEmail())).getPassword());
        }
        else return false;
    }

    @Override
    public void delete(HttpSession session, Long id) {
        User user = userRepository.findOne(id);
        User currentUser = (User) session.getAttribute("currentUser");
        if(currentUser!=null && user!=null && id.longValue()==currentUser.getId().longValue()){
            userRepository.delete(user);
        }
    }


    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
}