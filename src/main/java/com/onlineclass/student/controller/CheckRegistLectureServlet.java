package com.onlineclass.student.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineclass.student.dto.Enrollment;
import com.onlineclass.student.service.StudentService;

/**
 * Servlet implementation class CheckRegistLectureServlet
 */
@WebServlet("/student/checkregistlecture.do")
public class CheckRegistLectureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckRegistLectureServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String stuCode = request.getParameter("stuCode");
		String lecCode = request.getParameter("lecCode");
		Map<String, String> code = Map.of("stuCode", stuCode, "lecCode", lecCode);
		Enrollment enrollment = new StudentService().getEnrollment(code);
		if(enrollment!=null) {
			response.getWriter().write("none,inline-block");
		}else {
			response.getWriter().write("inline-block,none");
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
