<?php
session_start();
include 'condb.php';

$status_text = [
    "0" => "❌ ยกเลิกคำสั่งซื้อ",
    "1" => "⏳ รอดำเนินการ",
    "2" => "✅ ชำระเงินแล้ว"
];

$order = null;
$error = null;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $orderID = mysqli_real_escape_string($conn, $_POST['orderID']);
    
    // ดึงข้อมูลคำสั่งซื้อ
    $sql_order = "SELECT * FROM tb_order WHERE orderID = '$orderID'";
    $result_order = mysqli_query($conn, $sql_order);
    $order = mysqli_fetch_assoc($result_order);

    if (!$order) {
        $error = "❌ ไม่พบหมายเลขคำสั่งซื้อ!";
    } else {
        // ดึงข้อมูลรายการสินค้าที่อยู่ในคำสั่งซื้อ
        $sql_items = "SELECT od.orderQty, od.orderPrice, p.pro_name, t.type_name
                      FROM order_detail od
                      JOIN product p ON od.pro_id = p.pro_id
                      JOIN type t ON p.type_id = t.type_id
                      WHERE od.orderID = '$orderID'";

        $result_items = mysqli_query($conn, $sql_items);
    }
}
?>

<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <title>ติดตามสถานะสินค้า</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
        }
        .track-container {
            width: 450px;
            padding: 25px;
            background: rgba(0, 0, 0, 0.8);
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }
        h2 {
            text-align: center;
            color: #ff4444;
        }
        .form-control {
            border-radius: 5px;
        }
        .btn-danger {
            width: 100%;
            margin-top: 10px;
        }
        .status-box {
            background: rgba(255, 0, 0, 0.2);
            padding: 15px;
            margin-top: 10px;
            border-radius: 5px;
            text-align: center;
        }
        .order-details {
            background: rgba(255, 255, 255, 0.1);
            padding: 15px;
            border-radius: 5px;
            margin-top: 15px;
        }
        .order-details table {
            width: 100%;
            color: #fff;
        }
        .order-details th, .order-details td {
            padding: 8px;
            text-align: left;
        }
        .order-details th {
            background: rgba(255, 0, 0, 0.5);
        }
    </style>
</head>
<body>

<div class="track-container">
    <h2>🔎 ติดตามคำสั่งซื้อ</h2>
    <form method="POST" action="">
        <input type="text" class="form-control" id="orderID" name="orderID" placeholder="กรอกรหัสคำสั่งซื้อ" required>
        <button type="submit" class="btn btn-danger">ค้นหา</button>
    </form>

    <?php if (isset($error)): ?>
        <div class="status-box" style="color: #ff4444;"><?= $error ?></div>
    <?php elseif ($order): ?>
        <div class="order-details">
            <h4>📦 คำสั่งซื้อ: <?= $order['orderID'] ?></h4>
            <p>🛒 ชื่อ: <?= $order['cus_name'] ?><br>
               🏠 ที่อยู่: <?= $order['address'] ?><br>
               📞 เบอร์โทรศัพท์: <?= $order['telephone'] ?><br>
               🛍 สถานะการชำระเงิน: <strong><?= $status_text[$order['order_status']] ?? "❓ ไม่ทราบสถานะ" ?></strong></p>

            <p>🛒 สถานะคำสั่งซื้อ: <strong><?= $status_text[$order['order_status']] ?? "❓ ไม่ทราบสถานะ" ?></strong></p>

            <table>
                <tr>
                    <th>📖 รายการสินค้า</th>
                    <th>จำนวน</th>
                    <th>ราคา</th>
                    <th>ประเภทสินค้า</th>
                </tr>
                <?php
                $total_Orderprice = 0;
                while ($row = mysqli_fetch_assoc($result_items)):
                    $total_Orderprice += $row['orderPrice'] * $row['orderQty'];
                ?>
                    <tr>
                        <td><?= $row['pro_name'] ?></td>
                        <td><?= $row['orderQty'] ?></td>
                        <td><?= number_format($row['orderPrice'] * $row['orderQty'], 2) ?> ฿</td>
                        <td><?= $row['type_name'] ?></td>
                    </tr>
                <?php endwhile; ?>
            </table>
            <h4 style="text-align:right; color:#ff4444;">💰 ราคารวม: <?= number_format($total_Orderprice, 2) ?> ฿</h4>
        </div>
    <?php endif; ?>
</div>

</body>
</html>
