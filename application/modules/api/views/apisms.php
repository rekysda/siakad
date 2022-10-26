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

        <form class="form-horizontal" method="post" action="">
          <div class="box-body">
            <div class="form-group">
              <label class="col-sm-2 control-label">User API SMS</label>
              <div class="col-sm-10">
                <input type="password" name="apisms[user_api_sms]" value="<?= apisms('user_api_sms') == '' ? set_value('user_api_sms') : apisms('user_api_sms'); ?>" class="form-control" placeholder="User API SMS">
                <?= form_error('user_api_sms', '<span class="help-block">', '</span>') ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label">User Key SMS</label>
              <div class="col-sm-10">
                <input type="password" name="apisms[user_key_sms]" value="<?= apisms('user_key_sms') == '' ? set_value('user_key_sms') : apisms('user_key_sms'); ?>" class="form-control" placeholder="User KEY SMS">
                <?= form_error('user_key_sms', '<span class="help-block">', '</span>') ?>
              </div>
            </div>
          <div class="form-group">
              <label class="col-sm-2 control-label">Kirim SMS Pembayaran</label>
              <div class="col-sm-10">
                <select name="apisms[sent_notif_paid]" class="form-control <?= form_error('sent_notif_paid') ? 'is-invalid' : '' ?>">
                  <option value="1" <?= apisms('sent_notif_paid') == 1 ? 'selected' : null ?>>Aktif</option>
                  <option value="0" <?= apisms('sent_notif_paid') == 0 ? 'selected' : null ?>>Tidak Aktif</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label">No HP Kepsek</label>
              <div class="col-sm-10">
                <input type="text" name="apisms[hp_kepsek]" value="<?= apisms('hp_kepsek') == '' ? set_value('hp_kepsek') : apisms('hp_kepsek'); ?>" class="form-control" placeholder="HP Kepsek">
                <?= form_error('hp_kepsek', '<span class="help-block">', '</span>') ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label">Notif Buku Tamu ke Kepsek</label>
              <div class="col-sm-10">
                <select name="apisms[send_notif_bukutamu]" class="form-control <?= form_error('send_notif_bukutamu') ? 'is-invalid' : '' ?>">
                  <option value="1" <?= apisms('send_notif_bukutamu') == 1 ? 'selected' : null ?>>Aktif</option>
                  <option value="0" <?= apisms('send_notif_bukutamu') == 0 ? 'selected' : null ?>>Tidak Aktif</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label">Notif Pelanggaran ke Orangtua</label>
              <div class="col-sm-10">
                <select name="apisms[send_notif_pelanggaran]" class="form-control <?= form_error('send_notif_pelanggaran') ? 'is-invalid' : '' ?>">
                  <option value="1" <?= apisms('send_notif_pelanggaran') == 1 ? 'selected' : null ?>>Aktif</option>
                  <option value="0" <?= apisms('send_notif_pelanggaran') == 0 ? 'selected' : null ?>>Tidak Aktif</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label">Sisa Kredit</label>
              <div class="col-sm-10">
                <input type="text" name="cekkredit" value="<?= $cekkredit ?>" class="form-control"readonly>
              </div>
            </div>
          <!-- /.box-body -->
          <div class="form-group">
              <label class="col-sm-2 control-label"></label>
              <div class="col-sm-10">
            <input type="submit" name="submit" value="Save Changes" class="btn btn-primary">              
              </div>
            </div>
        </form>

      </div>
      <!-- /.box-body -->
    </div>
    <!-- /.box -->

  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->