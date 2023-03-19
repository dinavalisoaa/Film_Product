
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.HibernateDao;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import model.JourFerie;
import model.Plannification;
import model.Plateau;
import model.PlateauIndisponible;
import model.Scene;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author P14_A_111_Dina
 */
public class PlannificationService {

    @Autowired
    HibernateDao dao;

    public HibernateDao getDao() {
        return dao;
    }

    public void setDao(HibernateDao dao) {
        this.dao = dao;
    }

    public PlannificationService() {
    }

    public PlannificationService(HibernateDao dao) {
        this.dao = dao;
    }

    public void insertPlannification(Plannification p) {
        try {
            dao.create(p);
        } catch (Exception e) {
            throw e;
        }
    }
    
    public void updatePlannification(int id, Date date, int sceneid, int plateauid) {
        String sql = "update Plannification set date='" + date + "',scened="+ sceneid + ",plateauid=" + plateauid + " where Id=" + id;
        dao.updateBySql(sql);
    }
  
    public List<Plannification> allPlannification() {
        List<Plannification> list = null;
        try {
            list = dao.findAll(Plannification.class);
        } catch (Exception e) {
            throw e;
        }
        return list;
    }
    
    public boolean ifExist(Date d, List<Date> list){
        try {
          for (int i = 0; i < list.size(); i++) {
                if(list.get(i).equals(d)){
                    return true;
                }
            }
          } catch (Exception e) {
            throw e;
        }
        return false;
    }
    
//    public List<Date> distinctDate() {
//        List<Plannification> list = null;
//        List<Date> list_date = null;
//        try {
//          list = dao.findBySql("from Plannification");
//            for (int i = 0; i < list.size(); i++) {
//                Date get = list.get(i).getDate();
//                if(ifExist(get, list_date) == false){
//                    list_date.add(get);
//                }
//            }
//          } catch (Exception e) {
//            throw e;
//        }
//        return list_date;                                                                                    
//    }
    
    public List<Date> distinctDate() {
        List<Date> list = null;
        try {
          list = dao.findBySql("select distinct(date) from Plannification order by date asc");
          } catch (Exception e) {
            throw e;
        }
        return list;                                                                                    
    }
    
    public List<String> plateau(Date d) {
        List<String> list = null;
        try {
          list = dao.findBySql("select distinct(pt.nom) from Plateau pt join plannification pn on pt.id = pn.plateauid where pn.date = '"+ d +"'");
          } catch (Exception e) {
            throw e;
        }
        return list;                                                                                    
    }
    
    public List<Plannification> plannificationByDate(Date d) {
        List<Plannification> list = null;
        try {
          list = dao.findBySql("from Plannification where date = '"+ d +"' order by id asc");
          } catch (Exception e) {
            throw e;
        }
        return list;                                                                                    
    }
}
