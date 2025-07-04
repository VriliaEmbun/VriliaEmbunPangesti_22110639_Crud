# 📌 Sistem CRUD Mahasiswa (JSP + Java + MySQL)

Sistem ini adalah aplikasi web sederhana untuk mengelola data mahasiswa menggunakan **JSP**, **Java**, dan **MySQL**.

## ✨ Fitur
- ✅ **Login / Register User**
- ✅ **Tambah Data Mahasiswa**
- ✅ **Lihat Daftar Mahasiswa**
- ✅ **Edit / Update Data Mahasiswa**
- ✅ **Hapus Data Mahasiswa**
- ✅ **Logout**

---

## 🚀 Struktur File
```

├── add.jsp                # Form tambah data mahasiswa
├── list.jsp               # Menampilkan daftar mahasiswa
├── update.jsp             # Form edit data mahasiswa
├── deleteMahasiswa.jsp    # Proses hapus data mahasiswa
├── mahasiswa.tambah.jsp   # Proses simpan data baru
├── mahasiswa.update.jsp   # Proses update data
├── login.jsp              # Halaman login
├── loginProcess.jsp       # Proses login
├── logout.jsp             # Logout user
├── register.jsp           # Halaman register
├── registerProcess.jsp    # Proses register
└── src/crud/Mahasiswa.java # Class Java untuk operasi database

````

---

## ⚙️ Database

### Tabel `users`
```sql
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL
);
````

### Tabel `mahasiswa`

```sql
CREATE TABLE mahasiswa (
  nim VARCHAR(20) PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  nilai INT NOT NULL
);
```

---

## 💻 Cara Menjalankan

1️⃣ Buat database `test` di MySQL:

```sql
CREATE DATABASE test;
USE test;
-- Jalankan create table di atas
```

2️⃣ Sesuaikan konfigurasi database di file:

* `crud/Mahasiswa.java`
* `loginProcess.jsp`
* `registerProcess.jsp`

```java
String DBCONNECTION = "jdbc:mysql://localhost:3306/test";
String DBUSER = "root";
String DBPASS = "";
```

3️⃣ Jalankan di server JSP (misal: Apache Tomcat).

---

## 📝 Catatan

⚠️ *Password saat ini belum di-hash, hanya untuk keperluan belajar. Untuk produksi gunakan enkripsi / hash (misal SHA-256 atau bcrypt).*

⚠️ *Sistem ini untuk pembelajaran. Disarankan menggunakan framework (Spring Boot, Hibernate) untuk aplikasi nyata.*

---

## 📌 Lisensi

Proyek ini dibuat untuk keperluan latihan pribadi dan edukasi.
