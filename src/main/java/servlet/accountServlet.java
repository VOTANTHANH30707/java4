
package servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
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
import utils.CookieUtils;
import utils.PasswordUtils;
import utils.XCookie;
import utils.XParam;

/**
 * Servlet implementation class accountServlet
 */
@WebServlet({ "/dang-nhap", "/quen-mat-khau", "/dang-ky", "/doi-mat-khau", "/dang-xuat" })
public class accountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public accountServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	UserDAO udao = new UserDAOImpl();
	VideoDAO vdao = new VideoDAOImpl();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		if (path.endsWith("dang-nhap")) {
			this.doSignin(req, resp);
			return;
		} else if (path.endsWith("quen-mat-khau")) {
			this.doforGotPass(req, resp);
			return;
		} else if (path.endsWith("dang-ky")) {
			this.doSignUp(req, resp);
			return;
		} else if (path.endsWith("doi-mat-khau")) {
			this.doChangePass(req, resp);
			return;
		} else if (path.endsWith("dang-xuat")) {
			req.getSession().invalidate();
			resp.sendRedirect(req.getContextPath() + "/index");
			return;
		}
	}

	private void doSignin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = CookieUtils.get("username", req);
		String password = CookieUtils.get("password", req);
		req.setAttribute("usernameLg", username);
		req.setAttribute("passwordLg", password);
		if (req.getMethod().equalsIgnoreCase("post")) {
			username = req.getParameter("username");
			password = req.getParameter("password");
			try {
				User user = udao.findById(username);
				if (user != null && user.getPassword().equals(password)) {
					req.getSession().setAttribute("user", user);
					int hours = (req.getParameter("remember") == null) ? 0 : 30 * 24;
					CookieUtils.add("username", username, hours, resp);
					CookieUtils.add("password", password, hours, resp);
					if (user.isAdmin()) {
						resp.sendRedirect(req.getContextPath() + "/admin/home");
						return;
					}
					resp.sendRedirect(req.getContextPath() + "/index");
					return; // Kết thúc phương thức sau khi chuyển hướng thành công
				} else {
					req.setAttribute("message", "Tên đăng nhập hoặc mật khẩu không đúng");
				}
			} catch (Exception e) {
				req.setAttribute("message", "Đã xảy ra lỗi khi đăng nhập");
			}
		}

		req.getRequestDispatcher("/views/dangnhap.jsp").forward(req, resp);
	}

	private void doforGotPass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/quenmatkhau.jsp").forward(req, resp);
	}

	@SuppressWarnings({ "unused", "unchecked" })
	private void doSignUp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getMethod().equalsIgnoreCase("post")) {
			// Tạo một đối tượng User từ dữ liệu nhập vào từ form
			User entity = new User();
			try {
				BeanUtils.populate(entity, req.getParameterMap());
			} catch (Exception e) {
				// Xử lý ngoại lệ nếu có
				e.printStackTrace();
			}

			// Mã hóa mật khẩu trước khi lưu vào cơ sở dữ liệu
			String hashedPassword = PasswordUtils.hashPassword(entity.getPassword());
			entity.setPassword(hashedPassword);

			// Thiết lập quyền hạn người dùng, ví dụ như admin
			entity.setAdmin(false);

			// Kiểm tra xem người dùng đã tồn tại hay chưa dựa trên tên đăng nhập
			User userNew = udao.findById(entity.getId());
			if (userNew != null) {
				req.setAttribute("message", "Registration failed, please try again!");
				req.getRequestDispatcher("/views/dangky.jsp").forward(req, resp);
				return;
			} 

			// Lưu thông tin người dùng vào cơ sở dữ liệu
			udao.create(entity);

			// Đăng nhập người dùng mới và chuyển hướng đến trang chính
			req.setAttribute("user", entity);
			req.getSession().setAttribute("user", entity);
			resp.sendRedirect(req.getContextPath() + "/index");
			return;
		}
		// Nếu không phải là phương thức POST, hiển thị trang đăng ký
		req.getRequestDispatcher("/views/dangky.jsp").forward(req, resp);
	}

	private void doChangePass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Lấy các tham số từ request
		String username = req.getParameter("username");
		String old_pass = req.getParameter("old_pass");
		String new_pass = req.getParameter("new_pass");
		String again_pass = req.getParameter("again_pass");

		// Kiểm tra xem username có null hay không
		if (username == null || username.isEmpty()) {
			req.getRequestDispatcher("/views/doimatkhau.jsp").forward(req, resp);
			return;
		}

		User user = udao.findById(username);

		if (user == null) {
			req.setAttribute("message", "Tài Khoản Không tồn tại");
			req.getRequestDispatcher("/views/doimatkhau.jsp").forward(req, resp);
			return;
		}

		try {
			// Sao chép các thuộc tính từ request vào đối tượng User
			BeanUtils.populate(user, req.getParameterMap());

			// Kiểm tra mật khẩu cũ có khớp với mật khẩu hiện tại không
			if (!user.getPassword().equals(old_pass)) {
				req.setAttribute("message", "Mật khẩu cũ không đúng");
				req.getRequestDispatcher("/views/doimatkhau.jsp").forward(req, resp);
				return;
			}

			// Kiểm tra mật khẩu mới và mật khẩu xác nhận
			if (!new_pass.equals(again_pass)) {
				req.setAttribute("message", "Mật khẩu xác nhận không khớp");
				req.getRequestDispatcher("/views/doimatkhau.jsp").forward(req, resp);
				return;
			}

			// Cập nhật mật khẩu mới cho người dùng
			user.setPassword(new_pass);
			udao.update(user);
			req.getSession().setAttribute("user", user);
			req.setAttribute("message", "Cập Nhật Thành công");
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("message", "Đã xảy ra lỗi");
		}

		req.getRequestDispatcher("/views/doimatkhau.jsp").forward(req, resp);
	}

}