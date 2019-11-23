package com.nfwork.dbfound.springboot.demo.configure;

import com.nfwork.dbfound.dto.ResponseObject;
import com.nfwork.dbfound.util.JsonUtil;
import com.nfwork.dbfound.web.WebWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class AccessCheckFilter implements Filter {

	private List<String> excludeUrls = new ArrayList<String>();

	private List<String> SUFFIX = new ArrayList<String>();

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		SUFFIX.add(".jpg");
		SUFFIX.add(".jpeg");
		SUFFIX.add(".png");
		SUFFIX.add(".gif");
		SUFFIX.add(".js");
		SUFFIX.add(".css");
		SUFFIX.add(".eot");
		SUFFIX.add(".svg");
		SUFFIX.add(".ttf");
		SUFFIX.add(".woff");
		SUFFIX.add(".ico");

		excludeUrls.add("/login.jsp");
		excludeUrls.add("/sys/login.execute");
		excludeUrls.add("/relogin.jsp");
		excludeUrls.add("/close.jsp");
		excludeUrls.add("/loginWindow.jsp");
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;

		String servletPath = request.getServletPath();
		if (request.getSession().getAttribute("user_id") == null && !isPass(servletPath)) {
			if (servletPath.endsWith(".jsp")) {
				request.getRequestDispatcher("/sessionExpire.jsp").forward(request, response);
			} else {
				ResponseObject object = new ResponseObject();
				object.setMessage("登录超时，请重新登录");
				object.setSuccess(false);
				WebWriter.jsonWriter(response, JsonUtil.beanToJson(object));
			}
		} else {
			filterChain.doFilter(servletRequest, servletResponse);
		}
	}

	@Override
	public void destroy() {

	}

	private boolean isPass(String requestURI) {
		return SUFFIX.stream().anyMatch(requestURI::endsWith) || excludeUrls.stream().anyMatch(requestURI::equals);
	}
}
