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
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import service.PersonnageService;
import service.SceneService;

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
        m.addAttribute("etat", "0");
        m.addAttribute("service", service);

        return "dispo_personnage";
    }

    @RequestMapping(value = "/liste_personnage_scene")
    public String liste_personnage_scene(HttpServletRequest rq, Model m) {
        PersonnageService service = new PersonnageService(dao);
//        service.
        List<Personnage> nD = null;
        List<Personnage> liste = service.allPersonnage(Integer.parseInt(rq.getParameter("sceneId")));
        String date = LocalDate.now().toString();
//       m.addr
        SceneService men = new SceneService(dao);
        Scene c = men.getScene(Integer.parseInt(rq.getParameter("sceneId")));
        m.addAttribute("scene", c);
        m.addAttribute("mois",rq.getParameter("mois"));
        String d1 = LocalDate.parse(rq.getParameter("debut").split(" ")[0]).format(DateTimeFormatter.ofPattern("d MMM uuuu"));
        String d2 = LocalDate.parse(rq.getParameter("fin").split(" ")[0]).format(DateTimeFormatter.ofPattern("d MMM uuuu"));

        m.addAttribute("debut", d1 + " " + rq.getParameter("debut").split(" ")[1]);
        m.addAttribute("fin", d1 + " " + rq.getParameter("fin").split(" ")[1]);

        m.addAttribute("personnage", liste);

        return "liste_personnage_scene";
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
        int id = Integer.valueOf(id_s);
        String photo = "data:image/png;base64, " + PersonnageService.convert(JourFerie.file() + "\\" + file);
        String nom = req.getParameter("nom");
        Personnage p = new Personnage();
//        p.setNom(nom);
//        p.setPhoto(photo);
        service.update("update Personnage set photo='" + photo + "', nom='" + nom + "' where id=" + id);
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
