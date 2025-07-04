<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Daftar Mahasiswa</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            color: #333;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #007acc;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #007acc;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #e0e0e0;
        }
        a {
            text-decoration: none;
            color: #007acc;
            padding: 8px 12px;
            border: 1px solid #007acc;
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
        }
        a:hover {
            background-color: #007acc;
            color: white;
        }
        .add-button {
            display: inline-block;
            margin: 20px 0;
            padding: 10px 15px;
            background-color: #007acc;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .add-button:hover {
            background-color: #005f99;
        }
        .logout-button {
            display: inline-block;
            margin: 20px 0;
            padding: 10px 15px;
            background-color: #d9534f; /* Warna merah untuk logout */
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .logout-button:hover {
            background-color: #c9302c; /* Warna lebih gelap saat hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Daftar Mahasiswa</h2>
        <a href="add.jsp" class="add-button">Tambah Data</a>
        <a href="logout.jsp" class="logout-button">Logout</a>

        <%
            // Konfigurasi koneksi
            String url = "jdbc:mysql://localhost:3306/test"; // Ganti 'test' jika nama database berbeda
            String user = "root"; // Ganti sesuai user MySQL kamu
            String password = ""; // Ganti sesuai password MySQL kamu

            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM mahasiswa");
        %>

        <table>
            <tr>
                <th>No</th>
                <th>NIM</th>
                <th>Nama</th>
                <th>Nilai</th>
                <th>Aksi</th>
            </tr>
            <%
                int no = 1;
                while (rs.next()) {
            %>
            <tr>
                <td><%= no++ %></td>
                <td><%= rs.getString("nim") %></td>
                <td><%= rs.getString("nama") %></td>
                <td><%= rs.getInt("nilai") %></td>
                <td>
                    <a href="update.jsp?nim=<%= rs.getString("nim") %>">Edit</a>
                    <a href="deleteMahasiswa.jsp?nim=<%= rs.getString("nim") %>" onclick="return confirm('Yakin ingin menghapus?')">Delete</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>

        <%
            } catch (Exception e) {
                out.println("<p style='color: red;'>Error: " + e.getMessage() + "</p>");
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
    </div>
</body>
</html>