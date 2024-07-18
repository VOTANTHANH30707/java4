package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import entity.User;

@WebFilter("/*")
public class UsernameFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		// Kiểm tra xem User đã được đặt trong session hay chưa
		User user = (User) req.getSession().getAttribute("user");
		if (user == null) {
//			req.setAttribute("username", "Tài khoản của tôi");
		} else {
			req.setAttribute("username", user.getFullname());
		}
		chain.doFilter(req, response);
	}

}
