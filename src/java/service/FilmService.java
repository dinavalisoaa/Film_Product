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
import model.Film;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author P14_A_111_Dina
 */
public class FilmService {
    @Autowired
    HibernateDao dao;
    
    public HibernateDao getDao() {
        return dao;
    }
    
    public void setDao(HibernateDao dao) {
        this.dao = dao;
    }
    
    public FilmService(){}
    
    public FilmService(HibernateDao dao){
        this.dao=dao;
    }
    
    public void insertFilm(Film f) {
        try {
            dao.create(f);
        } catch (Exception e) {
            throw e;
        }
    }
    
    public List<Film> allFilm() {
        List<Film> list = null;
        try {
            list = dao.findAll(Film.class);
        } catch (Exception e) {
            throw e;
        }
        return list;
    }
    

public List<Film> allFilmBy() {
        List<Film> list = null;
        try {
            list = dao.findBySql("from Film order by id asc");
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
    
    public Film getFilmById(int id) {
        Film p = new Film();
        List list = allFilm();
        try {
            for (int i = 0; i < list.size(); i++) {
                Film get = (Film) list.get(i);
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
