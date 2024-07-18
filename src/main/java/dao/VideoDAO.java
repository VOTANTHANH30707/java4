package dao;

import java.util.List;

import entity.Video;

public interface VideoDAO {
	List<Video> findAll();

	Video findById(String id);

	void create(Video Video);

	void update(Video Video);

	void deleteById(String id);
}
