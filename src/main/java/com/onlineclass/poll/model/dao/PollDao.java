package com.onlineclass.poll.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.onlineclass.poll.model.dto.Ballot;
import com.onlineclass.poll.model.dto.Poll;
import com.onlineclass.poll.model.dto.Reminder;

public class PollDao {

	public int savePollDetail(SqlSession session, Poll p) {
		return session.insert("pollMapper.savePollDetail", p);
	}
	
	public int savePollBallot(SqlSession session, Ballot b) {
		return session.insert("pollMapper.savePollBallot", b);
	}
	
	public int savePollReminder(SqlSession session, Reminder r) {
		return session.insert("pollMapper.savePollReminder", r);
	}
	
	public List<Poll> fetchPollList(SqlSession session) {
		return session.selectList("pollMapper.fetchPollList");
	}
	
	public Poll fetchPollDetail(SqlSession session, String polCode) {
		return session.selectOne("pollMapper.fetchPollDetail", polCode);
	}
}
