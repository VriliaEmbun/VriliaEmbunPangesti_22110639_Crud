<%@ page import="java.sql.*" %>
<%@ page import="crud.Mahasiswa" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String nim = request.getParameter("nim");
    Mahasiswa mahasiswa = new Mahasiswa();
    mahasiswa.nim = nim;

    // Mengambil data mahasiswa dari database
    String DBDRIVER = "com.mysql.cj.jdbc.Driver";
    String DBCONNECTION = "jdbc:mysql://localhost:3306/test";
    String DBUSER = "root";
    String DBPASS = "";

    Connection conn = null;
    PreparedStatement st = null;
    ResultSet rs = null;

    try {
        Class.forName(DBDRIVER);
        conn = DriverManager.getConnection(DBCONNECTION, DBUSER, DBPASS);
        String sql = "SELECT * FROM mahasiswa WHERE nim = ?";
        st = conn.prepareStatement(sql);
        st.setString(1, nim);
        rs = st.executeQuery();

        if (rs.next()) {
            mahasiswa.nama = rs.getString("nama");
            mahasiswa.nilai = rs.getInt("nilai");
        } else {
            out.println("<p>Data mahasiswa tidak ditemukan.</p>");
            return;
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (st != null) try { st.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Data Mahasiswa</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f4f8;
            color: #333;
            margin: 30px auto;
            max-width: 400px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #007acc;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        label {
            font-weight: bold;
        }
        input[type="text"], input[type="number"] {
            padding: 8px 12px;
            font-size: 16px;
            border: 1.5px solid #ddd;
            border-radius: 4px;
            transition: border-color 0.3s ease;
        }
        input[type="text"]:focus, input[type="number"]:focus {
            border-color: #007acc;
            outline: none;
        }
        input[type="submit"] {
            background-color: #007acc;
            color: white;
            border: none;
            padding: 10px;
            font-size: 18px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #005f99;
        }
        a {
            display: block;
            margin-top: 15px;
            text-align: center;
            text-decoration: none;
            color: #555;
            font-size: 14px;
        }
        a:hover {
            color: #007acc;
        }
    </style>
</head>
<body>
    <h2>Edit Data Mahasiswa</h2>
    <form action="mahasiswa.update.jsp" method="post">
        <input type="hidden" name="nim" value="<%= mahasiswa.nim %>">
        <label for="nama">Nama:</label>
        <input type="text" id="nama" name="nama" value="<%= mahasiswa.nama %>" required>

        <label for="nilai">Nilai:</label>
        <input type="number" id="nilai" name="nilai" value="<%= mahasiswa.nilai %>" min="0" max="100" required>

        <input type="submit" value="Update">
    </form>
    <a href="list.jsp">Lihat Daftar Mahasiswa</a>
</body>
</html>