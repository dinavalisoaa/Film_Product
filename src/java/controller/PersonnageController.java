/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.HibernateDao;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.logging.Level;
import javax.servlet.http.Part;
import model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.FilmService;
import service.PersonnageService;
import service.PlateauService;

/**
 *
 * @author Fanjava
 */
@Controller
public class PersonnageController {

    @Autowired
    HibernateDao dao;
    
    @RequestMapping(value = "/personnage")
    public String pagePersonnage(Model m) {
        PersonnageService service = new PersonnageService(dao);
        List<Personnage> liste = service.allPersonnage();
        m.addAttribute("personnage", liste);
        return "ajout_personnageN";
    }
    
    @RequestMapping(value = "/add_personnage")
    public String addPlateau(HttpServletRequest req, Model m) {
        PersonnageService service = new PersonnageService(dao);
        String file = req.getParameter("photo");
        String photo = "data:image/png;base64, " + PersonnageService.convert("D:\\Elements disque C\\Images\\" + file);
        String nom = req.getParameter("nom");
        Personnage p = new Personnage();
        p.setNom(nom);
        p.setPhoto(photo);
        service.insertPersonnage(p);
        return "redirect:personnage";
    }
}
