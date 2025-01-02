package com.onlineclass.member.dto;

import java.sql.Date;

import com.onlineclass.student.dto.Student;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Review {
	private String revCode;
	private int revStar;
	private String revComment;
	private Date revDateTime;
	private String couCode;
	private String stuCode;
	private Student student;
}
