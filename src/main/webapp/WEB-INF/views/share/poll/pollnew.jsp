<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>투표 생성</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>  	
</head>

<body>
    <form id="poll" action="${pageContext.request.contextPath}/share/poll/save" method="post"
    onsubmit="return checkData();">

        <fieldset>
            <legend>제목</legend>
            <input type="text" name="poll-title" placeholder="필수">
        </fieldset>

        <fieldset>
            <legend>종류</legend>
            <label>
                <input type="radio" name="poll-sort" value="다수 투표제" checked required>다수 투표제
            </label>
            <label>
                <input type="radio" name="poll-sort" value="점수 투표제" required>점수 투표제
            </label>
            <label>
                <input type="radio" name="poll-sort" value="보르다 투표제" required>보르다 투표제
            </label>
        </fieldset>

        <fieldset>
            <legend>항목</legend>
            <input type="text" name="poll-ballot-content" placeholder="필수, 중복 불가"><br>
            <input type="text" name="poll-ballot-content" placeholder="필수, 중복 불가"><br>
            <div class="ballot-button-container">
	            <button type="button" onclick="addBallotContent(event);">추가</button>
	            <button type="button" onclick="removeBallotContent(event);">삭제</button>
            </div>
        </fieldset>

        <script>
            const addBallotContent=(e)=>{
                $($("[name='poll-ballot-content']")[0]).clone().val("").insertBefore($(".ballot-button-container"));
                $("<br>").insertBefore($(".ballot-button-container"));
            }

            const removeBallotContent=(e)=>{
                const inputToRemove = $("[name='poll-ballot-content']");
                if (inputToRemove.length > 2) {
                    inputToRemove.last().next("br").remove();
                    inputToRemove.last().remove();
                } else {
                    alert("더 이상 삭제할 수 없습니다.");
                }
            }
        </script>

        <fieldset>
            <legend>설정</legend>

            <fieldset>
                <legend>투표 다중 선택 가부</legend>
                <label>
                    <input type="radio" name="poll-multiple-choice" value="가능" checked required>가능
                </label>
                <label>
                    <input type="radio" name="poll-multiple-choice" value="불가능" required>불가능
                </label>
            </fieldset>
            
            <fieldset>
                <legend>투표 익명 설정 가부</legend>
                <label>
                    <input type="radio" name="poll-anonymous-ballot" value="기명" checked required>기명
                </label>
                <label>
                    <input type="radio" name="poll-anonymous-ballot" value="무기명" required>무기명
                </label>
            </fieldset>

            <fieldset>
                <legend>투표 진행 상황 공개 여부</legend>
                <label>
                    <input type="radio" name="poll-result-access" value="가능" checked required>가능
                </label>
                <label>
                    <input type="radio" name="poll-result-access" value="불가능" required>불가능
                </label>
            </fieldset>

            <fieldset>
                <legend>투표 신규 항목 추가 가부</legend>
                <label>
                    <input type="radio" name="poll-new-ballot" value="가능" checked required>가능
                </label>
                <label>
                    <input type="radio" name="poll-new-ballot" value="불가능" required>불가능
                </label>
            </fieldset>
            
            <fieldset>
                <legend>투표 항목 선택 변경 가부</legend>
                <label>    
                    <input type="radio" name="poll-selection-change" value="가능" checked required>가능
                </label>
                <label>
                    <input type="radio" name="poll-selection-change" value="불가능" required>불가능
                </label>
            </fieldset>

            <fieldset>
                <legend>투표 시작-마감 시각</legend>
                <input type="datetime-local" name="poll-start-date-time" required>
                <span>-</span>
                <input type="datetime-local" name="poll-end-date-time" required>
            </fieldset>
        </fieldset>

        <fieldset>
            <legend>알람</legend>
            <div class=poll-reminder-time>
                <input type="number" name="poll-reminder-day" value="0" min="0">
                <span>일</span>
                <input type="number" name="poll-reminder-hour" value="0" min="0">
                <span>시간</span>
                <input type="number" name="poll-reminder-minute" value="0" min="0">
                <span>분 전</span>
            </div>
            <div class="reminder-button-container">
	            <button type="button" onclick="addPollReminder(event);">추가</button>
	            <button type="button" onclick="removePollReminder(event);">삭제</button>
	        </div>
        </fieldset>

        <script>
            const addPollReminder=(e)=>{
                $($(".poll-reminder-time")[0]).clone().insertBefore($(".reminder-button-container"));
                $(".poll-reminder-time").last().find("input").val("0");
            }

            const removePollReminder=(e)=>{
                const divToRemove=$(".poll-reminder-time");
                if (divToRemove.length > 1) {
                    divToRemove.last().remove();
                } else {
                    alert("더 이상 삭제할 수 없습니다.");
                }
            }
        </script>
		
		<div class="submit-button-container">
			<button type="submit">생성</button>
	        <button type="button" onclick="window.location.href='${pageContext.request.contextPath}/share/poll/list';">취소</button>
		</div>

    </form>

    <script>
    	const checkData =()=>{			
			if ($($("input[name='poll-title']")).val().trim().length<1) {
				alert("제목을 포함해 모든 정보를 입력해야 합니다.");
				return false;
			}
			
			const ballotInputTags=$("input[name='poll-ballot-content']");	
			const ballotValuesSet=new Set();
			
			for(let i=0;i<ballotInputTags.length;i++){
				const ballotInputValues=$(ballotInputTags[i]).val().trim();
			
	    		if (ballotInputValues=="") {
					alert("두 개 이상의 항목을 포함해 모든 정보를 입력해야 합니다.");
	    			return false;
	    		}
	    		
				ballotValuesSet.add(ballotInputValues);
				
	    		if(ballotValuesSet.size!=i+1){
	    			alert("항목은 중복되지 않게 두 개 이상 입력해야 합니다.");
					return false;
	    		}
			}
			
			const startValue=$($("input[name='poll-start-date-time']")[0]).val();
			const endValue=$($("input[name='poll-end-date-time']")[0]).val();
			
			if(new Date(endValue) < new Date(startValue)) {
				alert("투표 마감 시각은 투표 시작 시각보다 이후여야 합니다.")
				return false;
			}
			
			const reminderDivTags=$("div[class='poll-reminder-time']");
			const reminderValuesSet=new Set();
			
			for(let i=0;i<reminderDivTags.length;i++){
				const dayValue=Number($($("input[name='poll-reminder-day']")[i]).val().trim());
				const hourValue=Number($($("input[name='poll-reminder-hour']")[i]).val().trim());
				const minuteValue=Number($($("input[name='poll-reminder-minute']")[i]).val().trim());
				
				if(dayValue==0 && hourValue==0 && minuteValue==0) {
					alert("알람 시간을 포함해 모든 정보를 입력해야 합니다.")
					return false;
				}
				
				reminderValuesSet.add(dayValue+"-"+hourValue+"-"+minuteValue);
				
				if(reminderValuesSet.size!=i+1) {
	    			alert("알람 시간은 중복될 수 없습니다.");
	    			return false;
				}
			}		
			return true; 
    	};
    </script>

</body>
</html>