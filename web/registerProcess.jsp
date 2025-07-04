<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    String url = "jdbc:mysql://localhost:3306/test";
    String dbUser = "root";
    String dbPass = "";

    Connection conn = null;
    PreparedStatement checkUser = null;
    PreparedStatement insertUser = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPass);

        // Cek apakah username sudah ada
        String checkSql = "SELECT * FROM users WHERE username=?";
        checkUser = conn.prepareStatement(checkSql);
        checkUser.setString(1, username);
        rs = checkUser.executeQuery();

        if (rs.next()) {
%>
            <script>alert("Username sudah digunakan!"); history.back();</script>
<%
        } else {
            // Simpan user baru
            String insertSql = "INSERT INTO users (username, password) VALUES (?, ?)";
            insertUser = conn.prepareStatement(insertSql);
            insertUser.setString(1, username);
            insertUser.setString(2, password);
            insertUser.executeUpdate();

%>
            <script>alert("Registrasi berhasil! Silakan login."); window.location = "login.jsp";</script>
<%
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (checkUser != null) checkUser.close();
        if (insertUser != null) insertUser.close();
        if (conn != null) conn.close();
    }
%>
