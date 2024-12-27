package com.onlineclass.share.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class ShareDAO {
	public int postWrite(SqlSession session, Map<String,String> data) {
		return session.insert("share.postWrite",data);
	}
}
