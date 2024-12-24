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
}
