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
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.FilmService;
import service.PlannificationService;
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

    @RequestMapping(value = "/planningForm", method = RequestMethod.GET)
    public String planningForm(@RequestParam(value = "idFilm") int idFilm, Model m) {
        m.addAttribute("scene", new SceneService(dao).listeScene(idFilm));
        m.addAttribute("ser",  new SceneService(dao));
        return "createPlanning";
    }

    @RequestMapping(value = "/creerPlanning", method = RequestMethod.GET)
    public String creerPlanning(@RequestParam(value = "debut") String debut, @RequestParam(value = "fin") String fin, @RequestParam(value = "scene[]") String[] idScene, Model m) {
        SceneService vice = new SceneService(dao);
//        ArrayList<Scene> se = (ArrayList<Scene>) vice.listeScene(1);
        ArrayList<Scene> se = new ArrayList<>();

        for (int i = 0; i < idScene.length; i++) {
            String string = idScene[i];
            Scene scn = vice.getScene(Integer.parseInt(string));
            se.add(scn);
        }
//        List <Scene> selectionne = new SceneService(dao).listeScene(1);
        PlanningDate plan = new PlanningDate();
        plan.setlScene(se);
        plan.setPlanning(dao, Date.valueOf(debut), Date.valueOf(fin));

//        m.addAttribute("plateau", plan.plateauDistinct());
        m.addAttribute("planning", plan);
        m.addAttribute("debut", debut);

        m.addAttribute("fin", fin);

        return "planningDisplay";
    }

    @RequestMapping(value = "/par_date", method = RequestMethod.GET)
    public String par_date(@RequestParam(value = "debut") String debut, @RequestParam(value = "fin") String fin, @RequestParam(value = "scene[]") String[] idScene, Model m) {
        SceneService vice = new SceneService(dao);
//        ArrayList<Scene> se = (ArrayList<Scene>) vice.listeScene(1);
        ArrayList<Scene> se = new ArrayList<>();

        for (int i = 0; i < idScene.length; i++) {
            String string = idScene[i];
            Scene scn = vice.getScene(Integer.parseInt(string));
            se.add(scn);
        }
//        List <Scene> selectionne = new SceneService(dao).listeScene(1);
        PlanningDate plan = new PlanningDate();
        plan.setlScene(se);
        plan.setPlanning(dao, Date.valueOf(debut), Date.valueOf(fin));

        m.addAttribute("plateau", plan.plateauDistinct());
        m.addAttribute("planning", plan);
        return "planningDisplay";
    }

    @RequestMapping(value = "/generer")
    public String generer(@RequestParam(value = "debut") String debut, @RequestParam(value = "fin") String fin, @RequestParam(value = "scene[]") String[] idScene, Model m) {
        ArrayList<Scene> se = new ArrayList();
        SceneService vice = new SceneService(dao);
        for (int i = 0; i < idScene.length; i++) {
            String string = idScene[i];
            Scene scn = vice.getScene(Integer.parseInt(string));
            se.add(scn);
        }
//        List <Scene> selectionne = new SceneService(dao).listeScene(1);
        PlanningDate plan = new PlanningDate();
        plan.setlScene(se);
        plan.setPlanning(dao, Date.valueOf(debut), Date.valueOf(fin));

        ArrayList<Planning> lPlanning = plan.getlPlanning();
        PlannificationService service = new PlannificationService(dao);
       int i= service.getLastVague();
        service.genererAll(lPlanning,Date.valueOf(debut),Date.valueOf(fin),i);
//        m.addAttribute("plateau", plan.plateauDistinct());
        m.addAttribute("planning", plan);

        return "redirect:vague";
    }
}
