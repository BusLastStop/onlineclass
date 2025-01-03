<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>투표 진행 중</title>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>  	
</head>

<body>
    <form id="poll-vote" action="${pageContext.request.contextPath}/share/poll/view" method="post" onsubmit="return checkData();">
		
        <fieldset>
            <span class="poll-title">${poll.polTitle}</span>
        </fieldset>

        <c:if test="${poll.polMultipleChoice=='가능'}">
            <fieldset id="ballot-container">
                <legend>항목</legend>
                <c:forEach var="b" items="${poll.polBallot}">
	                <label>
	                    <input type="checkbox" name="ballot">${b.balContent}<br>
	                </label>
 				</c:forEach>
                <c:if test="${poll.polNewBallot=='가능'}">
                    <input type="text" name="newBallot" placeholder="신규 항목 입력">
                    <button type="button" onclick="addNewBallot(event);">추가</button>
                </c:if>
            </fieldset>
        </c:if>

        <c:if test="${poll.polMultipleChoice=='불가능'}">
            <fieldset id="ballot-container">
                <legend>항목</legend>
                <c:forEach var="b" items="${poll.polBallot}">
	                <label>
	                    <input type="radio" name="ballot">${b.balContent}<br>
	                </label>
 				</c:forEach>
                <c:if test="${poll.polNewBallot=='불가능'}">
                    <input type="text" name="newBallot" placeholder="신규 항목 입력">
                    <button type="button" onclick="addNewBallot(event);">추가</button>
                </c:if>
            </fieldset>
        </c:if>

        <script>
            const addNewBallot=(e)=>{
                const newBallotValue=$("[name='newBallot']").val().trim();

                if (newBallotValue.length<1) {
                    alert("항목을 입력해 주세요.");
                    return;
                }

                let flag=true;
                for(let existingInput of document.querySelectorAll("#ballot-container input[type='${poll.polMultipleChoice=="가능"?"checkbox":"radio"}']")){
                    if(existingInput.value==newBallotValue){
                        flag=false;
                        alert("이미 존재하는 항목입니다.");
                        break;
                    }
                }

                if(flag){ 
                    const newBallotTag=$("<input>").attr({
                            type:"${poll.polMultipleChoice=='가능'?'checkbox':'radio'}",
                            name:"ballot",
                            value:newBallotValue
                        });
                        $("<label>").append(newBallotTag).append(newBallotValue).append($("<br>")).insertBefore($(e.target).prev());
                }
            };
        </script>

        <fieldset>
            <legend>설정</legend>

	        <fieldset>
	        	<legend>투표 종류</legend>
	            <span class="poll-sort">${poll.polSort}</span>
	        </fieldset>

            <fieldset>
                <legend>투표 다중 선택 가부</legend>
                <span class="poll-multiple-choice">${poll.polMultipleChoice}</span>
            </fieldset>
            
            <fieldset>
                <legend>투표 익명 설정 가부</legend>
                <span class="poll-anonymous-ballot">${poll.polAnonymousBallot}</span>
            </fieldset>

            <fieldset>
                <legend>투표 진행 상황 공개 여부</legend>
                <span class="poll-result-access">${poll.polResultAccess}</span>
            </fieldset>

            <fieldset>
                <legend>투표 신규 항목 추가 가부</legend>
                <span class="poll-new-ballot">${poll.polNewBallot}</span>
            </fieldset>
            
            <fieldset>
                <legend>투표 항목 선택 변경 가부</legend>
                <span class="poll-selection-change">${poll.polSelectionChange}</span>
            </fieldset>

            <fieldset>
                <legend>투표 시작-마감 시각</legend>
                <span class="poll-start-date-time">
                	<fmt:formatDate value="${poll.polStartDateTime}" pattern="YYYY-MM-dd HH:mm:ss"/>
                </span>
                <span>-</span>
                <span class="poll-end-date-time">
                	<fmt:formatDate value="${poll.polEndDateTime}" pattern="YYYY-MM-dd HH:mm:ss"/>
                </span>    
            </fieldset>
        </fieldset>

        <fieldset>
            <legend>알람</legend>
            <c:forEach var="r" items="${poll.polReminder}">
            	<span class="poll-reminder-time">${r.remDateTime}</span><br>
            </c:forEach>
            <!-- <div class="new-poll-reminder-time">
                <input type="number">
                <span>일</span>
                <input type="number">
                <span>시간</span>
                <input type="number">
                <span>분 전</span>
            </div>
			<button type="button" onclick="addPollReminder(event);">추가</button> -->
        </fieldset>

<!--         <script>
            const addPollReminder=(e)=>{
                const newPollReminderValue=$(".new-poll-reminder-time input");
                const datePattern=newPollReminderValue[0].value+"일 "+newPollReminderValue[1].value+"시간 "+newPollReminderValue[2].value+"분 전";

                let flag=true, i=0;

                for(let existingInput of document.querySelectorAll(".poll-reminder-time")){
                    const val=existingInput.innerText.trim("\n");
                    if(datePattern==val){
                        flag=false;
                        alert("이미 존재하는 항목입니다.");
                        break;
                    }
                }

                if(flag){ 
                    const newPollReminderTag=$("<span class=poll-reminder-time>")
                        .append(newPollReminderValue[0].value+"일 "+newPollReminderValue[1].value+"시간 "+newPollReminderValue[2].value+"분 전")
                        .insertBefore($(e.target).prev()).append($("<br>"));
                }
            }
        </script> -->

        <button type="button">투표</button>
        <button type="button">진행 상황 보기</button>
        <button type="button">투표 종료</button>
        <button type="button">투표 숨기기</button>
        <button type="button">취소</button>

    </form>
    
    <script>
    	const checkData =()=>{
		
    	}
    </script>
    
</body>
</html>