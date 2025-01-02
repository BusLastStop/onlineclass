package com.onlineclass.common.filter;

import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class LoginFilter
 */

@WebFilter(urlPatterns = { "/member/mylecturelist.do","/member/mypage.do","/student/mypost.do","/teacher/myreply.do",
	"/student/searchteacher.do","/student/sentrequest.do","/student/waitreservation.do", "/student/cancelreservation.do",
	"/teacher/lectureslot.do", "/teacher/recievedrequestlist.do", "/teacher/changereservation.do", "/teacher/uploadlecturedata.do"},
	servletNames = {"saveNewPoll"})
public class LoginCheckFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public LoginCheckFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		Map<String,Object> user = (Map<String,Object>)((HttpServletRequest)request).getSession().getAttribute("user");
		if(user==null) {
			String msg, loc;
			msg = "로그인 후 이용해 주세요!";
			loc = "/";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}

		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
