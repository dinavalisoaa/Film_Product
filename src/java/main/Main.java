import dao.HibernateDao;
import java.sql.Date;
import java.util.List;
import model.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import service.*;

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
//        date.setPlanning(dao, Date.valueOf("2023-03-21"), Date.valueOf("2023-03-24"));
//        System.out.println(date.getlPlanning().size());
//        System.out.println(date.getlScene().size());

//        for (int i = 0; i < date.getlPlanning().size(); i++) {
//            System.out.println(date.getlPlanning().get(i).toString());
//
//        }
        Recherche ch=new Recherche();
//        ch
        RechercheService recher=new RechercheService(dao);
                List<Recherche> list = recher.recherche(ch, "a");
                for (int i = 0; i < list.size(); i++) {
            Recherche get = list.get(i);
            
                    System.out.println(get.getNom());
                    
        }

        for(int i = 0; i<date.getlDate().size(); i++){
//            System.out.println(":"+date.getlDate().get(i).getTime().toString());
        }
    }
}

