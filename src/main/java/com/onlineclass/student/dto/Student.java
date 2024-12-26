package com.onlineclass.student.dto;

import java.sql.Date;
import java.util.List;

import com.onlineclass.share.dto.Post;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Student {
	private String stuCode;
	private String stuName;
	private String stuId;
	private String stuPw;
	private Date stuBirthDate;
	private String stuEmail;
	private String stuPhone;
	private String stuAddress;
	private String stuGender;
	private String stuSchool;
	private String stuInterestedUniversity;
	private String stuInterestedMajor;
	private int stuTotalAccumFee;	// 21억 넘을 것 같으면 long으로 바꾸기
	private int stuLectureAccumFee;
	private int stuTutAccumFee;	// 21억 넘을 것 같으면 long으로 바꾸기
	private int stuLectureAccumWatchTime;
	private int stuTutAccumMatchTime;
	private int stuTutAccumMatchCount;
	private int stuTutIdenticalMatchCount;
	private List<Post> stuPostList;
}
