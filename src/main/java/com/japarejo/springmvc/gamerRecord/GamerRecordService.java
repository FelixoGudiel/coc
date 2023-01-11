package com.japarejo.springmvc.gamerRecord;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GamerRecordService {
    
    @Autowired
	private GamerRecordRepository gamerRecordRepo;
    
}
