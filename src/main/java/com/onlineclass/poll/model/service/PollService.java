package com.onlineclass.poll.model.service;

import static com.onlineclass.common.SqlSessionTemplate.getSession;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.onlineclass.poll.model.dao.PollDao;
import com.onlineclass.poll.model.dto.Poll;

public class PollService {

	private PollDao dao=new PollDao();
	
	public int saveNewPoll(Poll p) {
		SqlSession session=getSession();
		int result=dao.savePollDetail(session, p);
		
		if(result>0&&p.getPollBallotContent().length>0) {
			for(String ballot:p.getPollBallotContent()) {
				result=dao.savePollBallot(session,Map.of("pollCode",p.getPollCode(),"ballotContent",ballot));
				if(result==0) {
					session.rollback();
					return 0;
				}
			}
			
			if(p.getPollReminderDay().length>0) {
				for(int i=0;i<p.getPollReminderDay().length;i++) {
					result=dao.savePollReminder(session, Map.of(
							"reminderDay",p.getPollReminderDay()[i],
							"reminderHour",p.getPollReminderHour()[i],
							"reminderMinute",p.getPollReminderMinute()[i],
							"pollCode",p.getPollCode())
							);
					if(result==0) {
						session.rollback();
						return 0;
					}
					
				}
			}
			
			if(result==0) {
				session.rollback();
				return 0;
			}
			
		}
		else {
			return 0;
		}
		session.commit();
		session.close();
		
		return result;
	}
	
}