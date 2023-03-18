/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dao.HibernateDao;
import java.sql.Date;
import java.sql.Time;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import service.PlateauService;
import service.SceneService;
import service.V_DureeDialogueService;

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
    @Column(name = "heure_ideal")
    private Time heure_ideal;
    @Transient
    private V_DureeDialogue vdialogue;
    public V_DureeDialogue getVdialogue(HibernateDao dao) {
        if(this.vdialogue == null){
            V_DureeDialogueService vs = new V_DureeDialogueService(dao);
            vdialogue = vs.listeDureeDialogue(id).get(0);
        }
        return vdialogue;
    }
    public void setVdialogue(V_DureeDialogue vdialogue) {
        this.vdialogue = vdialogue;
    }
    
    public Time getHeure_ideal() {
        return heure_ideal;
    }

    public void setHeure_ideal(Time heure_ideal) {
        this.heure_ideal = heure_ideal;
    }

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

    public Scene(int id, String titre, int numero, int plateauId, int filmId, Date date) {
        this.id = id;
        this.titre = titre;
        this.numero = numero;
        this.plateauId = plateauId;
        this.filmId = filmId;
        this.date = date;
    }
    public Scene(){        
    }
    


}
