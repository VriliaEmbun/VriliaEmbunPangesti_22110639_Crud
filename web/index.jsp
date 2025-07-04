<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Jika user sudah login, langsung ke list.jsp
    if (session.getAttribute("username") != null) {
        response.sendRedirect("list.jsp");
    } else {
        response.sendRedirect("login.jsp");
    }
%>
