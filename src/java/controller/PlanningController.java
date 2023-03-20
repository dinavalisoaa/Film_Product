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
import java.util.ArrayList;
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
import service.PlateauService;
import service.SceneService;

/**
 *
 * @author Fanjava
 */
@Controller
public class PlanningController {

    @Autowired
    HibernateDao dao;

    @RequestMapping(value = "/planning")
    public String pageScene(HttpServletRequest req, Model m) {
        FilmService ser = new FilmService(dao);
        List<Film> fils = ser.allFilm();
        m.addAttribute("film", fils);
        return "planning";
    }

    @RequestMapping(value = "/calendar")
    public String cal(HttpServletRequest req, Model m) {
//        FilmService ser = new FilmService(dao);
//        List<Film> fils = ser.allFilm();
//        m.addAttribute("film", fils);
        return "index";
    }

    @RequestMapping(value = "/voirPlanning")
    public String voirPlanning(HttpServletRequest req, Model m) throws Exception {
//        FilmService ser=new FilmService(dao);
        SceneService ser = new SceneService(dao);
        ArrayList<Planning> lifs = ser.setPlannings(dao, Integer.valueOf(req.getParameter("id")), Integer.valueOf(req.getParameter("jour")));
        ArrayList<Integer> tinct = SceneService.distinct(dao, Integer.valueOf(req.getParameter("id")));

        m.addAttribute("film", lifs);
        m.addAttribute("titre", req.getParameter("titre"));

        m.addAttribute("distinct", tinct);
        m.addAttribute("jour", req.getParameter("jour"));

        m.addAttribute("id", Integer.valueOf(req.getParameter("id")));

        return "voirPlanning";
    }
     @RequestMapping(value = "/planningForm", method= RequestMethod.GET)
    public String planningForm(@RequestParam(value="idFilm") int idFilm,Model m){
        m.addAttribute("scene", new SceneService(dao).listeScene(idFilm));
       return "createPlanning";
    }
    @RequestMapping(value= "/creerPlanning", method= RequestMethod.GET)
    public String creerPlanning(@RequestParam(value="debut") String debut,@RequestParam(value="fin") String fin,@RequestParam(value="scene[]") String[] idScene,Model m){
        List <Scene> selectionne = new SceneService(dao).listeScene(1);
        PlanningDate plan = new PlanningDate();
        plan.setlScene((ArrayList<Scene>) selectionne);
        plan.setPlanning(dao, Date.valueOf(debut),Date.valueOf(fin));
        m.addAttribute("planning", plan);
        return "planningDisplay";
    }
}
