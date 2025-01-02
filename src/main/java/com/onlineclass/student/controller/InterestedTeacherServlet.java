package com.onlineclass.student.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineclass.student.dto.FavouriteTeacher;
import com.onlineclass.student.service.StudentService;

/**
 * Servlet implementation class InterestedTeacherServlet
 */
@WebServlet("/student/interestedteacher.do")
public class InterestedTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InterestedTeacherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String stuCode = request.getParameter("stuCode");
		String teaCode = request.getParameter("teaCode");
		Map<String, String> code = Map.of("stuCode",stuCode,"teaCode",teaCode);
		FavouriteTeacher teacher = new StudentService().getInterestedTeacher(code);
		if(teacher!=null) {
			int result = new StudentService().removeInterestedTeacher(code);
			if(result>0) {
				response.getWriter().write("#ffccbd,#ff8a65");
			}else {
				response.getWriter().write("");
			}
		}else {
			int result = new StudentService().addInterestedTeacher(code);
			if(result>0) {
				response.getWriter().write("#fff59d,#fff176");
			}else {
				response.getWriter().write("");
			}
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
