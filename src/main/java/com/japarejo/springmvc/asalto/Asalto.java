package com.japarejo.springmvc.asalto;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.springframework.format.annotation.DateTimeFormat;

import com.japarejo.springmvc.gamerRecord.GamerRecord;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Asalto {
    @Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private Integer id;

    @Column
    private Integer monedasGanadas;

    @Column
    private Integer distritosTumbados;

    @Column
    private Integer oroCapital;

    @Column
    @DateTimeFormat(pattern = "yyyy/MM/dd")
    private LocalDate fecha;
    
    @OneToMany(cascade=CascadeType.ALL, mappedBy = "asalto")
    private List<GamerRecord> gamerRecord;
}
