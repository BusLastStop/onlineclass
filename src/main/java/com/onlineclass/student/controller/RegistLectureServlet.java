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
 * Servlet implementation class RegistLectureServlet
 */
@WebServlet("/student/registlecture.do")
public class RegistLectureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistLectureServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String lecCode = request.getParameter("lecCode");
		String stuCode = request.getParameter("stuCode");
		Map<String, String> code = Map.of("lecCode",lecCode,"stuCode",stuCode);
		// 작동 확인. 결제 API 추가 후 사용하기
		// int result = new StudentService().registLecture(code);
		int result = 0;	// 결제 API 추가 전이라 수강신청 실패로 해놓음
		if(result>0) {
			String msg;
			msg = "수강신청 완료되었습니다";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/WEB-INF/views/common/winclose.jsp").forward(request, response);
		}else {
			String msg, loc;
			msg = "수강신청 실패(결제 API 추가하기)!";
			loc = "/student/lecturedetails.do?lecCode="+lecCode;
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
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
