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
 * Servlet implementation class CancelRegistServlet
 */
@WebServlet("/student/cancelregist.do")
public class CancelRegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelRegistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String lecCode = request.getParameter("lecCode");
		String stuCode = request.getParameter("stuCode");
		Map<String, String> code = Map.of("stuCode",stuCode, "lecCode",lecCode);
		int result = new StudentService().cancelRegist(code);
		if(result>0) {
			String msg = "수강신청 취소 완료!";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/WEB-INF/views/common/winclose.jsp").forward(request, response);
		}else {
			String msg, loc;
			msg = "수강신청 취소 실패!";
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
