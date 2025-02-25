<?php include 'condb.php'; ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chapter Horror - Product Details</title>

    <!-- Bootstrap CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background-color: #1a1a1a; /* พื้นหลังสีดำสลัว */
            color: #e5e5e5; /* ตัวหนังสือสีอ่อน */
            font-family: 'Creepster', cursive; /* ฟอนต์ที่มีลักษณะหลอนๆ */
        }

        /* เพิ่มการออกแบบแถบเมนู */
        .navbar {
            background-color: #8B0000; /* สีแดงเลือด */
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4); /* เงาให้ดูน่ากลัว */
        }

        .logo {
            width: 80px;
            height: auto;
            filter: drop-shadow(2px 2px 5px black); /* เพิ่มเงาให้โลโก้ */
        }

        .navbar-nav .nav-link {
            color: #fff !important; /* เมนูเป็นสีขาว */
            font-weight: bold;
            text-transform: uppercase;
            transition: 0.3s;
        }

        .navbar-nav .nav-link:hover {
            color: #ff0000 !important; /* เมื่อ hover เป็นสีแดง */
            text-shadow: 0 0 10px red;
        }

        .navbar-brand {
            font-size: 24px;
            font-weight: bold;
            color: #ff0000 !important;
            text-shadow: 3px 3px 5px black;
        }

        .navbar-nav .nav-link.active {
            background-color: #8B0000;
            color: white !important;
            padding: 8px 15px;
            border-radius: 5px;
            transition: 0.3s;
        }

        .navbar-nav .nav-link.active:hover {
            background-color: #ff0000;
            box-shadow: 0 0 10px red;
        }

        .form-control {
            background-color: black;
            color: white;
            border: 2px solid #8B0000;
        }

        .form-control::placeholder {
            color: #ccc;
        }

        .form-control:focus {
            border-color: red;
            box-shadow: 0 0 10px red;
        }

        .btn-outline-success {
            color: #fff;
            border-color: #8B0000;
            background-color: #8B0000;
        }

        .btn-outline-success:hover {
            background-color: #ff0000;
            box-shadow: 0 0 10px red;
        }

        /* สำหรับเนื้อหาด้านล่าง */
        .product-image {
            width: 100%;
            max-width: 300px; /* จำกัดความกว้างของภาพ */
            height: 450px; /* อัตราส่วน 2:3 */
            object-fit: cover; /* ป้องกันการบิดเบือนของภาพ */
            border-radius: 10px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.5); /* เพิ่มเงา */
        }


        .product-details {
            background-color: #2f2f2f;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.5);
            color: #fff;
        }

        h2 {
            font-size: 2.5rem;
            color: #ff0000;
            text-shadow: 2px 2px 5px black;
        }

        .price {
            font-size: 2rem;
            font-weight: 700;
            color: #ff6347;
        }

        .detail-info p {
            font-size: 1rem;
            line-height: 1.6;
            color: #ccc;
        }

        /* ขยับคอลัมน์ลงมาจากแถบเมนู */
        .product-container {
            margin-top: 80px;
        }
    </style>

    <!-- Google Font for Creepy Style -->
    <link href="https://fonts.googleapis.com/css2?family=Creepster&display=swap" rel="stylesheet">

    <!-- Bootstrap JS -->
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</head>

<body>
    <!-- แถบเมนู -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center" href="#">
                <img src="img/ghost-book.png" alt="Logo" class="logo me-2">
                CHAPTER HORROR
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="show_product.php">หน้าหลัก</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            ตะกร้าสินค้า
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="cart.php">ไปที่ตะกร้าสินค้า</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled">0633148205</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="login.php">สมัครสมาชิก/เข้าสู่ระบบ</a>
                    </li>
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>

    <!-- เนื้อหาสินค้า -->
    <div class="container product-container">
        <div class="row align-items-center">
            <?php
            $ids = $_GET['id'];
            $sql = "SELECT * FROM product, type WHERE product.type_id = type.type_id AND product.pro_id = '$ids'";
            $result = mysqli_query($conn, $sql);
            $row = mysqli_fetch_array($result);
            ?>
            <div class="col-md-6 text-center">
                <img src="img/<?=$row['image']?>" class="product-image" alt="<?=$row['pro_name']?>" />
            </div>
            <div class="col-md-6">
                <div class="product-details">
                    <h2><?=$row['pro_name']?></h2>
                    <p><strong>Product ID:</strong> <?=$row['pro_id']?></p>
                    <p><strong>Category:</strong> <?=$row['type_name']?></p>
                    <div class="detail-info">
                        <p><strong>Description:</strong> <?=$row['detail']?></p>
                    </div>
                    <p class="price">฿<?=number_format($row['price'], 2)?></p>
                    <a class="btn btn-outline-success mt-4 w-100" href="order.php?id=<?=$row['pro_id']?>">Add to Cart</a>
                </div>
            </div>
        </div>
    </div>

    <?php mysqli_close($conn); ?>
</body>

</html>
