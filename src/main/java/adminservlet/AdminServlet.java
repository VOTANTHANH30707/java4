package adminservlet;

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
import utils.XParam;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet({ "/admin/home", "/admin/video/*", "/admin/user/*", "/admin/report" })
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	VideoDAO vdao = new VideoDAOImpl();
	UserDAO udao = new UserDAOImpl();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();

		if (path.endsWith("home")) {

			List<Video> videosIndex = vdao.findAll();
			req.setAttribute("videos", videosIndex);
			req.setAttribute("viewAdmin", "/common/index.jsp");
		} else if (path.endsWith("video")) {
			doVideo(req, resp);
			req.setAttribute("viewAdmin", "/common/indexAdmin.jsp");
		} else if (path.endsWith("user")) {
			doUser(req, resp);
			req.setAttribute("viewAdmin", "/views/admin/userList.jsp");
		} else if (path.endsWith("report")) {
			Report(req, resp);
			req.setAttribute("viewAdmin", "/views/admin/ThongKe.jsp");
		}
		req.getRequestDispatcher("/views/admin/layoutAdmin.jsp").forward(req, resp);
	}

	private void Report(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub

	}

	private void doUser(HttpServletRequest req, HttpServletResponse resp) {
//		List<User> user = udao.findAllNotAdmin();
//		req.setAttribute("userNotAdm", user);

	}

	private void doVideo(HttpServletRequest req, HttpServletResponse resp) {
//		List<Video> video = vdao.findAll();
//		req.setAttribute("videos", video);
	}

}
