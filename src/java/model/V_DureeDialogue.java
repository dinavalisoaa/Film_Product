/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Time;
import java.sql.Timestamp;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author P14_A_111_Dina
 */
@Entity
public class V_DureeDialogue {

    @Id
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    Timestamp totalDuree;
    int sceneId;

    public Timestamp getTotalDuree() {
        return totalDuree;
    }

    public void setTotalDuree(Timestamp totalDuree) {
        this.totalDuree = totalDuree;
    }

    public int getSceneId() {
        return sceneId;
    }

    public void setSceneId(int sceneId) {
        this.sceneId = sceneId;
    }
    
}
