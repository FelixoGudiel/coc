package com.japarejo.springmvc.gamerRecord;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.japarejo.springmvc.asalto.Asalto;
import com.japarejo.springmvc.gamer.GamerRepository;
import com.japarejo.springmvc.gamer.GamerService;

@Service
public class GamerRecordService {
    
    @Autowired
	private GamerRecordRepository gamerRecordRepo;
    @Autowired
	private GamerRepository gamerRepo;
    @Autowired
	private GamerService gamerService;
    
    public String parseGamerRecord(String raw, Asalto asalto) throws IOException {
		Integer comienzoMiembros = raw.indexOf("members");
		Integer finalMiembros = raw.indexOf("attackLog");
        String rawTrimmed = raw.substring(comienzoMiembros+ ("members':[").length(), finalMiembros-("],'").length());
        String[] members = rawTrimmed.split("}");
        for(String member : members){
            GamerRecord gamerRecordToAdd =new GamerRecord();
            String[] partes = member.split(",");
            for (String parte: partes){
                if (parte.contains("tag")){
                    parte=parte.replace("{\"tag\":\"", "");
                    parte=parte.replace("\"", "");
                    gamerService.gamerAPI(parte.trim());
                    gamerRecordToAdd.setGamer(gamerRepo.findbyTag(parte.trim()));
                }
                if (parte.contains("attacks")){
                    parte=parte.replace("attacks\":", "");
                    parte=parte.replace("\"", "");
                    gamerRecordToAdd.setNúmeroAtaques(Integer.valueOf(parte));
                }
                if (parte.contains("capitalResourcesLooted")){
                    parte=parte.replace("capitalResourcesLooted\":", "");
                    parte=parte.replace("\"", "");
                    gamerRecordToAdd.setBeneficioObtenido(Integer.valueOf(parte));
                }
            }
            gamerRecordToAdd.setCantidadInvertidaTotal(gamerRecordToAdd.getGamer().getDonado());
            gamerRecordToAdd.setAsalto(asalto);
            gamerRecordRepo.save(gamerRecordToAdd);
        }
        return Integer.valueOf(members.length).toString();
    }
}
