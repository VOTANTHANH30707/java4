package  servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FavoriteDAO;
import dao.FavoriteDAOImpl;
import  dao.VideoDAO;
import  dao.VideoDAOImpl;
import  entity.Favorite;
import  entity.User;
import  entity.Video;

@WebServlet({ "/fm/video/list", "/fm/video/detail/*", // videoId
		"/fm/video/favorite/*", // username
		"/fm/video/like/*", // videoId
		"/fm/video/unlike/*" // favoriteId
})
public class tesst extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		VideoDAO vdao = new VideoDAOImpl();
		FavoriteDAO fdao = new FavoriteDAOImpl();

		String path = req.getServletPath();
		if (path.contains("list")) {
			List<Video> videos = vdao.findAll();
			req.setAttribute("videos", videos);
			req.setAttribute("page", "video/list.jsp");
		} else if (path.contains("detail")) {
			String videoId = req.getPathInfo().substring(1);
			Video video = vdao.findById(videoId);
			req.setAttribute("video", video);

			User user = (User) req.getSession().getAttribute("user");
			List<Favorite> favorites = fdao.findByUsername(user.getId());
			req.setAttribute("favorites", favorites);
			req.setAttribute("page", "video/detail.jsp");
		} else if (path.contains("unlike")) {
			Integer favoriteId = Integer.valueOf(req.getPathInfo().substring(1));
			fdao.deleteById(favoriteId);

			User user = (User) req.getSession().getAttribute("user");
			resp.sendRedirect(req.getContextPath() + "/fm/video/favorite/"+user.getId());
			return;
		} else if (path.contains("like")) {
			String videoId = req.getPathInfo().substring(1);
			Favorite favorite = new Favorite();
			User user = (User) req.getSession().getAttribute("user");
			favorite.getVideo().setId(videoId);
			favorite.getUser().setId(user.getId());
			fdao.create(favorite);

			resp.sendRedirect(req.getContextPath() + "/fm/video/list");
			return;
		} else if (path.contains("favorite")) {
			String username = req.getPathInfo().substring(1);
			List<Favorite> favorites = fdao.findByUsername(username);
			req.setAttribute("favorites", favorites);
			req.setAttribute("page", "video/favorite.jsp");
		}
		
		req.getRequestDispatcher("/views/site/layout.jsp").forward(req, resp);
		
	}
}