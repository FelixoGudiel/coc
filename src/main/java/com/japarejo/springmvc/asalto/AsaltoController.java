package com.japarejo.springmvc.asalto;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.time.LocalDate;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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

    public static final String ROOMS_LISTING = "RoomsListing";

    @GetMapping("/pruebilla")
    public ModelAndView pruebillaRoom() throws IOException {
        ModelAndView result = new ModelAndView(ROOMS_LISTING);

        String raw = asaltoService.asaltoAPI();
        String rawTrimmed = asaltoService.recorteBasico(raw);

        Asalto ultimoAsalto = new Asalto();
        ultimoAsalto.setDistritosTumbados(asaltoService.parseDistritos(rawTrimmed));
        ultimoAsalto.setMonedasGanadas(asaltoService.parseMonedas(rawTrimmed));
        ultimoAsalto.setFecha(asaltoService.parseFecha(rawTrimmed));
       
        
        if (asaltoService.hayAsaltoReciente(ultimoAsalto.getFecha())) {
            return result;
        }
        result.addObject("message", gamerRecordService.parseGamerRecord(rawTrimmed, ultimoAsalto));
        asaltoService.save(ultimoAsalto);
        return result;
    }
}
