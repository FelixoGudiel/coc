package com.japarejo.springmvc.gamer;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.japarejo.springmvc.asalto.AsaltoService;
import com.japarejo.springmvc.gamerRecord.GamerRecordService;

@Controller
@RequestMapping("/clan")
public class GamerController {

    @Autowired
    AsaltoService asaltoService;
    @Autowired
    GamerService gamerService;
    @Autowired
    GamerRecordService gamerRecordService;

    public static final String CLAN = "Clan";
    @GetMapping()
    public ModelAndView clan() throws IOException {
        ModelAndView result = new ModelAndView(CLAN);
        result.addObject("members", gamerService.findAll());
        return result;
    }

    @GetMapping("/update")
    public ModelAndView clanUpdate() throws IOException {
        gamerService.clanAPI();
        ModelAndView result = new ModelAndView("redirect:/clan");
        return result;
    }
}
