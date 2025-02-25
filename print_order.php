<?php 
session_start();
include 'condb.php';
$sql = "SELECT * FROM tb_order WHERE orderID = '" . $_SESSION["order_id"] . "'";
$result = mysqli_query($conn, $sql);
$rs = mysqli_fetch_array($result);
$total_price = $rs['total_price'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>รายการสั่งซื้อ</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #fdf7f1; /* Light warm theme */
            color: #4a4a4a;
            font-family: 'Poppins', sans-serif;
        }
        .container {
            margin-top: 50px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        .table th {
            background-color: #8a5a44;
            color: white;
        }
        .table td {
            text-align: left;
        }
        .btn {
            transition: 0.3s;
            border-radius: 8px;
            background-color: #a45c40;
            color: white;
            border: none;
        }
        .btn:hover {
            background-color: #7a3b28;
            color: #fff;
        }
        .order-summary {
            background-color: #f3e0d6;
            padding: 20px;
            border-radius: 10px;
        }
        .payment-methods {
            margin-top: 30px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        .payment-methods input {
            margin-right: 10px;
        }
        .payment-methods label {
            font-size: 1.2em;
        }
        .payment-methods .method-icon {
            font-size: 2em;
            margin-right: 10px;
        }
        .action-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-8 mx-auto">
            <div class="alert alert-success text-center" role="alert" style="background-color: #a45c40; color: white; border: none;">
                <h4>การสั่งซื้อเสร็จสมบูรณ์</h4>
            </div>
            <div class="order-summary mb-4">
                <h5>รายละเอียดคำสั่งซื้อ</h5>
                <p><strong>เลขที่การสั่งซื้อ:</strong> <?=$rs['orderID']?></p>
                <p><strong>ลูกค้า:</strong> <?=$rs['cus_name']?></p>
                <p><strong>ที่อยู่จัดส่ง:</strong> <?=$rs['address']?></p>
                <p><strong>เบอร์โทรศัพท์:</strong> <?=$rs['telephone']?></p>
            </div>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ชื่อสินค้า</th>
                        <th>จำนวน</th>
                        <th>ราคา/หน่วย</th>
                        <th>รวม</th>
                    </tr>
                </thead>
                <tbody>
                <?php
                $sql1 = "SELECT * FROM order_detail d, product p WHERE d.pro_id = p.pro_id AND d.orderID = '" . $_SESSION["order_id"] . "'";
                $result1 = mysqli_query($conn, $sql1);
                while ($row = mysqli_fetch_array($result1)) {
                ?>
                    <tr>
                        <td><?=$row['pro_name']?></td>
                        <td><?=$row['orderQty']?></td>
                        <td><?=number_format($row['orderPrice'], 2)?></td>
                        <td><?=number_format($row['Total'], 2)?></td>
                    </tr>
                <?php
                }
                ?>
                </tbody>
            </table>
            <h5 class="text-end">รวมเป็นเงิน: <strong><?=number_format($total_price, 2)?></strong> บาท</h5>
            
            <!-- Payment Methods Section -->
            <div class="payment-methods">
                <h5>วิธีการชำระเงิน</h5>
                <form action="payment_process.php" method="post">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="payment_method" value="credit_card" id="credit_card">
                        <label class="form-check-label" for="credit_card">
                            <i class="fas fa-credit-card method-icon"></i> บัตรเครดิต
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="payment_method" value="bank_transfer" id="bank_transfer">
                        <label class="form-check-label" for="bank_transfer">
                            <i class="fas fa-university method-icon"></i> โอนเงินผ่านธนาคาร
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="payment_method" value="cash_on_delivery" id="cash_on_delivery">
                        <label class="form-check-label" for="cash_on_delivery">
                            <i class="fas fa-money-bill-wave method-icon"></i> ชำระเงินปลายทาง
                        </label>
                    </div>
                    <button type="submit" class="btn mt-3">ชำระเงิน</button>
                </form>
            </div>

            <!-- Action Buttons Section -->
            <div class="action-buttons">
                <a href="show_product.php" class="btn">กลับไปที่สินค้า</a>
                <!-- This form will now redirect to show_product.php upon confirmation -->
                <form action="show_product.php" method="get">
                    <button type="submit" class="btn">ยืนยันการสั่งซื้อ</button>
                </form>
                <button onclick="window.print()" class="btn">พิมพ์</button>
            </div>
        </div>
    </div>
</div> 
</body>
</html>
