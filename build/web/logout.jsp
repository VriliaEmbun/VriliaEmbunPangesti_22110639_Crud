<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Menghapus sesi pengguna
    session.invalidate(); // Menghapus sesi
    response.sendRedirect("login.jsp"); // Redirect ke halaman login
%>