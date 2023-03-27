
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.HibernateDao;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.JourFerie;
import model.Plannification;
import model.Planning;
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

    public void updatePlannification(int id, Date date, int sceneid, String datedebut, String datefin) {
        String sql = "update Plannification set date='" + date + "',sceneid=" + sceneid + ",datedebut='" + datedebut + "',datefin='" + datefin + "' where Id=" + id;
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

    public List<Plannification> allPlannificationByVague(int id) {
        List<Plannification> list = null;
        try {
            list = dao.findBySql("from Plannification where vague=" + id);
        } catch (Exception e) {
            throw e;
        }
        return list;
    }

    public List<Integer> distinctVague() {
        List<Integer> list = null;
        try {
            list = dao.findBySql("select distinct(vague) from Plannification ");
        } catch (Exception e) {
            throw e;
        }
        return list;
    }

    public Plannification getPlannification(int vague) {
        List<Plannification> list = null;
        try {
            list = dao.findBySql("from Plannification where vague=" + vague);
        } catch (Exception e) {
            throw e;
        }
        return list.get(0);
    }
//    public List<Integer> distinctVague() {
//        List<Integer> list = null;
//        try {
//            list = dao.findBySql("select d(vague) from Planniification ");
//        } catch (Exception e) {
//            throw e;
//        }
//        return list;
//    }

    public boolean ifExist(Date d, List<Date> list) {
        try {
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).equals(d)) {
                    return true;
                }
            }
        } catch (Exception e) {
            throw e;
        }
        return false;
    }

    public void generer(Planning iray, Date de, Date fi, int vague) {
        PlannificationService service = new PlannificationService(dao);
        Date date = Date.valueOf(iray.getDebut().toLocalDate().toString());
        Plannification p = new Plannification();
        SceneService svi=new SceneService(dao);
        p.setDate(date);
        p.setPlateauid(iray.getScene().getPlateauId());
        p.setDatedebut(Timestamp.valueOf(iray.getDebut()));
        p.setDatefin(Timestamp.valueOf(iray.getFin()));
        p.setSceneid(iray.getSceneId());
        p.setVague(vague);
        p.setDebut(de);
        p.setFin(fi);
        PlateauService serv = new PlateauService(dao);
        PlateauIndisponible ponible = new PlateauIndisponible();
        ponible.setDate1(Date.valueOf(LocalDate.parse(iray.getDebut().toString().split("T")[0])));
        ponible.setDate2(Date.valueOf(LocalDate.parse(iray.getFin().toString().split("T")[0])));
        ponible.setPlateauId(p.getPlateauid());
//        ponible.s
        serv.insertPlateauIndispo(ponible);
        service.insertPlannification(p);
    }

    public void genererAll(ArrayList<Planning> planning, Date de, Date fi, int va) {
        for (int i = 0; i < planning.size(); i++) {
            Planning get = planning.get(i);
            if (get.getDispo() != -1) {
                generer(get, de, fi, va);
            }
        }
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

    public List<Date> distinctDateByVague(int id) {
        List<Date> list = null;
        try {
            list = dao.findBySql("select distinct(date) from Plannification where vague=" + id + " order by date asc");
        } catch (Exception e) {
            throw e;
        }
        return list;
    }

    public List<String> plateau(Date d) {
        List<String> list = null;
        try {
            list = dao.findBySql("select distinct(pt.nom) from Plateau pt join plannification pn on pt.id = pn.plateauid where pn.date = '" + d + "'");
        } catch (Exception e) {
            throw e;
        }
        return list;
    }

    public int getLastVague() {
        List<Plannification> list = null;
        try {
            list = dao.findBySql("from Plannification order by id desc");
        } catch (Exception e) {
            throw e;
        }
        if (list.size() == 0) {
            return 1;
        }
        return list.get(0).getVague() + 1;
    }

    public List<Plannification> plannificationByDate(Date d) {
        List<Plannification> list = null;
        try {
            list = dao.findBySql("from Plannification where date = '" + d + "' order by id asc");
        } catch (Exception e) {
            throw e;
        }
        return list;
    }
}
