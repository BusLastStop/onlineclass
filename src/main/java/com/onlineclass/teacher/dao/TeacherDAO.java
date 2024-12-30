package com.onlineclass.teacher.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.onlineclass.teacher.dto.Teacher;

public class TeacherDAO {
	public Teacher selectOneTeacher(SqlSession session, String userId) {
		return session.selectOne("teacher.selectOneTeacher",userId);
	}
	
	public Teacher selectOneByEmail(SqlSession session, String email) {
		return session.selectOne("teacher.selectTeacherByEmail",email);
	}
	
	public int enrollTeacher(SqlSession session, Teacher t) {
		return session.insert("teacher.enrollTeacher",t);
	}
	
	public Teacher teacherLogin(SqlSession session, Map<String,String> user) {
		return session.selectOne("teacher.teacherLogin",user);
	}
	
	public String sendIdEmail(SqlSession session, Map<String,String> info) {
		return session.selectOne("teacher.sendIdEmail",info);
	}
	
	public String sendIdPhone(SqlSession session, Map<String,String> info) {
		return session.selectOne("teacher.sendIdPhone",info);
	}
	
	public int findTeacherEmail(SqlSession session, Map<String,String> info) {
		return session.selectOne("teacher.findTeacherEmail",info);
	}
	
	public int findTeacherPhone(SqlSession session, Map<String,String> info) {
		return session.selectOne("teacher.findTeacherPhone",info);
	}
	
	public int teacherTempPw(SqlSession session, Map<String, String> info) {
		return session.update("teacher.teacherTempPw",info);
	}
}
