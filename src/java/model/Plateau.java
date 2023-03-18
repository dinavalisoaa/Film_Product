/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

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
public class Plateau {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    @Column(name="nom")
    String nom;
    @Column(name="description")
    String description;
    @Column(name="longitude")
    private double longitude;
    @Column(name="latitude")
    private double latitude;
//    @Column(name="etat")
//    private int etat;

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

//    public int getEtat() {
//        return etat;
//    }
//
//    public void setEtat(int etat) {
//        this.etat = etat;
//    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDescription() {
        if(this.description==null){
        return "Pas de description";
        }
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    
}
