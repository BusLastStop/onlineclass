package com.onlineclass.share.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineclass.share.service.ShareService;

/**
 * Servlet implementation class DeleteReplyServlet
 */
@WebServlet("/share/deletereply.do")
public class DeleteReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String repCode = request.getParameter("posRepCode");
		String posCode = request.getParameter("posCode");
		int result = new ShareService().deleteReply(repCode);
		String msg, loc;
		if(result>0) {
			msg = "댓글을 삭제하였습니다!";
			loc = "/share/postdetail.do?posCode="+posCode;
		}else {
			msg = "댓글 삭제에 실패하였습니다!";
			loc = "/share/postdetail.do?posCode="+posCode;
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
