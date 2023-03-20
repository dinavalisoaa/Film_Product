/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dao.HibernateDao;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import service.ConfigurationService;
import service.PlateauService;
import service.V_DureeDialogueService;

/**
 *
 * @author Tolotra
 */
public class PlanningDate {
    private int filmId;
    private ArrayList<Planning> lPlanning = new ArrayList();
    private List<Scene> lScene = new ArrayList();
    private Position positionPersonne;
    private ArrayList<Time> heurePris;
    private List<Calendar> lDate = new ArrayList();

    public List<Calendar> getlDate() {
        return lDate;
    }

    public void setlDate(List<Calendar> lDate) {
        this.lDate = lDate;
    }
    
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

    public List<Scene> getlScene() {
        return lScene;
    }

    public void setlScene(List<Scene> lScene) {
        this.lScene = lScene;
    }

    public int getFilmId() {
        return filmId;
    }

    public void setFilmId(int filmId) {
        this.filmId = filmId;
    }

    public ArrayList<Planning> getlPlanning() {
        if (this.lPlanning == null) {

        }
        return lPlanning;
    }

    public void setlPlanning(ArrayList<Planning> lPlanning) {
        this.lPlanning = lPlanning;
    }

    public static boolean isJourOuvrable(Calendar jour) {
        boolean val = true;
        if (jour.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY || jour.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
            val = false;
        }
        return val;
    }

    public void setPlanning(HibernateDao dao,Date debutPlanning, Date finPlanning) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        ConfigurationService conf = new ConfigurationService(dao);
        V_DureeDialogueService vs = new V_DureeDialogueService(dao);
        PlateauService ps =  new PlateauService(dao);
        Time heureDebut = conf.getConfig("heuredebut").getValeur();
        Time heureFin = conf.getConfig("heurefin").getValeur();
        Calendar debutP = Calendar.getInstance();
        debutP.setTime(debutPlanning);
        Calendar finP = Calendar.getInstance();
        finP.setTime(finPlanning);
        while (debutP.before(finP)) {
             System.out.println("date: "+debutP.getTime().toString());
            if (PlanningDate.isJourOuvrable(debutP) == true) {
                Time debutTravail = heureDebut;
                Plateau disp =ps.allPlateauDispo(dateFormat.format(debutP.getTime())).get(0);
                List<Plateau> disponible = ps.allPlateauDispo(disp.getLatitude(),disp.getLongitude(),dateFormat.format(debutP.getTime()));
                for (int i = 0; i < disponible.size(); i++) {
                      System.out.println("disponible:"+disponible.get(i).getId());
                    ArrayList<Scene> scenes = this.getByPlateau(disponible.get(i).getId());
                     System.out.println("iscene:"+scenes.size());
                    for (int iscene = 0; iscene < scenes.size(); iscene++) {
                       
                        Time dureeDialogue = scenes.get(iscene).getVdialogue(dao).getTotalDuree();
                        System.out.println("dialogue:"+dureeDialogue.toString());
                        Date dateDeb =new Date(debutP.getTime().getTime());

                        LocalDateTime deb = LocalDateTime.parse(dateFormat.format(dateDeb) +"T"+ debutTravail.toString());
                        if (!debutTravail.toLocalTime().isAfter(heureFin.toLocalTime())) {
                            Planning plan = new Planning();
                            plan.setSceneId(scenes.get(iscene).getId());
                            if(scenes.get(iscene).getHeure_ideal() == null){
                                    plan.setDebut(deb);
                                    plan.setDate(debutP);
                               LocalTime addition = debutTravail.toLocalTime().plusHours(dureeDialogue.toLocalTime().getHour())
                                       .plusMinutes(dureeDialogue.toLocalTime().getMinute())
                                       .plusSeconds(dureeDialogue.toLocalTime().getSecond());
                               Time adddebutTravail = Time.valueOf(addition);
                               if (!adddebutTravail.toLocalTime().isAfter(heureFin.toLocalTime())) {
                                   LocalDateTime fin = LocalDateTime.parse(dateFormat.format(dateDeb) +"T"+ adddebutTravail.toString());
                                   plan.setFin(fin);
                                   plan.setScene(scenes.get(iscene));
                                   lScene.remove(scenes.get(iscene));
                                   debutTravail = adddebutTravail;
                                   this.lPlanning.add(plan);
                               }
                            }
                            else{
                                plan.setDate(debutP);
                                deb = LocalDateTime.parse(dateFormat.format(dateDeb) +"T"+ scenes.get(iscene).getHeure_ideal().toString());
                                plan.setDebut(deb);
                                LocalTime addition = scenes.get(iscene).getHeure_ideal().toLocalTime().plusHours(dureeDialogue.toLocalTime().getHour())
                                       .plusMinutes(dureeDialogue.toLocalTime().getMinute())
                                       .plusSeconds(dureeDialogue.toLocalTime().getSecond());
                                plan.setFin(LocalDateTime.parse(dateFormat.format(dateDeb) +"T"+ Time.valueOf(addition).toString()));  
                                plan.setScene(scenes.get(iscene));
                                   lScene.remove(scenes.get(iscene));
                                   this.lPlanning.add(plan);
                            }
                        }
                    }
                }
            }
            lDate.add(debutP);
            debutP.add(Calendar.DAY_OF_MONTH, 1);
        }
    }

    public ArrayList<Scene> getByPlateau(int idPlateau) {
        ArrayList<Scene> val = new ArrayList();
        for (int i = 0; i < this.getlScene().size(); i++) {
            if (this.getlScene().get(i).getPlateauId()== idPlateau) {
                val.add(this.getlScene().get(i));
            }
        }
        return val;
    }

}
