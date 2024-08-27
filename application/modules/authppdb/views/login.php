<!-- Login Baru -->
<div class="login-box">
  <div class="login-logo">
    <a href="<?= base_url(); ?>"></a>
  </div>
  <!-- /.login-logo -->
  <?php if(get_m_options('is_ppdb_online')=='1'){?>
    <div class="login-box-body">
    <p class="login-box-msg">Please user your Voucher and Password</p>
    <?= $this->session->flashdata('message'); ?>
    <form class="user" method="post" action="<?= base_url('authppdb'); ?>">
      <div class="form-group has-feedback <?= form_error('noformulir') ? 'has-error' : '' ?>">
        <input type="noformulir" name="noformulir" value="<?= set_value('noformulir'); ?>" class="form-control" placeholder="noformulir">
        <span class="glyphicon glyphicon-barcode form-control-feedback"></span>
        <?= form_error('noformulir', '<div class="text-danger">', '</div>') ?>
      </div>
      <div class="form-group has-feedback <?= form_error('password') ? 'has-error' : '' ?>">
        <input id='myInput' type="password" name="password" value="<?= set_value('password'); ?>" class="form-control" placeholder="Password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        <?= form_error('password', '<div class="text-danger">', '</div>') ?>
      </div>
      <div class="row">
      <div class="col-xs-8">
      <input type="checkbox" onclick="myFunction()"> Show Password </label><br>
      Forgot Password?<br>
      Please contact our School
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
<button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
<a class="btn btn-danger btn-block btn-flat" href="<?= base_url()?>">Kembali</a>
        </div>
        <!-- /.col -->
      </div>
    </form>
  </div>
</div>
<?php }else{?>
  <div class="login-box-body">
  <center>
    <span class="glyphicon glyphicon-info-sign" style="font-size: 8vh;"></span>
    <h2>Saat ini PPDB Online dinonaktifkan</h2>
    </center>
    </div>
<?php }?>
  <!-- /.login-box-body -->
<!-- /.login-box -->