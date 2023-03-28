/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.HibernateDao;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.DialogueService;
import service.EmotionService;
import service.FilmService;
import service.PersonnageService;
import service.PlateauService;
import service.RechercheService;
import service.SceneService;

/**
 *
 * @author Fanjava
 */
@Controller
public class RechercheController {

    @Autowired
    HibernateDao dao;

    @RequestMapping(value = "/recherche")
    public String recherche(HttpServletRequest req, Model m) {
        PlateauService service = new PlateauService(dao);
        SceneService serviceS = new SceneService(dao);
        FilmService serviceF = new FilmService(dao);
        m.addAttribute("film", serviceF.allFilm());
        m.addAttribute("plateau", service.allPlateau());
        m.addAttribute("scene", serviceS.allScene());
        RechercheService recher = new RechercheService(dao);
        String motCle = null;
        String datedebut = null;
        String datefin = null;
        int etat = -1;

        Recherche pl = new Recherche();

        if (req.getParameter("motcle") != null) {
            motCle = req.getParameter("motcle");
        }
        String dis="";
        if(!motCle.equals("")){
        dis+="'"+motCle+"'";
        }
        if (req.getParameter("datefin") != null&&!req.getParameter("datefin").equals("")) {
            datefin = (req.getParameter("datefin"));
            pl.setFinPlan(Date.valueOf(datefin));

        }
        if (req.getParameter("datedebut") != null&&!req.getParameter("datedebut").equals("")) {
            datedebut = (req.getParameter("datedebut"));
            pl.setDebutPlan(Date.valueOf(datedebut));

        }
          if (req.getParameter("plateauId") != null&& !req.getParameter("plateauId").equals("-1")) {
           int iP =Integer.parseInt(req.getParameter("plateauId"));
            pl.setPlateauId(iP);

        }
            if (req.getParameter("sceneId") != null&&!req.getParameter("sceneId").equals("-1") ) {
           int iP =Integer.parseInt(req.getParameter("sceneId"));
            pl.setSceneId(iP);

        }
             if (req.getParameter("filmId") != null &&!req.getParameter("filmId").equals("-1") ) {
           int iP =Integer.parseInt(req.getParameter("filmId"));
            pl.setFilmId(iP);

        }
        if (req.getParameter("etat")!= null) {
            etat = Integer.parseInt(req.getParameter("etat"));
            pl.setEtat(etat);

        }
        List<Recherche> list = recher.recherche(pl, motCle);
        m.addAttribute("valiny", list);
        
        m.addAttribute("mot",dis);
        return "recherche_avance";
    }
}
