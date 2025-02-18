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

    <!-- Default box -->
    <div class="box">
      <div class="box-header with-border">
        <h3 class="box-title"><?= $title; ?></h3>
      </div>
      <div class="box-body">

        <?= $this->session->flashdata('message') ?>

        <form action="" method="post">
              <div class="form-group <?php echo form_error('kode') ? 'has-error' : '' ?>">
                <label for="name">Kode</label>
                <input class="form-control" type="text" name="kode" value="<?= $getsupplier['kode']; ?>" />
                <?= form_error('kode', '<span class="help-block">', '</small>'); ?>
              </div>
              <div class="form-group <?php echo form_error('nama') ? 'has-error' : '' ?>">
                <label for="tahun">Nama</label>
                <input class="form-control" type="text" name="nama" value="<?= $getsupplier['nama']; ?>" />
                <?= form_error('nama', '<span class="help-block">', '</small>'); ?>
              </div>
              <div class="form-group <?php echo form_error('alamat') ? 'has-error' : '' ?>">
                <label for="tahun">Alamat</label>
                <input class="form-control" type="text" name="alamat" value="<?= $getsupplier['alamat']; ?>" />
                <?= form_error('alamat', '<span class="help-block">', '</small>'); ?>
              </div>
              <div class="form-group <?php echo form_error('telepon') ? 'has-error' : '' ?>">
                <label for="tahun">Telepon</label>
                <input class="form-control" type="number" name="telepon" value="<?= $getsupplier['telepon']; ?>" />
                <?= form_error('telepon', '<span class="help-block">', '</small>'); ?>
              </div>

              <button type="submit" class="btn btn-primary">Simpan</button>
              <a href="<?= base_url('sarpras/supplier'); ?> " class="btn btn-default">Cancel</a>
            </form>
      </div>
      <!-- /.box-body -->
    </div>
    <!-- /.box -->

  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->