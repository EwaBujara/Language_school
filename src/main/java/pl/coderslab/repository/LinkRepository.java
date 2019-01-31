package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.entity.Group;
import pl.coderslab.entity.Link;

import java.util.List;

public interface LinkRepository extends JpaRepository<Link, Long> {

    List<Link> findAllByGroup(Group group);
}
