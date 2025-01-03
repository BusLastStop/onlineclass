package com.onlineclass.teacher.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineclass.teacher.service.TeacherService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class LectureUploadEndServlet
 */
@WebServlet("/teacher/lectureuploadend.do")
public class LectureUploadEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureUploadEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = getServletContext().getRealPath("/resources/upload/record");
		MultipartRequest mr = new MultipartRequest(
				request,
				path,
				1024*1024*1024,
				"utf-8",
				new DefaultFileRenamePolicy()
				);
		
		String subject = mr.getParameter("subject");
		String lectureTime = mr.getParameter("lectureTime");
		String lectureTitle = mr.getParameter("lectureTitle");
		String teacherCode = mr.getParameter("teacherCode");
		String keyword = mr.getParameter("keyword");
		
		String oriFileName = mr.getOriginalFileName("uploadLecture");
		String renamedFileName = mr.getFilesystemName("uploadLecture");
		
		Map<String,String> lecInfo =
				Map.of("subject",subject,"title",lectureTitle,"time",lectureTime,
						"teaCode",teacherCode,"keyword",keyword);
		int result = new TeacherService().lectureUpload(lecInfo);
		if(result>0) {
			String lecCode = new TeacherService().getLecCode(lecInfo);
			Map<String,String> vidInfo = Map.of("fileName",renamedFileName,"lecCode",lecCode,"teaCode",teacherCode);
			int result2 = new TeacherService().lectureVideoRequest(vidInfo);
			if(result2>0) {
				String msg = "업로드 요청 완료!";
				request.setAttribute("msg", msg);
				request.getRequestDispatcher("/WEB-INF/views/common/winclose.jsp").forward(request, response);
			}else {
				String msg,loc;
				msg = "업로드 요청 중 오류!";
				loc = "/views/teacher/lectureupload.jsp";
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			}
		}else {
			String msg, loc;
			msg = "업로드 요청 실패!";
			loc = "/views/teacher/lectureupload.jsp";
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
