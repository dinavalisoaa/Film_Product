/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.HibernateDao;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import model.Scene;
import org.hibernate.Query;
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

    public SceneService() {
    }
//    pu

    public SceneService(HibernateDao dao) {
        this.dao = dao;
    }

    public void insertScene(Scene s) {
        try {
            dao.create(s);
        } catch (Exception e) {
            throw e;
        }
    }

    public void updateScene(int id, String titre, int numero, int plateauId) {
        String sql = "update Scene set titre='" + titre + "',numero=" + numero + ",plateauId=" + plateauId + " where Id=" + id;
        dao.updateBySql(sql);
    }

    public List<Scene> getDurer(int id) {
        String req = "select sum(cast(scene.duree as interval)) as totalDuree,scene.sceneId from Dialogue as scene where scene.sceneId=" + id + " group by scene.sceneId ";
//                System.out.println(req);
        List list = null;
        Query ry = null;

        try {
            ry = dao.findBySql2(Scene.class, req);
            for (Iterator iterator = ry.iterate(); iterator.hasNext();) {
                Object[] next = (Object[]) iterator.next();
//                
                System.out.println(next[0]);
            }
        } catch (Exception e) {
            throw e;
        }
        return list;
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
