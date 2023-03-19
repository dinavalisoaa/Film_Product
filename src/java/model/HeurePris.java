/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.time.LocalTime;

/**
 *
 * @author Tolotra
 */
public class HeurePris {
    private LocalTime debut;
    private LocalTime fin;

    public LocalTime getDebut() {
        return debut;
    }

    public void setDebut(LocalTime debut) {
        this.debut = debut;
    }

    public LocalTime getFin() {
        return fin;
    }

    public void setFin(LocalTime fin) {
        this.fin = fin;
    }

    public HeurePris() {
    }

    public HeurePris(LocalTime debut, LocalTime fin) {
        this.debut = debut;
        this.fin = fin;
    }
    
}
