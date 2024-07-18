package dao;

import java.util.List;

import entity.Favorite;



public interface FavoriteDAO {
	List<Favorite> findAll();

	Favorite findById(Integer id);

	void create(Favorite Favorite);

	void update(Favorite Favorite);

	void deleteById(Integer id);

	List<Favorite> findByUsername(String username);
}
