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
import model.V_StatMois;
import model.V_DureeDialogue;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author P14_A_111_Dina
 */
public class V_StatMoisService {

    @Autowired
    HibernateDao dao;

    public HibernateDao getDao() {
        return dao;
    }

    public void setDao(HibernateDao dao) {
        this.dao = dao;
    }

    public V_StatMoisService() {
    }

    public V_StatMoisService(HibernateDao dao) {
        this.dao = dao;
    }

    public void insertV_StatMois(V_StatMois s) {
        try {
            dao.create(s);
        } catch (Exception e) {
            throw e;
        }
    }


    public V_StatMois getV_StatMois(int idFilm, int scene) {
        String req = "from V_StatMois where filmId = " + idFilm + "";
        List list = null;
        try {
            list = dao.findBySql(req);
        } catch (Exception e) {
            throw e;
        }
        return (V_StatMois) list.get(0);
    }

//     select *from scene where id in (select sceneid from dialogue where personnageid in(select personnageid from personnageindisponible where date('2023-03-21') between date1 and date2));
    public List<V_StatMois> listeV_StatMois(int idFilm) {
        String req = "from V_StatMois where filmId="+idFilm+" order by numero";
        List list = null;
        try {
            list = dao.findBySql(req);
        } catch (Exception e) {
            throw e;
        }
        return list;
    }

    public List<V_StatMois> listeV_StatMoisByDate(String date) {
        String req = "from V_StatMois where id in (select sceneId from Dialogue where personnageId in( select personnageId from PersonnageIndisponible where date('" + date + "') between date1 and date2)) or id in (select sceneid from Plannification) ";
        List<V_StatMois> list = null;
        try {
            list = dao.findBySql(req);
        } catch (Exception e) {
            throw e;
        }
        return list;
    }

   
    public List<V_StatMois> allV_StatMois() {
        List<V_StatMois> list = null;
        try {
            list = dao.findBySql("from V_StatMois order by mois asc");
        } catch (Exception e) {
            throw e;
        }
        return list;
    }

  

    public V_StatMois getV_StatMois(int id) {
        List<V_StatMois> als = null;
        try {
            als = dao.findBySql("from V_StatMois where id=" + id);
        } catch (Exception e) {
            throw e;
        }
        return als.get(0);
    }

}
