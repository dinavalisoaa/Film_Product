/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
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
import org.springframework.web.bind.annotation.RestController;
import service.DialogueService;
import service.FilmService;
import service.PlateauService;
import service.SceneService;
/**
 *
 * @author Fanjava
 */
@Controller
public class CalendarController {

    @Autowired
    HibernateDao dao;

    @RequestMapping(value = "/data")
    public String pageScene(HttpServletRequest request, Model m) {
        Gson son = new Gson();
        String start = request.getParameter("start");
        String end = request.getParameter("end");

        ArrayList<Events> apla = new ArrayList();
        ArrayList<Events> apla2 = new ArrayList();

        apla.add(new Events(2, "Events", LocalDateTime.parse("2023-03-14T11:30:00"), LocalDateTime.parse("2023-03-14T12:00:00")));
        apla.add(new Events(3, "Events", LocalDateTime.parse("2023-03-13T11:30:00"), LocalDateTime.parse("2023-03-13T12:00:00")));
        for (int i = 0; i < apla.size(); i++) {
            Events get = apla.get(i);
//            if (LocalDateTime.parse(get.getEnd()).isAfter(LocalDateTime.parse(end)) && LocalDateTime.parse(get.getStart()).isBefore(LocalDateTime.parse(start)) ) {
//                apla2.add(get);
//            }

        }
        m.addAttribute("data", son.toJson(apla));
        return "view";
//       ArrayList
    }

}
