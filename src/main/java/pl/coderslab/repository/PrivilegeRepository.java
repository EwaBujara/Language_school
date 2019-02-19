package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.entity.Privilege;
import pl.coderslab.entity.Role;

import java.util.List;

public interface PrivilegeRepository extends JpaRepository<Privilege, Long> {
    Privilege findByName(String name);

    List<Privilege> findAllByRoles(Role role);
}
