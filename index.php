<?php

if (!isset($_SESSION)) {
  session_start();
}

include_once("koneksi.php");
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Klinik BK</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
  </head>
  <body class="bg-primary container-fluid">
    <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">Toggle right offcanvas</button>
    
    <nav class="container-fluid offcanvas fixed-top offcanvas-expand-lg py-3 offcanvas-dark bg-danger">
        <div class="container-fluid d-flex align-items-center bg-light text-light">
            <a class="offcanvas-brand" href="#">Klinik BK</a>
            <button class="offcanvas-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#offcanvasTogglerDemo02" aria-controls="offcanvasTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="offcanvas-toggler-icon"></span>
            </button>
            <div class="container-fluid collapse offcanvas-collapse" id="offcanvasTogglerDemo02">
                
                <?php
                if (isset($_SESSION['username'])) {
                    
                ?>
                    <ul class="container-fluid offcanvas-nav d-flex align-items-lg-center ms-auto">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="index.php">Home</a>
                        </li>
                        <!-- <li class="nav-item">
                            <a class="nav-link" href="index.php?page=dokter">Dokter</a>
                        </li> -->
                        <li class="nav-item dropdown">
                            <button class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                Dokter
                            </button>
                            <ul class="dropdown-menu dropdown-menu-light">
                                <li><a class="dropdown-item" href="index.php?page=dokter">Data Dokter</a></li>
                                
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="index.php?page=poli">Poli</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="index.php?page=obat">Obat</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="index.php?page=pasien">Pasien</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="index.php?page=jadwalperiksa">Jadwal Periksa</a>
                        </li>
                    </ul>
                    <ul class="offcanvas-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="Logout.php">Logout (<?php echo $_SESSION['fullname'] ?>)</a>
                        </li>
                    </ul>
                <?php
                } else {
                    
                ?>
                    <ul class="container-fluid offcanvas-nav d-flex align-items-lg-center ms-auto">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="index.php">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="index.php?page=cekRM">Pendaftaran Jadwal Periksa</a>
                        </li>
                        <!-- <li class="nav-item">
                            <a class="nav-link" href="index.php?page=poli">Cek RM</a>
                        </li> -->
                    </ul>
                    <ul class="offcanvas-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.php?page=loginUser">Login</a>
                        </li>
                    </ul>
                <?php
                }
                ?>
            </div>
        </div>
    </nav>
    

    <main role="main" class="container-fluid text-light" style="margin-top: 5rem;">
    <?php
    if (isset($_GET['page'])) {
        include($_GET['page'] . ".php");
    } else {
        echo "<br><h2>Selamat Datang!!!";

        if (isset($_SESSION['username'])) {
            
            echo ", " . $_SESSION['fullname'] . "</h2><hr>";
        } else {
            echo "</h2><hr>Silakan Login untuk menggunakan sistem. Jika belum memiliki akun silakan Register terlebih dahulu.";
        }
    }
    ?>
    </main>
    <div>
        <img src="./images/hos.png" class="img-fluid rounded mx-auto d-block" alt="opening-pic">
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/71c2ab2c83.js" crossorigin="anonymous"></script>
  </body>
</html>