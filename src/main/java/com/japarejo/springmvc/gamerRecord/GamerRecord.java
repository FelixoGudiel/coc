package com.japarejo.springmvc.gamerRecord;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;


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
    private String cantidadInvertidaTotal;

    //@ManyToOne 
    //@Column
    //private Gamer gamer;
}
