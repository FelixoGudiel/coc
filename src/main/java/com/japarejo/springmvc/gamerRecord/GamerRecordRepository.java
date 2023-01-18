package com.japarejo.springmvc.gamerRecord;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.japarejo.springmvc.asalto.Asalto;



@Repository
public interface GamerRecordRepository extends CrudRepository<GamerRecord, Integer> {
    List<GamerRecord> findAll();
    @Query ("SELECT g from GamerRecord g WHERE g.asalto = ?1")
    List<GamerRecord> findByAsalto(Asalto asalto);
    @Query ("SELECT g from GamerRecord g WHERE g.asalto = ?1 ORDER BY g.beneficioObtenido DESC")
    List<GamerRecord> orderGanancia(Asalto asalto);
}
