package com.japarejo.springmvc.asalto;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import static java.time.temporal.ChronoUnit.DAYS;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import com.japarejo.springmvc.gamer.Gamer;
import com.japarejo.springmvc.gamerRecord.GamerRecord;

@Service
public class AsaltoService {
    
    @Autowired
	private AsaltoRepository asaltoRepo;
    public String asaltoAPI() throws IOException{
        try {
            URL url = new URL("https://api.clashofclans.com/v1/clans/%232LPQV9YP0/capitalraidseasons?authorization=Bearer:eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImUwNzkyZTUzLWZlMDgtNGY5Mi05ZjcwLWNlZjJiMjQ4ZTc2NyIsImlhdCI6MTY3MzQ2NDU1Miwic3ViIjoiZGV2ZWxvcGVyL2IyYWJiMGZhLTBmZjAtNjdjMC0xZjIxLTBjNWIzMjNhNjczMiIsInNjb3BlcyI6WyJjbGFzaCJdLCJsaW1pdHMiOlt7InRpZXIiOiJkZXZlbG9wZXIvc2lsdmVyIiwidHlwZSI6InRocm90dGxpbmcifSx7ImNpZHJzIjpbIjgxLjM2LjIzNC42MCJdLCJ0eXBlIjoiY2xpZW50In1dfQ.heum3wpHm-M8doUi59vjPhMyyBsxDDOR_8jNxmp0rEVF6EZcVrbStHEE2giwunSb7ImQRjsXNS7AsmyUIo5y2Q");
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
            return raw;
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
       return null;
    }
    public String recorteBasico(String raw) {
		Integer posicionDePurga = raw.indexOf("defender");
		return raw.substring(0, posicionDePurga);
    }
	
    public LocalDate parseFecha(String trimmedRaw) {
        Integer comienzoFecha = trimmedRaw.indexOf("startTime");
        Integer finalFecha = trimmedRaw.indexOf("endTime");
		String fechaRaw = trimmedRaw.substring(comienzoFecha + ("startTime':'").length(), finalFecha- ("','").length());
        Integer anyo = Integer.valueOf(fechaRaw.substring(0,4));
        Integer mes = Integer.valueOf(fechaRaw.substring(4,6));
        Integer dia = Integer.valueOf(fechaRaw.substring(6,8));
        LocalDate fecha = LocalDate.of(anyo, mes, dia);
        return fecha;
    }
	
    public Integer parseMonedas(String trimmedRaw) {
        Integer comienzoMonedas = trimmedRaw.indexOf("offensiveReward");
        Integer puntoMedio = trimmedRaw.indexOf("defensiveReward");
        Integer finalMonedas = trimmedRaw.indexOf("members");

        Integer ofensivas = Integer.valueOf(trimmedRaw.substring(comienzoMonedas + ("offensiveReward':").length(),puntoMedio - (",'").length()));
        Integer defensivas = Integer.valueOf(trimmedRaw.substring(puntoMedio + ("defensiveReward':").length(),finalMonedas - (",'").length()));
        return ofensivas*6 +defensivas;
    }

    public Integer parseDistritos(String trimmedRaw) {
        Integer comienzoDistritos = trimmedRaw.indexOf("enemyDistrictsDestroyed");
        Integer finalDistritos = trimmedRaw.indexOf("offensiveReward");

        return Integer.valueOf(trimmedRaw.substring(comienzoDistritos + ("enemyDistrictsDestroyed':").length(),finalDistritos - (",'").length()));
    }

    public Integer parseOroCapital(String trimmedRaw) {
        Integer comienzoOroCapital = trimmedRaw.indexOf("capitalTotalLoot");
        Integer finalOroCapital = trimmedRaw.indexOf("raidsCompleted");

        return Integer.valueOf(trimmedRaw.substring(comienzoOroCapital + ("capitalTotalLoot':").length(),finalOroCapital - (",'").length()));
    }

    public boolean hayAsaltoReciente(LocalDate fecha) {
        for (Asalto a : asaltoRepo.findAll()){
            if (DAYS.between(a.getFecha(), fecha)<6)
            return true;
        }
        return false;
    }

    public List<Asalto> findAll() {
        return asaltoRepo.findAll();
     }

     public Boolean asaltoEnProceso(String rawTrimmed) {
        return rawTrimmed.contains("ongoing");
     }

    public List<Asalto> orderFecha() {
        return asaltoRepo.orderFecha();
    }

    public List<Gamer> trabajadores(Integer semanasIgnorables){
        List<Gamer> currantes = new ArrayList<>();
        for (Integer i=0; i<=semanasIgnorables; i++){
            for (GamerRecord gr : orderFecha().get(i).getGamerRecord()){
                Gamer gamerAdd = gr.getGamer();
                if (!currantes.contains(gamerAdd))currantes.add(gamerAdd);
            }
        }
        return currantes;
    }
    @Transactional
    public void save(Asalto asalto) {
       asaltoRepo.save(asalto);
    }
}
