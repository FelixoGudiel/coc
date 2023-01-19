package com.japarejo.springmvc.apiKey;

import javax.transaction.TransactionScoped;
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
    
    @Transactional
    public void save(apiKey apiKey) {
        keyRepo.save(apiKey);
    }
}
