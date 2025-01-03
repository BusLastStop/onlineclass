package com.onlineclass.share.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineclass.share.dto.Post;
import com.onlineclass.share.dto.PostReply;
import com.onlineclass.share.service.ShareService;

/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/share/post/postdetail.do")
public class PostDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("posCode");
		Post post = new ShareService().selectOnePost(code);
		List<PostReply> replies = new ShareService().selectCommentList(code);
		
//		Post post = new ShareService().postAndReplies(code);
		
		request.setAttribute("post", post);
		request.setAttribute("replies", replies);
		request.getRequestDispatcher("/WEB-INF/views/share/post/postdetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
