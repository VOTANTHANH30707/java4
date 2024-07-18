package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import entity.User;

@WebFilter({ "/admin/*",
	"/video/detail/*", 
	"/video/favorite", 
	"/video/like/*", 
	"/video/unlike/*",
	"/doi-mat-khau" })
public class AppFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");

		// Kiểm tra xem người dùng đã đăng nhập hay chưa
		if (user == null) {
			String requestURI = req.getRequestURI();
			session.setAttribute("backUrl", requestURI);
			req.setAttribute("message", "Vui lòng đăng nhập");
			req.getRequestDispatcher("/views/dangnhap.jsp").forward(request, response);
			return; // Dừng xử lý tiếp theo
		}

		// Kiểm tra xem đường dẫn Servlet có phải là /admin và người dùng có quyền admin
		// hay không
		String path = req.getServletPath();
		if (path.startsWith("/admin") && !user.isAdmin()) {
			session.setAttribute("backUrl", path);
			req.setAttribute("message", "Vui lòng đăng nhập với vai trò admin");
			req.getRequestDispatcher("/views/dangnhap.jsp").forward(request, response);
			return; // Dừng xử lý tiếp theo
		}

		// Nếu mọi thứ hợp lệ, tiếp tục chuỗi lọc
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// Không cần thực hiện gì ở đây
	}

	@Override
	public void destroy() {
		// Không cần thực hiện gì ở đây
	}
}
