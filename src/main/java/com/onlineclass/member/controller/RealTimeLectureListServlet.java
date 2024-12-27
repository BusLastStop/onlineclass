package com.onlineclass.member.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RealTimeLectureListServlet
 */
@WebServlet("/member/realtimelecturelist.do")
public class RealTimeLectureListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RealTimeLectureListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String,Object> user = (Map<String,Object>)request.getSession().getAttribute("user");
		try {
			if(((String)user.get("userType")).equals("학생")) {
				request.getRequestDispatcher("/WEB-INF/views/student/searchteacher.jsp").forward(request, response);
			}else if(((String)user.get("userType")).equals("강사")) {
				request.getRequestDispatcher("/WEB-INF/views/teacher/lectureslot.jsp").forward(request, response);
			}
		}catch(NullPointerException e){
			String msg,loc;
			msg = "권한이 없습니다 😡";
			loc = "/";
			request.setAttribute("msg",msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
