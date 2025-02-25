<?php
session_start();
include 'condb.php';
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <!-- Bootstrap CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS for additional styling -->
    <style>
        body {
            background-color: #1a1a1a; /* พื้นหลังสีดำ */
            font-family: 'Creepster', cursive; /* ฟอนต์ที่ดูหลอนๆ */
            color: #e5e5e5; /* สีตัวหนังสืออ่อน */
        }

        .container {
            margin-top: 50px;
            background-color: #2f2f2f; /* พื้นหลังเทาเข้ม */
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.6); /* เงาที่มืดขึ้น */
            display: flex;
            flex-direction: row; /* จัดให้อยู่ในแนวนอน */
            gap: 20px;
        }

        .cart-table, .order-form {
            width: 50%; /* ให้ทั้งสองฟอร์มมีความกว้างเท่ากัน */
        }

        .cart-table {
            background-color: #3c3c3c; /* พื้นหลังของตาราง */
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
        }

        .order-form {
            background-color: #3c3c3c; /* พื้นหลังของฟอร์ม */
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
        }

        .table th, .table td {
            vertical-align: middle;
            color: #fff;
        }

        .alert {
            margin-bottom: 30px;
            border-radius: 10px;
            background-color: #8B0000; /* สีแดงเข้มสำหรับการแจ้งเตือน */
            color: white;
        }

        .btn {
            transition: background-color 0.3s, color 0.3s;
            border-radius: 30px;
            border: 2px solid #ff6347;
            color: #ff6347;
        }

        .btn:hover {
            background-color: #ff6347;
            color: white;
            box-shadow: 0 0 10px red;
        }

        .product-image {
            max-width: 80px;
            height: auto;
            border-radius: 5px;
            border: 2px solid #333;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.4);
        }

        .subtotal {
            font-size: 1.5rem;
            font-weight: bold;
            color: #ff6347;
        }

        .form-control {
            border-radius: 30px;
            background-color: #333;
            color: white;
            border: 2px solid #ff6347;
        }

        .form-control:focus {
            box-shadow: 0 0 5px rgba(255, 99, 71, .5);
            border-color: #ff6347;
        }

        .form-control::placeholder {
            color: #ccc;
        }

        .table th {
            background-color: #8B0000;
        }

        .btn-outline-primary {
            border-radius: 50px;
            border-color: #ff6347;
        }

        .btn-outline-primary:hover {
            background-color: #ff6347;
            color: white;
            box-shadow: 0 0 10px red;
        }

        .alert-success {
            background-color: #ff6347;
            border-radius: 15px;
            color: white;
            font-weight: bold;
            text-shadow: 2px 2px 5px black;
        }
    </style>
    <!-- Bootstrap JS Bundle -->
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</head>

<body>
    <?php include 'menu.php'; ?>
    <div class="container">
        <div class="cart-table">
            <form id="form1" method="POST" action="insert_cart.php">
                <div class="alert alert-success h4 text-center" role="alert">
                    การสั่งซื้อสินค้า
                </div>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>ลำดับที่</th>
                            <th>ชื่อสินค้า</th>
                            <th>ราคา</th>
                            <th>จำนวน</th>
                            <th>ราคารวม</th>
                            <th>เพิ่ม - ลด</th>
                            <th>ลบ</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $Total = 0;
                        $sumPrice = 0;
                        $m = 1;
                        for ($i = 0; $i <= (int)$_SESSION["intLine"]; $i++) {
                            if ($_SESSION["strProductID"][$i] != "") {
                                $sql1 = "SELECT * FROM product WHERE pro_id = '" . $_SESSION["strProductID"][$i] . "'";
                                $result1 = mysqli_query($conn, $sql1);
                                $row_pro = mysqli_fetch_array($result1);
                                
                                $_SESSION["price"] = $row_pro['price'];
                                $Total = $_SESSION["strQty"][$i];
                                $sum = $Total * $row_pro['price'];
                                $sumPrice += $sum;
                                $_SESSION["sum_price"] = $sumPrice;
                        ?>
                        <tr>
                            <td><?=$m?></td>
                            <td>
                                <img src="img/<?=$row_pro['image']?>" class="product-image border" alt="<?=$row_pro['pro_name']?>">
                                <?=$row_pro['pro_name']?>
                            </td>
                            <td><?=number_format($row_pro['price'], 2)?></td>
                            <td><?=$_SESSION["strQty"][$i]?></td>
                            <td><?=number_format($sum, 2)?></td>
                            <td>
                                <a href="order.php?id=<?=$row_pro['pro_id']?>" class="btn btn-outline-primary">+</a>
                                <?php if ($_SESSION["strQty"][$i] > 1) { ?>
                                <a href="order_del.php?id=<?=$row_pro['pro_id']?>" class="btn btn-outline-primary">-</a>
                                <?php } ?>
                            </td>
                            <td>
                                <a href="pro_delete.php?Line=<?=$i?>" class="text-danger" title="Remove">
                                    <img src="img/cross.png" width="30" alt="Delete">
                                </a>
                            </td>
                        </tr>
                        <?php
                            $m++;
                            }
                        }
                        ?>
                        <tr>
                            <td colspan="4" class="text-end">รวมเป็นเงิน</td>
                            <td class="text-center subtotal"><?=number_format($sumPrice, 2)?></td>
                            <td>บาท</td>
                        </tr>
                    </tbody>
                </table>
                <div class="text-end">
                    <a href="show_product.php" class="btn btn-outline-secondary">เลือกสินค้า</a>
                    <button type="submit" class="btn btn-outline-primary">ยืนยันการสั่งซื้อ</button>
                </div>
            </form>
        </div>
        
        <div class="order-form">
    <div class="alert alert-success mt-4" role="alert">
        ข้อมูลสำหรับจัดส่งสินค้า
    </div>
    <div class="row">
        <div class="col-md-12">
            <input type="text" name="cus_name" class="form-control mb-3" required placeholder="ชื่อ-นามสกุล..." style="width: 100%; font-size: 1.2rem; padding: 10px;">
            <textarea class="form-control mb-3" required placeholder="ที่อยู่..." name="cus_add" rows="4" style="width: 100%; font-size: 1.2rem; padding: 10px;"></textarea>
            <input type="number" name="cus_tel" class="form-control mb-3" required placeholder="เบอร์โทรศัพท์..." style="width: 100%; font-size: 1.2rem; padding: 10px;">
        </div>
    </div>
</div>

    </div>
</body>

</html>
