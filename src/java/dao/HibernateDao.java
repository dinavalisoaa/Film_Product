package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.persistence.EntityManager;
import model.Scene;
import org.hibernate.Query;
import org.hibernate.metadata.ClassMetadata;
import org.hibernate.type.StandardBasicTypes;

//Hibernate 3.0
public class HibernateDao {

    private SessionFactory sessionFactory;

    public <T> T create(T entity) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.saveOrUpdate(entity);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            throw e;
        } finally {
            session.close();
        }
        return entity;
    }

    public <T> T findById(Class<T> clazz, Serializable id) {
        Session session = sessionFactory.openSession();
        T entity = null;
        try {
            entity = (T) session.get(clazz, id);
        } catch (Exception e) {
            throw e;
        } finally {
            session.close();
        }
        return entity;
    }

    public <T> List<T> findAll(Class<T> tClass) {
        Session session = sessionFactory.openSession();
        List<T> results = null;
        try {
            results = session.createCriteria(tClass).list();
            System.out.println("Res " + session.createCriteria(tClass).list());
        } catch (Exception e) {
            throw e;
        } finally {
            session.close();
        }
        return results;
    }

    public <T> List<T> findWhere(T entity) {
        Session session = sessionFactory.openSession();
        List<T> results = null;
        try {
            Example example = Example.create(entity).ignoreCase();
            results = session.createCriteria(entity.getClass()).add(example).list();
        } catch (Exception e) {
            throw e;
        } finally {
            session.close();
        }
        return results;
    }

    public <T> List<T> paginateWhere(T entity, int offset, int size) {
        Session session = sessionFactory.openSession();
        List<T> results = null;
        try {
            Example example = Example.create(entity).ignoreCase();
            results = session.createCriteria(entity.getClass())
                    .add(example)
                    .setFirstResult(offset)
                    .setMaxResults(offset + size).list();
        } catch (Exception e) {
            throw e;
        } finally {
            session.close();
        }
        return results;
    }

    public <T> List<T> paginate(Class<T> clazz, int offset, int size) {
        Session session = sessionFactory.openSession();
        List<T> results = null;
        try {
            results = session.createCriteria(clazz)
                    .setFirstResult(offset)
                    .setMaxResults(size).list();
        } catch (Exception e) {
            throw e;
        } finally {
            session.close();
        }
        return results;
    }

    public <T> List<T> paginate(Class<T> clazz, int offset, int size, String orderBy, boolean orderAsc) {
        Session session = sessionFactory.openSession();
        List<T> results = null;
        try {
            Order order = (orderAsc) ? Order.asc(orderBy) : Order.desc(orderBy);
            results = session.createCriteria(clazz)
                    .addOrder(order)
                    .setFirstResult(offset)
                    .setMaxResults(offset + size).list();
        } catch (Exception e) {
            throw e;
        } finally {
            session.close();
        }
        return results;
    }

    public void deleteById(Class tClass, Serializable id) {
        try {
            delete(findById(tClass, id));
        } catch (Exception e) {
            throw e;
        }
    }

    public void delete(Object entity) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.delete(entity);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            throw e;
        } finally {
            session.close();
        }
    }

    public void updateBySql(String k) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.createSQLQuery(k).executeUpdate();
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            throw e;
        } finally {
            session.close();
        }
//        return entity;
    }

    public <T> T update(T entity) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.saveOrUpdate(entity);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            throw e;
        } finally {
            session.close();
        }
        return entity;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List findBySqlPaginate(String req, int offset, int size) {
        List liste = null;//new List();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            liste = session.createQuery(req)
                    .setFirstResult(offset)
                    .setMaxResults(size).list();
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            throw e;
        } finally {
            session.close();
        }
        return liste;
    }

    public Query findBySql2(Object c, String req) {
        List liste = null;//new List();
        Query ry = null;
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            ry = session.createQuery(req);
//            session.
//            for (Iterator iterator = ry.iterate(); iterator.hasNext();) {
//                Object[] next = (Object[])iterator.next();
//                
//            }
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            throw e;
        } finally {
            session.close();
        }
        return ry;
    }
//    List<Pla

    public List findBySql(String req) {
        List liste = null;//new List();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            liste = session.createQuery(req).list();
            System.out.println("Req: " + req);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            throw e;
        } finally {
            session.close();
        }
        return liste;
    }
//
//    public String addTwoTimestamp(String time1, String time2) {
//        Session session = null;
//        String val;
//        try {
////             ClassMetadata hibernateMetadata = sessionFactory.getClassMetadata(o.getClass());
////            AbstractEntityPersister persister = (AbstractEntityPersister) hibernateMetadata;
////            String tableName = persister.getTableName();
//            session = sessionFactory.getCurrentSession();
//            session.beginTransaction();
//            String hql = "SELECT CAST(:interval1 AS interval) + CAST(:interval2 AS interval) AS sum_interval ";
//            Query query = session.createQuery(hql);
//            
////query.setParameter("interval1", interval1, org.hibernate.type.In);
////query.setParameter("interval2", interval2, org.hibernate.type.PostgresIntervalType.INSTANCE);
//
//            query.setParameter("interval1", time1, StandardBasicTypes.TIME);
//            query.setParameter("interval2", time2, StandardBasicTypes.TIME);
//            Object result = query.uniqueResult();
//
//// Fermer l'EntityManager
////entityManager.close();
////            System.out.println(sql);
////            val =String.valueOf(c.uniqueResult());
////            session.getTransaction().commit();
//        } catch (Exception e) {
//            throw e;
//        }
//
//        return "val";
//    }
}
