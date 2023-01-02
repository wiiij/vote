<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function remove() {
		alert("모든 내용을 지우고 다시 입력합니다!");
		document.vData.reset();
		document.vData.jumin.focus();
	}
	
	function checkVal(){
		
		if(!document.vData.jumin.value){
			alert("주민번호가 입력되지 않았습니다!");
			document.vData.jumin.focus();
			return false;
		}else if(!document.vData.name.value){
			alert("성명이 입력되지 않았습니다!");
			document.vData.name.focus();
			return false;			
		}else if(!document.vData.vote_num.value){
			alert("후보번호가 입력되지 않았습니다!");
			document.vData.vote_num.focus();
			return false;
		}else if(!document.vData.time.value){
			alert("투표시간이 입력되지 않았습니다!");
			document.vData.time.focus();
			return false;
		}else if(!document.vData.place.value){
			alert("투표장소가 입력되지 않았습니다!");
			document.vData.place.focus();
			return false;
		}else if(!document.vData.confirm.value){
			alert("유권자확인이 선택되지 않았습니다!");
			return false;
		}
		alert("투표하기 정보가 정상적으로 등록되었습니다!");
	}
</script>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>
	<div class="section">
		<h2>투표하기</h2>
		<div>
		<form name="vData" method="post" action="page2_p.jsp" onsubmit="return checkVal()">
			<table class="table_list">
				<tr>
					<td>주민번호</td>
					<td class="align-left"><input type="text" size="26" name="jumin"> 예: 8912121111111</td>
				</tr>
				<tr>
					<td>성명</td>
					<td class="align-left"><input type="text" size="20"  name="name"></td>
				</tr>
				<tr>
					<td>투표번호</td>
					<td class="align-left">
						<select name="vote_num">
							<option value="">후보선택</option>
							<option value="1">[1]김후보</option>
							<option value="2">[2]이후보</option>
							<option value="3">[3]박후보</option>
							<option value="4">[4]조후보</option>
							<option value="5">[5]최후보</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>투표시간</td>
					<td class="align-left"><input type="text" size="20"  name="time"></td>
				</tr>
				<tr>
					<td>투표장소</td>
					<td class="align-left"><input type="text" size="20"  name="place"></td>
				</tr>
				<tr>
					<td>유권자확인</td>
					<td class="align-left">
						<input type="radio" id="confirm_y"  name="confirm" value="Y">
						<label for="confirm_y">확인</label>
						<input type="radio" id="confirm_n"  name="confirm" value="N">
						<label for="confirm_n">미확인</label>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="투표하기">
						<input type="button" value="다시하기" onclick="remove()">
					</td>
				</tr>
			</table>
		</form>
		</div>
	</div>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>