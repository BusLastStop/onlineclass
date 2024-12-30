package com.onlineclass.student.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineclass.student.service.StudentService;

/**
 * Servlet implementation class TempPwServlet
 */
@WebServlet("/student/temppw.do")
public class StudentTempPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentTempPwServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		Map<String, String> info = Map.of("id",id,"pw",pw);
		int result = new StudentService().studentTempPw(info);
		
		if(result>0) {
			response.sendRedirect(request.getContextPath()+"/member/loginpage.do");
		}else {
			String msg = "임시 비밀번호로 변경 실패!";
			String loc = "/member/findpw.do";
			request.setAttribute("msg", msg);
			request.setAttribute("loc",loc);
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
