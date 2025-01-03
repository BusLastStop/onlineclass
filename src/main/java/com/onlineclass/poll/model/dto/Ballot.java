package com.onlineclass.poll.model.dto;

import java.sql.Timestamp;
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

public class Ballot {
	private String balCode;
	private String balContent;
	private int balVotedNumber;
	private String polCode;
}
