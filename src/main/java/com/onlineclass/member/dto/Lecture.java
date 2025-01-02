package com.onlineclass.member.dto;

import java.util.List;

import com.onlineclass.teacher.dto.Teacher;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Lecture {
	private String lecCode;
	private String lecSubject;
	private String lecName;
	private int lecFee;
	private String lecDuration;
	private int lecAccumEnrollCount;
	private int lecAccumStudentNum;
	private int lecEnrStudentNum;
	private int lecAccumEnrStudentNum;
	private int lecAverageWatchTime;
	private String teaCode;
	private String lecKeyword;
	private Teacher teacher;
	private Video video;
	private List<Review> review;
}
