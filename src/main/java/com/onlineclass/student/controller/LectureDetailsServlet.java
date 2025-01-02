package com.onlineclass.student.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineclass.member.dto.Lecture;
import com.onlineclass.student.service.StudentService;

/**
 * Servlet implementation class LectureDetailsServlet
 */
@WebServlet("/student/lecturedetails.do")
public class LectureDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String lecCode = request.getParameter("lecCode");
		Lecture lecture = new StudentService().lectureDetails(lecCode);
		if(lecture==null) {
			String msg = "잘못된 접근입니다!";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/WEB-INF/views/common/winclose.jsp").forward(request, response);
		}else {
			request.setAttribute("lecture", lecture);
			request.getRequestDispatcher("/WEB-INF/views/student/lecturedetails.jsp").forward(request, response);
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
