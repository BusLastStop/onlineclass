package com.onlineclass.share.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineclass.share.dto.PostReply;
import com.onlineclass.share.service.ShareService;

/**
 * Servlet implementation class PostCommentServlet
 */
@WebServlet("/share/postcomment.do")
public class PostCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostCommentServlet() {
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
		String content = request.getParameter("content");
		int level = Integer.parseInt(request.getParameter("level"));
		String refCode = request.getParameter("refCode");
		String posCode = request.getParameter("posCode");
		String stuCode = request.getParameter("stuCode");
		String teaCode = request.getParameter("teaCode");
		
		PostReply reply = new PostReply().builder()
							.posRepContent(content)
							.posRepLevel(level)
							.posRepRefCode(refCode)
							.posCode(posCode)
							.stuCode(stuCode)
							.teaCode(teaCode)
							.build();
		
		int result = new ShareService().postReply(reply);
		
		if(result>0) {
			response.sendRedirect(request.getContextPath()+"/share/postdetail.do?posCode="+posCode);
		}else {
			String msg = "댓글 등록 실패!";
			String loc = "/share/postdetail.do?posCode="+posCode;
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}
	}

}
