package pl.coderslab.repository;

import org.hibernate.validator.constraints.Email;
import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.entity.Thread;

import java.util.List;

public interface ThreadRepository extends JpaRepository<Thread, Long> {

    List<Thread> findAllByGroupId(Long id);
}
