/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.HibernateDao;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import model.Dialogue;
import model.Scene;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author P14_A_111_Dina
 */
public class DialogueService {
    @Autowired
    HibernateDao dao;
    
    public HibernateDao getDao() {
        return dao;
    }
    
    public void setDao(HibernateDao dao) {
        this.dao = dao;
    }
    
    public DialogueService(){}
    
    public DialogueService(HibernateDao dao){
        this.dao=dao;
    }
    
    public void insertDialogue(Dialogue d) {
        try {
            dao.create(d);
        } catch (Exception e) {
            throw e;
        }
    }
    
    public void updateDialogue(int id, String contenu, int personnageId, int sceneId, Time duree) {
        String sql = "update Dialogue set contenu='" + contenu + "',personnageId="+ personnageId + ",sceneId=" + sceneId + ",duree='" + duree + "' where Id=" + id;
        dao.updateBySql(sql);
    }
                

    public List<Dialogue> listeDialogue(int idScene) {
        String req = "from Dialogue where sceneId = " + idScene + " order by numero";
        List list = null;
        try {
            list = dao.findBySql(req);
        } catch (Exception e) {
            throw e;
        }
        return list;
    } public List<Dialogue> listeByFilm(int idScene) {
        String req = "from Dialogue where sceneId in (select id From Scene where filmid="+idScene+")";
        List list = null;
        try {
            list = dao.findBySql(req);
        } catch (Exception e) {
            throw e;
        }
        return list;
    }

    public int getLastNumero(int idScene) {
        String req = "from Dialogue where sceneId = " + idScene + " order by numero DESC";
        List list = null;
        try {
            list = dao.findBySql(req);
        } catch (Exception e) {
            throw e;
        }
        int numero = 0;
        if(list.size() != 0){
            numero = ((Dialogue) list.get(0)).getNumero();
        }
        return numero;
    }
    
    public List<Dialogue> recherche(int idScene, String mot, String idPersonnage, String idEmotion){
        String req = "from Dialogue where 1=1";
        if(mot != null){
            req = req + " and (UPPER(contenu) like UPPER('%" + mot + "%') or UPPER(action) like UPPER('%" + mot + "%'))";
        }
        if(idPersonnage.equals("") == false){
            req = req + " and personnageId = " + idPersonnage;
        }
        if(idEmotion.equals("") == false){
            req = req + " and emotionId = " + idEmotion;
        }
        req = req + " and sceneId = " + idScene;
        List list = null;
        try {
            list = dao.findBySql(req);
        } catch (Exception e) {
            throw e;
        }
        return list;
    }
}
