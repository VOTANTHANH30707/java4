package entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Table(name = "Videos")
@Entity
public class Video {
	@Id
	@Column(name = "id")
	String Id;
	@Column(name = "title")
	String title;
	@Column(name = "poster")
	String poster;
	@Column(name = "views")
	int views;
	@Column(name = "description")
	String description;
	@Column(name = "active")
	boolean active;

	@OneToMany(mappedBy = "video")
	List<Share> listShareVideo;

	@OneToMany(mappedBy = "video")
	List<Favorite> listFavoriteVideo;

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public List<Share> getListShareVideo() {
		return listShareVideo;
	}

	public void setListShareVideo(List<Share> listShareVideo) {
		this.listShareVideo = listShareVideo;
	}

	public List<Favorite> getListFavoriteVideo() {
		return listFavoriteVideo;
	}

	public void setListFavoriteVideo(List<Favorite> listFavoriteVideo) {
		this.listFavoriteVideo = listFavoriteVideo;
	}

}
