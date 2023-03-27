/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import Util.Concat;
import dao.HibernateDao;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import model.Film;
import model.Planning;
import model.Plateau;
import model.Scene;
import model.V_DureeDialogue;
import model.Recherche;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author P14_A_111_Dina
 */
public class RechercheService {

    @Autowired
    HibernateDao dao;

    public HibernateDao getDao() {
        return dao;
    }

    public void setDao(HibernateDao dao) {
        this.dao = dao;
    }

    public RechercheService() {
    }

    public RechercheService(HibernateDao dao) {
        this.dao = dao;
    }

    public void insertScene(Scene s) {
        try {
            dao.create(s);
        } catch (Exception e) {
            throw e;
        }
    }

   

    public List<Recherche> recherche(Recherche vP,String mot ) {
        String req = "from Recherche where 1=1";
        if(mot!=null){
        req+=" and (upper(filmtitre) like upper('%"+mot+"%') or upper(scenetitre) like upper('%"+mot+"%') or upper(nom) like upper('%"+mot+"%')) ";
        }
        if(vP.getDebutPlan()!=null ){
        req+=" and date(datedebut)>=date('"+vP.getDebutPlan()+"')";
        }
          if(vP.getFinPlan()!=null){
        req+=" and date(datefin)<=date('"+vP.getFinPlan()+"')";
        }
            if(vP.getEtat()!=-1){
        req+=" and etat="+vP.getEtat();
        }
            if(vP.getPlateauId()!=0){
        req+=" and plateauId="+vP.getPlateauId();
        }  
             if(vP.getSceneId()!=0){
        req+=" and sceneId="+vP.getSceneId();
        }  
              if(vP.getFilmId()!=0){
        req+=" and filmId="+vP.getFilmId();
        }  
        List<Recherche> list = null;
        try {
            list = dao.findBySql(req);
//            System.out.println("!!!!!!!!!!!!!!!!"+list.size());
        } catch (Exception e) {
            throw e;
        }
        return list;
    }

}
