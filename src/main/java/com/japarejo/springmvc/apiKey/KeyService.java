package com.japarejo.springmvc.apiKey;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class KeyService {

    @Autowired
    private KeyRepository keyRepo;

    public apiKey keyActiva(){
        return keyRepo.keyActiva();
    }

    public List<apiKey> findAll(){
        return keyRepo.findAll();
    }
    
    @Transactional
    public void save(apiKey apiKey) {
        keyRepo.save(apiKey);
    }
}
