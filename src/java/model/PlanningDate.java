/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
    private ArrayList<Planning> lPlanning = new ArrayList();
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
        Time heureFin = conf.getConfig("heurefin").getValeur();
        Calendar debutP = Calendar.getInstance();
        debutP.setTime(debutPlanning);
        Calendar finP = Calendar.getInstance();
        while(debutP.equals(finP)){
            Time debutTravail = heureDebut;
            ArrayList<Plateau> disponible = new ArrayList();
            //Mijery plateau disponible amn'io date io
            
            //-----------------------------------------
            for(int i = 0; i< disponible.size(); i++){
                ArrayList<Scene> scenes = this.getByPlateau(disponible.get(i).getId());
                for(int iscene = 0; iscene< scenes.size(); iscene++){
                    Time dureeDialogue = scenes.get(iscene).getVdialogue().getTotalDuree();
                    Date dateDeb = (Date) debutP.getTime();  
                    DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
                    LocalDateTime deb = LocalDateTime.parse(dateFormat.format(dateDeb)+" "+heureDebut.toString());
                    if(!debutTravail.toLocalTime().isAfter(heureFin.toLocalTime())){
                        Planning plan  = new Planning();
                        plan.setSceneId(scenes.get(iscene).getId());
                        plan.setDebut(deb);
                        debutTravail = new Time(heureDebut.getTime()+dureeDialogue.getTime());
                        if(!debutTravail.toLocalTime().isAfter(heureFin.toLocalTime())){
                             LocalDateTime fin = LocalDateTime.parse(dateFormat.format(dateDeb)+" "+debutTravail.toString());
                             plan.setFin(fin);
                             plan.setScene(scenes.remove(iscene));
                             this.lPlanning.add(plan);
                        }
                        else{
                            LocalDateTime fin = LocalDateTime.parse(dateFormat.format(dateDeb)+" "+debutTravail.toString());
                            plan.setFin(fin);
                        }
                    }
                }
            }
            debutP.add(Calendar.DAY_OF_MONTH, 1);
        }
    }
    
    public ArrayList<Scene> getByPlateau(int idPlateau){
        ArrayList<Scene> val = new ArrayList();
        for(int i = 0; i< this.getlScene().size(); i++){
            if(this.getlScene().get(i).getId() == idPlateau){
                val.add(this.getlScene().get(i));
            }
        }
        return val;
    }
    
}
