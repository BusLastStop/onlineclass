package com.onlineclass.share.service;

import static com.onlineclass.common.SqlSessionTemplate.getSession;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.onlineclass.share.dao.ShareDAO;

public class ShareService {
	private ShareDAO dao = new ShareDAO();
	
	public int postWrite(Map<String,String> data) {
		SqlSession session = getSession();
		int result = dao.postWrite(session, data);
		
		if(result>0) session.commit();
		else session.rollback();
		
		session.close();
		return result;
	}
}
