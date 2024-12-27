<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>투표 생성</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    
    <style>
    	body {
    font-family: Arial, sans-serif;
    color: #000000;
    background-color: #FFFFFF;
    margin: 0;
    padding: 20px;
    line-height: 1.6;
}

form {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #757575;
    border-radius: 8px;
    background-color: #FFFFFF;
    text-align: center;
}

fieldset {
    border: 1px solid #757575;
    border-radius: 8px;
    margin-bottom: 20px;
    padding: 15px;
    text-align: left;
}

legend {
    font-weight: bold;
    color: #065986;
}

input[type="text"],
input[type="datetime-local"],
input[type="number"] {
    width: calc(100% - 20px);
    margin: 10px 0;
    padding: 8px;
    border: 1px solid #757575;
    border-radius: 4px;
    box-sizing: border-box;
}

label {
    display: block;
    margin: 5px 0;
}

input[type="radio"] {
    margin-right: 8px;
}

/* 공통 버튼 스타일 */
button {
    padding: 15px 30px;
    margin: 10px 5px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    background-color: #065986;
    color: #FFFFFF;
    font-weight: bold;
    display: inline-block;
    width: 80%;
    max-width: 300px;
}

button:hover {
    background-color: #757575;
}

/* 추가/삭제 버튼의 중앙 정렬 */
fieldset > div.button-group {
    display: flex;
    justify-content: center;
    gap: 20px;
    margin: 20px 0;
}

fieldset:last-child > div.poll-reminder-time {
    display: flex;
    justify-content: space-between;
}

.poll-reminder-time input,
.poll-reminder-time span {
    display: inline-block;
    width: calc(33% - 10px);
    margin: 0 5px;
    text-align: center;
}

.poll-reminder-time span {
    line-height: 30px;
    color: #757575;
}

input[name="poll-start-date-time"],
input[name="poll-end-date-time"] {
    display: inline-block;
    width: calc(48% - 10px);
}

input[name="poll-start-date-time"] + span {
    display: inline-block;
    width: 4%;
    text-align: center;
    line-height: 30px;
}

  	</style>
  	
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
            <button type="button" onclick="addBallotContent(event);">추가</button>
            <button type="button" onclick="removeBallotContent(event);">삭제</button>
        </fieldset>

        <script>
            const addBallotContent=(e)=>{
                $($("[name='poll-ballot-content']")[0]).clone().val("").insertBefore($(e.target));
                $("<br>").insertBefore($(e.target));
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
            <button type="button" onclick="addPollReminder(event);">추가</button>
            <button type="button" onclick="removePollReminder(event);">삭제</button>
        </fieldset>

        <script>
            const addPollReminder=(e)=>{
                $($(".poll-reminder-time")[0]).clone().insertBefore($(e.target));
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

        <button type="submit">생성</button>
        <button type="button">취소</button>

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