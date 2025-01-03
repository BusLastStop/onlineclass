package com.onlineclass.poll.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineclass.poll.model.dto.Ballot;
import com.onlineclass.poll.model.dto.Poll;
import com.onlineclass.poll.model.dto.Reminder;
import com.onlineclass.poll.model.service.PollService;
import com.onlineclass.student.dto.Student;

/**
 * Servlet implementation class SaveNewPollServlet
 */
@WebServlet(name="saveNewPoll", urlPatterns={"/share/poll/save"})
public class PollSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PollSaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Map<String,Object> memberSignedIn=(Map<String, Object>)request.getSession().getAttribute("user");
		Student pollCreator=null;
		if(memberSignedIn.get("userType").equals("학생")) {
			pollCreator=(Student)memberSignedIn.get("userinfo");
		}
		
		String[] ballotContent=request.getParameterValues("poll-ballot-content");
		List<Ballot> ballotData=new ArrayList();
		for(String bc: ballotContent) {
			Ballot b=Ballot.builder()
					.balContent(bc)
					.build();
			ballotData.add(b);
		}
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		Timestamp startDate=Timestamp.valueOf(LocalDateTime.parse(request.getParameter("poll-start-date-time"),formatter));
		Timestamp endDate=Timestamp.valueOf(LocalDateTime.parse(request.getParameter("poll-end-date-time"),formatter));
		
        String[] reminderDay=request.getParameterValues("poll-reminder-day");
		String[] reminderHour=request.getParameterValues("poll-reminder-hour");
		String[] reminderMinute=request.getParameterValues("poll-reminder-minute");
		List<Reminder> reminderData=new ArrayList();
		for(int i=0;i<reminderMinute.length;i++) {
			Reminder r=Reminder.builder()
						.remDay(reminderDay[i])
						.remHour(reminderHour[i])
						.remMinute(reminderMinute[i])
						.build();
			reminderData.add(r);
		}
		
		Poll p=Poll.builder()
				.polTitle(request.getParameter("poll-title"))
	            .polSort(request.getParameter("poll-sort"))
	            .polBallot(ballotData)
	            .polMultipleChoice(request.getParameter("poll-multiple-choice"))
	            .polAnonymousBallot(request.getParameter("poll-anonymous-ballot"))
	            .polResultAccess(request.getParameter("poll-result-access"))
	            .polNewBallot(request.getParameter("poll-new-ballot"))
	            .polSelectionChange(request.getParameter("poll-selection-change"))
	            .polStartDateTime(startDate)
	            .polEndDateTime(endDate)
	            .polReminder(reminderData)
	            .polCreator(pollCreator)
	            .build();
		
		int result=new PollService().saveNewPoll(p);
		
		if(result>0) {
			response.sendRedirect(request.getContextPath()+"/share/poll/list");
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
