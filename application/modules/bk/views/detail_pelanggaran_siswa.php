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
      <li class="active"><?= $title; ?></li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">

    <?= $this->session->flashdata('message') ?>

    <!-- Default box -->
    <div class="box">
      <div class="box-header with-border">
        <h3 class="box-title"><?= $title; ?></h3>
      </div>
      <div class="box-body">
        <div class="row">
          <div class="col-md-4">
           
                 <table class="table table-bordered table-striped">
                <tr><td>NIS</label> </td><td> <?= $datadetailsiswa['nis']?></td></tr>
                <tr><td>Nama Siswa</td><td> <?= $datadetailsiswa['namasiswa']?></td></tr>
                <tr><td>Alamat </td><td> <?= $datadetailsiswa['alamatsiswa']?></td></tr>
                <tr><td>Jenis Kelamin </td><td> <?= $datadetailsiswa['kelaminsiswa']?></td></tr>
                <tr><td>Nama Ayah </td><td> <?= $datadetailsiswa['namaayah']?></td></tr>
                <tr><td>HP Ayah </td><td> <?= $datadetailsiswa['hpayah']?></td></tr>
                <tr><td>Nama Ibu </td><td> <?= $datadetailsiswa['namaibu']?></td></tr>
                <tr><td>HP Ibu </td><td> <?= $datadetailsiswa['hpibu']?></td></tr>
                </table>
          </div>
          <div class="col-md-8">
            <div class="table-responsive">
              <table  class="table table-bordered table-striped" id="example1">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Tanggal</th>
                    <th>Nama</th>
                    <th>Kelas</th>
                    <th>Pelanggaran</th>
                    <th>Point</th>
                  </tr>
                </thead>
                <tbody>
                  <?php $i = 1; ?>
                  <?php foreach ($datapelanggaranbysiswa as $dt) : ?>
                    <tr>
                      <td><?= $i; ?></td>
                      <td><?= gettanggalindo($dt['tanggal']); ?></td>
                      <td><?= $dt['namasiswa']; ?></td>
                      <td><?= $dt['nama_kelas']; ?></td>
                      <td><?= $dt['pelanggaran']; ?></td>
                      <td><?= $dt['point']; ?></td>
                    </tr>
                    <?php $i++; ?>
                  <?php endforeach; ?>
                </tbody>
              </table>
            </div>
          </div>
          
        </div>

        <a href="<?php echo site_url('bk/detail_pelanggaran_siswa_pdf/'.$dt['siswa_id']) ?>" target='blank' class='btn btn-default'><img src="<?= base_url('assets/images/'); ?>pdf.png"> Export ke PDF</a>
<a href="<?php echo site_url('bk/detail_pelanggaran_siswa_print/'.$dt['siswa_id']) ?>" target='blank' class='btn btn-default'><img src="<?= base_url('assets/images/'); ?>print.jpg" width="15"> Cetak ke Printer</a>

      </div>
      <!-- /.box-body -->
    </div>
    <!-- /.box -->

  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->