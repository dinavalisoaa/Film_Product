/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import jdk.nashorn.internal.ir.annotations.Ignore;

/**
 *
 * @author P14_A_111_Dina
 */
@Entity
public class Recherche implements Serializable {
    @Id
    int id;
    int filmId;
    int sceneId;
    int plateauId;
    int etat;
    public int getFilmId() {
        return filmId;
    }

    public void setFilmId(int filmId) {
        this.filmId = filmId;
    }

    public int getSceneId() {
        return sceneId;
    }

    public void setSceneId(int sceneId) {
        this.sceneId = sceneId;
    }

    public int getPlateauId() {
        return plateauId;
    }

    public void setPlateauId(int plateauId) {
        this.plateauId = plateauId;
    }

    public int getEtat() {
        return etat;
    }

    public void setEtat(int etat) {
        this.etat = etat;
    }

    public Timestamp getDatedebut() {
        return datedebut;
    }

    public void setDatedebut(Timestamp datedebut) {
        this.datedebut = datedebut;
    }

    public Timestamp getDatefin() {
        return datefin;
    }

    public void setDatefin(Timestamp datefin) {
        this.datefin = datefin;
    }

    public Date getFinPlan() {
        return finPlan;
    }

    public void setFinPlan(Date finPlan) {
        this.finPlan = finPlan;
    }

    public Date getDebutPlan() {
        return debutPlan;
    }

    public void setDebutPlan(Date debutPlan) {
        this.debutPlan = debutPlan;
    }

    public String getSceneTitre() {
        return sceneTitre;
    }

    public void setSceneTitre(String sceneTitre) {
        this.sceneTitre = sceneTitre;
    }

    public String getFilmtitre() {
        return filmtitre;
    }

    public void setFilmtitre(String filmtitre) {
        this.filmtitre = filmtitre;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    

    Timestamp datedebut;
    Timestamp datefin;

    Date finPlan;
    Date debutPlan;
    String sceneTitre;
    String filmtitre;

    String nom;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

}
