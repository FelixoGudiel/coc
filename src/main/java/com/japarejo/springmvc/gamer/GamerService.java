package com.japarejo.springmvc.gamer;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GamerService {
    
    @Autowired
	private GamerRepository gamerRepo;
    
    public void gamerAPI(String playerTag) throws IOException{
   
        try {
            String urlPlayerTag =playerTag.replace("#", "%23");
            URL url = new URL("https://api.clashofclans.com/v1/players/" + urlPlayerTag+ "?authorization=Bearer:eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImUwNzkyZTUzLWZlMDgtNGY5Mi05ZjcwLWNlZjJiMjQ4ZTc2NyIsImlhdCI6MTY3MzQ2NDU1Miwic3ViIjoiZGV2ZWxvcGVyL2IyYWJiMGZhLTBmZjAtNjdjMC0xZjIxLTBjNWIzMjNhNjczMiIsInNjb3BlcyI6WyJjbGFzaCJdLCJsaW1pdHMiOlt7InRpZXIiOiJkZXZlbG9wZXIvc2lsdmVyIiwidHlwZSI6InRocm90dGxpbmcifSx7ImNpZHJzIjpbIjgxLjM2LjIzNC42MCJdLCJ0eXBlIjoiY2xpZW50In1dfQ.heum3wpHm-M8doUi59vjPhMyyBsxDDOR_8jNxmp0rEVF6EZcVrbStHEE2giwunSb7ImQRjsXNS7AsmyUIo5y2Q");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.connect();
            StringBuilder info = new StringBuilder();
            Scanner scanner = new Scanner(url.openStream());
            while (scanner.hasNext()){
                info.append(scanner.nextLine());
            }
            scanner.close();
 
            String raw = info.substring(0);
            Gamer gamerToAdd = null;
            Boolean newGamer = false;
            if (gamerRepo.findbyTag(playerTag)!=null){
                gamerToAdd = gamerRepo.findbyTag(playerTag);
            }
            else{
            gamerToAdd = new Gamer();
            gamerToAdd.setTag(playerTag);
            newGamer=true;
            }
            String[] partes = raw.split(",");
            Boolean nameSelected = false;
            for (String parte : partes){
                if (parte.contains("name") && !nameSelected){
                    parte=parte.replace("name\":\"", "");
                    parte=parte.replace("\"", "");
                    parte=parte.replace("™", "?");
                    gamerToAdd.setNombre(parte);
                    nameSelected=true;
                }
                if (parte.contains("role")){
                    parte=parte.replace("role\":\"", "");
                    parte=parte.replace("\"", "");
                    gamerToAdd.setRol(parte);
                }
                if (parte.contains("Total Capital Gold contributed")){
                    parte=parte.replace("\"completionInfo\":\"Total Capital Gold contributed:", "");
                    parte=parte.replace("\"", "");
                    gamerToAdd.setDonado(Integer.valueOf(parte.trim()));
                }
            }
            if (newGamer){
            gamerToAdd.setEtiqueta("Desconocido");
            }
            gamerRepo.save(gamerToAdd);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
    }

    public void clanAPI() throws IOException{
        try {

            URL url = new URL("https://api.clashofclans.com/v1/clans/%232LPQV9YP0/members?authorization=Bearer:eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImUwNzkyZTUzLWZlMDgtNGY5Mi05ZjcwLWNlZjJiMjQ4ZTc2NyIsImlhdCI6MTY3MzQ2NDU1Miwic3ViIjoiZGV2ZWxvcGVyL2IyYWJiMGZhLTBmZjAtNjdjMC0xZjIxLTBjNWIzMjNhNjczMiIsInNjb3BlcyI6WyJjbGFzaCJdLCJsaW1pdHMiOlt7InRpZXIiOiJkZXZlbG9wZXIvc2lsdmVyIiwidHlwZSI6InRocm90dGxpbmcifSx7ImNpZHJzIjpbIjgxLjM2LjIzNC42MCJdLCJ0eXBlIjoiY2xpZW50In1dfQ.heum3wpHm-M8doUi59vjPhMyyBsxDDOR_8jNxmp0rEVF6EZcVrbStHEE2giwunSb7ImQRjsXNS7AsmyUIo5y2Q");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.connect();
            StringBuilder info = new StringBuilder();
            Scanner scanner = new Scanner(url.openStream());
            while (scanner.hasNext()){
                info.append(scanner.nextLine());
            }
            scanner.close();

            String raw = info.substring(0);
            String[] partes = raw.split(",");
            for (String parte : partes){
                if (parte.contains("tag")){
                    parte=parte.replace("{\"items\":[", "");
                    parte=parte.replace("{\"tag\":\"", "");
                    parte=parte.replace("\"", "");
                    gamerAPI(parte);
                }
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
    }

    public List<Gamer> clanMembers() throws IOException{
        try {

            URL url = new URL("https://api.clashofclans.com/v1/clans/%232LPQV9YP0/members?authorization=Bearer:eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImUwNzkyZTUzLWZlMDgtNGY5Mi05ZjcwLWNlZjJiMjQ4ZTc2NyIsImlhdCI6MTY3MzQ2NDU1Miwic3ViIjoiZGV2ZWxvcGVyL2IyYWJiMGZhLTBmZjAtNjdjMC0xZjIxLTBjNWIzMjNhNjczMiIsInNjb3BlcyI6WyJjbGFzaCJdLCJsaW1pdHMiOlt7InRpZXIiOiJkZXZlbG9wZXIvc2lsdmVyIiwidHlwZSI6InRocm90dGxpbmcifSx7ImNpZHJzIjpbIjgxLjM2LjIzNC42MCJdLCJ0eXBlIjoiY2xpZW50In1dfQ.heum3wpHm-M8doUi59vjPhMyyBsxDDOR_8jNxmp0rEVF6EZcVrbStHEE2giwunSb7ImQRjsXNS7AsmyUIo5y2Q");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.connect();
            StringBuilder info = new StringBuilder();
            Scanner scanner = new Scanner(url.openStream());
            while (scanner.hasNext()){
                info.append(scanner.nextLine());
            }
            scanner.close();

            String raw = info.substring(0);
            String[] partes = raw.split(",");
            List<Gamer> members = new ArrayList<>();
            for (String parte : partes){
                if (parte.contains("tag")){
                    parte=parte.replace("{\"items\":[", "");
                    parte=parte.replace("{\"tag\":\"", "");
                    parte=parte.replace("\"", "");
                    members.add(gamerRepo.findbyTag(parte));
                }
            }
            return members;
        } catch (MalformedURLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Gamer> findAll(){
        return gamerRepo.findAll();
    }

    public Gamer findByTag(String tag){
        return gamerRepo.findbyTag(tag);
    }

    public Gamer findById(Integer id){
        if (gamerRepo.findById(id).isPresent())
        return gamerRepo.findById(id).get();
        return null;
    }

    public void save(Gamer g){
        gamerRepo.save(g);
    }
}
