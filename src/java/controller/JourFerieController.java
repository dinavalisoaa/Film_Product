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
import service.JourFerieService;
import service.PlateauService;

/**
 *
 * @author Fanjava
 */
@Controller
public class JourFerieController {

    @Autowired
    HibernateDao dao;

    @RequestMapping(value = "/add_jour_ferie")
    public String add(Model m,HttpServletRequest req) {
        JourFerieService service = new JourFerieService(dao);
        List<JourFerie> liste = service.allJourFerie();
        JourFerie fre=new JourFerie();
        fre.setJour(Integer.parseInt(req.getParameter("jour")));
        fre.setMois(Integer.parseInt(req.getParameter("mois")));
        service.insertJourFerie(fre);
        m.addAttribute("JourFerie", liste);
        return "redirect:liste_jour_ferie";
    }
    @RequestMapping(value = "/liste_jour_ferie")
    public String pagePlateau(Model m) {
        JourFerieService service = new JourFerieService(dao);
        List<JourFerie> liste = service.allJourFerie();
        m.addAttribute("JourFerie", liste);
        return "liste_jour_ferie";
    }

}
