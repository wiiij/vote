<%@page import="DB.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String sql = "select tm.m_no, tm.m_name, tp.p_name, case when p_school = '1' then '고졸' when p_school = '2' then '학사' when p_school = '3' then '석사' else '박사' end as p_school , substr(tm.m_jumin,1,6)||'-'||substr(tm.m_jumin,7) as m_jumin, tm.m_city, tp.p_tel1||'-'||tp.p_tel2||'-'||tp.p_tel3 as p_tal from tbl_member_202005 tm, tbl_party_202005 tp where tm.p_code = tp.p_code";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();

 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
<jsp:include page="layout/header.jsp"></jsp:include>
</header>
<nav>
<jsp:include page="layout/nav.jsp"></jsp:include>
</nav>
<section class="section">
<h2 align="center">후보조회</h2>
<table class="table_list">
	<tr>
		<th>후보번호</th>
		<th>성명</th>
		<th>소속정당</th>
		<th>학력</th>
		<th>주민번호</th>
		<th>지역구</th>
		<th>대표전화</th>
	</tr>
	<%while(rs.next()){ %>
		<tr align="center">
			<td><%= rs.getString(1) %></td>
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getString(3) %></td>
			<td><%= rs.getString(4) %></td>
			<td><%= rs.getString(5) %></td>
			<td><%= rs.getString(6) %></td>
			<td><%= rs.getString(7) %></td>
		</tr>
	<%} %>
</table>
</section>
<footer>
<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>