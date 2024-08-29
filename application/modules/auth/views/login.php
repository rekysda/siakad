<!-- Login Baru -->
<div class="login-box">
  <div class="login-logo">
    <a href="<?= base_url(); ?>"></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start your session</p>

    <?= $this->session->flashdata('message'); ?>
    <!--
    <div style="border: 1px solid black; padding: 10px;margin: 10px;border-radius: 20px;" class="text-center"><span style="font-size: 100pt;" class="glyphicon glyphicon-education"></span></div>
-->
    <form class="user" method="post" action="<?= base_url('auth'); ?>">
      <div class="form-group has-feedback <?= form_error('username') ? 'has-error' : '' ?>">
        <input type="username" name="username" value="<?= set_value('username'); ?>" class="form-control" placeholder="Username">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
        <?= form_error('username', '<div class="text-danger">', '</div>') ?>
      </div>
      <div class="form-group has-feedback <?= form_error('password') ? 'has-error' : '' ?>">
        <input id='myInput' type="password" name="password" value="<?= set_value('password'); ?>" class="form-control" placeholder="Password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        <?= form_error('password', '<div class="text-danger">', '</div>') ?>
      </div>
      <div class="row">
        <div class="col-xs-8">
        <input type="checkbox" onclick="myFunction()"> Show Password </label><br>
          <?php if (options('forgot_password') == '1') {
            ?>
            <a href="<?= base_url('auth/forgotPassword'); ?>">Forgot Password Send Email</a><br> <a href="<?= base_url('auth/forgotPasswordTele'); ?>">Forgot Password Send Telegram</a>
          <?php
        }
        ?>
 <br>
            <?php if (options('signup_member') == '1') {
            ?>
            <a href="<?= base_url('auth/registration'); ?>" class="text-center">Create an Account!</a>
          <?php
        } 
        ?>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
<button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
<a class="btn btn-danger btn-block btn-flat" href="<?= base_url()?>">Kembali</a>
        </div>
        <!-- <hr><hr> -->
        <!-- <?= $login_button ?> -->
        <!-- /.col -->
      </div>
    </form>


  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->