package com.onlineclass.member.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineclass.student.dto.Student;
import com.onlineclass.student.service.StudentService;
import com.onlineclass.teacher.dto.Teacher;
import com.onlineclass.teacher.service.TeacherService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/member/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// login test
		String userType = request.getParameter("userType");
		if(userType.equals("학생")) {
			Map<String,Object> userSession = Map.of("userType",userType,"userinfo",new Student());
			request.getSession().setAttribute("user", userSession);
			String msg, loc;
			msg = userType + "로그인(임시)!";
			loc = "/";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}else if(userType.equals("강사")) {
			Map<String,Object> userSession = Map.of("userType",userType,"userinfo",new Teacher());
			request.getSession().setAttribute("user", userSession);
			String msg, loc;
			msg = userType + "로그인(임시)!";
			loc = "/";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userType = request.getParameter("userType");
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		Map<String, String> user = Map.of("id", id, "pw", pw);
		if(userType.equals("학생")) {
			Student student = new StudentService().studentLogin(user);
			if(student!=null) {
				Map<String,Object> userSession = Map.of("userType",userType,"userinfo",student);
				request.getSession().setAttribute("user", userSession);
				String msg, loc;
				msg = userType + "로그인 성공!";
				loc = "/";
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			}else {
				String msg, loc;
				msg = userType + "로그인 실패!";
				loc = "/member/loginpage.do";
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			}
		}else if(userType.equals("강사")) {
			Teacher teacher = new TeacherService().teacherLogin(user);
			if(teacher!=null) {
				Map<String,Object> userSession = Map.of("userType",userType,"userinfo",teacher);
				request.getSession().setAttribute("user", userSession);
				String msg, loc;
				msg = userType + "로그인 성공!";
				loc = "/";
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			}else {
				String msg, loc;
				msg = userType + "로그인 실패!";
				loc = "/member/loginpage.do";
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			}
		}else if(userType.equals("관리자")) {
			Map<String, Object> userSession = Map.of("userType", userType, "userinfo", "userinfo");
			request.getSession().setAttribute("user", userSession);
			request.getRequestDispatcher("/admin/lecturelist.do").forward(request, response);
		}
	}

}
