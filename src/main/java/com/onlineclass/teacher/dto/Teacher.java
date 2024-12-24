package com.onlineclass.teacher.dto;

import java.sql.Date;

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
	private int teaTutAccumIncome;
	private int teaTutAccumMatchTime;
	private int teaTutAccumMatchCount;
	private int teaTutIdenticalMatchCount;
}
