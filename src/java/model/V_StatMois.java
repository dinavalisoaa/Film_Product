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
public class V_StatMois {

    @Id
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
   int mois;
    int planning;
    int personnage;
int plateau;

    public int getPlateau() {
        return plateau;
    }

    public void setPlateau(int plateau) {
        this.plateau = plateau;
    }

    public int getMois() {
        return mois;
    }

    public void setMois(int mois) {
        this.mois = mois;
    }

    public int getPlanning() {
        return planning;
    }

    public void setPlanning(int planning) {
        this.planning = planning;
    }

    public int getPersonnage() {
        return personnage;
    }

    public void setPersonnage(int personnage) {
        this.personnage = personnage;
    }
    

    
    
}
