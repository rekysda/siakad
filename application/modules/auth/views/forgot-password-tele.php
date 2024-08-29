<div class="register-box">
  <div class="register-logo">
  <p style="color:white;"><b>Forgot</b> your Password ?</p>
  </div>

  <div class="register-box-body">
    <p class="login-box-msg">Enter email address</p>

    <?= $this->session->flashdata('message'); ?>
    <form class="user" method="post" action="<?= base_url('auth/forgotpasswordtele'); ?>">
      <div class="form-group has-feedback <?= form_error('email') ? 'has-error' : '' ?>">
        <input type="email" name="email" value="<?= set_value('email'); ?>" class="form-control" placeholder="Email">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
        <?= form_error('email', '<div class="text-danger">', '</div>') ?>
      </div>
      <button type="submit" class="btn btn-primary btn-block btn-flat">
        Reset Password
      </button>
    </form>

    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="<?= base_url('auth'); ?>">Back to Login</a>
    </div>

  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->