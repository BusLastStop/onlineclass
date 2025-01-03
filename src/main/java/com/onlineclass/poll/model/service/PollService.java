package com.onlineclass.poll.model.service;

import static com.onlineclass.common.SqlSessionTemplate.getSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.onlineclass.poll.model.dao.PollDao;
import com.onlineclass.poll.model.dto.Ballot;
import com.onlineclass.poll.model.dto.Poll;
import com.onlineclass.poll.model.dto.Reminder;

public class PollService {

	private PollDao dao=new PollDao();
	
	public int saveNewPoll(Poll p) {
		SqlSession session=getSession();
		int resultPoll=dao.savePollDetail(session, p);
		
		if(resultPoll>0&&p.getPolBallot().size()>0) {
			int resultBallot=0;
			
			for(Ballot pb: p.getPolBallot()) {
				pb.setPolCode(p.getPolCode());
				resultBallot=dao.savePollBallot(session, pb);
				if(resultBallot==0) {
					session.rollback();
					session.close();
					return 0;
				}
			}
			
			if(resultBallot>0&&p.getPolReminder().size()>0) {
				
				for(Reminder pr: p.getPolReminder()) {
					pr.setPolCode(p.getPolCode());
					int resultReminder=dao.savePollReminder(session, pr);
					if(resultReminder==0) {
						session.rollback();
						session.close();
						return 0;
					}
				}
			}
			
		}
		else {
			session.rollback();
			session.close();
			return 0;
		}
		
		session.commit();
		session.close();
		
		return resultPoll;
	}
	
	public List<Poll> fetchPollList() {
		SqlSession session=getSession();
		List<Poll> result=dao.fetchPollList(session);
		session.close();
		return result;
	}
	
	public Poll fetchPollDetail(String polCode) {
		SqlSession session=getSession();
		Poll result=dao.fetchPollDetail(session, polCode);
		session.close();
		return result;
	}
	
}
