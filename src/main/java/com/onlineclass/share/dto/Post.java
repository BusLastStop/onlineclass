package com.onlineclass.share.dto;

import java.sql.Date;
import java.util.List;

import com.onlineclass.student.dto.Student;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Post {
	private String posCode;
	private String posTitle;
	private String posContent;
	private String posUpload;
	private Date posDateTime;
	private String stuCode;
	private Student student;
	private List<PostReply> replies;
}
