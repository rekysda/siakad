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

    <div class="row">
      <div class="col-lg-6">
        <?= $this->session->flashdata('message'); ?>
      </div>
    </div>

    <div class="row">
      <div class="col-md-3">

        <!-- Profile Image -->
        <div class="box box-primary">
          <div class="box-body box-profile">
            <img class="profile-user-img img-responsive img-circle" src="<?= base_url('assets/images/siswa/') . $user['image']; ?>" alt="User profile picture">

            <h3 class="profile-username text-center"><?= $user['namasiswa']; ?></h3>

            <p class="text-muted text-center">
            Nomor Formulir : <?= $user['noformulir']; ?><br>
            Gelombang : <?= $user['namagelombang']; ?><br>
            Jalur : <?= $user['namajalur']; ?><br>
            NIS : <?= $user['nis']; ?><br>
            Status : <?= $user['ppdb_status']; ?><br>
            # : <?= round(microtime(true) * 1000).$this->session->userdata('siswa_id'); ?>
          </p>
          <?php if( $user['ppdb_status']=='calon'){ ?>
            <a href="<?= base_url('siswa/edit'); ?>" class="btn btn-primary btn-block"><b>Edit Profile</b></a>
          <?php } ?>
          <?php if( $user['ppdb_status']=='aktif'){ ?>
            <a href="<?= base_url('siswa/lihatdata'); ?>" class="btn btn-primary btn-block"><b>Lihat Profile</b></a>
          <?php } ?>
          </div>
          <!-- /.box-body -->
        </div>
        <!-- /.box -->

      </div>
    </div>

  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->