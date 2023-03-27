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
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import service.ConfigurationService;
import service.JourFerieService;
import service.PlateauService;
import service.SceneService;
import service.V_DureeDialogueService;
//import com.itextpdf.text.

/**
 *
 * @author Tolotra
 */
public class PlanningDate {

    private int filmId;
    private ArrayList<Planning> lPlanning = new ArrayList();
        private ArrayList<String> sPlanning = new ArrayList();

    private ArrayList<Planning> lPlanningInverse = new ArrayList();

    private List<Scene> lScene = new ArrayList();
    private Position positionPersonne;
    private ArrayList<Time> heurePris;
    private List<Calendar> lDate = new ArrayList();

    public List<Calendar> getlDate() {
        return lDate;
    }

    public ArrayList<Planning> getlPlanningInverse() {
        return lPlanningInverse;
    }

    public void setlPlanningInverse(ArrayList<Planning> lPlanningInverse) {
        this.lPlanningInverse = lPlanningInverse;
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

    public static boolean isJourFerie(Calendar date, HibernateDao dao) {
        boolean val = false;
        List<JourFerie> lF = new JourFerieService(dao).jourFerie(date.get(Calendar.DAY_OF_MONTH), date.get(Calendar.MONTH) + 1);
        if (lF.size() > 0) {
            val = true;
        }
        return val;
    }

    public ArrayList<String> distinctDate() {
        ArrayList<Planning> li = this.lPlanning;
        ArrayList<String> date = new ArrayList<>();
        for (int i = 0; i < li.size(); i++) {
            String get = li.get(i).DatetoString();
            if (!date.contains(get)) {
                date.add(get);
            }
        }
        return date;
    }

    public static boolean isJourOuvrable(Calendar jour) {
        boolean val = true;
        if (jour.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY || jour.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
            val = false;
        }
        return val;
    }

    public static boolean isJourOuvrable(Calendar jour, HibernateDao dao) {
        boolean val = true;
        if (jour.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY || jour.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
            val = false;
        } else {
            if (isJourFerie(jour, dao)) {
                val = false;
            }
        }
        return val;
    }

    public void setPlanning(HibernateDao dao, Date debutPlanning, Date finPlanning) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        ConfigurationService conf = new ConfigurationService(dao);
        V_DureeDialogueService vs = new V_DureeDialogueService(dao);
        PlateauService ps = new PlateauService(dao);
        Time heureDebut = conf.getConfig("heuredebut").getValeur();
        Time heureFin = conf.getConfig("heurefin").getValeur();
        Calendar debutP = Calendar.getInstance();
        debutP.setTime(debutPlanning);
        Calendar finP = Calendar.getInstance();
        finP.setTime(finPlanning);

        while (debutP.before(finP)) {
            int cpt = 0;
            Calendar d = debutP;
            lDate.add(d);
            if (PlanningDate.isJourOuvrable(debutP, dao) == true) {
                Time debutTravail = heureDebut;
                Plateau disp = ps.allPlateauDispo(dateFormat.format(debutP.getTime())).get(0);
                List<Plateau> disponible = ps.allPlateauDispo(disp.getLatitude(), disp.getLongitude(), dateFormat.format(debutP.getTime()));
                List<Plateau> indisponible = ps.allPlateau();
                //System.err.println("@###################################33[" + indisponible.size());

                for (int i = 0; i < indisponible.size(); i++) {
                    Plateau get = indisponible.get(i);
                    SceneService scene = new SceneService(dao);
                    PlateauService ptS = new PlateauService(dao);
                    ArrayList<Scene> scenes = this.getByPlateauDispoIndispo(get.getId(), dateFormat.format(debutP.getTime()), dao);
                    for (int iscene = 0; iscene < scenes.size(); iscene++) {
                        Scene ray = scenes.get(iscene);
                        ray.getPlateau(dao);
//                        ray.setPlateau(ptS.getPlateauById(get.getId()));
                        Planning pln = new Planning();
                        String raison = "";
                        if (scene.verifierScene(ray.getId(), dateFormat.format(debutP.getTime()))) {
//                            pln.setRaison();
                            raison = "<h3><a class='btn btn-danger'>Scene :" + ray.getTitre() +"  indisponible</a></h3>"
                                    + "<h3>" + "Date:" +LocalDate.parse(dateFormat.format(debutP.getTime())).format(DateTimeFormatter.ofPattern("d MMM uuuu")) + "</h3>";
                        }
                            if (ptS.isDispo(get.getId(), disp.getLatitude(), disp.getLongitude(), dateFormat.format(debutP.getTime())) == false) {
//                            pln.setRaison();
                            raison += "<h3>" + "<h3><a class='btn btn-danger'>Plateau :" + get.getNom() + " indisponible</a></h3></h3> <h3>Date: " +LocalDate.parse(dateFormat.format(debutP.getTime())).format(DateTimeFormatter.ofPattern("d MMM uuuu")) + "</h3>";
                        }
                        
                        pln.setRaison(raison);

                        pln.setSceneId(ray.getId());
                        pln.setDate(d);
                        pln.setDispo(-1);
                        pln.setScene(scene.getScene(ray.getId()));
                        pln.setDebut(LocalDateTime.parse("1000-01-01T01:01:01.00"));
                        pln.setFin(LocalDateTime.parse("1000-01-01T01:01:01.00"));
                        if(!sPlanning.contains(String.valueOf(pln.getScene().getTitre()+pln.getScene().getId()))){
                        this.lPlanning.add(pln);
                        sPlanning.add(String.valueOf(pln.getScene().getTitre()+pln.getScene().getId()));
                        }
                    }
                    if(i==indisponible.size()){
                    break;
                    }
                }
                for (int i = 0; i < disponible.size(); i++) {
//                    //System.out.println("disponible:" + disponible.get(i).getId());
                    ArrayList<Scene> scenes = this.getByPlateauDispo(disponible.get(i).getId(), dateFormat.format(debutP.getTime()), dao);
                    if (scenes.size() > 0) {
                        cpt++;
                    }
                    //System.out.println("iscene:" + scenes.size());
                    for (int iscene = 0; iscene < scenes.size(); iscene++) {
//                        scenes.get(iscene).getPlateau(dao);
                        Time dureeDialogue = scenes.get(iscene).getVdialogue(dao).getTotalDuree();
//                        //System.out.println("dialogue:" + dureeDialogue.toString());
                        Date dateDeb = new Date(debutP.getTime().getTime());
                        LocalDateTime deb = LocalDateTime.parse(dateFormat.format(dateDeb) + "T" + debutTravail.toString());
                        if (!debutTravail.toLocalTime().isAfter(heureFin.toLocalTime())) {
                            Planning plan = new Planning();
                            plan.setDispo(1);
                            plan.setSceneId(scenes.get(iscene).getId());
                            if (scenes.get(iscene).getHeure_ideal() == null) {
                                plan.setDebut(deb);
//                                //System.out.println("date: " + debutP);

                                LocalTime addition = debutTravail.toLocalTime().plusHours(dureeDialogue.toLocalTime().getHour())
                                        .plusMinutes(dureeDialogue.toLocalTime().getMinute())
                                        .plusSeconds(dureeDialogue.toLocalTime().getSecond());
                                Time adddebutTravail = Time.valueOf(addition);
                                if (!adddebutTravail.toLocalTime().isAfter(heureFin.toLocalTime())) {
                                    LocalDateTime fin = LocalDateTime.parse(dateFormat.format(dateDeb) + "T" + adddebutTravail.toString());
                                    plan.setFin(fin);
                                    plan.setScene(scenes.get(iscene));
                                    lScene.remove(scenes.get(iscene));
                                    debutTravail = adddebutTravail;
                                    this.lPlanning.add(plan);
                                }
                            } else {
                                deb = LocalDateTime.parse(dateFormat.format(dateDeb) + "T" + scenes.get(iscene).getHeure_ideal().toString());
                                plan.setDebut(deb);
                                LocalTime addition = scenes.get(iscene).getHeure_ideal().toLocalTime().plusHours(dureeDialogue.toLocalTime().getHour())
                                        .plusMinutes(dureeDialogue.toLocalTime().getMinute())
                                        .plusSeconds(dureeDialogue.toLocalTime().getSecond());
                                plan.setFin(LocalDateTime.parse(dateFormat.format(dateDeb) + "T" + Time.valueOf(addition).toString()));
                                plan.setScene(scenes.get(iscene));
                                lScene.remove(scenes.get(iscene));
                                this.lPlanning.add(plan);
                            }
                        }
                    }
                    if (cpt == 2) {
                        break;

                    }
                }
            }

            debutP.add(Calendar.DAY_OF_MONTH, 1);
        }

    }

    public void setPlanningInverse(HibernateDao dao, Date debutPlanning, Date finPlanning) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        ConfigurationService conf = new ConfigurationService(dao);
        V_DureeDialogueService vs = new V_DureeDialogueService(dao);
        PlateauService ps = new PlateauService(dao);
        Time heureDebut = conf.getConfig("heuredebut").getValeur();
        Time heureFin = conf.getConfig("heurefin").getValeur();
        Calendar debutP = Calendar.getInstance();
        debutP.setTime(debutPlanning);
        Calendar finP = Calendar.getInstance();
        finP.setTime(finPlanning);

        while (debutP.before(finP)) {
            int cpt = 0;
            Calendar d = debutP;
            lDate.add(d);
            if (PlanningDate.isJourOuvrable(debutP, dao) == true) {
                Time debutTravail = heureDebut;
                Plateau disp = ps.allPlateauDispo(dateFormat.format(debutP.getTime())).get(0);
                List<Plateau> disponible = ps.allPlateauDispo(disp.getLatitude(), disp.getLongitude(), dateFormat.format(debutP.getTime()));
                for (int i = 0; i < disponible.size(); i++) {
                    //System.out.println("disponible:" + disponible.get(i).getId());
                    ArrayList<Scene> scenes = this.getByPlateauDispo(disponible.get(i).getId(), dateFormat.format(debutP.getTime()), dao);
                    if (scenes.size() > 0) {
                        cpt++;
                    }
                    //System.out.println("iscene:" + scenes.size());
                    for (int iscene = 0; iscene < scenes.size(); iscene++) {
                        scenes.get(iscene).getPlateau(dao);
                        Time dureeDialogue = scenes.get(iscene).getVdialogue(dao).getTotalDuree();
                        //System.out.println("dialogue:" + dureeDialogue.toString());
                        Date dateDeb = new Date(debutP.getTime().getTime());
                        LocalDateTime deb = LocalDateTime.parse(dateFormat.format(dateDeb) + "T" + debutTravail.toString());
                        if (!debutTravail.toLocalTime().isAfter(heureFin.toLocalTime())) {
                            Planning plan = new Planning();
                            plan.setSceneId(scenes.get(iscene).getId());
                            if (scenes.get(iscene).getHeure_ideal() == null) {
                                plan.setDebut(deb);
                                //System.out.println("date: " + debutP);

                                LocalTime addition = debutTravail.toLocalTime().plusHours(dureeDialogue.toLocalTime().getHour())
                                        .plusMinutes(dureeDialogue.toLocalTime().getMinute())
                                        .plusSeconds(dureeDialogue.toLocalTime().getSecond());
                                Time adddebutTravail = Time.valueOf(addition);
                                if (!adddebutTravail.toLocalTime().isAfter(heureFin.toLocalTime())) {
                                    LocalDateTime fin = LocalDateTime.parse(dateFormat.format(dateDeb) + "T" + adddebutTravail.toString());
                                    plan.setFin(fin);
                                    plan.setScene(scenes.get(iscene));
                                    lScene.remove(scenes.get(iscene));
                                    debutTravail = adddebutTravail;
                                    this.lPlanning.add(plan);
                                }
                            } else {
                                deb = LocalDateTime.parse(dateFormat.format(dateDeb) + "T" + scenes.get(iscene).getHeure_ideal().toString());
                                plan.setDebut(deb);
                                LocalTime addition = scenes.get(iscene).getHeure_ideal().toLocalTime().plusHours(dureeDialogue.toLocalTime().getHour())
                                        .plusMinutes(dureeDialogue.toLocalTime().getMinute())
                                        .plusSeconds(dureeDialogue.toLocalTime().getSecond());
                                plan.setFin(LocalDateTime.parse(dateFormat.format(dateDeb) + "T" + Time.valueOf(addition).toString()));
                                plan.setScene(scenes.get(iscene));
                                lScene.remove(scenes.get(iscene));
                                this.lPlanning.add(plan);
                            }
                        }
                    }
                    if (cpt == 2) {
                        break;

                    }
                }
            }

            debutP.add(Calendar.DAY_OF_MONTH, 1);
        }
    }

    public ArrayList<Scene> getByPlateauDispo(int idPlateau, String date, HibernateDao dao) {
        ArrayList<Scene> val = new ArrayList();
        SceneService scene = new SceneService(dao);

        for (int i = 0; i < this.getlScene().size(); i++) {
            if (this.getlScene().get(i).getPlateauId() == idPlateau && scene.verifierScene(this.getlScene().get(i).getId(), date) == false) {
                val.add(this.getlScene().get(i));
            }
        }

        return val;
    }

    public ArrayList<Scene> getByPlateauDispoIndispo(int idPlateau, String date, HibernateDao dao) {
        ArrayList<Scene> val = new ArrayList();
        SceneService scene = new SceneService(dao);

        for (int i = 0; i < this.getlScene().size(); i++) {
            if (this.getlScene().get(i).getPlateauId() == idPlateau) {
                val.add(this.getlScene().get(i));
            }
        }

        return val;
    }

    public List<Plateau> plateauDistinct() {
        List<Plateau> lPlateau = new ArrayList();
        for (int i = 0; i < this.getlPlanning().size(); i++) {
            Plateau init = this.getlPlanning().get(i).getScene().getPlateau();
            int count = 0;
            for (int j = 0; j < lPlateau.size(); j++) {
                int id = init.getId();
                int id2 = lPlateau.get(j).getId();
                if (id == id2) {
                    count++;
                    break;
                }
            }
            if (count == 0) {
                lPlateau.add(init);
            }

        }
        return lPlateau;
    }
}
