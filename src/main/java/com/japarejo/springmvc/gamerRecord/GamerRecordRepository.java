package com.japarejo.springmvc.gamerRecord;
import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface GamerRecordRepository extends CrudRepository<GamerRecord, Integer> {
    List<GamerRecord> findAll();
}
