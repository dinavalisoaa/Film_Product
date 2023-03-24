/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Time;
import java.time.LocalDateTime;
import java.util.Calendar;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author P14_A_111_Dina
 */
public class Planning {

    int sceneId;
    LocalDateTime debut;
    LocalDateTime fin;

    public Planning() {
    }

    public Planning(int sec, LocalDateTime de, LocalDateTime fin) {
        this.debut = de;
        this.fin = fin;
        sceneId = sec;
    }

    public String DatetoString() {
        String d = debut.toLocalDate().toString();
        String[] tab = d.split("-");
        return tab[0] + tab[1] + tab[2];
    }

    public static String StringToDate(String date) {
        char[] d = date.toCharArray();
//        String[] tab = d.split
        String year = String.valueOf(d[0]) + String.valueOf(d[1]) + String.valueOf(d[2]) + String.valueOf(d[3]);
        String m = String.valueOf(d[4]) + String.valueOf(d[5]);
        String day = String.valueOf(d[6]) + String.valueOf(d[7]);

        return year+"-"+m+"-"+day;
    }

    Scene scene;
    Calendar date;

    public Calendar getDate() {
        return date;
    }

    public void setDate(Calendar date) {
        this.date = date;
    }

    public Scene getScene() {
        return scene;
    }

    public void setScene(Scene scene) {
        this.scene = scene;
    }

    public int getSceneId() {
        return sceneId;
    }

    public void setSceneId(int sceneId) {
        this.sceneId = sceneId;
    }

    public LocalDateTime getDebut() {
        return debut;
    }

    public void setDebut(LocalDateTime debut) {
        this.debut = debut;
    }

    public LocalDateTime getFin() {
        return fin;
    }

    public void setFin(LocalDateTime fin) {
        this.fin = fin;
    }

    @Override
    public String toString() {
        return "Planning{" + "sceneId=" + sceneId + ", debut=" + debut.toString() + ", fin=" + fin.toString() + "}";
    }

}
