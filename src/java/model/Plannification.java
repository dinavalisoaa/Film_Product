/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author P14_A_111_Dina
 */
@Entity
public class Plannification {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    @Column(name="date")
    Date date;
    @Column(name="sceneid")
    int sceneid;
    @Column(name="plateauid")
    int plateauid;
    Timestamp datedebut;
    Timestamp datefin;
    int vague;
    Date debut;
    Date fin;

    public int getVague() {
        return vague;
    }

    public void setVague(int vague) {
        this.vague = vague;
    }

    public Date getDebut() {
        return debut;
    }

    public void setDebut(Date debut) {
        this.debut = debut;
    }

    public Date getFin() {
        return fin;
    }

    public void setFin(Date fin) {
        this.fin = fin;
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

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getSceneid() {
        return sceneid;
    }

    public void setSceneid(int sceneid) {
        this.sceneid = sceneid;
    }

    public int getPlateauid() {
        return plateauid;
    }

    public void setPlateauid(int plateauid) {
        this.plateauid = plateauid;
    }

    
}
