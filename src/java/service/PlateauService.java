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
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author P14_A_111_Dina
 */
public class PlateauService {
    @Autowired
    HibernateDao dao;
    
    public HibernateDao getDao() {
        return dao;
    }
    
    public void setDao(HibernateDao dao) {
        this.dao = dao;
    }
    
    public PlateauService(){}
    
    public PlateauService(HibernateDao dao){
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
