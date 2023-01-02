<%@page import="java.sql.PreparedStatement"%>
<%@page import="DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    
    String sql = "INSERT INTO TBL_VOTE_202005 VALUES(?, ?, ?, ?, ?, ?)";
    Connection conn = DBConnect.getConnection();
    PreparedStatement ps = conn.prepareStatement(sql);
    
    ps.setString(1, request.getParameter("jumin"));
    ps.setString(2, request.getParameter("name"));
    ps.setString(3, request.getParameter("vote_num"));
    ps.setString(4, request.getParameter("time"));
    ps.setString(5, request.getParameter("place"));
    ps.setString(6, request.getParameter("confirm"));
    
    ps.executeUpdate();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="index.jsp"></jsp:include>
</body>
</html>