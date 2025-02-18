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
      <li class="active"><?= $title ?></li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">

    <!-- Default box -->
    <div class="box">
      <div class="box-header with-border">
        <h3 class="box-title">All</h3>
        <div class="box-tools">
          <a href="<?= base_url('ppdb/formulir_add'); ?>" class="btn btn-primary btn-sm">
            Add New Data
          </a>&nbsp;
          <a href="<?= base_url('ppdb/formulir_export_csv'); ?>" class="btn btn-success btn-sm">
            Export CSV
          </a>
        </div>
      </div>
<div class="box-body">
<?= $this->session->flashdata('message') ?>
<h4>Tahun PPDB Default <?= $tahun_ppdb_default['value']?></h4>
        <!-- Posts List -->
        <form method="POST" action="<?= base_url('ppdb/hapusformulir') ?>" enctype="multipart/form-data" class="form-inline">
          <table class='table table-hover' id="example1">
            <thead>
              <tr>
                <th>No</th>
                <th>#</th>
                <th>Tahun</th>
                <th>NoFormulir</th>
                <th>Password</th>
                <th>Status</th>
                <th>Aksi</th>
              </tr>
            </thead>
            <tbody>
              <?php $sno = 1; ?>
              <?php foreach ($formulir as $dt) :
                $idformulir = $dt['id'];
                $tahun_ppdb = $dt['tahun_ppdb'];
                $noformulir = $dt['noformulir'];
                $password = $dt['password'];
                $status = $dt['status'];
                echo "<tr>";
                echo "<td>" . $sno . "</td>";
                echo "<td><input name='check[]' type='checkbox' value='" . $idformulir . "'></td>";
                echo "<td>" . $tahun_ppdb . "</td>";
                echo "<td>" . $noformulir . "</td>";
                echo "<td>" . $password . "</td>";
                echo "<td>" . $status . "</td>";
                echo "<td>&nbsp;"; ?>
                <a href="<?= base_url('ppdb/editformulir/' . $dt['id']); ?>" class="btn btn-info btn-xs">Edit</a>
                <?php echo "</td>"; ?>
                </tr>
                <?php $sno++; ?>
              <?php endforeach; ?>
            <tbody>
              <?php
              echo "<tr>
    <td colspan='5' align='right'>";
              echo '<a href="#" onclick="chunchall(this);return false"class="btn btn-warning">Check all</a>&nbsp;with selected &nbsp; <input class="btn btn-primary" type="submit" onclick="return confirm(Anda yakin ? data tidak dapat dikembalikan lagi...)" name="btn" value="Delete"></td></tr></form>';

              ?>
          </table>
        </form>
      </div>
      <!-- /.box-body -->
  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->