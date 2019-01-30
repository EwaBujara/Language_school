package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.entity.Thread;

public interface ThreadRepository extends JpaRepository<Thread, Long> {
}
