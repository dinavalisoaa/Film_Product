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
import java.sql.Time;
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
import service.EmotionService;
import service.FilmService;
import service.PersonnageService;
import service.PlateauService;
import service.SceneService;

/**
 *
 * @author Fanjava
 */
@Controller
public class DialogueController {

    @Autowired
    HibernateDao dao;
    
    @RequestMapping(value = "/dialogue")
    public String pageDialogue(HttpServletRequest req, Model m) {
        DialogueService service = new DialogueService(dao);
        int idScene = Integer.parseInt(req.getParameter("idScene").trim());
        PersonnageService pers_service = new PersonnageService(dao);
        List<Personnage> pers = pers_service.allPersonnage();
        EmotionService emotion = new EmotionService(dao);
        List<Emotion> emo = emotion.allEmotion();
        List<Dialogue> liste = null;
        if(req.getParameter("search") == null){
            liste = service.listeDialogue(idScene);
        }
        else{
            String mot = req.getParameter("mot");
            String idPersonnage = req.getParameter("personnage");
            String idEmotion = req.getParameter("emotion");
            liste = service.recherche(idScene, mot, idPersonnage, idEmotion);
        }
   
        m.addAttribute("dialogue", liste);
        m.addAttribute("personnage", pers);
        m.addAttribute("emotion", emo);
        return "liste_dialogue";
    }
    
    @RequestMapping(value = "/dialogue_formulaire")
    public String formulaireDialogue(HttpServletRequest req, Model m) {
        PersonnageService service = new PersonnageService(dao);
        List<Personnage> liste = service.allPersonnage();
        EmotionService emotion = new EmotionService(dao);
        List<Emotion> emo = emotion.allEmotion();
        m.addAttribute("personnage", liste);
        m.addAttribute("emotion", emo);
        m.addAttribute("idScene", req.getParameter("idScene"));
        return "ajout_dialogue";
    }
    
    @RequestMapping(value = "/add_dialogue")
    public String addDialogue(HttpServletRequest req, Model m) {
        DialogueService service = new DialogueService(dao);
        int idPersonnage = Integer.parseInt(req.getParameter("personnage").trim());
        String contenu = req.getParameter("contenu");
        Time duree = Time.valueOf(req.getParameter("duree").trim() + ":00");
        int idEmotion = Integer.parseInt(req.getParameter("emotion").trim());
        int numero = service.getLastNumero(Integer.parseInt(req.getParameter("idScene").trim()));
        String action = req.getParameter("action");
        Dialogue d = new Dialogue();
        d.setPersonnageId(idPersonnage);
        d.setContenu(contenu);
        d.setDuree(duree);
        d.setEmotionId(idEmotion);
        d.setAction(action);
        d.setNumero(numero + 1);
        d.setSceneId(Integer.parseInt(req.getParameter("idScene").trim()));
        service.insertDialogue(d);
        return "redirect:dialogue_formulaire?idScene="+req.getParameter("idScene");
    }
}
