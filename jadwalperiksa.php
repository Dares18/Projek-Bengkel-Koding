<main id="jadwalperiksa-page">
    <div class="container" style="margin-top: 5.5rem;">
        <div class="row">
            <h2 class="ps-0">Jadwal Periksa</h2>
            <!-- <div class="d-flex justify-content-end pe-0">
                <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#tambahDokter">
                    <i class="fa-regular fa-plus"></i> Tambah
                </button>
            </div> -->
            <div class="container">
                <form action="" method="POST" onsubmit="return(validate());">
                    <?php
                    $id_dokter = '';
                    $hari = '';
                    $jam_mulai = '';
                    $jam_selesai = '';
                    if (isset($_GET['id'])) {
                        $get = mysqli_query($mysqli, "SELECT * FROM jadwal_periksa 
                                WHERE id='" . $_GET['id'] . "'");
                        while ($row = mysqli_fetch_array($get)) {
                            $id_dokter = $row['id_dokter'];
                            $hari = $row['hari'];
                            $jam_mulai = $row['jam_mulai'];
                            $jam_selesai = $row['jam_selesai'];
                        }
                    ?>
                        <input type="hidden" name="id" value="<?php echo $_GET['id'] ?>">
                    <?php
                    }
                    ?>
                    <div class="dropdown mb-3 w-25">
                        <label for="id_dokter">Dokter <span class="text-danger">*</span></label>
                        <select class="form-select" name="id_dokter" aria-label="id_dokter">
                            <option value="" selected>Pilih Dokter...</option>
                            <?php
                                $result = mysqli_query($mysqli, "SELECT * FROM dokter");
                                
                                while ($data = mysqli_fetch_assoc($result)) {
                                    echo "<option value='" . $data['id'] . "'>" . $data['nama'] . "</option>";
                                }
                            ?>
                            
                        </select>
                    </div>
                    <div class="dropdown mb-3 w-25">
                        <label for="hari">Hari <span class="text-danger">*</span></label>
                        <select class="form-select" name="hari" aria-label="hari">
                            <option value="" selected>Pilih Hari...</option>
                            <option value="Senin">Senin</option>
                            <option value="Selasa">Selasa</option>
                            <option value="Rabu">Rabu</option>
                            <option value="Kamis">Kamis</option>
                            <option value="Jum'at">Jum'at</option>
                            <option value="Sabtu">Sabtu</option>
                        </select>
                    </div>
                    <div class="mb-3 w-25">
                        <label for="jam_mulai">Jam Mulai <span class="text-danger">*</span></label>
                        <input type="time" name="jam_mulai" class="form-control" required value="<?php echo $jam_mulai ?>">
                    </div>
                    <div class="mb-3 w-25">
                        <label for="jam_selesai">Jam Selesai <span class="text-danger">*</span></label>
                        <input type="time" name="jam_selesai" class="form-control" required value="<?php echo $jam_selesai ?>">
                    </div>
                    <div class="d-flex justify-content-end mt-2">
                        <button type="submit" name="simpanData" class="btn btn-primary">Simpan</button>
                    </div>
    
                </form>
            </div>

            <div class="table-responsive mt-3 px-0">
                <table class="table text-center bg-dark text-light">
                    <thead class="table-primary bg-dark">
                        <tr>
                            <th valign="middle">No</th>
                            <th valign="middle">Nama Dokter</th>
                            <th valign="middle">Hari</th>
                            <th valign="middle" style="width: 25%;" colspan="2">Waktu</th>
                            <!-- <th valign="middle">Jam Selesai</th> -->
                            <th valign="middle" style="width: 0.5%;" colspan="2">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                            $result = mysqli_query($mysqli, "SELECT dokter.nama, jadwal_periksa.id, jadwal_periksa.hari, jadwal_periksa.jam_mulai, jadwal_periksa.jam_selesai FROM dokter JOIN jadwal_periksa ON dokter.id = jadwal_periksa.id_dokter");
                            $no = 1;
                            while ($data = mysqli_fetch_array($result)) :
                            ?>
                                <tr>
                                    <td><?php echo $no++ ?></td>
                                    <td><?php echo $data['nama'] ?></td>
                                    <td><?php echo $data['hari'] ?></td>
                                    <td><?php echo $data['jam_mulai'] ?> WIB</td>
                                    <td><?php echo $data['jam_selesai'] ?> WIB</td>
                                    <td>
                                        <a class="btn btn-sm btn-warning text-white" href="index.php?page=jadwalDokter&id=<?php echo $data['id'] ?>">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <a href="index.php?page=jadwalDokter&id=<?php echo $data['id'] ?>&aksi=hapus" class="btn btn-sm btn-danger text-white">
                                            <i class="fa-solid fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>

                        <?php endwhile; ?>
                    </tbody>
                </table>
                        

            </div>
        </div>
    </div>