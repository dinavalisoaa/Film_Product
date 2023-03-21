/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.HibernateDao;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;
import model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import service.PlannificationService;
import service.PlateauService;
import service.SceneService;

/**
 *
 * @author Fanjava
 */
@Controller
public class PlannificationController {

    @Autowired
    HibernateDao dao;

    @RequestMapping(value = "/add_plannification")
    public String addPlannification(HttpServletRequest req, Model m) {
        PlannificationService service = new PlannificationService(dao);
        Date date = Date.valueOf(LocalDate.now().toString());
        int sceneid = Integer.parseInt(req.getParameter("sceneid").trim());
        int plateauid = Integer.parseInt(req.getParameter("plateauid").trim());
        
        String debut = req.getParameter("debut");
        debut=debut.split("T")[0]+" "+debut.split("T")[1]+":00.0000";
        String fin = req.getParameter("fin");
        fin=fin.split("T")[0]+" "+fin.split("T")[1]+":00.0000";
        Timestamp tampDe = Timestamp.valueOf(debut);
        Timestamp tampFin = Timestamp.valueOf(fin);

        Plannification p = new Plannification();
        p.setDate(date);
        p.setSceneid(sceneid);
        p.setPlateauid(plateauid);
        p.setDatedebut(tampDe);
        p.setDatefin(tampFin);
        service.insertPlannification(p);
        return "redirect:liste_plannification";
    }

    @RequestMapping(value = "/liste_plannification")
    public String liste_plannification(HttpServletRequest rq, Model m) {
        PlannificationService service = new PlannificationService(dao);
        SceneService sceneservice = new SceneService(dao);
        PlateauService plateauservice = new PlateauService(dao);
        List<Plannification> liste = service.allPlannification();
        List<Date> date = service.distinctDate();
        m.addAttribute("liste", liste);
        m.addAttribute("date", date);
        m.addAttribute("service", service);
        m.addAttribute("sceneservice", sceneservice);
        
        m.addAttribute("lPlateau", plateauservice.allPlateau());
        m.addAttribute("lScene", sceneservice.allScene());
        m.addAttribute("plateauservice", plateauservice);
        
        return "liste_plannification";
    }

    @RequestMapping(value = "/update_plannification")
    public String updatePlannification(HttpServletRequest req, Model m) {
        PlannificationService service = new PlannificationService(dao);
        String debut = req.getParameter("debut");
        debut=debut.split("T")[0]+" "+debut.split("T")[1];
        String fin = req.getParameter("fin");
        fin=fin.split("T")[0]+" "+fin.split("T")[1];
        int sceneid = Integer.parseInt(req.getParameter("sceneid").trim());
        int id = Integer.parseInt(req.getParameter("id").trim());
        Plannification p = new Plannification();
        Date date = Date.valueOf(debut.split(" ")[0]);

        p.setDate(date);
        p.setSceneid(sceneid);
        p.setId(id);
        service.updatePlannification(id, date, sceneid, debut, fin);
        return "redirect:liste_plannification";
    }
}
