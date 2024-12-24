package com.onlineclass.student.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.onlineclass.student.dto.Student;
import com.onlineclass.student.service.StudentService;

/**
 * Servlet implementation class SelectOneStudentServlet
 */
@WebServlet("/student/selectonestudent.do")
public class SelectOneStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Student student = null;
		String userId = request.getParameter("userId");
		String email = request.getParameter("email");
		if(userId!=null) student = new StudentService().selectOneStudent(userId);
		else if(email!=null) student = new StudentService().selectOneByEmail(email);
		
		response.setContentType("application/json;charset=utf-8");
		Gson gson = new Gson();
		
		String jsonData = gson.toJson(student);
		
		response.getWriter().print(jsonData);
	}

}
