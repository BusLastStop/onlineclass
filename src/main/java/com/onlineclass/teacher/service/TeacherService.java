package com.onlineclass.teacher.service;

import static com.onlineclass.common.SqlSessionTemplate.getSession;

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
}
