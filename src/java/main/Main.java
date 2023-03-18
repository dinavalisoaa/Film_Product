/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import dao.HibernateDao;
import java.sql.Date;
import java.util.List;
import model.PlanningDate;
import model.Scene;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import service.SceneService;

/**
 *
 * @author Tolotra
 */
public class Main {

    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        HibernateDao dao = context.getBean(HibernateDao.class);
        PlanningDate date = new PlanningDate();
        List<Scene> liste = new SceneService(dao).listeScene(1);
        for (int i = 0; i < liste.size(); i++) {
            date.getlScene().add(liste.get(i));
        }
        date.setPlanning(dao, Date.valueOf("2023-03-18"), Date.valueOf("2023-03-22"));
        System.out.println(date.getlPlanning().size());
        System.out.println(date.getlScene().size());

        for (int i = 0; i < date.getlPlanning().size(); i++) {
            System.out.println(date.getlPlanning().get(i).toString());
        }
    }

}
