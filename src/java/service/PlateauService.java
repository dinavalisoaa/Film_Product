
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.HibernateDao;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import model.JourFerie;
import model.Personnage;
import model.Plateau;
import model.PlateauIndisponible;
import model.Scene;
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

    public PlateauService() {
    }

    public PlateauService(HibernateDao dao) {
        this.dao = dao;
    }

    public void insertPlateau(Plateau p) {
        try {
            dao.create(p);
        } catch (Exception e) {
            throw e;
        }
    }
    
    public void insertPlateauIndispo(PlateauIndisponible p) {
        try {
            dao.create(p);
        } catch (Exception e) {
            throw e;
        }
    }
 public List<Plateau> allPlateauNonDispo(String date1) {
        List<Plateau> list = null;
        try {
            list = dao.findBySql("from Plateau where id in (select plateauId from PlateauIndisponible where date('"+date1+"') between date1 and date2)");
        } catch (Exception e) {
            throw e;
        }
        return list;
    }

 
 public Plateau getByCoord(double lg,double lt) {
        List<Plateau> list = null;
        try {
            list = dao.findBySql("from plateau where longitude="+lg+" and  latitude="+lt);
        } catch (Exception e) {
            throw e;
        }
        return list.get(0);
    }
 public PlateauIndisponible getById(int id) {
        List<PlateauIndisponible> list = null;
        try {
            list = dao.findBySql("from PlateauIndisponible where plateauid="+id);
        } catch (Exception e) {
           
            throw e;
        }
        return list.get(0);
    }
 public List<Plateau> allPlateauNonDispoNoDate() {
        List<Plateau> list = null;
        try {
            list = dao.findBySql("from Plateau where id in (select plateauId from PlateauIndisponible)");
        } catch (Exception e) {
            throw e;
        }
        return list;
    }
 public List<Plateau> allPlateauDispo(String date1) {
        List<Plateau> list = null;
        try {
          list = dao.findBySql("from Plateau where id not in (select plateauId from PlateauIndisponible where date('"+date1+"') between date1 and date2)");
          } catch (Exception e) {
            throw e;
        }
        return list;
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
    
    public boolean verifFerie( Date date) {
        List<JourFerie> plat = null;
        try {
            plat = dao.findBySql("from JourFerie where jour="+date.getDate()+" and mois="+date.getMonth());
           
        } catch (Exception d) {
            throw d;
        }
        if (plat.size() > 0) {
            return true;
        }
        return false;
    }
    public boolean isDisponible(Plateau iray, Date date) {
        List<PlateauIndisponible> plat = null;
                List<JourFerie> ferie = null;

        try {
            plat = dao.findBySql("from PlateauIndisponible where date1<'" + date.toString() + "' and date2>'" + date.toString() + "' and plateauid=" + iray.getId());
           
        } catch (Exception d) {
            throw d;
        }
        if(verifFerie(date)){
        return false;
        }
        if (plat.size() > 0) {
            return false;
        }
        return true;
    }

    public Plateau getPlateauById(int id) {
        Plateau p = new Plateau();
        List list = allPlateau();
        try {
            for (int i = 0; i < list.size(); i++) {
                Plateau get = (Plateau) list.get(i);
                if (get.getId() == id) {
                    p = get;
                }
            }
        } catch (Exception e) {
            throw e;
        }
        return p;
    }
     public List<Plateau> allPlateauDispo(double latitude,double longitude,String date1) {
        List<Plateau> list = null;
        try {
          list = dao.findBySql(" from Plateau where id not in (select plateauId from PlateauIndisponible where date('"+date1+"') between date1 and date2) ORDER BY haversine_distance("+latitude+", "+longitude+", latitude, longitude) ASC");
          } catch (Exception e) {
            throw e;
        }
        return list;
    }
//     List<Plateau> indisponible = ps.allPlateauInDispo(disp.getLatitude(), disp.getLongitude(), dateFormat.format(debutP.getTime()));
      public boolean isDispo(int id,double latitude,double longitude,String date1) {
        List<Plateau> list = null;
        try {
          list = dao.findBySql(" from Plateau where id="+id+" and id in (select plateauId from PlateauIndisponible where date('"+date1+"') between date1 and date2) ORDER BY haversine_distance("+latitude+", "+longitude+", latitude, longitude) ASC");
          } catch (Exception e) {
            throw e;
        }
        if(list.size()>0){
        return false;
        }
        return true;
               
//        return ;
    }         
     public List<Plateau> allPlateauInDispo(double latitude,double longitude,String date1) {
        List<Plateau> list = null;
        try {
          list = dao.findBySql(" from Plateau where id  in (select plateauId from PlateauIndisponible where date('"+date1+"') between date1 and date2) ORDER BY haversine_distance("+latitude+", "+longitude+", latitude, longitude) ASC");
          } catch (Exception e) {
            throw e;
        }
        return list;
    }
}