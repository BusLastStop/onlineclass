package com.onlineclass.poll.model.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Poll {
private String pollCode;
private String pollTitle;
private String pollSort;
private String[] pollBallotContent;
private String pollMultipleChoice;
private String pollAnonymousBallot;
private String pollResultAccess;
private String pollNewBallot;
private String pollSelectionChange;
private Timestamp pollStartDateTime;
private Timestamp pollEndDateTime;
private String[] pollReminderDay;
private String[] pollReminderHour;
private String[] pollReminderMinute;
	
}
