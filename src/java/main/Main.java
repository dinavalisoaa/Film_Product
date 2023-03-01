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
import service.SceneService;
import service.V_DureeDialogueService;

/**
 *
 * @author P14_A_111_Dina
 */
public class Main {
//public  static /

    public static ArrayList<Planning> setPlanning(HibernateDao dao, int filmId) throws Exception {
        V_DureeDialogueService sa = new V_DureeDialogueService(dao);;

        List<V_DureeDialogue> su = sa.alllisteDureeDialogue(filmId);
        Timestamp tamp = null;
        Timestamp tamp_prec = null;

        Timestamp tamp2 = null;
        LocalDateTime date = null;
        Timestamp val = su.get(0).getTotalDuree();
//        V_
        int pause = 5;
        Date debut = Date.valueOf("2023-02-02");
        int year = debut.getYear();
        int mois = debut.getMonth();
        int jour = debut.getDate();
        LocalDateTime resultat = LocalDateTime.of(year, mois, jour, val.getHours(), val.getMinutes(), val.getSeconds());
        resultat = resultat.plusHours(9).plusMinutes(30);
        resultat = resultat.minusMinutes(pause);

        LocalDateTime resultat_prec = LocalDateTime.of(year, mois, jour, val.getHours(), val.getMinutes(), val.getSeconds());
        resultat_prec = resultat.plusHours(8).plusMinutes(0);
        resultat_prec = resultat.minusMinutes(pause);
        int cpt = 0;
        int cpt2 = 0;
        ArrayList<Planning> plan = new ArrayList<Planning>();
        Planning pla = new Planning();
        pla.setDebut(resultat.minusMinutes(val.getMinutes()).plusMinutes(pause));
        pla.setFin(resultat.minusMinutes(pause));

        LocalDateTime debuts1 = pla.getDebut();
        LocalDateTime fins1 = pla.getDebut();


//        System.err.println( + " " + );
        pla.setSceneId(su.get(0).getSceneId());
        plan.add(pla);
        for (int i = 1; i < su.size(); i++) {
            V_DureeDialogue get = su.get(i);
            tamp = get.getTotalDuree();

            V_DureeDialogue prec = su.get(i);
            tamp_prec = prec.getTotalDuree();
            date = LocalDateTime.of(year, mois, jour, tamp.getHours(), tamp.getMinutes(), tamp.getSeconds());
            LocalDateTime date2 = null;

            {
                resultat = resultat.plusHours(tamp.getHours()).plusMinutes(tamp.getMinutes()).plusSeconds(tamp.getSeconds());
                resultat = resultat.minusMinutes(pause);
                resultat_prec = resultat_prec.plusHours(tamp_prec.getHours()).plusMinutes(tamp_prec.getMinutes()).plusSeconds(tamp_prec.getSeconds());
                resultat_prec = resultat_prec.minusMinutes(pause);

                if (resultat.minusMinutes(pause).isAfter(LocalDateTime.of(year, mois, jour, 12, 00, 00))) {
                    if (cpt < 1) {
                        resultat = LocalDateTime.of(year, mois, jour, 14, 00, 00);
                        resultat = resultat.minusMinutes(pause);
////
                        resultat = resultat.plusHours(tamp.getHours()).plusMinutes(tamp.getMinutes()).plusSeconds(tamp.getSeconds());
                        resultat = resultat.plusMinutes(pause);
                        cpt++;
                    }
                }
                if (resultat.minusMinutes(pause).isAfter(LocalDateTime.of(year, mois, jour, 18, 00, 00))) {
                    if (cpt2 < 1) {
                        debut.setDate(debut.getDate() + 1);
                        resultat = LocalDateTime.of(debut.toLocalDate(), LocalTime.of(8, 0, 0));
                        resultat = resultat.minusMinutes(pause);
////
                        resultat = resultat.plusHours(tamp.getHours()).plusMinutes(tamp.getMinutes()).plusSeconds(tamp.getSeconds());
                        resultat = resultat.plusMinutes(pause);
                        cpt2++;
                    }
                }
////            }
//LocalDateTime
                Planning id = new Planning();
                id.setSceneId(get.getSceneId());
                id.setDebut(resultat.minusHours(tamp_prec.getHours()).minusMinutes(tamp_prec.getMinutes()).minusSeconds(tamp_prec.getSeconds()).plusMinutes(pause));
                id.setFin(resultat.minusMinutes(pause));
                LocalDateTime debuts = id.getDebut();
                LocalDateTime fins = id.getDebut();

//                id.setDebut(LocalDateTime.of(2023, debuts.getMonth(), debuts.getDayOfMonth() , debuts.getHour(), debuts.getMinute(), debuts.getSecond()));
//                id.setFin(LocalDateTime.of(2023, fins.getMonth(), fins.getDayOfMonth() , fins.getHour(), fins.getMinute(), fins.getSecond()));

//                id.getDebut().s
                plan.add(id);

//            
//            if (i > 0) {
//                V_DureeDialogue get2 = su.get(i - 1);
//                tamp2 = get2.getTotalDuree();
//                date=date.plusHours(tamp2.getHours()).plusMinutes(tamp2.getMinutes()).plusSeconds(tamp2.getSeconds());
//                System.out.println(date);
//            }
//            System.out.println(date.minusHours(0).minusMinutes(pause).minusSeconds(0));
//            date
            }
        }

        return plan;
    }

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
//       dao.create(is);
        DialogueService daos = new DialogueService(dao);
//        select sum(cast(duree as interval)),dialogue.sceneid from dialogue group by dialogue.sceneid;
//       List<Dialogue> lis=daos.getAll();
//        for (int i = 0; i < lis.size(); i++) {
//            Dialogue get = lis.get(i);
//            System.out.println(get.getContenu());
//            Timestamp temp=get.getDuree();
//            temp.to
//            System.out.println(""+temp);
//            
//        }
        ArrayList<Planning> in = setPlanning(dao, 2);
        for (int i = 0; i < in.size(); i++) {
            Planning get = in.get(i);
            System.out.println("" + get.getDebut() + "    " + get.getFin() + "  " + get.getSceneId());
        }
//        SceneService a = new SceneService(dao);
//        V_DureeDialogueService sa = new V_DureeDialogueService(dao);
//
//        is.setTitre("TITaNIC");
////       dao.create(is);
//
//        List<V_DureeDialogue> su = sa.alllisteDureeDialogue(2);
//        Timestamp tamp = null;
//        Timestamp tamp_prec = null;
//
//        Timestamp tamp2 = null;
//        LocalDateTime date = null;
//        Timestamp val = su.get(0).getTotalDuree();
//        int pause = 5;
//        Date debut = Date.valueOf("2023-02-02");
//        int year = debut.getYear();
//        int mois = debut.getMonth();
//        int jour = debut.getDate();
//        LocalDateTime resultat = LocalDateTime.of(year, mois, jour, val.getHours(), val.getMinutes(), val.getSeconds());
//        resultat = resultat.plusHours(9).plusMinutes(30);
//        resultat = resultat.minusMinutes(pause);
//
//        LocalDateTime resultat_prec = LocalDateTime.of(year, mois, jour, val.getHours(), val.getMinutes(), val.getSeconds());
//        resultat_prec = resultat.plusHours(8).plusMinutes(0);
//        resultat_prec = resultat.minusMinutes(pause);
//        int cpt = 0;
//        int cpt2 = 0;
//
//        System.err.println(resultat.minusMinutes(val.getMinutes()).plusMinutes(pause) + " " + resultat.minusMinutes(pause));
//        for (int i = 1; i < su.size(); i++) {
//            V_DureeDialogue get = su.get(i);
//            tamp = get.getTotalDuree();
//
//            V_DureeDialogue prec = su.get(i);
//            tamp_prec = prec.getTotalDuree();
//            date = LocalDateTime.of(year, mois, jour, tamp.getHours(), tamp.getMinutes(), tamp.getSeconds());
//            LocalDateTime date2 = null;
//
//            {
//                resultat = resultat.plusHours(tamp.getHours()).plusMinutes(tamp.getMinutes()).plusSeconds(tamp.getSeconds());
//                resultat = resultat.minusMinutes(pause);
//                resultat_prec = resultat_prec.plusHours(tamp_prec.getHours()).plusMinutes(tamp_prec.getMinutes()).plusSeconds(tamp_prec.getSeconds());
//                resultat_prec = resultat_prec.minusMinutes(pause);
//
//                if (resultat.minusMinutes(pause).isAfter(LocalDateTime.of(year, mois, jour, 12, 00, 00))) {
//                    if (cpt < 1) {
//                        resultat = LocalDateTime.of(year, mois, jour, 14, 00, 00);
//                        resultat = resultat.minusMinutes(pause);
//////
//                        resultat = resultat.plusHours(tamp.getHours()).plusMinutes(tamp.getMinutes()).plusSeconds(tamp.getSeconds());
//                        resultat = resultat.plusMinutes(pause);
//                        cpt++;
//                    }
//                }
//                if (resultat.minusMinutes(pause).isAfter(LocalDateTime.of(year, mois, jour, 18, 00, 00))) {
//                    if (cpt2 < 1) {
//                        debut.setDate(debut.getDate() + 1);
//                        resultat = LocalDateTime.of(debut.toLocalDate(), LocalTime.of(8, 0, 0));
//                        resultat = resultat.minusMinutes(pause);
//////
//                        resultat = resultat.plusHours(tamp.getHours()).plusMinutes(tamp.getMinutes()).plusSeconds(tamp.getSeconds());
//                        resultat = resultat.plusMinutes(pause);
//                        cpt2++;
//                    }
//                }
//////            }
//                System.err.println(resultat.minusHours(tamp_prec.getHours()).minusMinutes(tamp_prec.getMinutes()).minusSeconds(tamp_prec.getSeconds()).plusMinutes(pause) + "<->" + resultat.minusMinutes(pause));
//
////            
////            if (i > 0) {
////                V_DureeDialogue get2 = su.get(i - 1);
////                tamp2 = get2.getTotalDuree();
////                date=date.plusHours(tamp2.getHours()).plusMinutes(tamp2.getMinutes()).plusSeconds(tamp2.getSeconds());
////                System.out.println(date);
////            }
////            System.out.println(date.minusHours(0).minusMinutes(pause).minusSeconds(0));
////            date
//            }
//        }
//        8:00
//        System.out.println(addTwoTimestamp("12:13:00","00:12:11"));

//        System.out.println(dao.addTwoTimestamp("00:12:00","00:14:00"));
//                       System.out.println(""+);
//        System.out.println(""+su.get(0).getTitre());
//        System.out.println(""+lis.get(0).getContenu());
//// Créer deux timestamps
//LocalDateTime timestamp1 = LocalDateTime.parse("1970-09-01 12:00:00");
//LocalDateTime timestamp2 = LocalDateTime.parse("1970-09-01 4:00:00");
// Afficher le résultat
//        System.out.println("Date de départ : " + date);
///        System.out.println("Date finale : " + resultat);
// Ajouter les deux timestamps
//LocalDateTime resultat = timestamp1.plus(Duration.between(timestamp1, timestamp/2));
// Afficher le résultat
//System.out.println("Résultat : " + resultat);
    }

}
