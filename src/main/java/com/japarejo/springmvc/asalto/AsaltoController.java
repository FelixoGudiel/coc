package com.japarejo.springmvc.asalto;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.japarejo.springmvc.gamer.Gamer;
import com.japarejo.springmvc.gamer.GamerService;
import com.japarejo.springmvc.gamerRecord.GamerRecordService;

@Controller
@RequestMapping("/asaltos")
public class AsaltoController {

    @Autowired
    AsaltoService asaltoService;
    @Autowired
    GamerService gamerService;
    @Autowired
    GamerRecordService gamerRecordService;

    public static final String ASALTO_INFO = "AsaltoInfo";

    @GetMapping("/añadirAsalto")
    public ModelAndView pruebillaRoom() throws IOException {
        ModelAndView result = new ModelAndView(ASALTO_INFO);

        String raw = asaltoService.asaltoAPI();
        String rawTrimmed = asaltoService.recorteBasico(raw);

        Asalto ultimoAsalto = new Asalto();
        ultimoAsalto.setDistritosTumbados(asaltoService.parseDistritos(rawTrimmed));
        ultimoAsalto.setMonedasGanadas(asaltoService.parseMonedas(rawTrimmed));
        ultimoAsalto.setFecha(asaltoService.parseFecha(rawTrimmed));
        ultimoAsalto.setMonedasGanadas(asaltoService.parseOroCapital(rawTrimmed));
       
        result.addObject("message", rawTrimmed);
        if (asaltoService.hayAsaltoReciente(ultimoAsalto.getFecha()) || !asaltoService.asaltoEnProceso(rawTrimmed)) {
            result.addObject("message", "sucka!");
            return result;
        }
        gamerRecordService.parseGamerRecord(rawTrimmed, ultimoAsalto);
        asaltoService.save(ultimoAsalto);
        return result;
    }

    @GetMapping()
    public ModelAndView infoAsaltos(){
        ModelAndView result = new ModelAndView(ASALTO_INFO);
        result.addObject("asaltos", asaltoService.findAll());
        return result;
    }
    @GetMapping("/analisis")
    public ModelAndView analisisAsaltos() throws IOException{
        ModelAndView result = new ModelAndView(ASALTO_INFO);
        gamerService.clanAPI();
        List<String> morosos = new ArrayList<>();
        List<Gamer> trabajadores = asaltoService.trabajadores(0);
        for (Gamer g :gamerService.findAll()){
            if (!trabajadores.contains(g)) morosos.add(g.getNombre());
        }
        result.addObject("message", morosos);
        return result;
    }
}
