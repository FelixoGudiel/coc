package com.japarejo.springmvc.gamer;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.japarejo.springmvc.gamerRecord.GamerRecord;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Gamer {
    @Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private Integer id;

    @Column
    private String tag;

    @Column
    private String nombre;

    @Column
    private Integer donado;

    @Column
    private String rol;

    @Column
    private String etiqueta;
    
    @OneToMany(cascade=CascadeType.ALL, mappedBy = "gamer")
    private List<GamerRecord> gamerRecord;
}
