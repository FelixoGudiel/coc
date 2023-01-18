package com.japarejo.springmvc.asalto;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.japarejo.springmvc.gamer.Gamer;
import com.japarejo.springmvc.gamer.GamerService;
import com.japarejo.springmvc.gamerRecord.GamerRecordService;

import javassist.expr.NewArray;

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
    public static final String ASALTO_ANALISIS = "Analisis";

    @GetMapping("/addAsalto")
    public ModelAndView añadirUltimoAsalto() throws IOException {
        ModelAndView result = new ModelAndView("redirect:/asaltos");

        String raw = asaltoService.asaltoAPI();
        String rawTrimmed = asaltoService.recorteBasico(raw);

        Asalto ultimoAsalto = new Asalto();
        ultimoAsalto.setDistritosTumbados(asaltoService.parseDistritos(rawTrimmed));
        ultimoAsalto.setMonedasGanadas(asaltoService.parseMonedas(rawTrimmed));
        ultimoAsalto.setFecha(asaltoService.parseFecha(rawTrimmed));
        ultimoAsalto.setOroCapital(asaltoService.parseOroCapital(rawTrimmed));
        ultimoAsalto.setCopasCapital(asaltoService.copasAPI());

        if (asaltoService.hayAsaltoReciente(ultimoAsalto.getFecha())) {
            result.addObject("message", "El último asalto ya está registrado, espera a que termine el próximo asalto");
            return result;
        }
        if (asaltoService.asaltoEnProceso(rawTrimmed)) {
            result.addObject("message", "Hay un asalto en proceso, espera a que termine");
            return result;
        }
        gamerRecordService.parseGamerRecord(rawTrimmed, ultimoAsalto);
        asaltoService.save(ultimoAsalto);
        return result;
    }

    @GetMapping()
    public ModelAndView infoAsaltos() {
        ModelAndView result = new ModelAndView(ASALTO_INFO);
        result.addObject("asaltos", asaltoService.orderFecha());
        List<Integer> OroRecord = new ArrayList<>();
        List<Integer> MonedasRecord = new ArrayList<>();
        List<Integer> DistritosRecord = new ArrayList<>();
        List<Integer> AtacantesRecord = new ArrayList<>();
        List<Integer> CopasRecord = new ArrayList<>();
        for (Asalto a : asaltoService.findAll()) {
            OroRecord.add(a.getOroCapital());
            MonedasRecord.add(a.getMonedasGanadas());
            DistritosRecord.add(a.getDistritosTumbados());
            AtacantesRecord.add(a.getGamerRecord().size());
            CopasRecord.add(a.getCopasCapital());
        }
        result.addObject("OroRecord", OroRecord);
        result.addObject("MonedasRecord", MonedasRecord);
        result.addObject("DistritosRecord", DistritosRecord);
        result.addObject("AtacantesRecord", AtacantesRecord);
        result.addObject("CopasRecord", CopasRecord);
        return result;
    }

    @GetMapping("/analisis/{semanas}")
    public ModelAndView analisisAsaltos(@PathVariable("semanas") Integer semanas) throws IOException {
        ModelAndView result = new ModelAndView(ASALTO_ANALISIS);
        if (asaltoService.findAll().size() == 0) {
            result = new ModelAndView("redirect:/asaltos");
            result.addObject("message", "No hay suficientes asaltos");
            return result;
        }
        // gamerService.clanAPI();
        List<String> morosos = new ArrayList<>();
        List<String> avisar = new ArrayList<>();
        List<Gamer> trabajadores = asaltoService.trabajadores(semanas);
        for (Gamer g : gamerService.clanMembers()) {
            if (!trabajadores.contains(g) && g.getEtiqueta().equals("Desconocido") && g.getRol().equals("member"))
                morosos.add(g.getNombre());
            if (!trabajadores.contains(g) && !g.getEtiqueta().equals("Desconocido"))
                avisar.add(g.getNombre());
        }
        Integer ratioAtacanteOro = asaltoService.ratioAtacanteOro(semanas);
        Integer ratioAtacanteMonedas = asaltoService.ratioAtacanteMonedas(semanas);
        Integer progresoCopas = asaltoService.progresoCopas(semanas);
        Double porcentaje = (double)trabajadores.size()/gamerService.clanMembers().size();

        Asalto asaltoReciente = asaltoService.orderFecha().get(0);

        String dirLiga = asaltoService.ligaImagenPorCopas(asaltoReciente.getCopasCapital());
        String ligaActual =asaltoService.ligaPorCopas(asaltoReciente.getCopasCapital());
        String Evaluation =asaltoService.evaluation(trabajadores.size(), gamerService.clanMembers().size());

        DecimalFormat df =new DecimalFormat("0.0");
    

        result.addObject("morosos", morosos);
        result.addObject("avisar", avisar);
        result.addObject("trabajadores", trabajadores);
        result.addObject("ratioAtacanteOro", ratioAtacanteOro);
        result.addObject("ratioAtacanteMonedas", ratioAtacanteMonedas);
        result.addObject("progresoCopas", progresoCopas);
        result.addObject("asaltoReciente", asaltoService.orderFecha().get(0));
        result.addObject("dirLiga", dirLiga);
        result.addObject("ligaActual", ligaActual);
        result.addObject("evaluation", Evaluation);
        result.addObject("porcentaje", df.format(porcentaje*100));
        result.addObject("porcentajePuro", porcentaje);
        return result;
    }
}
