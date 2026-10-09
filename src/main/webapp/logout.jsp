<%-- 
    Document   : logout
    Created on : 9 de out. de 2026, 16:50:43
    Author     : Nathan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate();
    response.sendRedirect("LoginProfessor.jsp");
%>