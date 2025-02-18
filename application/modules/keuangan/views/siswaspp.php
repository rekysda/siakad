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
                <h3 class="box-title">All [Status Calon dan Aktif ]</h3>
                <div class="box-tools">
                    <a href="<?= base_url('keuangan/settingspp_global') ?>" class="btn btn-warning">Setting SPP Global</a>&nbsp;&nbsp;
                    <a href="<?= base_url('keuangan/siswasppdata') ?>" class="btn btn-primary">Lihat SPP Siswa</a>
                </div>
            </div>
            <div class="box-body">

                <!-- Posts List -->
                <table class='table table-hover' id="example1">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>NoFormulir</th>
                            <th>NIS</th>
                            <th>Nama</th>
                            <th>SPP</th>
                            <th>Status</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $sno = 1; ?>
                        <?php foreach ($siswaresult as $dt) :
                            $siswa_id = $dt['id'];
                            $noformulir = $dt['noformulir'];
                            $nis = $dt['nis'];
                            $namasiswa = $dt['namasiswa'];
                            $namatahun = $dt['tahun'];
                            $gelombang = $dt['gelombang'];
                            $jalur = $dt['jalur'];
                            $ppdb_status = $dt['ppdb_status'];
                            $nominalspp = getsettingsppsiswa($siswa_id);
                            echo "<tr>";
                            echo "<td>" . $sno . "</td>";
                            echo "<td>" . $noformulir . "</td>";
                            echo "<td>" . $nis . "</td>";
                            echo "<td>" . $namasiswa . "</td>"; ?>
                            <td><?= nominal($nominalspp); ?>
                            </td>
                            <?php
                            echo "<td>" . $ppdb_status . "</td>"; ?>
                            <td><a href="<?= base_url('keuangan/editspp/' . $siswa_id) ?>" class="btn btn-info btn-xs">Ubah</a></td>
                            </tr>
                            <?php
                            $sno++; ?>
                        <?php endforeach; ?>
                    <tbody>
                </table>

            </div>
            <!-- /.box-body -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->