/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.HibernateDao;
import java.util.ArrayList;
import java.util.List;
import model.Scene;
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
        String req = "from Scene where filmId = " + idFilm;
        List list = null;
        try {
            list = dao.findBySql(req);
        } catch (Exception e) {
            throw e;
        }
        return list;
    }
}
