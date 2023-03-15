/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author P14_A_111_Dina
 */
@Entity
public class PlateauIndisponible {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
 int plateauId;
 Date date1;
 Date date2;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPlateauId() {
        return plateauId;
    }

    public void setPlateauId(int plateauId) {
        this.plateauId = plateauId;
    }

    public Date getDate1() {
        return date1;
    }

    public void setDate1(Date date1) {
        this.date1 = date1;
    }

    public Date getDate2() {
        return date2;
    }

    public void setDate2(Date date2) {
        this.date2 = date2;
    }
 
}
