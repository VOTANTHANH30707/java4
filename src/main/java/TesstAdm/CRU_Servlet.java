package TesstAdm;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.VideoDAO;
import dao.VideoDAOImpl;
import entity.Video;
import utils.XParam;

@WebServlet({ "/create", "/update", "/delete", "/reset", "/home", "/edit/*" })
public class CRU_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		VideoDAO dao = new VideoDAOImpl();

//		Video video = new Video();
//		try {
//			BeanUtils.populate(video, req.getParameterMap());
//		} catch (IllegalAccessException | InvocationTargetException e) {
//			e.printStackTrace();
//		}
		Video video = XParam.getBean(req, Video.class);

		String path = req.getServletPath();
		if (path.contains("create") || path.contains("update")) {
//			Part part = req.getPart("poster_file");
//			String fname = part.getSubmittedFileName();
//			if(fname != null) {
//				video.setPoster(fname);
//				String filename = req.getServletContext().getRealPath("/views/images/" + fname);
//				part.write(filename);
//			}
			try {
				File file = utils.XParam.getFile(req, "poster_file", "/template/user/img/");
				video.setPoster(file.getName());
			} catch (Exception e) {
				System.out.println("Chưa upload file");
			}

			if (path.contains("create")) {
				dao.create(video);
			} else {
				dao.update(video);
			}
		} else if (path.contains("delete")) {
			dao.deleteById(video.getId());
		} else if (path.contains("edit")) {
			String id = req.getPathInfo().substring(1);
			video = dao.findById(id);
		}

		List<entity.Video> videos = dao.findAll();
		req.setAttribute("video", video);
		req.setAttribute("videos", videos);

		req.getRequestDispatcher("/views/CRUD/layout.jsp").forward(req, resp);
	}

}
