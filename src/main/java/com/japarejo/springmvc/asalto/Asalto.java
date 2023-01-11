package com.japarejo.springmvc.asalto;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;

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
    @DateTimeFormat(pattern = "yyyy/MM/dd")
    private LocalDate fecha;
    
}
