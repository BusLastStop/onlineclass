package com.onlineclass.student.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.onlineclass.share.dto.Post;
import com.onlineclass.student.dto.Student;

public class StudentDAO {
	public Student selectOneStudent(SqlSession session, String userId) {
		return session.selectOne("student.selectOneStudent",userId);
	}
	
	public Student selectOneByEmail(SqlSession session, String email) {
		return session.selectOne("student.selectOneByEmail",email);
	}
	
	public int enrollStudent(SqlSession session, Student s) {
		return session.insert("student.enrollStudent",s);
	}
	
	public Student studentLogin(SqlSession session, Map<String,String> user) {
		return session.selectOne("student.studentLogin",user);
	}
	
	public List<Post> getMyPosts(SqlSession session, String code){
		return session.selectList("student.getMyPosts",code);
	}
	
	public String sendIdEmail(SqlSession session, Map<String,String> info) {
		return session.selectOne("student.sendIdEmail",info);
	}
	
	public String sendIdPhone(SqlSession session, Map<String,String> info) {
		return session.selectOne("student.sendIdPhone",info);
	}
	
	public int findStudentEmail(SqlSession session, Map<String,String> info) {
		return session.selectOne("student.findStudentEmail",info);
	}
	
	public int findStudentPhone(SqlSession session, Map<String,String> info) {
		return session.selectOne("student.findStudentPhone",info);
	}
	
	public int studentTempPw(SqlSession session, Map<String, String> info) {
		return session.update("student.studentTempPw",info);
	}
}
