package com.onlineclass.teacher.dto;

import java.sql.Date;
import java.util.List;

import com.onlineclass.member.dto.Lecture;
import com.onlineclass.student.dto.Tutorial;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Teacher {
	private String teaCode;
	private String teaName;
	private String teaId;
	private String teaPw;
	private Date teaBirthDate;
	private String teaEmail;
	private String teaPhone;
	private String teaAddress;
	private String teaGender;
	private String teaUniversity;
	private String teaSubject;
	private int teaTotalAccumIncome;
	private int teaLectureAccumIncome;
	private int teaTutuorialAccumIncome;
	private int teaTutuorialAccumMatchTime;
	private int teaTutAccumMatchCount;
	private int teaTutIdenticalMatchCount;
	private Tutorial tutorial;
	private List<Lecture> lectures;
}
