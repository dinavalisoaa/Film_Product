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

/**
 *
 * @author Fanjava
 */
@Controller
public class FilmController {

    @Autowired
    HibernateDao dao;
    
    @RequestMapping(value = "/")
    public String index(Model m) {
        return "redirect:choix_film";
    }
    
//    @RequestMapping(value = "/")
//    public String index(Model m) {
//        return "ajoutScene";
//    }
    
    @RequestMapping(value = "/choix_film")
    public String choixFilm(Model m) {
        FilmService service = new FilmService(dao);
        List<Film> liste = service.allFilm();
        m.addAttribute("film", liste);
        return "choix_film";
    }
    
    @RequestMapping(value = "/film")
    public String pageFilm(Model m) {
        return "ajout_filmN";
    }
    
    @RequestMapping(value = "/add_film")
    public String addFilm(HttpServletRequest req, Model m) {
        FilmService service = new FilmService(dao);
        String titre = req.getParameter("titre");
        Film f = new Film();
        f.setTitre(titre);
        service.insertFilm(f);
        return "redirect:choix_film";
    }
}
