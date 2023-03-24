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
 @RequestMapping(value = "/liste_personnage")
    public String liste_plateau(HttpServletRequest rq, Model m) {
        PersonnageService service = new PersonnageService(dao);
//        service.
        List<Personnage> nD = null;
        List<Personnage> liste = service.allPersonnage();
        String date = LocalDate.now().toString();
        if (rq.getParameter("date") != null) {
            if (rq.getParameter("date").equals("123")) {
                nD = service.allPersonnageNonDispo(date);
            } else {
                date = rq.getParameter("date");
                nD = service.allPersonnageNonDispo(date);
            }
        } else {
            nD = service.allPersonnageNonDispo(date);

        }

        m.addAttribute("personnage", liste);
        m.addAttribute("dispo", nD);
        m.addAttribute("date", date);
        m.addAttribute("etat","0");
        m.addAttribute("service", service);

        return "dispo_personnage";
    }
 @RequestMapping(value = "/liste_personnage_dispo")
    public String liste_plateaus(HttpServletRequest rq, Model m) {
        PersonnageService service = new PersonnageService(dao);
//        service.
        List<Personnage> nD = null;
        List<Personnage> liste = service.allPersonnage();
        String date = LocalDate.now().toString();
        if (rq.getParameter("date") != null) {
            if (rq.getParameter("date").equals("123")) {
                nD = service.allPersonnageDispo(date);
            } else {
                date = rq.getParameter("date");
                nD = service.allPersonnageDispo(date);
            }
        } else {
            nD = service.allPersonnageDispo(date);

        }

        m.addAttribute("personnage", liste);
        m.addAttribute("dispo", nD);
        m.addAttribute("date", date);
        m.addAttribute("etat", "1");
        m.addAttribute("service", service);

        return "dispo_personnage";
    }
    @RequestMapping(value = "/personnage")
    public String pagePersonnage(Model m) {
        PersonnageService service = new PersonnageService(dao);
        List<Personnage> liste = service.allPersonnage();
        m.addAttribute("Personnage", liste);
        return "liste_personnage";
    }

    @RequestMapping(value = "/up_personnage")
    public String up(HttpServletRequest req, Model m) {
        PersonnageService service = new PersonnageService(dao);
        String file = req.getParameter("photo");
        String id_s = req.getParameter("id");
        int id=Integer.valueOf(id_s);
        String photo = "data:image/png;base64, " + PersonnageService.convert(JourFerie.file() + "\\" + file);
        String nom = req.getParameter("nom");
        Personnage p = new Personnage();
//        p.setNom(nom);
//        p.setPhoto(photo);
        service.update("update Personnage set photo='"+photo+"', nom='"+nom+"' where id="+id);
        return "redirect:personnage";
    }
    @RequestMapping(value = "/add_personnage_indispo")
    public String add_indispo(HttpServletRequest req, Model m) {
        PersonnageService service = new PersonnageService(dao);
        PersonnageIndisponible pI = new PersonnageIndisponible();
        pI.setDate1(Date.valueOf(req.getParameter("date1")));
        pI.setDate2(Date.valueOf(req.getParameter("date2")));
        pI.setPersonnageId(Integer.parseInt(req.getParameter("plateauId")));
        service.insertPersonnageIndisponible(pI);
        return "redirect:liste_personnage";
    }
//add_personnage_indispo
    @RequestMapping(value = "/add_personnage")
    public String addPlateau(HttpServletRequest req, Model m) {
        PersonnageService service = new PersonnageService(dao);
        String file = req.getParameter("photo");
        String photo = "data:image/png;base64, " + PersonnageService.convert(JourFerie.file() + "\\" + file);
        String nom = req.getParameter("nom");
        Personnage p = new Personnage();
        p.setNom(nom);
        p.setPhoto(photo);
        service.insertPersonnage(p);
        return "redirect:personnage";
    }

}
