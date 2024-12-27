package com.onlineclass.student.service;

import static com.onlineclass.common.SqlSessionTemplate.getSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.onlineclass.share.dto.Post;
import com.onlineclass.student.dao.StudentDAO;
import com.onlineclass.student.dto.Student;

public class StudentService {
	private StudentDAO dao = new StudentDAO();
	
	public Student selectOneStudent(String userId) {
		SqlSession session = getSession();
		Student student = dao.selectOneStudent(session, userId);
		session.close();
		return student;
	}
	
	public Student selectOneByEmail(String email) {
		SqlSession session = getSession();
		Student student = dao.selectOneByEmail(session, email);
		session.close();
		return student;
	}
	
	public int enrollStudent(Student s) {
		SqlSession session = getSession();
		int result = dao.enrollStudent(session, s);
		if(result>0) {
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		return result;
	}
	
	public Student studentLogin(Map<String, String> user) {
		SqlSession session = getSession();
		Student student = dao.studentLogin(session, user);
		session.close();
		return student;
	}
	
	public List<Post> getMyPosts(String code){
		SqlSession session = getSession();
		List<Post> posts = dao.getMyPosts(session, code);
		session.close();
		return posts;
	}
}
