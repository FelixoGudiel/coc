package com.japarejo.springmvc.asalto;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface AsaltoRepository extends CrudRepository<Asalto, Integer> {
    List<Asalto> findAll();
@Query("SELECT a FROM Asalto a ORDER BY a.fecha DESC")
List<Asalto> orderFecha();
}


