/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import dao.HibernateDao;
import java.sql.Date;
import java.util.List;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import model.*;
/**
 *
 * @author P14_A_111_Dina
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        HibernateDao dao = (HibernateDao) context.getBean("hibernateDAO");
       Film is=new Film();
       is.setTitre("TITaNIC");
       dao.create(is);

    }
    
}
