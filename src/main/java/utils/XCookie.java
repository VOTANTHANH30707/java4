package utils;

import java.util.Base64;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class XCookie {
	public static void add(String name, String value, int maxAge) {
		add(name, value, maxAge, false);
	}

	public static void add(String name, String value, int maxAge, boolean encoded) {
		if (encoded) {
			value = Base64.getEncoder().encodeToString(value.getBytes());
		}
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(maxAge);
		cookie.setPath("/");
		cookie.setHttpOnly(true); // Set HttpOnly flag
		cookie.setSecure(true); // Set Secure flag
		HttpServletResponse response = RR.getResponse();
		if (response != null) {
			response.addCookie(cookie);
		}
	}

	public static void remove(String name) {
		add(name, "", 0);
	}

	public static Cookie get(String name) {
		HttpServletRequest request = RR.getRequest();
		if (request != null) {
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equalsIgnoreCase(name)) {
						return cookie;
					}
				}
			}
		}
		return null;
	}

	public static String getValue(String name) {
		return getValue(name, false);
	}

	public static String getValue(String name, boolean decoded) {
		Cookie cookie = get(name);
		if (cookie != null) {
			String value = cookie.getValue();
			if (decoded) {
				value = new String(Base64.getDecoder().decode(value));
			}
			return value;
		}
		return null;
	}
}
