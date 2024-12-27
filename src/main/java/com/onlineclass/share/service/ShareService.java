package com.onlineclass.share.service;

import static com.onlineclass.common.SqlSessionTemplate.getSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.onlineclass.share.dao.ShareDAO;
import com.onlineclass.share.dto.Post;
import com.onlineclass.share.dto.PostReply;

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
	
	public List<Post> selectPostList(Map<String, Integer> page){
		SqlSession session = getSession();
		List<Post> postList = dao.selectPostList(session, page);
		session.close();
		return postList;
	}
	
	public int postCount() {
		SqlSession session = getSession();
		int count = dao.postCount(session);
		session.close();
		return count;
	}
	
	public Post selectOnePost(String code) {
		SqlSession session = getSession();
		Post post = dao.selectOnePost(session, code);
		session.close();
		return post;
	}
	
	public int postReply(PostReply reply) {
		SqlSession session = getSession();
		int result = dao.postReply(session,reply);
		
		if(result>0) session.commit();
		else session.rollback();
		
		session.close();
		return result;
	}
	
	public List<PostReply> selectCommentList(String code){
		SqlSession session = getSession();
		List<PostReply> comments = dao.selectReplyList(session, code);
		session.close();
		return comments;
	}
	
//	public Post postAndReplies(String code) {
//		SqlSession session = getSession();
//		Post post = dao.postAndReplies(session, code);
//		session.close();
//		return post;
//	}
	
	public int deleteReply(String code) {
		SqlSession session = getSession();
		int result = dao.deleteReply(session, code);
		if(result>0) session.commit();
		else session.rollback();
		return result;
	}
}
