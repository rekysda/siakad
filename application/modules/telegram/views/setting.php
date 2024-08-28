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
      <div class="form-group <?php echo form_error('tahun') ? 'has-error' : '' ?>">
                <label for="name">Token</label>
                <input class="form-control" type="text" name="token" value="<?= $apitoken?>"readonly />
                <?= form_error('tahun', '<span class="help-block">', '</small>'); ?>
              </div>
      <div class="form-group <?php echo form_error('tahun') ? 'has-error' : '' ?>">
        <label for="name">Phone</label>
        <input class="form-control" type="text" name="token" value="+628885465802"readonly />
        <?= form_error('tahun', '<span class="help-block">', '</small>'); ?>
      </div>

      </div>
      <!-- /.box-body -->
    </div>
    <!-- /.box -->
  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->