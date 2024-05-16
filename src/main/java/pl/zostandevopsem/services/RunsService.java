package pl.zostandevopsem.services;

import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import pl.zostandevopsem.data.Runs;
import pl.zostandevopsem.data.RunsRepository;

@Service
public class RunsService {

    private final RunsRepository repository;

    public RunsService(RunsRepository repository) {
        this.repository = repository;
    }

    public Optional<Runs> get(Long id) {
        return repository.findById(id);
    }

    public Runs update(Runs entity) {
        return repository.save(entity);
    }

    public void delete(Long id) {
        repository.deleteById(id);
    }

    public Page<Runs> list(Pageable pageable) {
        return repository.findAll(pageable);
    }

    public Page<Runs> list(Pageable pageable, Specification<Runs> filter) {
        return repository.findAll(filter, pageable);
    }

    public int count() {
        return (int) repository.count();
    }

}
