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

public class Poll {
private String polCode;
private String polTitle;
private String polSort;
private List<Ballot> polBallot;
private String polMultipleChoice;
private String polAnonymousBallot;
private String polResultAccess;
private String polNewBallot;
private String polSelectionChange;
private Timestamp polStartDateTime;
private Timestamp polEndDateTime;
private Timestamp PolCreatedDateTime;
private List<Reminder> polReminder;
private Student polCreator;
	
}
