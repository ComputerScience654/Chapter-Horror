<?php include 'condb.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chapter Horror</title>

    <!-- Bootstrap CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background: url('img/scary.jpg') no-repeat center center fixed; 
            background-size: cover; /* ปรับขนาดภาพให้เต็มจอ */
            color: #fff; /* เปลี่ยนสีตัวอักษรให้ชัดขึ้น */
            font-family: Arial, sans-serif;
        }
        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6); /* เลเยอร์สีดำโปร่งแสง 60% */
            z-index: -1;
        }
        .card {
            display: flex;
            flex-direction: row; /* ทำให้เนื้อหาในการ์ดเรียงแนวนอน */
            align-items: center;
            width: 100%; /* กว้างเต็มพื้นที่ */
            height: 200px; /* ปรับความสูงให้เป็นสี่เหลี่ยมผืนผ้า */
            background-color: #222; /* สีพื้นหลังดำ */
            color: #fff; /* เปลี่ยนตัวอักษรเป็นสีขาว */
            border-radius: 10px; /* เพิ่มขอบมนเล็กน้อย */
            padding: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }
        .btn-brand {
            margin: 5px;
        }
        .card-img-top {
            width: 120px; /* ปรับความกว้างของรูปให้เหมาะกับหนังสือ */
            height: 180px; /* ปรับความสูงให้อยู่ในอัตราส่วนของหนังสือ */
            object-fit: cover; /* ให้รูปภาพเต็มพื้นที่โดยไม่ผิดสัดส่วน */
            border-radius: 10px; /* ขอบมน */
            margin-right: 15px; /* เว้นระยะห่างระหว่างรูปกับข้อความ */
        }
        .container {
            margin-top: 20px;
        }
        .logo {
            height: 100px; /* Adjust logo height */
            margin-right: 5px; /* Space between logo and text */
            vertical-align: middle; /* Align logo vertically with text */
        }
        .card-body {
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

    </style>

    <!-- Bootstrap JS -->
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- JavaScript for Filtering -->
    <script>
        function filterBrand(brand) {
            const cards = document.querySelectorAll('.product-card');
            cards.forEach(card => {
                if (brand === 'all' || card.dataset.brand === brand) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        }
    </script>
</head>
<body>

    <?php include 'menu.php'; ?>

    <!-- Header Section -->
    <div class="container text-center mt-5">
        <h1>
            <img src="img/ghost-book.png" alt="Logo" class="logo"> Add your logo here
            Book List
        </h1>
    </div>

    <!-- Brand Buttons -->
    <div class="container text-center mt-3">
        <button class="btn btn-outline-success btn-brand" onclick="filterBrand('all')">All</button>
        <!-- <button class="btn btn-outline-success btn-brand" onclick="filterBrand('iphone')">Iphone</button>
        <button class="btn btn-outline-success btn-brand" onclick="filterBrand('samsung')">Samsung</button>
        <button class="btn btn-outline-success btn-brand" onclick="filterBrand('realme')">Realme</button>
        <button class="btn btn-outline-success btn-brand" onclick="filterBrand('oppo')">Oppo</button>
        <button class="btn btn-outline-success btn-brand" onclick="filterBrand('vivo')">Vivo</button>
        <button class="btn btn-outline-success btn-brand" onclick="filterBrand('xiaomi')">Xiaomi</button> -->
    </div>

    <!-- Product Section -->
    <div class="container mt-5">
    <div class="row row-cols-1 g-4">

        <?php
        $sql = "SELECT * FROM product ORDER BY pro_id";
        $result = mysqli_query($conn, $sql);
        while ($row = mysqli_fetch_array($result)) {
        ?>

        <div class="col">
            <div class="card">
                <img src="img/<?= $row['image'] ?>" class="card-img-top" alt="<?= $row['pro_name'] ?>">
                <div class="card-body">
                    <h5 class="card-title"><?= $row['pro_name'] ?></h5>
                    <p class="card-text price text-danger">฿<?= number_format($row['price'], 2) ?></p>
                    <a href="sh_product_detail.php?id=<?= $row['pro_id'] ?>" class="btn btn-danger">รายละเอียดเพิ่มเติม</a>
                </div>
            </div>
        </div>

        <?php
        }
        mysqli_close($conn);
        ?>

    </div>
</div>

</body>
</html>
