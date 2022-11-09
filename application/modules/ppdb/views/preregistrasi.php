<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      <?= $title; ?>
      <small>to manage <?= $title; ?></small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li>PPDB</li>
            <li><?= $title; ?></li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">

    <!-- Default box -->
    <div class="box">
      <div class="box-header with-border">
      <div class="col-md-6">
      </div>
</div>
      <br>
      <div class="box-body">
        <div style="display: none;">
<?= $this->session->flashdata('message') ?>
</div>
        <div align="right">
        <form method="POST" action="<?= base_url('ppdb/filterpreregistrasi') ?>" enctype="multipart/form-data" class="form-inline">
        <input class="form-control" type="text" id="tanggalawal" name="tanggalmulai" value="<?= set_value('tanggalmulai', $tanggalmulai); ?>"required>
        <input class="form-control" type="text" id="tanggalakhir" name="tanggalakhir" value="<?= set_value('tanggalakhir', $tanggalakhir); ?>"required>
        <button type="submit" class="btn btn-primary" name="lihat_preregistrasi">Lihat</button>
      </form>
      </div>
        <!-- Posts List -->
        <div class="table-responsive">
        <form method="POST" action="<?= base_url('ppdb/hapuspreregistrasi') ?>" enctype="multipart/form-data" class="form-inline">
          <table class='table table-hover' id='example3'>
            <thead>
              <tr>
                <th>#</th>
                <th>Tanggal</th>
                <th width="15%">Nama</th>
                <th>HP</th>
                <th>HP Ortu</th>
                <th>AsalSekolah</th>
                <th>BuktiBayar</th>
                <th width="15%">Email</th>
                <th>NoFormulir</th>
                <th>Password</th>
                <th width="100">VirtualAccount</th>
                <th width="100">AksiVoucher</th>
              </tr>
            </thead>
            <tbody>
              <?php $sno = 1; ?>
              <?php foreach ($preregistrasi as $dt) :
                $idpreregistrasi = $dt['id'];
                $tanggal = $dt['tanggal'];
                $nama = $dt['nama'];
                $hp = $dt['hp'];
                $hp_ortu = $dt['hp_ortu'];
                $asalsekolah = $dt['asalsekolah'];
                $email = $dt['email'];
                $noformulir = $dt['noformulir'];
                $password = $dt['password'];
                $buktibayar = $dt['buktibayar'];
                if ($dt['status_bayar']=='UNPAID') {
                  $status_bayar = '<label class="text-danger">UNPAID</label>';
                }else{
                  $status_bayar = '<label class="text-success">PAID</label>';
                }
                $cek_kirimva = $this->db->get_where('ppdb_kirimva', ['noformulir'=>$noformulir])->result_array();
                echo "<tr>";
                echo "<td><input name='check[]' type='checkbox' value='" . $idpreregistrasi . "'></td>";
                echo "<td>" . $tanggal . "</td>";
                echo "<td>" . $nama . "</td>";
                echo "<td>" . no_wa($hp) . "</td>";
                echo "<td>" . no_wa($hp_ortu) . "</td>";
                echo "<td>" . $asalsekolah . "</td>";
                // echo "<td> <a href='../assets/images/siswa/$buktibayar'target='new'>$buktibayar</a></td>";
                echo "<td>" . $status_bayar . "</td>";
                echo "<td>" . $email . "<br>Terkirim Formulir <b><u>".getjumlahterkirimemail($noformulir)."</u></b> Kali
                <br>Terkirim VA <b><u>".count($cek_kirimva)."</u></b> Kali</td>";
                echo "<td>" . $noformulir . "</td>";
                echo "<td>" . $password . "</td>";
                ?>
                <td width="100">
                <?php if($email && $noformulir) {?>
                <a href="<?= base_url('ppdb/kirimnotifemailva/' . $dt['id']); ?>" class="btn btn-primary btn-xs"onclick="return confirm('Anda yakin ? akan mengirimkan data VirtualAccount')">KirimVA</a>
                <a href="<?= base_url('ppdb/ubahstatusbayar/' . $dt['id']); ?>" class="btn btn-warning btn-xs" >Ubah status bayar</a>
                <?php }else{
                  echo "<label>Isi no formulir</label>";
                } ?>                   
                </td> 
                <td width="100">
                <?php if($email && $noformulir && $dt['status_bayar']=='PAID') {?>
                <a href="<?= base_url('ppdb/kirimnotifemail/' . $dt['id']); ?>" class="btn btn-success btn-xs" <?= $view_kirim_voucher ?> onclick="return confirm('Anda yakin ? akan mengirimkan data Voucher dan Password')">KirimVoucher</a> <?php } ?>
                <a href="<?= base_url('ppdb/editpreregistrasi/' . $dt['id']); ?>" class="btn btn-warning btn-xs">Ubah</a>             
                </td> 
                </tr>
                <?php $sno++; ?>
              <?php endforeach; ?>
            <tbody>
              <?php
              echo "<tr> 
    <td colspan='5' align='right'>";
              echo '<a href="#" onclick="chunchall(this);return false"class="btn btn-warning">Check all</a>&nbsp;with selected &nbsp; <input class="btn btn-primary" type="submit" onclick="return confirm(Anda yakin ? data tidak dapat dikembalikan lagi...)" name="btn" value="Delete">
              <a href="'.site_url('ppdb/export_ppdb_excel/').set_value('tanggalmulai', $tanggalmulai).'/'.set_value('tanggalakhir', $tanggalakhir).'" target="blank" class="btn btn-default"><img src="'. base_url("assets/images/").'xls.png"> Export ke Excel</a>
              </td></tr></form>';

              ?>
          </table>
        </form>
      </div>
        <a href="<?= base_url('preregistrasi')?>"target="new"class="btn btn-warning">Link Isi PPDB</a><br><br>
      </div>
      <!-- /.box-body -->
  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->