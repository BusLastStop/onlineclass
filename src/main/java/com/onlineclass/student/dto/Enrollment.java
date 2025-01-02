package com.onlineclass.student.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Enrollment {
	private String enrCode;
	private Date enrStartDate;
	private Date enrEndDate;
	private String lecCode;
	private String stuCode;
}
