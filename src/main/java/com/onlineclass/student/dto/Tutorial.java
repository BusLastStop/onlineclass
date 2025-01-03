package com.onlineclass.student.dto;

import java.sql.Date;
import java.util.List;

import com.onlineclass.member.dto.Review;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Tutorial {
	private String tutCode;
	private String tutSubject;
	private int tutFee;
	private Date tutStartDateTime;
	private Date tutEndDateTime;
	private int tutEnrStudentNum;
	private int tutIdenticalMatchCount;
	private String tutLink;
	private String teaCode;
	private List<Review> reviews;
}
