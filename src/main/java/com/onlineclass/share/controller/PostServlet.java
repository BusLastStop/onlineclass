package com.onlineclass.share.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineclass.share.dto.Post;
import com.onlineclass.share.service.ShareService;

/**
 * Servlet implementation class BoardServlet
 */
@WebServlet("/share/post.do")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cPage, numPerPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage = 1;
		}
		try {
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		}catch(NumberFormatException e) {
			numPerPage = 8;
		}
		
		Map<String, Integer> page = Map.of("cPage",cPage,"numPerPage",numPerPage);
		List<Post> postList = new ShareService().selectPostList(page);
		
		int totalCount = new ShareService().postCount();
		int totalPage = totalCount/numPerPage+1;
		int pageBarSize = 5;
		int pageNum = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNum+pageBarSize-1;
		String pageBar = "<ul class='pagination'>";
		if(pageNum==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a href='#'>이전</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a href'"
					+request.getRequestURI()
					+"?cPage="+(pageNum-1)
					+"&numPerPage="+numPerPage
					+"'>이전</a>";
			pageBar+="</li>";
		}
		while(!(pageNum>pageEnd||pageNum>totalPage)) {
			if(pageNum==cPage) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a href='#'>"+pageNum+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a href='"
						+request.getRequestURI()
						+"?cPage="+pageNum
						+"&numPerPage="+numPerPage
						+"'>"+pageNum+"</a>";
				pageBar+="</li>";
			}
			pageNum++;
		}
		if(pageNum>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a href='#'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a href='"
					+request.getRequestURI()
					+"?cPage="+pageNum
					+"&numPerPage="+numPerPage
					+"'>다음</a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("postList",postList);
		
		request.getRequestDispatcher("/WEB-INF/views/share/post/post.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
