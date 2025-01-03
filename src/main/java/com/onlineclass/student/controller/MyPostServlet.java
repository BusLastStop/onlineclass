package com.onlineclass.student.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineclass.share.dto.Post;
import com.onlineclass.student.dto.Student;
import com.onlineclass.student.service.StudentService;

/**
 * Servlet implementation class MyPostServlet
 */
@WebServlet("/student/mypost.do")
public class MyPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> user = (Map<String,Object>)request.getSession().getAttribute("user");
		String code = ((Student)user.get("userinfo")).getStuCode();
		List<Post> posts = new StudentService().getMyPosts(code);
		request.setAttribute("posts", posts);
		request.getRequestDispatcher("/WEB-INF/views/student/mypost.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
