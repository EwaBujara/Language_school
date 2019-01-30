package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.entity.Group;

public interface GroupRepository extends JpaRepository<Group, Long> {
    Group findByName(String name);
}
