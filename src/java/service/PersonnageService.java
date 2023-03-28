/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.HibernateDao;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.UncheckedIOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import javax.imageio.ImageIO;
import model.Personnage;
import model.PersonnageIndisponible;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author P14_A_111_Dina
 */
public class PersonnageService {
    @Autowired
    HibernateDao dao;
     public List<Personnage> allPersonnageNonDispo(String date1) {
        List<Personnage> list = null;
        try {
            list = dao.findBySql("from Personnage where id in (select personnageId from PersonnageIndisponible where date('"+date1+"') between date1 and date2)");
        } catch (Exception e) {
            throw e;
        }
        return list;
    } public PersonnageIndisponible getIndispoById(int id) {
        List<PersonnageIndisponible> list = null;
        try {
            list = dao.findBySql("from PersonnageIndisponible where personnageId="+id);
        } catch (Exception e) {
            throw e;
        }
        return list.get(0);
    }public List<Personnage> allPersonnageDispo(String date1) {
        List<Personnage> list = null;
        try {
            list = dao.findBySql("from Personnage where id not in (select personnageId from PersonnageIndisponible where date('"+date1+"') between date1 and date2)");
        } catch (Exception e) {
            throw e;
        }
        return list;
    }
    public HibernateDao getDao() {
        return dao;
    }
    
    public void setDao(HibernateDao dao) {
        this.dao = dao;
    }
    
    public PersonnageService(){}
    
    public PersonnageService(HibernateDao dao){
        this.dao=dao;
    }
    
    public void insertPersonnage(Personnage p) {
        try {
            dao.create(p);
        } catch (Exception e) {
            throw e;
        }
    }   public void insertPersonnageIndisponible(PersonnageIndisponible p) {
        try {
            dao.create(p);
        } catch (Exception e) {
            throw e;
        }
    }
    public void update(String sql) {
        try {
            dao.updateBySql(sql);
        } catch (Exception e) {
            throw e;
        }
    }
    
    public List<Personnage> allPersonnage() {
        List<Personnage> list = null;
        try {
            list = dao.findAll(Personnage.class);
        } catch (Exception e) {
            throw e;
        }
        return list;
    } public List<Personnage> allPersonnage(int scene) {
        List<Personnage> list = null;
        try {
            list = dao.findBySql("from Personnage where id in (select personnageId from Dialogue where sceneId="+scene+")");
        } catch (Exception e) {
            throw e;
        }
        return list;
    }
    
    public static String convert(String file) {
        String base64 = null;
        final ByteArrayOutputStream os = new ByteArrayOutputStream();
        try {
            final String formatName = file.split("\\.")[1];
            final BufferedImage image = ImageIO.read(new File(file));
            ImageIO.write(image, formatName, Base64.getEncoder().wrap(os));
            base64 = os.toString(StandardCharsets.UTF_8.name());
        } catch (final IOException ioe) {

            throw new UncheckedIOException(ioe);
        }
        return base64;
    }
    
    public Personnage getPersonnageById(int id) {
        Personnage p = new Personnage();
        List list = allPersonnage();
        try {
            for (int i = 0; i < list.size(); i++) {
                Personnage get = (Personnage) list.get(i);
                if(get.getId() == id){
                    p = get;
                }
            }
        } catch (Exception e) {
            throw e;
        }
        return p;
    }
}
