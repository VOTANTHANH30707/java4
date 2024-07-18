package adminservlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import dao.UserDAO;
import dao.UserDAOImpl;
import entity.User;
import utils.XParam;

@WebServlet({ "/admin/user/index", "/admin/user/create", "/admin/user/edit/*", "/admin/user/reset" })
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req == null) {
			// Ghi nhật ký lỗi
			System.err.println("Đối tượng HttpServletRequest là null.");
			// Bạn cũng có thể muốn ném một ServletException ở đây hoặc xử lý lỗi theo một
			// cách nào đó
			throw new ServletException("Đối tượng HttpServletRequest là null.");
		}

		UserDAO udao = new UserDAOImpl();
		User user = XParam.getBean(req, User.class);
		UserDAO dao = new UserDAOImpl();
		List<User> usersAd = dao.findAll();
		req.setAttribute("usersAd", usersAd);
		String path = req.getServletPath();
		if (path.endsWith("index")) {

			req.setAttribute("viewAdmin", "/views/admin/userList.jsp");

		} else if (path.endsWith("create")) {
			user.setAdmin(true);
			udao.create(user);
			req.setAttribute("viewAdmin", "/views/admin/userList.jsp");
		} else if (path.endsWith("edit")) {

			String id = req.getPathInfo().substring(1);
			if (id == null || id.isEmpty()) {
				req.setAttribute("message", "loi");

			} else {
				user = udao.findById(id);
				if (user == null) {
					req.setAttribute("message", "user khong ton tai");
				} else {
//					req.setAttribute("user", user);
				}

			}

			req.setAttribute("viewAdmin", "/views/admin/userList.jsp");
		}

		req.getRequestDispatcher("/views/admin/layoutAdmin.jsp").forward(req, resp);
	}

}
