package com.onlineclass.student.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

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
}