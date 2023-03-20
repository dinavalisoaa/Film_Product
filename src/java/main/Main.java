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
import service.PlannificationService;
import service.PlateauService;
import service.SceneService;
import service.V_DureeDialogueService;

/**
 *
 * @author P14_A_111_Dina
 */
public class Main {


        for (int i = 0; i < date.getlPlanning().size(); i++) {
            System.out.println(date.getlPlanning().get(i).toString());
           // System.out.println(date.getlPlanning().get(i).getDate().getTime().toString());

        }
        for(int i = 0; i<date.getlDate().size(); i++){
            System.out.println(":"+date.getlDate().get(i).getTime().toString());
        }
//Pd.get
//       Personnage age=new Personnage();
//       age.setNom("ttt");
//       age.setPhoto("342");
//        is.setTitre("TITaNIC");
//        PlateauService vice=new PlateauService(dao);
//        vice.allPlateau();
//Plateau teau=new Plateau();
//teau.setId(1);
//        System.out.println(vice.isDisponible(teau,Date.valueOf("2023-04-02")));
//        Plateau teau=new Plateau();
//        teau.setId(1);
//        System.out.println(vice.isDisponible(teau,Date.valueOf("2023-04-02")));

//        PlannificationService service = new PlannificationService(dao);
//        List<Date> d = service.distinctDate();
//        for (int i = 0; i < d.size(); i++) {
//            System.out.println(d.get(i));
//        }
    }

}
