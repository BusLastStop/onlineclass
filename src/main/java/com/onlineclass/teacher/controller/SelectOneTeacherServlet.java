package com.onlineclass.teacher.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.onlineclass.teacher.dto.Teacher;
import com.onlineclass.teacher.service.TeacherService;

/**
 * Servlet implementation class SelectOneTeacherServlet
 */
@WebServlet("/teacher/selectoneteacher.do")
public class SelectOneTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneTeacherServlet() {
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
		Teacher teacher = null;
		String userId = request.getParameter("userId");
		String email = request.getParameter("email");
		if(userId!=null) teacher = new TeacherService().selectOneTeacher(userId);
		else if(email!=null) teacher = new TeacherService().selectOneByEmail(email);
		
		response.setContentType("application/json;charset=utf-8");
		Gson gson = new Gson();
		
		String jsonData = gson.toJson(teacher);
		
		response.getWriter().print(jsonData);
	}

}
