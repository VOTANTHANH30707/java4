package adminservlet;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import dao.UserDAO;
import dao.UserDAOImpl;
import dao.VideoDAO;
import dao.VideoDAOImpl;
import entity.User;
import entity.Video;
import utils.XParam;

@MultipartConfig
@WebServlet({ "/admin/video/index", "/admin/video/create", "/admin/video/update", "/admin/video/delete/*",
		"/admin/video/edit/*" })
public class VideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		VideoDAO dao = new VideoDAOImpl();
		List<Video> videosAd = dao.findAll();
		req.setAttribute("videosAd", videosAd);

		VideoDAO vdao = new VideoDAOImpl();

		Video video = XParam.getBean(req, Video.class);

		if (path.contains("create") || path.contains("update")) {
			try {
				File file = XParam.getFile(req, "poster_file", "/");
				video.setPoster(file.getName());
			} catch (Exception e) {
				System.out.println("Chưa upload file");
			}

			if (path.contains("create")) {
				dao.create(video);
				System.out.println("create");
				req.setAttribute("viewAdmin", "/common/indexAdmin.jsp");
			} else {
				dao.update(video);
				System.out.println("update");
				req.setAttribute("viewAdmin", "/common/indexAdmin.jsp");
			}
		} else if (path.contains("delete")) {
			System.out.println("delete");
			String vdId = req.getContextPath().substring(1);
			dao.deleteById(vdId);
			System.out.println(vdId);
			req.setAttribute("viewAdmin", "/common/indexAdmin.jsp");
		} else if (path.endsWith("edit")) {
			String videoId = req.getPathInfo().substring(1);
			if (videoId == null || videoId.isEmpty()) {
				req.setAttribute("message", "loi");
			} else {
				video = vdao.findById(videoId);
				if (video == null) {
					req.setAttribute("message", "user khong ton tai");
				} else {
					req.setAttribute("video", video);
				}
			}
			req.setAttribute("viewAdmin", "/common/indexAdmin.jsp");
		}
		if (path.contains("index")) {
			req.setAttribute("viewAdmin", "/common/indexAdmin.jsp");
		}

		req.getRequestDispatcher("/views/admin/layoutAdmin.jsp").forward(req, resp);
	}

}
