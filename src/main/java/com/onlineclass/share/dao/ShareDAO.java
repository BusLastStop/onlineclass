package com.onlineclass.share.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.onlineclass.share.dto.Post;
import com.onlineclass.share.dto.PostReply;

public class ShareDAO {
	public int postWrite(SqlSession session, Map<String,String> data) {
		return session.insert("share.postWrite",data);
	}
	
	public List<Post> selectPostList(SqlSession session, Map<String, Integer> page){
		int cPage = page.get("cPage");
		int numPerPage = page.get("numPerPage");
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("share.selectPostList",null,rb);
	}
	
	public int postCount(SqlSession session) {
		return session.selectOne("share.postCount");
	}
	
	public Post selectOnePost(SqlSession session, String code) {
		return session.selectOne("share.selectOnePost",code);
	}
	
	public int postReply(SqlSession session, PostReply reply) {
		return session.insert("share.postReply",reply);
	}
	
	public List<PostReply> selectReplyList(SqlSession session, String code){
		return session.selectList("share.selectReplyList",code);
	}
	
//	public Post postAndReplies(SqlSession session, String code) {
//		return session.selectOne("share.postAndReplies",code);
//	}
}
