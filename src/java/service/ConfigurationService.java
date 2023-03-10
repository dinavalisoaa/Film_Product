/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.HibernateDao;
import java.util.ArrayList;
import java.util.List;
import model.Configuration;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author P14_A_111_Dina
 */
public class ConfigurationService {
    @Autowired
    HibernateDao dao;
    
    public HibernateDao getDao() {
        return dao;
    }
      public Configuration getConfig(String cle) {
//        String req = "select sum(cast(scene.duree as interval)) as totalDuree,scene.sceneId from Dialogue as scene where scene.sceneId=" + id + " group by scene.sceneId ";
//                System.out.println(req);
        List list = null;

        try {
            list=dao.findBySql("from Configuration where lower(cle)=lower('"+cle+"')");
        } catch (Exception e) {
            throw e;
        }
        return (Configuration) list.get(0);
    }

    public void setDao(HibernateDao dao) {
        this.dao = dao;
    }
    
    public ConfigurationService(){}
    
    public ConfigurationService(HibernateDao dao){
        this.dao=dao;
    }
    
}
