package dao;

import java.util.List;

import entity.User;

public interface UserDAO {
	List<User> findAll();
	List<User> findAllNotAdmin();
	User findById(String id);
	void create(User user);
	void update(User user);
	void deleteById(String id);
	boolean existByID(String id);
}
