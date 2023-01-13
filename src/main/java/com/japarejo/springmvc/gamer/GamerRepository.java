package com.japarejo.springmvc.gamer;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface GamerRepository extends CrudRepository<Gamer, Integer> {
    List<Gamer> findAll();
    @Query ("SELECT g from Gamer g WHERE g.tag = ?1")
    Gamer findbyTag(String tag);
    @Query ("SELECT g from Gamer g WHERE g.id = ?1")
    Optional<Gamer> findById(Integer id);
}
