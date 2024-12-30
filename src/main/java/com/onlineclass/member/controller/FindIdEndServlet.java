package com.onlineclass.member.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineclass.student.service.StudentService;
import com.onlineclass.teacher.service.TeacherService;

/**
 * Servlet implementation class FindIdEndServlet
 */
@WebServlet("/member/findidend.do")
public class FindIdEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 임시로 alert 창으로 아이디를 알려주는 기능으로 설정함.
		String type = request.getParameter("userType");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		String id = null;
		
		if(type.equals("학생")) {
			if(email!="") {
				Map<String, String> info = Map.of("name",name,"email",email); 
				id = new StudentService().sendIdEmail(info);
			}else if(phone!="") {
				Map<String, String> info = Map.of("name",name,"phone",phone);
				id = new StudentService().sendIdPhone(info);
			}else {
				String msg = "잘못된 접근입니다!";
				String loc = "/";
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			}
		}else if(type.equals("강사")) {
			if(email!="") {
				Map<String, String> info = Map.of("name",name,"email",email); 
				id = new TeacherService().sendIdEmail(info);
			}else if(phone!="") {
				Map<String, String> info = Map.of("name",name,"phone",phone);
				id = new TeacherService().sendIdPhone(info);
			}else {
				String msg = "잘못된 접근입니다!";
				String loc = "/";
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			}
		}else {
			String msg = "잘못된 접근입니다!";
			String loc = "/";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}
		
		String msg="", loc="";
		if(id!=null) {
			msg = type + " 아이디는 " + id + "입니다.";
			loc = "/member/loginpage.do";
		}else {
			msg = type + " 아이디가 없습니다.";
			loc = "/member/findid.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
