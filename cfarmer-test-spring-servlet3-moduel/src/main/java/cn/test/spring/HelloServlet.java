/*  
 * @(#) HelloServlet.java Create on 2014-7-24 下午4:24:18   
 *   
 * Copyright 2014 by yhx.   
 */


package cn.test.spring;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;

/**
 * @HelloServlet.java
 * @created at 2014-7-24 下午4:24:18 by zhanghl
 *
 * @desc
 *
 * @author zhanghl({@link 253587517@qq.com})
 * @version $Revision$
 * @update: $Date$
 */
@WebServlet("/hello2")
public class HelloServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.getWriter().print("hello");
		resp.getWriter().flush();
	}
}
