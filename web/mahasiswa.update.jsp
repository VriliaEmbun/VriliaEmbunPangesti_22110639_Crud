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
        out.println("<a href='update.jsp?nim=" + nim + "'>Kembali</a>");
        return; // Menghentikan eksekusi lebih lanjut
    }

    Mahasiswa mahasiswa = new Mahasiswa();
    mahasiswa.nim = nim;
    mahasiswa.nama = nama;
    mahasiswa.nilai = nilai;

    // Memperbarui data mahasiswa
    if (mahasiswa.update()) {
        response.sendRedirect("list.jsp"); // Redirect ke daftar mahasiswa jika berhasil
    } else {
        // Jika gagal, redirect kembali ke update.jsp dengan pesan kesalahan
        response.sendRedirect("update.jsp?nim=" + nim + "&error=Data gagal disimpan. Silakan coba lagi.");
    }
%>