<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    StringBuffer sb = new StringBuffer();
    sb.append("select  v_no, m_name, count(*) cnt				   ")
    	.append("from TBL_VOTE_202005 vote, TBL_MEMBER_202005 mem  ")
    	.append("where vote.v_no=mem.m_no and vote.V_CONFIRM = 'Y' ")
    	.append("group by v_no, m_name                             ")
    	.append("order by cnt desc                                 ");
    
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
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>
	<div class="section">
		<h2>후보자등수</h2>
		<div>
			<table class="table_list">
				<tr>
					<td>후보번호</td>
					<td>성명</td>
					<td>총투표건수</td>
				</tr>
				<%while(rs.next()){ %>
				<tr>
					<td><%=rs.getString("v_no") %></td>
					<td><%=rs.getString("m_name") %></td>
					<td><%=rs.getString("cnt") %></td>
				</tr>
				<%} %>
			</table>
		</div>
	</div>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>