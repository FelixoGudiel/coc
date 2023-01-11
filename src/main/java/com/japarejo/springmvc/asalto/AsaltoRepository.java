package com.japarejo.springmvc.asalto;
import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface AsaltoRepository extends CrudRepository<Asalto, Integer> {
    List<Asalto> findAll();
}


