package com.onlineclass.student.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.onlineclass.member.dto.Lecture;
import com.onlineclass.share.dto.Post;
import com.onlineclass.student.dto.Enrollment;
import com.onlineclass.student.dto.FavouriteTeacher;
import com.onlineclass.student.dto.InterestedLecture;
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
	
	public List<Lecture> recordLectures(SqlSession session){
		return session.selectList("student.recordLectures");
	}
	
	public int lectureCount(SqlSession session) {
		return session.selectOne("student.lectureCount");
	}
	
	public Lecture lectureDetails(SqlSession session, String lecCode) {
		return session.selectOne("student.lectureDetails",lecCode);
	}
	
	public InterestedLecture getInterestedLecture(SqlSession session, Map<String, String> code) {
		return session.selectOne("student.getInterestedLecture",code);
	}
	
	public int addInterestedLecture(SqlSession session, Map<String, String> code) {
		return session.insert("student.addInterestedLecture",code);
	}
	
	public int removeInterestedLecture(SqlSession session, Map<String, String> code) {
		return session.delete("student.removeInterestedLecture",code);
	}
	
	public FavouriteTeacher getInterestedTeacher(SqlSession session, Map<String, String> code) {
		return session.selectOne("student.getInterestedTeacher",code);
	}
	
	public int addInterestedTeacher(SqlSession session, Map<String, String> code) {
		return session.insert("student.addInterestedTeacher",code);
	}
	
	public int removeInterestedTeacher(SqlSession session, Map<String, String> code) {
		return session.delete("student.removeInterestedTeacher",code);
	}
	
	public int registLecture(SqlSession session, Map<String,String> code) {
		return session.insert("student.registLecture",code);
	}
	
	public Enrollment getEnrollment(SqlSession session, Map<String,String> code) {
		return session.selectOne("student.getEnrollment", code);
	}
	
	public int cancelRegist(SqlSession session, Map<String,String> code) {
		return session.delete("student.cancelRegist",code);
	}
}
