package pl.zostandevopsem.data;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface RunsRepository extends JpaRepository<Runs, Long>, JpaSpecificationExecutor<Runs> {

}
