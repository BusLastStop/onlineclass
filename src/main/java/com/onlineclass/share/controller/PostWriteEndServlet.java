package com.onlineclass.share.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineclass.share.service.ShareService;

/**
 * Servlet implementation class PostWriteEndServlet
 */
@WebServlet("/share/postwriteend.do")
public class PostWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("contents");
		String upload = request.getParameter("upload");
		String code = request.getParameter("uploader");
		Map<String,String> data = new HashMap<>();
		data.put("title",title);
		data.put("content",content);
		data.put("code",code);
		if(upload!=null) {
			System.out.println(upload);
			data.put("upload", upload);
		}else{
			data.put("upload", null);
		}
		int result = new ShareService().postWrite(data);
		if(result>0) {
			String msg, loc;
			msg = "성공메시지(DB적용됨!)";
			loc = "/share/post.do";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}else {
			String msg, loc;
			msg = "실패메시지(DB적용됨...)";
			loc = "/share/post.do";
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
