package com.onlineclass.student.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineclass.student.dto.InterestedLecture;
import com.onlineclass.student.service.StudentService;

/**
 * Servlet implementation class InterestedLectureServlet
 */
@WebServlet("/student/interestedlecture.do")
public class InterestedLectureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InterestedLectureServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String stuCode = request.getParameter("stuCode");
		String lecCode = request.getParameter("lecCode");
		Map<String, String> code = Map.of("stuCode",stuCode,"lecCode",lecCode);
		InterestedLecture lecture = new StudentService().getInterestedLecture(code);
		if(lecture!=null) {
			int result = new StudentService().removeInterestedLecture(code);
			if(result>0) {
				response.getWriter().write("#ffccbd,#ff8a65");
			}else {
				response.getWriter().write("");
			}
		}else {
			int result = new StudentService().addInterestedLecture(code);
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
