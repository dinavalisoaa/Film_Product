/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.HibernateDao;
import java.util.ArrayList;
import java.util.List;
import model.Plateau;
import model.Scene;
import model.V_DureeDialogue;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author P14_A_111_Dina
 */
public class V_DureeDialogueService {
    @Autowired
    HibernateDao dao;
    
    public HibernateDao getDao() {
        return dao;
    }
     public List<V_DureeDialogue> listeDureeDialogue(int idFilm) {
        String req = "from V_DureeDialogue where sceneid="+idFilm;
        List <V_DureeDialogue> list= null;
        try {
            list = dao.findBySql(req);
        } catch (Exception e) {
            throw e;
        }
        return list;
    }public List<V_DureeDialogue> alllisteDureeDialogue(int idFilm) {
        String req = "from V_DureeDialogue";// where sceneid="+idFilm;
        List <V_DureeDialogue> list= null;
        try {
            list = dao.findBySql(req);
        } catch (Exception e) {
            throw e;
        }
        return list;
    }
    public void setDao(HibernateDao dao) {
        this.dao = dao;
    }
    
    public V_DureeDialogueService(){}
    
    public V_DureeDialogueService(HibernateDao dao){
        this.dao=dao;
    }
    
    public void insertPlateau(Plateau p) {
        try {
            dao.create(p);
        } catch (Exception e) {
            throw e;
        }
    }
    
    public List<Plateau> allPlateau() {
        List<Plateau> list = null;
        try {
            list = dao.findAll(Plateau.class);
        } catch (Exception e) {
            throw e;
        }
        return list;
    }
}
