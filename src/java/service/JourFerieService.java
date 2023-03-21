/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.HibernateDao;
import java.util.List;
import model.JourFerie;
import model.Plateau;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Tolotra
 */
public class JourFerieService {
     @Autowired
    HibernateDao dao;

    public HibernateDao getDao() {
        return dao;
    }

    public void setDao(HibernateDao dao) {
        this.dao = dao;
    }

    public JourFerieService(HibernateDao dao) {
        this.dao = dao;
    }
      public List<JourFerie> jourFerie(int jour, int mois) {
        List<JourFerie> list = null;
        try {
            list = dao.findBySql("from JourFerie where jour="+jour+" AND mois="+mois);
        } catch (Exception e) {
            throw e;
        }
        return list;
    }
}
