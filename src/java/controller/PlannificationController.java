/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.HibernateDao;
import java.sql.Date;
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
        Date date = Date.valueOf(req.getParameter("date").trim());
        int sceneid = Integer.parseInt(req.getParameter("sceneid").trim());
        int plateauid = Integer.parseInt(req.getParameter("plateauid").trim());
        Plannification p = new Plannification();
        p.setDate(date);
        p.setSceneid(sceneid);
        p.setPlateauid(plateauid);
        service.insertPlannification(p);
        return "redirect:voirPlanning";
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
        m.addAttribute("plateauservice", plateauservice);
        return "liste_plannification";
    }
    
    @RequestMapping(value = "/update_plannification")
    public String updatePlannification(HttpServletRequest req, Model m) {
        PlannificationService service = new PlannificationService(dao);
        Date date = Date.valueOf(req.getParameter("date").trim());
        int sceneid = Integer.parseInt(req.getParameter("sceneid").trim());
        int plateauid = Integer.parseInt(req.getParameter("plateauid").trim());
        int id = Integer.parseInt(req.getParameter("id").trim());
        Plannification p = new Plannification();
        p.setDate(date);
        p.setSceneid(sceneid);
        p.setPlateauid(plateauid);
        p.setId(id);
        service.updatePlannification(id, date, sceneid, plateauid);
        return "redirect:voirPlanning";
    }
}
