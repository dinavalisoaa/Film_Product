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
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author P14_A_111_Dina
 */
public class PersonnageService {
    @Autowired
    HibernateDao dao;
    
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
    }
    
    public List<Personnage> allPersonnage() {
        List<Personnage> list = null;
        try {
            list = dao.findAll(Personnage.class);
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
