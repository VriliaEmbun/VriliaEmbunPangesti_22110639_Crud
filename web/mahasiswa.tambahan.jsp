<%@page import="crud.Mahasiswa"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String nim = request.getParameter("nim");
    String nama = request.getParameter("nama");
    Integer nilai = null;

    // Validasi input nilai
    try {
        nilai = Integer.parseInt(request.getParameter("nilai"));
    } catch (NumberFormatException e) {
        out.println("<p>Nilai harus berupa angka.</p>");
        out.println("<a href='add.jsp'>Kembali</a>");
        return; // Menghentikan eksekusi lebih lanjut
    }

    Mahasiswa mahasiswa = new Mahasiswa();
    mahasiswa.nim = nim;
    mahasiswa.nama = nama;
    mahasiswa.nilai = nilai;

    // Menambahkan data mahasiswa
    if (mahasiswa.tambah()) {
        response.sendRedirect("list.jsp"); 
    } else {
        out.println("<p>Data gagal disimpan. Silakan coba lagi.</p>");
    }
%>
