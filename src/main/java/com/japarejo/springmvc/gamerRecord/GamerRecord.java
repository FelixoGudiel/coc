package com.japarejo.springmvc.gamerRecord;


import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.japarejo.springmvc.asalto.Asalto;
import com.japarejo.springmvc.gamer.Gamer;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class GamerRecord {
    @Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private Integer id;

    @Column
    private Integer númeroAtaques;

    @Column
    private Integer beneficioObtenido;

    @Column
    private Integer cantidadInvertidaTotal;

    @ManyToOne(cascade=CascadeType.ALL)
    private Gamer gamer;

    @ManyToOne(cascade=CascadeType.ALL)
    private Asalto asalto;
}
