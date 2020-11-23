package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.entity.Role;
import pl.coderslab.entity.User;

//import javax.jws.soap.SOAPBinding;
import java.util.List;

public interface RoleRepository extends JpaRepository<Role, Long> {

    Role findByName(String name);

    List<Role> findAllByUsers(List<User> users);
}
