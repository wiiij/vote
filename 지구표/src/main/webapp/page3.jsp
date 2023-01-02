<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    StringBuffer sb = new StringBuffer();
    sb.append("select V_NAME ")
	    .append(" ,'19'||SUBSTR(V_JUMIN,1,2)||'년'||SUBSTR(V_JUMIN,3,2)||'월'||SUBSTR(V_JUMIN,5,2)||'일생' AS V_BIRTH                         ")
	    .append(" , TRUNC(MONTHS_BETWEEN(SYSDATE, TO_DATE(SUBSTR('19'||V_JUMIN,1,8), 'YYYYMMDD'))/12) AS V_AGE                             ")
	    .append(" , CASE SUBSTR(V_JUMIN,7,1) WHEN '1' THEN '남자' WHEN '2' THEN '여자' WHEN '3' THEN '남자' WHEN '4' THEN '여자' END AS V_GENDER ")
	    .append(" , V_NO                                                                                                                    ")
	    .append(" , SUBSTR(V_TIME,1,2) || ':' || SUBSTR(V_TIME,3,2) AS V_TIME                                                               ")
	    .append(" , CASE V_CONFIRM WHEN 'Y' THEN '확인' WHEN 'N' THEN '미확인' END AS V_CONFIRM                                                ")
	    .append("from TBL_VOTE_202005 where V_AREA = '제1투표장'                                                                               ");
  
    String sql = sb.toString();
    
    Connection conn = DBConnect.getConnection();
    PreparedStatement ps = conn.prepareStatement(sql);
    ResultSet rs = ps.executeQuery();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>
	<div class="section">
		<h2>투표검수조회</h2>
		<table class="table_list">
			<tr>
				<td>성명</td>
				<td>생년월일</td>
				<td>나이</td>
				<td>성별</td>
				<td>후보번호</td>
				<td>투표시간</td>
				<td>유권자확인</td>
			</tr>
			<%while(rs.next()){ %>
			<tr>
				<td><%=rs.getString("V_NAME") %></td>
				<td><%=rs.getString("V_BIRTH") %></td>
				<td><%=rs.getString("V_AGE") %></td>
				<td><%=rs.getString("V_GENDER") %></td>
				<td><%=rs.getString("V_NO") %></td>
				<td><%=rs.getString("V_TIME") %></td>
				<td><%=rs.getString("V_CONFIRM") %></td>
			</tr>
			<%} %>
		</table>
	</div>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>