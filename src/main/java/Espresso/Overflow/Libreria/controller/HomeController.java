package Espresso.Overflow.Libreria.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String helloWorld(Model model) {
        model.addAttribute("mensaje", "¡Bienvenido a la librería! El servidor de Spring Boot está funcionando correctamente.");
        return "index";
    }
}