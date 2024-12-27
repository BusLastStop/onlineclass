package com.onlineclass.poll.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineclass.poll.model.dto.Poll;
import com.onlineclass.poll.model.service.PollService;

/**
 * Servlet implementation class SaveNewPollServlet
 */
@WebServlet("/share/poll/save")
public class SaveNewPollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveNewPollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		Timestamp startDate=Timestamp.valueOf(LocalDateTime.parse(request.getParameter("poll-start-date-time"),formatter));
		Timestamp endDate=Timestamp.valueOf(LocalDateTime.parse(request.getParameter("poll-end-date-time"),formatter));
		
		Poll p=Poll.builder()
				.pollTitle(request.getParameter("poll-title"))
	            .pollSort(request.getParameter("poll-sort"))
	            .pollBallotContent(request.getParameterValues("poll-ballot-content"))
	            .pollMultipleChoice(request.getParameter("poll-multiple-choice"))
	            .pollAnonymousBallot(request.getParameter("poll-anonymous-ballot"))
	            .pollResultAccess(request.getParameter("poll-result-access"))
	            .pollNewBallot(request.getParameter("poll-new-ballot"))
	            .pollSelectionChange(request.getParameter("poll-selection-change"))
	            .pollStartDateTime(startDate)
	            .pollEndDateTime(endDate)
	            .pollReminderDay(request.getParameterValues("poll-reminder-day"))
	            .pollReminderHour(request.getParameterValues("poll-reminder-hour"))
	            .pollReminderMinute(request.getParameterValues("poll-reminder-minute"))
	            .build();
		
		int result=new PollService().saveNewPoll(p);
		
		if(result>0) {
			response.sendRedirect(request.getContextPath()+"/share/poll.do");
		}
		else {
			response.sendRedirect(request.getContextPath()+"/share/poll/creation");
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
