/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import service.ConfigurationService;
import service.V_DureeDialogueService;

/**
 *
 * @author Tolotra
 */
public class PlanningDate {
    private int filmId;
    private LocalDateTime debut;
    private LocalDateTime fin;
    private ArrayList<Planning> lPlanning;
    private ArrayList<Scene> lScene;
    private Position positionPersonne;
    private ArrayList<Time> heurePris;
    public Position getPositionPersonne() {
        return positionPersonne;
    }

    public void setPositionPersonne(Position positionPersonne) {
        this.positionPersonne = positionPersonne;
    }

    public ArrayList<Time> getHeurePris() {
        return heurePris;
    }

    public void setHeurePris(ArrayList<Time> heurePris) {
        this.heurePris = heurePris;
    }
    
    public ArrayList<Scene> getlScene() {
        return lScene;
    }

    public void setlScene(ArrayList<Scene> lScene) {
        this.lScene = lScene;
    }
    
    public int getFilmId() {
        return filmId;
    }

    public void setFilmId(int filmId) {
        this.filmId = filmId;
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

    public ArrayList<Planning> getlPlanning() {
        if(this.lPlanning == null){
            
        }
        return lPlanning;
    }

    public void setlPlanning(ArrayList<Planning> lPlanning) {
        this.lPlanning = lPlanning;
    }
    
    public void setPlanning(Date debutPlanning,Date finPlanning){
        ConfigurationService conf = new ConfigurationService();
        V_DureeDialogueService vs = new V_DureeDialogueService();
        Time heureDebut = conf.getConfig("heuredebut").getValeur();
        Calendar debutP = Calendar.getInstance();
        debutP.setTime(debutPlanning);
        Calendar finP = Calendar.getInstance();
        /*for(int i = 0; i<this.getlScene().size(); i++){
            Timestamp dureeTotal = vs.listeDureeDialogue(lScene.get(i).getId()).get(0).getTotalDuree();
            heurePris.add(lScene.get(i).getHeure_ideal());
            //heurePris.add(lScene.get(i).getHeure_ideal().);
        }*/
        while(debutP.equals(finP)){
            ArrayList<Plateau> disponible = new ArrayList();
            //Mijery plateau disponible amn'io date io
            
            //-----------------------------------------
            for(int i = 0; i< disponible.size(); i++){
                
            }
            debutP.add(Calendar.DAY_OF_MONTH, 1);
        }
    }
    
}
