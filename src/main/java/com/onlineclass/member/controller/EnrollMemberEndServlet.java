package com.onlineclass.member.controller;

import java.io.IOException;
import java.sql.Date;

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
 * Servlet implementation class EnrollMemberEndServlet
 */
@WebServlet("/member/enrollend.do")
public class EnrollMemberEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollMemberEndServlet() {
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
		Student s = null;
		Teacher t = null;
		String type = request.getParameter("userType");
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		String name = request.getParameter("name");
		Date birth = Date.valueOf(request.getParameter("birthDate"));
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		String school = request.getParameter("school");
		
		String interestedUniversity = request.getParameter("interestedUniversity");
		String interestedMajor = request.getParameter("interestedMajor");
		
		String subject = request.getParameter("subject");
		int result = 0;
		if(type.equals("student")) {
			s = new Student().builder()
					.stuId(id)
					.stuPw(pw)
					.stuName(name)
					.stuBirthDate(birth)
					.stuEmail(email)
					.stuPhone(phone)
					.stuGender(gender)
					.stuAddress(address)
					.stuSchool(school)
					.build();
			result = new StudentService().enrollStudent(s);
		}else if(type.equals("teacher")) {
			t = new Teacher().builder()
					.teaId(id)
					.teaPw(pw)
					.teaName(name)
					.teaBirthDate(birth)
					.teaEmail(email)
					.teaPhone(phone)
					.teaGender(gender)
					.teaAddress(address)
					.teaUniversity(school)
					.teaSubject(subject)
					.build();
			result = new TeacherService().enrollTeacher(t);
		}else {
			
		}
		if(result>0) {
			String msg, loc;
			msg = "회원가입에 성공하셨습니다!";
			loc = "/";
			request.setAttribute("msg",msg);
			request.setAttribute("loc",loc);
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}else {
			String msg, loc;
			msg = "회원가입 실패! 다시 시도하세요!";
			loc = "${pageContext.request.contextPath}/member/loginpage.do";
			request.setAttribute("msg",msg);
			request.setAttribute("loc",loc);
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}
	}

}
