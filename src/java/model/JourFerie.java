/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author P14_A_111_Dina
 */
@Entity
public class JourFerie {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    int jour;
    int mois;

    public int getId() {
        return id;
    }
    public static String mois(int i){
        String[]s=new String[]{"Jan","Fev","Mars","Apr","Mai","Juin","Juillet","Aout","Sept","Oct","Nov","Dec"};
        return s[i];
    }
 public static String file(){
        return "E:\\ITU\\img";
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getJour() {
        return jour;
    }

    public void setJour(int jour) {
        this.jour = jour;
    }

    public int getMois() {
        return mois;
    }

    public void setMois(int mois) {
        this.mois = mois;
    }
    
}

