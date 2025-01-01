package com.onlineclass.teacher.service;

import static com.onlineclass.common.SqlSessionTemplate.getSession;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.onlineclass.teacher.dao.TeacherDAO;
import com.onlineclass.teacher.dto.Teacher;

public class TeacherService {
	private TeacherDAO dao = new TeacherDAO();
	public Teacher selectOneTeacher(String userId) {
		SqlSession session = getSession();
		Teacher teacher = dao.selectOneTeacher(session, userId);
		session.close();
		return teacher;
	}
	
	public Teacher selectOneByEmail(String email) {
		SqlSession session = getSession();
		Teacher teacher = dao.selectOneByEmail(session, email);
		session.close();
		return teacher;
	}
	
	public int enrollTeacher(Teacher t) {
		SqlSession session = getSession();
		int result = dao.enrollTeacher(session, t);
		if(result>0) {
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		return result;
	}
	
	public Teacher teacherLogin(Map<String,String> user) {
		SqlSession session = getSession();
		Teacher teacher = dao.teacherLogin(session, user);
		session.close();
		return teacher;
	}
	
	public String sendIdEmail(Map<String,String> info) {
		SqlSession session = getSession();
		String id = dao.sendIdEmail(session, info);
		session.close();
		return id;
	}
	
	public String sendIdPhone(Map<String,String> info) {
		SqlSession session = getSession();
		String id = dao.sendIdPhone(session, info);
		session.close();
		return id;
	}
	
	public int findTeacherEmail(Map<String,String> info) {
		SqlSession session = getSession();
		int count = dao.findTeacherEmail(session, info);
		session.close();
		return count;
	}
	
	public int findTeacherPhone(Map<String,String> info) {
		SqlSession session = getSession();
		int count = dao.findTeacherPhone(session, info);
		session.close();
		return count;
	}
	
	public int teacherTempPw(Map<String, String> info) {
		SqlSession session = getSession();
		int result = dao.teacherTempPw(session, info);
		
		if(result>0) session.commit();
		else session.rollback();
		session.close();
		
		return result;
	}
	
	public int lectureUpload(Map<String,String> lecInfo) {
		SqlSession session = getSession();
		int result = dao.lectureUpload(session, lecInfo);
		
		if(result>0) session.commit();
		else session.rollback();
		
		session.close();
		
		return result;
	}
	
	public String getLecCode(Map<String,String> lecInfo) {
		SqlSession session = getSession();
		String lecCode = dao.getLecCode(session, lecInfo);
		
		session.close();
		
		return lecCode;
	}
	
	public int lectureVideoRequest(Map<String,String> vidInfo) {
		SqlSession session = getSession();
		int result = dao.lectureVideoRequest(session, vidInfo);
		
		if(result>0) session.commit();
		else session.rollback();
		
		session.close();
		
		return result;
	}
}
