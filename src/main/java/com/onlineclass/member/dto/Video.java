package com.onlineclass.member.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Video {
	private String vidCode;
	private String vidFileName;
	private String vidUploadStatus;
	private Date vidDateTime;
	private String lecCode;
	private String teaCode;
}
