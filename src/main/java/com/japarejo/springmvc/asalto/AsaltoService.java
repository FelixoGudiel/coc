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
import com.japarejo.springmvc.gamerRecord.GamerRecordRepository;


@Service
public class AsaltoService {

    @Autowired
    private AsaltoRepository asaltoRepo;
    @Autowired
    private GamerRecordRepository gamerRecordRepo;
    private String apiKey= "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjE4MGVhYTJmLWYxYTUtNGM1MC04MDlmLTM2MzhjMmZkNjgwZSIsImlhdCI6MTY4MDUyMzE3OCwic3ViIjoiZGV2ZWxvcGVyL2IyYWJiMGZhLTBmZjAtNjdjMC0xZjIxLTBjNWIzMjNhNjczMiIsInNjb3BlcyI6WyJjbGFzaCJdLCJsaW1pdHMiOlt7InRpZXIiOiJkZXZlbG9wZXIvc2lsdmVyIiwidHlwZSI6InRocm90dGxpbmcifSx7ImNpZHJzIjpbIjgxLjM2LjE3OC4yNDIiXSwidHlwZSI6ImNsaWVudCJ9XX0.jF7xNUbvNILlnvW_xWqe0QzAzKubVoAJS7iS4NdKxNwsTDzyqCLK4VJljlek6_vmzJ6QFTwsAXfwE0HOLA5qQg";
    public String asaltoAPI() throws IOException {
        try {
            URL url = new URL(
                    "https://api.clashofclans.com/v1/clans/%232LPQV9YP0/capitalraidseasons?authorization=Bearer:"+apiKey);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.connect();
            StringBuilder info = new StringBuilder();
            Scanner scanner = new Scanner(url.openStream());
            while (scanner.hasNext()) {
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

    public Integer copasAPI() throws IOException {
        try {
            URL url = new URL(
                    "https://api.clashofclans.com/v1/clans/%232LPQV9YP0?authorization=Bearer:"+apiKey);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.connect();
            StringBuilder info = new StringBuilder();
            Scanner scanner = new Scanner(url.openStream());
            while (scanner.hasNext()) {
                info.append(scanner.nextLine());
            }
            scanner.close();

            String raw = info.substring(0);
            String[] partes = raw.split(",");
            for (String parte : partes) {
                if (parte.contains("clanCapitalPoints")) {
                    parte = parte.replace("clanCapitalPoints", "");
                    parte = parte.replace(":", "");
                    parte = parte.replace("\"", "");
                    return Integer.valueOf(parte);
                }
            }
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
        String fechaRaw = trimmedRaw.substring(comienzoFecha + ("startTime':'").length(),
                finalFecha - ("','").length());
        Integer anyo = Integer.valueOf(fechaRaw.substring(0, 4));
        Integer mes = Integer.valueOf(fechaRaw.substring(4, 6));
        Integer dia = Integer.valueOf(fechaRaw.substring(6, 8));
        LocalDate fecha = LocalDate.of(anyo, mes, dia);
        return fecha;
    }

    public Integer parseMonedas(String trimmedRaw) {
        Integer comienzoMonedas = trimmedRaw.indexOf("offensiveReward");
        Integer puntoMedio = trimmedRaw.indexOf("defensiveReward");
        Integer finalMonedas = trimmedRaw.indexOf("members");

        Integer ofensivas = Integer.valueOf(
                trimmedRaw.substring(comienzoMonedas + ("offensiveReward':").length(), puntoMedio - (",'").length()));
        Integer defensivas = Integer.valueOf(
                trimmedRaw.substring(puntoMedio + ("defensiveReward':").length(), finalMonedas - (",'").length()));
        return ofensivas * 6 + defensivas;
    }

    public Integer parseDistritos(String trimmedRaw) {
        Integer comienzoDistritos = trimmedRaw.indexOf("enemyDistrictsDestroyed");
        Integer finalDistritos = trimmedRaw.indexOf("offensiveReward");

        return Integer.valueOf(trimmedRaw.substring(comienzoDistritos + ("enemyDistrictsDestroyed':").length(),
                finalDistritos - (",'").length()));
    }

    public Integer parseOroCapital(String trimmedRaw) {
        Integer comienzoOroCapital = trimmedRaw.indexOf("capitalTotalLoot");
        Integer finalOroCapital = trimmedRaw.indexOf("raidsCompleted");

        return Integer.valueOf(trimmedRaw.substring(comienzoOroCapital + ("capitalTotalLoot':").length(),
                finalOroCapital - (",'").length()));
    }

    public boolean hayAsaltoReciente(LocalDate fecha) {
        for (Asalto a : asaltoRepo.findAll()) {
            if (DAYS.between(a.getFecha(), fecha) < 6)
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

    public List<GamerRecord> orderGanancia(Integer semanas) {
        if (semanas == 1)
        return gamerRecordRepo.orderGanancia(orderFecha().get(0),null, null);
        if (semanas == 2)
        return gamerRecordRepo.orderGanancia(orderFecha().get(0),orderFecha().get(1), null);
        if (semanas == 3)
        return gamerRecordRepo.orderGanancia(orderFecha().get(0),orderFecha().get(1), orderFecha().get(2));
        return null;

    }

    public List<Gamer> trabajadores(Integer semanas) {
        List<Gamer> currantes = new ArrayList<>();
        for (Integer i = 0; i <= semanas - 1; i++) {
            for (GamerRecord gr : orderFecha().get(i).getGamerRecord()) {
                Gamer gamerAdd = gr.getGamer();
                if (!currantes.contains(gamerAdd))
                    currantes.add(gamerAdd);
            }
        }
        return currantes;
    }

    public Integer ratioAtacanteOro(Integer semanas) {
        Integer numAtacantes = 0;
        Integer numOro = 0;
        for (Integer i = 0; i <= semanas - 1; i++) {
            numAtacantes = numAtacantes + orderFecha().get(i).getGamerRecord().size();
            numOro = numOro + orderFecha().get(i).getOroCapital();
        }
        return (numOro / numAtacantes);
    }

    public Integer ratioAtacanteMonedas(Integer semanas) {
        Integer numAtacantes = 0;
        Integer numMonedas = 0;
        for (Integer i = 0; i <= semanas - 1; i++) {
            numAtacantes = numAtacantes + orderFecha().get(i).getGamerRecord().size();
            numMonedas = numMonedas + orderFecha().get(i).getMonedasGanadas();
        }
        return (numMonedas / numAtacantes);
    }
    public Integer totalOro(Integer semanas) {
        Integer totalOro = 0;
        for (Integer i = 0; i <= semanas - 1; i++) {
           totalOro=totalOro+orderFecha().get(i).getOroCapital();
        }
        return totalOro;
    }

    public Integer totalMonedas(Integer semanas) {
        Integer totalMonedas = 0;
        for (Integer i = 0; i <= semanas - 1; i++) {
           totalMonedas=totalMonedas+orderFecha().get(i).getMonedasGanadas();
        }
        return totalMonedas;
    }


    public Integer progresoCopas(Integer semanas) {
        Integer incrementoCopas = orderFecha().get(0).getCopasCapital()
                - orderFecha().get(semanas - 1).getCopasCapital();
        return (incrementoCopas);
    }

    public String ligaImagenPorCopas(Integer copas) {
        String dirLiga = "";
        if (copas >= 0)
            dirLiga = "no";
        if (copas >= 400)
            dirLiga = "bronze";
        if (copas>= 800)
            dirLiga = "silver";
        if (copas >= 1400)
            dirLiga = "gold";
        if (copas >= 2000)
            dirLiga = "cristal";
        if (copas >= 2600)
            dirLiga = "maestro";
        if (copas >= 3200)
            dirLiga = "campeon";
        if (copas >= 4100)
            dirLiga = "titan";
        if (copas >= 5000)
            dirLiga = "leyenda";
        return dirLiga;
    }

    public String ligaPorCopas(Integer copas) {
        String Liga = "";
        if (copas >= 0)
        Liga = "ninguna liga";
        if (copas >= 400)
        Liga = "Bronce III";
        if (copas>= 500)
        Liga = "Bronce II";
        if (copas >= 600)
        Liga = "Bronce I";
        if (copas >= 800)
        Liga = "Plata III";
        if (copas >= 100)
        Liga = "Plata II";
        if (copas >= 1200)
        Liga = "Plata I";
        if (copas >= 1400)
        Liga = "Oro III";
        if (copas >= 1600)
        Liga = "Oro II";
        if (copas >= 1800)
        Liga = "Oro I";
        if (copas >= 2000)
        Liga = "Cristal III";
        if (copas>= 2200)
        Liga = "Cristal II";
        if (copas >= 2400)
        Liga = "Cristal I";
        if (copas >= 2600)
        Liga = "Maestro III";
        if (copas >= 2800)
        Liga = "Maestro II";
        if (copas >= 3000)
        Liga = "Maestro I";
        if (copas >= 3200)
        Liga = "Campeon III";
        if (copas >= 3500)
        Liga = "Campeon II";
        if (copas >= 3800)
        Liga = "Campeon I";
        if (copas >= 4100)
        Liga = "Titan III";
        if (copas>= 4400)
        Liga = "Titan II";
        if (copas >= 4700)
        Liga = "Titan I";
        if (copas >= 5000)
        Liga = "Leyenda";
        return Liga;
    }
    public String evaluation(Integer activos, Integer totales) {
        Double inner = Math.exp((-activos+totales*0.7)/(totales*0.07));
        Double value = (1/(1+inner)) + 0.014;
        String text = "Es necesario purgar jugadores inactivos";
        if (value>0.5){
            text = "El rendimiento es insuficiente";
        }
        if (value>0.8){
            text = "El rendimiento es aceptable";
        }
        if (value>0.9){
            text = "Casi todos los miembros atacan";
        }
        if (value>=0.9999999){
            text = "Todos los miembros han atacado!";
        }
        return text;
    }
    
    @Transactional
    public void save(Asalto asalto) {
        asaltoRepo.save(asalto);
    }
}
