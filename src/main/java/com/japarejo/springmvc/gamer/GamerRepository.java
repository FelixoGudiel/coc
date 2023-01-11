package com.japarejo.springmvc.gamer;
import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface GamerRepository extends CrudRepository<Gamer, Integer> {
    List<Gamer> findAll();
}
