<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container d-flex flex-column align-items-center">
    
    <!-- โลโก้ตรงกลาง -->
    <a class="navbar-brand text-center" href="#">
      <img src="img/ghost-book.png" alt="Logo" class="logo">
      <div>CHAPTER HORROR</div>
    </a>

    <!-- ปุ่มสำหรับเปิด-ปิด Navbar บนมือถือ -->
    <button class="navbar-toggler mt-2" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- ส่วนเมนู -->
    <div class="collapse navbar-collapse justify-content-center" id="navbarContent">
      <ul class="navbar-nav text-center">
        <li class="nav-item px-3">
          <a class="nav-link" href="show_product.php">หน้าหลัก</a>
        </li>
        <li class="nav-item px-3">
          <a class="nav-link" href="track_order.php">ติดตามคำสั่งซื้อ</a> <!-- เพิ่มเมนูนี้ -->
        </li>
        <li class="nav-item dropdown px-3">
          <a class="nav-link dropdown-toggle" href="#" id="cartDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            ตะกร้าสินค้า
          </a>
          <ul class="dropdown-menu text-center shadow-lg">
            <li><a class="dropdown-item" href="cart.php">ไปที่ตะกร้าสินค้า</a></li>
          </ul>
        </li>
        <li class="nav-item px-3">
          <a class="nav-link disabled">0633148205</a>
        </li>
      </ul>

      <!-- ปุ่มสมัครสมาชิก/เข้าสู่ระบบ แยกออกมาด้านขวา -->
      <div class="text-center mt-2 mt-lg-0">
        <a href="login.php" class="btn btn-danger px-4 py-2">สมัครสมาชิก / เข้าสู่ระบบ</a>
      </div>
    </div>

    <!-- ช่องค้นหา แยกออกมาด้านล่างของ Navbar -->
    <div class="w-100 mt-3">
      <form class="d-flex justify-content-center">
        <input class="form-control w-50 me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>

<!-- Custom CSS -->
<style>
  .logo {
    width: 80px;
    height: auto;
    filter: drop-shadow(2px 2px 5px black);
  }
  .navbar-nav .nav-link {
    font-weight: bold;
    text-transform: uppercase;
    transition: 0.3s;
    padding: 12px 20px; /* เพิ่มพื้นที่ให้ใหญ่ขึ้น */
  }
  .navbar-nav .nav-link:hover {
    color: #ff0000 !important;
    text-shadow: 0 0 10px red;
  }
/* ทำให้ Dropdown ดูโดดเด่นขึ้น */
  .dropdown-menu {
    background-color: #222;
    border-radius: 8px;
    border: 1px solid #ff0000;
  }
  .dropdown-menu .dropdown-item {
    color: white;
    padding: 12px;
    transition: background 0.3s ease-in-out;
  }
  .dropdown-menu .dropdown-item:hover {
    background-color: #8B0000;
    color: white;
  }
/* ปรับขนาดปุ่มสมัครสมาชิกให้เด่น */
  .btn-danger {
    font-weight: bold;
    font-size: 16px;
    border-radius: 6px;
  }
  .btn-danger:hover {
    background-color: #ff0000;
    box-shadow: 0 0 10px red;
  }
/* ช่องค้นหาที่อยู่ด้านล่าง */
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
    border-color: #8B0000;
    background-color: #8B0000;
  }
  .btn-outline-success:hover {
    background-color: #ff0000;
    box-shadow: 0 0 10px red;
  }
  .navbar {
    position: relative;
    /* background: url('img/background-menu4.jpg') no-repeat center center; */
    background-size: cover;
  }
/* เพิ่ม Overlay มืด */
  .navbar::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5); /* สีดำโปร่งใส (0.7 = ความมืด 70%) */
    z-index: -1;
    
  }

</style>
