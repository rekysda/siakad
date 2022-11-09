<div class="register-box">
  <div class="register-logo">
  <img src="<?= base_url('assets/images/logo.png');?>"width="100px"><br>
  <p style="color:white;"><b><?= $title ?></b></p>
  </div> 
<div style="display: none;">
</div>
<div class="register-box-body">
    <?= $this->session->flashdata('message') ?>
    <?php
    if($pendaftaran == 1){?>
    <form class="user" method="post" action=""enctype ="multipart/form-data">
      <div class="form-group has-feedback <?= form_error('nama') ? 'has-error' : '' ?>">
        <input type="text" name="nama" value="<?= set_value('nama'); ?>" class="form-control" placeholder="Nama Sesuai Akte Lahir">
        <?= form_error('nama', '<div class="text-danger">', '</div>') ?>
      </div>
      <div class="form-group has-feedback <?= form_error('hp') ? 'has-error' : '' ?>">
        <input type="text" name="hp" value="<?= set_value('hp'); ?>" class="form-control" placeholder="Nomor Whatsapp Siswa">
        <?= form_error('hp', '<div class="text-danger">', '</div>') ?>
      </div>
      <div class="form-group has-feedback <?= form_error('hp_ortu') ? 'has-error' : '' ?>">
        <input type="text" name="hp_ortu" value="<?= set_value('hp_ortu'); ?>" class="form-control" placeholder="Nomor Whatsapp Orangtua">
        <?= form_error('hp_ortu', '<div class="text-danger">', '</div>') ?>
      </div>
      <div class="form-group has-feedback <?= form_error('asalsekolah') ? 'has-error' : '' ?>">
        <input type="text" name="asalsekolah" value="<?= set_value('asalsekolah'); ?>" class="form-control" placeholder="Asal Sekolah">
        <?= form_error('asalsekolah', '<div class="text-danger">', '</div>') ?>
      </div>
      <div class="form-group has-feedback <?= form_error('email') ? 'has-error' : '' ?>">
        <input type="text" name="email" value="<?= set_value('email'); ?>" class="form-control" placeholder="Email">
        <?= form_error('email', '<div class="text-danger">', '</div>') ?>
      </div>
      <tr>
	<!-- <td>Bukti Pembayaran</td> -->
		<!-- <td>:</td> -->
	<!-- <td><input type="file" name="image" required><p class="help-block">Extensi harus JPG, Maks 10MB</p></td> -->
</tr>
      <div class="row">
        <div class="col-xs-12">
        <input type="hidden" name="tanggal" value="<?=  $tanggalskrg ?>">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Simpan</button>
        </div>
        <!-- /.col -->
      </div>
      <div class="row"></div>
    </form>
  <?php }else{?>
    <center>
    <span class="glyphicon glyphicon-info-sign" style="font-size: 8vh;"></span>
    <h2>Mohon maaf saat ini preregistrasi/pendaftaran belum dibuka</h2>
    </center>
  <?php }?>
  </div>
  <!-- /.form-box -->
</div>

<!-- /.register-box -->