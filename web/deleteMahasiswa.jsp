<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String nim = request.getParameter("nim");

    // Konfigurasi koneksi
    String url = "jdbc:mysql://localhost:3306/test"; // Ganti 'test' jika nama database berbeda
    String user = "root"; // Ganti sesuai user MySQL kamu
    String password = ""; // Ganti sesuai password MySQL kamu

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
        
        // SQL untuk menghapus data mahasiswa
        String sql = "DELETE FROM mahasiswa WHERE nim = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, nim);
        
        int rowsAffected = pstmt.executeUpdate();
        
        if (rowsAffected > 0) {
            response.sendRedirect("list.jsp");
        } else {
            out.println("<p>Data mahasiswa dengan NIM " + nim + " tidak ditemukan.</p>");
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>

<a href="index.jsp">Kembali ke Daftar Mahasiswa</a>