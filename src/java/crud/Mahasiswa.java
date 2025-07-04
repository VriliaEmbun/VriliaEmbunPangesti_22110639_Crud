package crud;

import java.sql.*;

public class Mahasiswa {

    public String nim;
    public String nama;
    public Integer nilai;

    public boolean tambah() {
        String DBDRIVER = "com.mysql.cj.jdbc.Driver";
        String DBCONNECTION = "jdbc:mysql://localhost:3306/test";
        String DBUSER = "root";
        String DBPASS = "";

        Connection conn = null;
        PreparedStatement st;

        try {
            Class.forName(DBDRIVER);
            conn = DriverManager.getConnection(DBCONNECTION, DBUSER, DBPASS);

            String sql = "INSERT INTO mahasiswa (nim, nama, nilai) VALUES (?, ?, ?)";
            st = conn.prepareStatement(sql);
            st.setString(1, this.nim);
            st.setString(2, this.nama);
            st.setInt(3, this.nilai);
            st.executeUpdate();
            conn.close();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    public boolean update() {
        String DBDRIVER = "com.mysql.cj.jdbc.Driver";
        String DBCONNECTION = "jdbc:mysql://localhost:3306/test";
        String DBUSER = "root";
        String DBPASS = "";

        Connection conn = null;
        PreparedStatement st;

        try {
            Class.forName(DBDRIVER);
            conn = DriverManager.getConnection(DBCONNECTION, DBUSER, DBPASS);

            String sql = "UPDATE mahasiswa SET nama = ?, nilai = ? WHERE nim = ?";
            st = conn.prepareStatement(sql);
            st.setString(1, this.nama);
            st.setInt(2, this.nilai);
            st.setString(3, this.nim);
            int rowsUpdated = st.executeUpdate();
            conn.close();
            return rowsUpdated > 0;
        } catch (Exception ex) {
            return false;
        }
    }
}
