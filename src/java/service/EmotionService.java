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
import model.Emotion;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author P14_A_111_Dina
 */
public class EmotionService {
    @Autowired
    HibernateDao dao;
    
    public HibernateDao getDao() {
        return dao;
    }
    
    public void setDao(HibernateDao dao) {
        this.dao = dao;
    }
    
    public EmotionService(){}
    
    public EmotionService(HibernateDao dao){
        this.dao=dao;
    }
    
    public List<Emotion> allEmotion() {
        List<Emotion> list = null;
        try {
            list = dao.findAll(Emotion.class);
        } catch (Exception e) {
            throw e;
        }
        return list;
    }
    
    public Emotion getEmotionById(int id) {
        Emotion p = new Emotion();
        List list = allEmotion();
        try {
            for (int i = 0; i < list.size(); i++) {
                Emotion get = (Emotion) list.get(i);
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
