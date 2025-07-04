<!DOCTYPE html>
<html>
<head>
    <title>Tambah Data Mahasiswa</title>
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
    <h2>Tambah Data Mahasiswa</h2>
    <form action="mahasiswa.tambah.jsp" method="post">
        <label for="nim">NIM:</label>
        <input type="text" id="nim" name="nim" maxlength="20" required>

        <label for="nama">Nama:</label>
        <input type="text" id="nama" name="nama" maxlength="100" required>

        <label for="nilai">Nilai:</label>
        <input type="number" id="nilai" name="nilai" min="0" max="100" required>

        <input type="submit" value="Tambah">
    </form>
    <a href="list.jsp">Lihat Daftar Mahasiswa</a>
</body>
</html>