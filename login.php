<?php
session_start();
include 'condb.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = $_POST['password'];  // รหัสผ่านที่กรอกมา

    // เช็คว่า username มีอยู่ในฐานข้อมูลหรือไม่
    $sql = "SELECT * FROM users WHERE username = '$username'";
    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) > 0) {
        // ดึงข้อมูลผู้ใช้จากฐานข้อมูล
        $row = mysqli_fetch_assoc($result);
        // ตรวจสอบรหัสผ่านที่กรอกกับแฮชในฐานข้อมูล
        if (password_verify($password, $row['password'])) {
            // รหัสผ่านถูกต้อง
            $_SESSION['user_id'] = $row['id'];
            $_SESSION['username'] = $row['username'];
            $_SESSION['fullname'] = $row['fullname'];
            header('Location: show_product.php');  // เปลี่ยนเส้นทางไปหน้า show_product.php
            exit();
        } else {
            // รหัสผ่านไม่ถูกต้อง
            $error = "ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง!";
        }
    } else {
        // ชื่อผู้ใช้ไม่ถูกต้อง
        $error = "ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง!";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - CHAPTER HORROR</title>

    <!-- Bootstrap CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Font (Creepster for horror effect) -->
    <link href="https://fonts.googleapis.com/css2?family=Creepster&display=swap" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background: url('img/horror-bg.png') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Creepster', cursive;
            color: #fff;
            position: relative;
        }

        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5); /* เพิ่มความมืดให้พื้นหลัง */
            backdrop-filter: blur(5px); /* ทำให้เบลอ */
            z-index: 0;
        }

        .login-container {
            position: relative;
            z-index: 1;
            background: rgba(0, 0, 0, 0.8); /* เพิ่มพื้นหลังดำโปร่งใส */
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.6);
        }

        .login-container {
            width: 400px;
            padding: 40px;
            background-color: rgba(0, 0, 0, 0.8);
            border-radius: 15px;
            box-shadow: 0 8px 24px rgba(255, 0, 0, 0.5);
            text-align: center;
        }

        h2 {
            color: #ff0000;
            font-size: 32px;
            text-shadow: 3px 3px 5px black;
        }

        .form-label {
            font-size: 18px;
            color: #ff4444;
        }

        .form-control {
            border-radius: 10px;
            background-color: #222;
            color: #fff;
            border: 2px solid #ff0000;
        }

        .btn-dark {
            background-color: #ff0000;
            border: none;
            border-radius: 10px;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
            color: white;
            font-size: 18px;
            padding: 10px;
            text-transform: uppercase;
        }

        .btn-dark:hover {
            background-color: #8b0000;
            box-shadow: 0 0 20px red;
        }

        .alert-danger {
            text-align: center;
            background-color: rgba(139, 0, 0, 0.8);
            border: 1px solid red;
            color: white;
        }

        .login-footer {
            text-align: center;
            margin-top: 15px;
        }

        .login-footer a {
            color: #ff4444;
            text-decoration: none;
        }

        .login-footer a:hover {
            text-decoration: underline;
            color: #ff0000;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2>Welcome to the Nightmare</h2>

        <?php if (isset($error)): ?>
            <div class="alert alert-danger">👻 <?= $error ?> 👻</div>
        <?php endif; ?>

        <form method="POST" action="login.php">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-dark w-100">Login</button>
        </form>

        <div class="login-footer">
            <p class="mt-3">Don't have an account? <a href="register.php">Register</a></p>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
