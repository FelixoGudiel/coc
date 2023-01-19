package com.japarejo.springmvc.apiKey;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class apiKey {
    @Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private Integer id;

    @Column
    String apiKey;

    @Column
    String descripcion;

    @Column
    Boolean activa;
 
    @Column
    String ip;
}
