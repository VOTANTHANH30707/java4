package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FavoriteDAO;
import dao.FavoriteDAOImpl;
import dao.UserDAO;
import dao.UserDAOImpl;
import dao.VideoDAO;
import dao.VideoDAOImpl;
import entity.Favorite;
import entity.User;
import entity.Video;

@WebServlet({ "/video/detail/*", "/video/favorite", "/video/like/*", "/video/khonglike/*", "/video/countview/*" })
public class videoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final FavoriteDAO favoriteDAO = new FavoriteDAOImpl();
	private final VideoDAO videoDAO = new VideoDAOImpl();
	private final UserDAO userDAO = new UserDAOImpl();

	public videoServlet() {
		super();
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");

//		if (user == null) {
//			resp.sendRedirect(req.getContextPath() + "/dang-nhap");
//			return;
//		}
		System.out.println(path);
		if (path.contains("detail")) {
			handleDetailRequest(req, resp, user);
		} else if (path.contains("like")) {
			handleLikeRequest(req, resp, user);
		} else if (path.contains("khonglike")) {
			handleUnLikeRequest(req, resp, user);
		} else if (path.contains("favorite")) {
			handleFavoriteRequest(req, resp, user);
		}

		setUserAttribute(req);
		setUserNameAttribute(req);
		req.getRequestDispatcher("/views/user/layout.jsp").forward(req, resp);

	}


	private void handleDetailRequest(HttpServletRequest req, HttpServletResponse resp, User user)
			throws ServletException, IOException {
		String videoId = req.getPathInfo();
		boolean isLiked = false;

		if (videoId != null) {
			videoId = videoId.substring(1);
			Video video = videoDAO.findById(videoId);
			req.setAttribute("video", video);

			List<Favorite> favorites = favoriteDAO.findByUsername(user.getId());
			req.setAttribute("favorites", favorites);

			for (Favorite favorite : favorites) {
				if (favorite.getVideo().getId().equals(videoId)) {
					isLiked = true;
					break;
				}
			}
		}

		req.setAttribute("isLiked", isLiked);
		req.setAttribute("view", "/views/user/video-detail.jsp");
	}

	private void handleLikeRequest(HttpServletRequest req, HttpServletResponse resp, User user)
			throws ServletException, IOException {
		String videoId = req.getPathInfo();
		if (videoId != null) {
			videoId = videoId.substring(1);
			Video video = videoDAO.findById(videoId);

			List<Favorite> favorites = favoriteDAO.findByUsername(user.getId());
			boolean alreadyLiked = false;
			for (Favorite favorite : favorites) {
				if (favorite.getVideo().getId().equals(videoId)) {
					alreadyLiked = true;
					break;
				}
			}
			if (!alreadyLiked) {
				Favorite newFavorite = new Favorite();
				newFavorite.setUser(user);
				newFavorite.setVideo(video);
				favoriteDAO.create(newFavorite);
			}
			req.setAttribute("isLiked", alreadyLiked);
			handleDetailRequest(req, resp, user); // Gọi lại phương thức handleDetailRequest để cập nhật thông tin video
													// và chuyển hướng
		}
	}

	private void handleUnLikeRequest(HttpServletRequest req, HttpServletResponse resp, User user)
			throws IOException, ServletException {
		String pathInfo = req.getPathInfo();
		if (pathInfo != null && pathInfo.length() > 1) {
			Integer favoriteId = Integer.valueOf(pathInfo.substring(1)); // Lấy favoriteId từ đường dẫn
			System.out.println(favoriteId);
			FavoriteDAO fdao = new FavoriteDAOImpl();
			fdao.deleteById(favoriteId);
		} else {
			// Handle the case when pathInfo is null or its length is not enough
			// You may want to throw an exception or send an error response
		}
		resp.sendRedirect(req.getContextPath() + "/video/favorite");
		System.out.println("aaaa");
	}

	private void handleFavoriteRequest(HttpServletRequest req, HttpServletResponse resp, User user)
			throws ServletException, IOException {
		List<Favorite> favoritesList = favoriteDAO.findByUsername(user.getId());
		req.setAttribute("favoritesList", favoritesList);
		req.setAttribute("view", "/views/user/favoriteUser.jsp");
	}

	private void setUserAttribute(HttpServletRequest req) {
		User user = (User) req.getSession().getAttribute("user");
		if (user == null) {
			req.setAttribute("username", "Tài khoản của tôi");
		} else {
			req.setAttribute("username", user.getFullname());
		}
	}

	private void setUserNameAttribute(HttpServletRequest req) {
		User user = (User) req.getSession().getAttribute("user");
		if (user != null) {
			req.setAttribute("username", user.getFullname());
		}
	}
}
