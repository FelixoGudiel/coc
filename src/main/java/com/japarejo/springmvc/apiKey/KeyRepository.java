package com.japarejo.springmvc.apiKey;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface KeyRepository extends CrudRepository<apiKey, Integer> {
    List<apiKey> findAll();
@Query("SELECT k FROM apiKey k WHERE k.active")
apiKey keyActiva();
}


