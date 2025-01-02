package com.onlineclass.student.service;

import static com.onlineclass.common.SqlSessionTemplate.getSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.onlineclass.member.dto.Lecture;
import com.onlineclass.share.dto.Post;
import com.onlineclass.student.dao.StudentDAO;
import com.onlineclass.student.dto.Enrollment;
import com.onlineclass.student.dto.FavouriteTeacher;
import com.onlineclass.student.dto.InterestedLecture;
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
	
	public int findStudentEmail(Map<String,String> info) {
		SqlSession session = getSession();
		int count = dao.findStudentEmail(session, info);
		session.close();
		return count;
	}
	
	public int findStudentPhone(Map<String,String> info) {
		SqlSession session = getSession();
		int count = dao.findStudentPhone(session, info);
		session.close();
		return count;
	}
	
	public int studentTempPw(Map<String, String> info) {
		SqlSession session = getSession();
		int result = dao.studentTempPw(session, info);
		
		if(result>0) session.commit();
		else session.rollback();
		session.close();
		
		return result;
	}
	
	public List<Lecture> recordLectures(){
		SqlSession session = getSession();
		List<Lecture> lectures = dao.recordLectures(session);
		
		session.close();
		
		return lectures;
	}
	
	public int lectureCount() {
		SqlSession session = getSession();
		int count = dao.lectureCount(session);
		
		session.close();
		
		return count;
	}
	
	public Lecture lectureDetails(String lecCode) {
		SqlSession session = getSession();
		Lecture lecture = dao.lectureDetails(session, lecCode);
		
		session.close();
		
		return lecture;
	}
	
	public InterestedLecture getInterestedLecture(Map<String, String> code) {
		SqlSession session = getSession();
		InterestedLecture lecture = dao.getInterestedLecture(session,code);
		
		session.close();
		
		return lecture;
	}
	
	public int addInterestedLecture(Map<String, String> code) {
		SqlSession session = getSession();
		int result = dao.addInterestedLecture(session, code);
		
		if(result>0) session.commit();
		else session.rollback();
		
		session.close();
		return result;
	}
	
	public int removeInterestedLecture(Map<String, String> code) {
		SqlSession session = getSession();
		int result = dao.removeInterestedLecture(session, code);
		
		if(result>0) session.commit();
		else session.rollback();
		
		session.close();
		return result;
	}
	
	public FavouriteTeacher getInterestedTeacher(Map<String, String> code) {
		SqlSession session = getSession();
		FavouriteTeacher teacher = dao.getInterestedTeacher(session,code);
		
		session.close();
		
		return teacher;
	}
	
	public int addInterestedTeacher(Map<String, String> code) {
		SqlSession session = getSession();
		int result = dao.addInterestedTeacher(session, code);
		
		if(result>0) session.commit();
		else session.rollback();
		
		session.close();
		return result;
	}
	
	public int removeInterestedTeacher(Map<String, String> code) {
		SqlSession session = getSession();
		int result = dao.removeInterestedTeacher(session, code);
		
		if(result>0) session.commit();
		else session.rollback();
		
		session.close();
		return result;
	}
	
	public int registLecture(Map<String,String> code) {
		SqlSession session = getSession();
		int result = dao.registLecture(session, code);
		
		if(result>0) session.commit();
		session.rollback();
		
		session.close();
		
		return result;
	}
	
	public Enrollment getEnrollment(Map<String,String> code) {
		SqlSession session = getSession();
		Enrollment enrollment = dao.getEnrollment(session, code);
		
		session.close();
		
		return enrollment;
	}
	
	public int cancelRegist(Map<String,String> code) {
		SqlSession session = getSession();
		int result = dao.cancelRegist(session,code);
		
		if(result>0) session.commit();
		else session.rollback();
		
		return result;
	}
}
