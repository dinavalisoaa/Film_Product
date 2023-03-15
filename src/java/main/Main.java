/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import dao.HibernateDao;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import model.*;
import service.DialogueService;
import service.PlateauService;
import service.SceneService;
import service.V_DureeDialogueService;

/**
 *
 * @author P14_A_111_Dina
 */
public class Main {


    public static String timestampAdd(String datetime, int val) {

        String str = datetime;
        str = str.split("\\.")[0];
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime dateTime = LocalDateTime.parse(str, formatter);
        LocalDateTime d = dateTime.plusHours(val);
        String fats = d.toString();
        String m1 = fats.split("T")[0];
        String m2 = fats.split("T")[1];
        return m1 + " " + m2;
    }

    /**
     * @param args the command line arguments
     */
    public static String addTwoTimestamp(String t1, String t2) throws Exception {
//    t1
        Time time1 = Time.valueOf(t1);
        Time time2 = Time.valueOf(t2);

        // Adding the two times
        Time resultTime = new Time(time1.getTime() + time2.getTime());
        return resultTime.toString();
    }

    public static void main(String[] args) throws Exception {
        // TODO code application logic here

        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        HibernateDao dao = (HibernateDao) context.getBean("hibernateDAO");
        Film is = new Film();
//       Personnage age=new Personnage();
//       age.setNom("ttt");
//       age.setPhoto("342");
        is.setTitre("TITaNIC");
        PlateauService vice=new PlateauService(dao);
//        vice.allPlateau();
Plateau teau=new Plateau();
teau.setId(1);
        System.out.println(vice.isDisponible(teau,Date.valueOf("2023-04-02")));
    }

}
