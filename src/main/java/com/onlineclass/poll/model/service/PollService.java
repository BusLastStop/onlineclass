package com.onlineclass.poll.model.service;

import static com.onlineclass.common.SqlSessionTemplate.getSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.onlineclass.poll.model.dao.PollDao;
import com.onlineclass.poll.model.dto.Poll;

public class PollService {

	private PollDao dao=new PollDao();
	
	public List<Poll> fetchPollList() {
		SqlSession session=getSession();
		List<Poll> result=dao.fetchPollList(session);
		session.close();
		return result;
	}
	
	public int saveNewPoll(Poll p) {
		SqlSession session=getSession();
		int result=dao.savePollDetail(session, p);
		
		if(result>0&&p.getPolBallotContent().length>0) {
			for(String ballot:p.getPolBallotContent()) {
				result=dao.savePollBallot(session,Map.of("polCode",p.getPolCode(),"balContent",ballot));
				if(result==0) {
					session.rollback();
					return 0;
				}
			}
			
			if(p.getPolReminderDay().length>0) {
				for(int i=0;i<p.getPolReminderDay().length;i++) {
					result=dao.savePollReminder(session, Map.of(
							"remDay",p.getPolReminderDay()[i],
							"remHour",p.getPolReminderHour()[i],
							"remMinute",p.getPolReminderMinute()[i],
							"polCode",p.getPolCode())
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
