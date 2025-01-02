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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		String path = getServletContext().getRealPath("/resources/upload/post");
//		System.out.println(path);
		MultipartRequest mr = new MultipartRequest(
				request,
				path,
				1024*1024*100,
				"utf-8",
				new DefaultFileRenamePolicy()
				);
		
		String title = mr.getParameter("title");
		String content = mr.getParameter("contents");
		String code = mr.getParameter("uploader");
		String oriUpload = mr.getOriginalFileName("upload");
		String renameUpload = mr.getFilesystemName("upload");
		Map<String,String> data = new HashMap<>();
		data.put("title",title);
		data.put("content",content);
		data.put("code",code);
		if(renameUpload!=null) {
			data.put("upload", renameUpload);
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
