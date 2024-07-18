package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import dao.UserDAOImpl;
import dao.VideoDAO;
import dao.VideoDAOImpl;
import entity.User;
import entity.Video;

/**
 * Servlet implementation class homeServlet
 */
@WebServlet({ "/index", "/about", "/contact","/favorite/*" })
public class homeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserDAO udao = new UserDAOImpl();
	VideoDAO vdao = new VideoDAOImpl();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		// Xử lý các trường hợp cho các đường dẫn
		if (path.endsWith("index")) {
			List<Video> videos = vdao.findAll();
			req.setAttribute("videos", videos);
			req.setAttribute("view", "/common/index.jsp");
		} else if (path.endsWith("about")) {
			req.setAttribute("view", "/common/about.jsp");
		} else if (path.endsWith("contact")) {
			req.setAttribute("view", "/common/contact.jsp");
		} else if(path.endsWith("favorite")) {
			req.setAttribute("view", "/views/user/favoriteUser.jsp");
		}
		req.getRequestDispatcher("/views/user/layout.jsp").forward(req, resp);
	}

}
