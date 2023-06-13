package frgp.utn.edu.ar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class paginaController {

    @RequestMapping("irLogin.html")
    public ModelAndView evento() {
        ModelAndView MV = new ModelAndView();
        MV.setViewName("Login");
        return MV;
    }
}
