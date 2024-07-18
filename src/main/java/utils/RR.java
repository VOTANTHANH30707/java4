package utils;

import java.util.Base64;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RR {
	private static ThreadLocal<HttpServletRequest> requestThreadLocal = new ThreadLocal<>();
	private static ThreadLocal<HttpServletResponse> responseThreadLocal = new ThreadLocal<>();

	public static void add(HttpServletRequest request, HttpServletResponse response) {
		requestThreadLocal.set(request);
		responseThreadLocal.set(response);
	}

	public static void remove() {
		requestThreadLocal.remove();
		responseThreadLocal.remove();
	}

	public static HttpServletRequest getRequest() {
		return requestThreadLocal.get();
	}

	public static HttpServletResponse getResponse() {
		return responseThreadLocal.get();
	}
}
