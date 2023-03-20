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
import service.DialogueService;
import service.FilmService;
import service.PlateauService;
import service.SceneService;

/**
 *
 * @author Fanjava
 */
@Controller
public class SceneController {

    @Autowired
    HibernateDao dao;
    
    @RequestMapping(value = "/scene")
    public String pageScene(HttpServletRequest req, Model m) {
        PlateauService service = new PlateauService(dao);
        List<Plateau> liste = service.allPlateau();
      
        int idFilm = Integer.parseInt(req.getParameter("film").trim());
        SceneService scene_service = new SceneService(dao);
        List<Scene> scene = null;
        if(req.getParameter("search") == null){
            scene = scene_service.listeScene(idFilm);
        }
        else{
            String mot = req.getParameter("mot");
            String idPlateau = req.getParameter("idPlateau");
            String date = req.getParameter("date");
            scene = scene_service.recherche(idFilm, mot, idPlateau, date);
        }
        
        m.addAttribute("plateau", liste);
        m.addAttribute("scene", scene);
        return "ajout_scene";
    }
    
    @RequestMapping(value = "/liste_scene")
    public String listeScene(HttpServletRequest req, Model m) {
        PlateauService service = new PlateauService(dao);
        List<Plateau> liste = service.allPlateau();
        System.out.println("----"+liste.get(0).getDescription());
        int idFilm = Integer.parseInt(req.getParameter("film").trim());
        SceneService scene_service = new SceneService(dao);
//        scene_service.get
        DialogueService dia=new DialogueService(dao);
//        dia.get
        List<Scene> scene = null;        List<Dialogue> logue = null;

        if(req.getParameter("search") == null){
            scene = scene_service.listeScene(idFilm);
            logue=dia.listeByFilm(idFilm);
        }
        else{
            String mot = req.getParameter("mot");
            String idPlateau = req.getParameter("idPlateau");
            String date = req.getParameter("date");
            scene = scene_service.recherche(idFilm, mot, idPlateau, date);
        }
        m.addAttribute("plateau", liste);
        m.addAttribute("scene", scene);
        m.addAttribute("service",service);  
        m.addAttribute("diS",dia);    
  
        m.addAttribute("dialogue", logue);

        
        return "liste_scene";
    }
    
    @RequestMapping(value = "/add_scene")
    public String addScene(HttpServletRequest req, Model m) {
        SceneService service = new SceneService(dao);
        String titre = req.getParameter("titre");
        int idPlateau = Integer.parseInt(req.getParameter("plateau").trim());
        int idFilm = Integer.parseInt(req.getParameter("idFilm").trim());
        int numero = service.getLastNumero(idFilm);
        Scene s = new Scene();
        s.setTitre(titre);
        s.setPlateauId(idPlateau);
        s.setFilmId(idFilm);
        s.setNumero(numero + 1);
        s.setDate(Date.valueOf(LocalDate.now()));
        service.insertScene(s);
        return "redirect:scene?film="+idFilm;
    }
    
}
