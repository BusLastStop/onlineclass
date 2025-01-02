package com.onlineclass.poll.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.onlineclass.poll.model.dto.Poll;

public class PollDao {

	public int savePollDetail(SqlSession session, Poll p) {
		return session.insert("pollMapper.savePollDetail", p);
	}
	
	public int savePollBallot(SqlSession session, Map<String,String> p) {
		return session.insert("pollMapper.savePollBallot", p);
	}
	
	public int savePollReminder(SqlSession session, Map<String,String> p) {
		return session.insert("pollMapper.savePollReminder", p);
	}
	
	public List<Poll> fetchPollList(SqlSession session) {
		return session.selectList("pollMapper.fetchPollList");
	}
}
