package utils;



import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;

public class XParam {
	public static String getString(HttpServletRequest req, String name) {
		return req.getParameter(name);
	}

	public static int getInt(HttpServletRequest req, String name) {
		return Integer.valueOf(getString(req, name));
	}

	public static double getDouble(HttpServletRequest req, String name) {
		return Double.valueOf(getString(req, name));
	}

	public static boolean getBoolean(HttpServletRequest req, String name) {
		return (getString(req, name) != null);
	}

	public static Date getDate(HttpServletRequest req, String name) {
		String pattern = "MM/dd/yyyy";
		SimpleDateFormat format = new SimpleDateFormat(pattern);
		try {
			Date date = format.parse(getString(req, name));
			return date;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public static File getFile(HttpServletRequest req, String name, String folder) {
		try {
			Part part = req.getPart(name);
			String dir = req.getServletContext().getRealPath(folder);
			File file = new File(dir, part.getSubmittedFileName());
			part.write(file.getAbsolutePath());
			return file;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public static <B> B getBean(HttpServletRequest req, Class<B> beanClass) {
		try {
			DateConverter converter = new DateConverter();
			converter.setPattern("MM/dd/yyyy");
			ConvertUtils.register(converter, Date.class);

			B bean = beanClass.getDeclaredConstructor().newInstance();
			BeanUtils.populate(bean, req.getParameterMap());
			return bean;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
