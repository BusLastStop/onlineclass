package com.onlineclass.share.dto;

import java.sql.Date;

import com.onlineclass.student.dto.Student;
import com.onlineclass.teacher.dto.Teacher;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PostReply {
	private String posRepCode;
	private String posRepContent;
	private Date posRepDateTime;
	private int posRepLevel;
	private String posRepRefCode;
	private String posCode;
	private String stuCode;
	private String teaCode;
	private Student student;
	private Teacher teacher;
}
