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
      <form action="" method="post">
      <div class="form-group <?php echo form_error('token') ? 'has-error' : '' ?>">
      <label for="name">Token</label>
      <input class="form-control" type="text" name="token" value="<?= $telegram_api_token?>"/>
      <?= form_error('token', '<span class="help-block">', '</small>'); ?>
    </div>
      <div class="form-group <?php echo form_error('telegram_master') ? 'has-error' : '' ?>">
        <label for="name">Phone</label>
        <input class="form-control" type="text" name="telegram_master" value="<?=$telegram_master?>"/>
        <?= form_error('telegram_master', '<span class="help-block">', '</small>'); ?>
      </div>

      <button type="submit" class="btn btn-primary">Save changes</button>
</form>
      </div>
      <!-- /.box-body -->
    </div>
    <!-- /.box -->
  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->