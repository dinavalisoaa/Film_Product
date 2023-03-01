/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.HibernateDao;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import model.Planning;
import model.Scene;
import model.V_DureeDialogue;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author P14_A_111_Dina
 */
public class SceneService {
    @Autowired
    HibernateDao dao;
    
    public HibernateDao getDao() {
        return dao;
    }
    
    public void setDao(HibernateDao dao) {
        this.dao = dao;
    }
    
    public SceneService(){}
    
    public SceneService(HibernateDao dao){
        this.dao=dao;
    }
    
    public void insertScene(Scene s) {
        try {
            dao.create(s);
        } catch (Exception e) {
            throw e;
        }
    }
    
    public void updateScene(int id, String titre, int numero, int plateauId) {
        String sql = "update Scene set titre='" + titre + "',numero="+ numero + ",plateauId=" + plateauId + " where Id=" + id;
        dao.updateBySql(sql);
    }
    
    public List<Scene> listeScene(int idFilm) {
        String req = "from Scene where filmId = " + idFilm + " order by numero";
        List list = null;
        try {
            list = dao.findBySql(req);
        } catch (Exception e) {
            throw e;
        }
        return list;
    }
    
    public int getLastNumero(int idFilm) {
        String req = "from Scene where filmId = " + idFilm + " order by numero DESC";
        List list = null;
        try {
            list = dao.findBySql(req);
        } catch (Exception e) {
            throw e;
        }
        int numero = 0;
        if(list.size() != 0){
            numero = ((Scene) list.get(0)).getNumero();
        }
        return numero;
    }
    
    public List<Scene> recherche(int idFilm,String mot, String idPlateau, String date){
        String req = "from Scene where 1=1";
        if(mot != null){
            req = req + " and (UPPER(titre) like UPPER('%" + mot + "%') or to_char(date, 'YYYY-MM-DD') like ('%" + mot + "%'))";
        }
        if(idPlateau != null){
            req = req + " and plateauId = " + idPlateau;
        }
        if(date.toString().equals("") == false){
            req = req + " and date = '" + date + "'";
        }
        req = req + " and filmId = " + idFilm;
        List list = null;
        try {
            list = dao.findBySql(req);
        } catch (Exception e) {
            throw e;
        }
        return list;
    }
 

    public static ArrayList<Planning> setPlanning(HibernateDao dao, int filmId) throws Exception {
        V_DureeDialogueService sa = new V_DureeDialogueService(dao);;
       ConfigurationService service = new ConfigurationService(dao);
        List<V_DureeDialogue> su = sa.alllisteDureeDialogue(filmId);
        Timestamp tamp = null;
        Timestamp tamp_prec = null;

        Timestamp tamp2 = null;
        LocalDateTime date = null;
        Timestamp val = su.get(0).getTotalDuree();
        Time heuredebut = service.getConfig("heuredebut").getValeur();
        Time heurefin = service.getConfig("heurefin").getValeur();
        Time pauses = service.getConfig("pausescene").getValeur();
        int pause = pauses.getMinutes();

        Time finbreak = service.getConfig("finbreak").getValeur();
        Time debutbreak = service.getConfig("debutbreak").getValeur();

        Date debut = Date.valueOf("2023-02-02");
        int year = debut.getYear();
        int mois = debut.getMonth();
        int jour = debut.getDate();
        LocalDateTime resultat = LocalDateTime.of(year, mois, jour, val.getHours(), val.getMinutes(), val.getSeconds());
         resultat=resultat.plusHours(heuredebut.getHours()).plusMinutes(heuredebut.getMinutes());
        resultat = resultat.minusMinutes(pause);

        LocalDateTime resultat_prec = LocalDateTime.of(year, mois, jour, val.getHours(), val.getMinutes(), val.getSeconds());
        resultat_prec = resultat.plusHours(heuredebut.getHours()).plusMinutes(heuredebut.getMinutes());
        resultat_prec = resultat.minusMinutes(pause);
        int cpt = 0;
        int cpt2 = 0;
        ArrayList<Planning> plan = new ArrayList<Planning>();
        Planning pla = new Planning();
        pla.setDebut(resultat.minusMinutes(val.getMinutes()).plusMinutes(pause));
        pla.setFin(resultat.minusMinutes(pause));
        LocalDateTime debuts1 = pla.getDebut();
        LocalDateTime fins1 = pla.getDebut();
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

                if (resultat.minusMinutes(pause).isAfter(LocalDateTime.of(year, mois, jour, debutbreak.getHours(), debutbreak.getMinutes(), debutbreak.getSeconds()))) {
                    if (cpt < 1) {
                        resultat = LocalDateTime.of(year, mois, jour, finbreak.getHours(), finbreak.getMinutes(), finbreak.getSeconds());
                        resultat = resultat.minusMinutes(pause);
////
                        resultat = resultat.plusHours(tamp.getHours()).plusMinutes(tamp.getMinutes()).plusSeconds(tamp.getSeconds());
                        resultat = resultat.plusMinutes(pause);
                        cpt++;
                    }
                }
                if (resultat.minusMinutes(pause).isAfter(LocalDateTime.of(year, mois, jour, heurefin.getHours(), heurefin.getMinutes(), heurefin.getSeconds()))) {
                    if (cpt2 < 1) {
                        debut.setDate(debut.getDate() + 1);
                        resultat = LocalDateTime.of(debut.toLocalDate(), LocalTime.of(heuredebut.getHours(), heuredebut.getMinutes(), heuredebut.getSeconds()));
                        resultat = resultat.minusMinutes(pause);
                        resultat = resultat.plusHours(tamp.getHours()).plusMinutes(tamp.getMinutes()).plusSeconds(tamp.getSeconds());
                        resultat = resultat.plusMinutes(pause);
                        cpt2++;
                    }
                }
                Planning id = new Planning();
                id.setSceneId(get.getSceneId());
                id.setDebut(resultat.minusHours(tamp_prec.getHours()).minusMinutes(tamp_prec.getMinutes()).minusSeconds(tamp_prec.getSeconds()).plusMinutes(pause));
                id.setFin(resultat.minusMinutes(pause));
                LocalDateTime debuts = id.getDebut();
                LocalDateTime fins = id.getDebut();
                plan.add(id);

            }
        }

        return plan;
    }
   
}
