/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.HibernateDao;
import model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import service.PlateauService;
import service.SceneService;

/**
 *
 * @author Fanjava
 */
@Controller
public class PlateauController {

    @Autowired
    HibernateDao dao;

    @RequestMapping(value = "/plateau")
    public String pagePlateau(Model m) {
        PlateauService service = new PlateauService(dao);
        List<Plateau> liste = service.allPlateau();
        m.addAttribute("plateau", liste);
        return "ajout_plateauN";
    }

    @RequestMapping(value = "/liste_plateau")
    public String liste_plateau(HttpServletRequest rq, Model m) {
        PlateauService service = new PlateauService(dao);
//        service.
        List<Plateau> nD = null;
        List<Plateau> liste = service.allPlateau();
        String date = LocalDate.now().toString();
        if (rq.getParameter("date") != null) {
            if (rq.getParameter("date").equals("123")) {
                nD = service.allPlateauNonDispoNoDate();
            } else {
                date = rq.getParameter("date");
                nD = service.allPlateauNonDispo(date);
            }
        } else {
            nD = service.allPlateauNonDispo(date);

        }

        m.addAttribute("plateau", liste);
        m.addAttribute("dispo", nD);
        m.addAttribute("date", date);
        m.addAttribute("etat", 0);
        m.addAttribute("service", service);

        return "dispo_plateau";
    }

    @RequestMapping(value = "/detail_plateau")
    public String detail_plateau(HttpServletRequest rq, Model m) {
        SceneService service = new SceneService(dao);
        PlateauService pSer = new PlateauService(dao);
        List<Scene> liste = service.getParPlateau(Integer.parseInt(rq.getParameter("id")));
        Plateau iray = pSer.getPlateauById(Integer.parseInt(rq.getParameter("id")));
        m.addAttribute("scene", liste);
        m.addAttribute("plateau", iray);

        return "detail_plateau";
    }

    @RequestMapping(value = "/liste_plateau_dispo")
    public String liste_plateau_dispo(HttpServletRequest rq, Model m) {
        PlateauService service = new PlateauService(dao);
        List<Plateau> liste = service.allPlateau();
        String date = LocalDate.now().toString();
        if (rq.getParameter("date") != null) {
            date = rq.getParameter("date");
        }
        List<Plateau> nD = service.allPlateauDispo(date);
        m.addAttribute("plateau", liste);
        m.addAttribute("etat", 1);

        m.addAttribute("dispo", nD);
        m.addAttribute("date", date);
        return "dispo_plateau";
    }

    @RequestMapping(value = "/add_plateau")
    public String addPlateau(HttpServletRequest req, Model m) {
        PlateauService service = new PlateauService(dao);
        String nom = req.getParameter("nom");
        String description = req.getParameter("description");
        Plateau p = new Plateau();
        p.setNom(nom);
        p.setDescription(description);
        service.insertPlateau(p);
        return "redirect:plateau";
    }

    @RequestMapping(value = "/add_indispo")
    public String add_indispo(HttpServletRequest req, Model m) {
        PlateauService service = new PlateauService(dao);
        PlateauIndisponible pI = new PlateauIndisponible();
        pI.setDate1(Date.valueOf(req.getParameter("date1")));
        pI.setDate2(Date.valueOf(req.getParameter("date2")));
        pI.setPlateauId(Integer.parseInt(req.getParameter("plateauId")));
        service.insertPlateauIndispo(pI);
        return "redirect:liste_plateau";
    }
    
    @RequestMapping(value = "/popup")
    public String add_indispo(HttpServletRequest req, Model m) {
        return "popup";
    }
}
