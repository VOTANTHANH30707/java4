package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entity.User;
import utils.JpaUtils;

public class UserDAOImpl implements UserDAO {

	EntityManager em = JpaUtils.getEntityManager();

	@Override
	public List<User> findAll() {
		String jpql = "SELECT o FROM User o";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		return query.getResultList();
	}
	@Override
	public List<User> findAllNotAdmin() {
		String jpql = "SELECT o FROM User o WHERE o.admin = false";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		return query.getResultList();
	}

	@Override
	public User findById(String id) {

		return em.find(User.class, id);
	}

	@Override
	public void create(User user) {
		try {
			em.getTransaction().begin();
			em.persist(user);
			em.getTransaction().commit();
			System.out.println("aaaa");
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}


	@Override
	public void update(User user) {
		try {
			em.getTransaction().begin();
			em.merge(user);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}

	}

	@Override
	public void deleteById(String id) {
		User user = em.find(User.class, id);
		try {
			em.getTransaction().begin();
			em.remove(user);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
		
	}

	@Override
	public boolean existByID(String id) {
		return false;
	}



}
