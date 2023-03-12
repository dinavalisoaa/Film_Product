/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dao.HibernateDao;
import java.sql.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import service.PlateauService;

/**
 *
 * @author P14_A_111_Dina
 */
@Entity
public class Scene {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    @Column(name = "titre")
    String titre;
        @Column(name = "numero")

    int numero;
            @Column(name = "plateauId")

    int plateauId;
                @Column(name = "filmId")

    int filmId;
    Date date;
   
// Plateau plateau;
//
//    public Plateau getPlateau(HibernateDao dao) {
//    S
//    }
//
//    public void setPlateau(Plateau plateau) {
//        this.plateau = plateau;
//    }
 
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }
//    public Plateau getPlateau()throws Exception{
//        
//    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public int getPlateauId() {
        return plateauId;
    }

    public void setPlateauId(int plateauId) {
        this.plateauId = plateauId;
    }

    public int getFilmId() {
        return filmId;
    }

    public void setFilmId(int filmId) {
        this.filmId = filmId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
}
