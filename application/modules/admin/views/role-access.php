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
        <h3 class="box-title"><?= $title; ?> : <?= $role['role']; ?></h3>
      </div>
      <div class="box-body">

        <?= $this->session->flashdata('message') ?>
        <form method="post" action="<?= base_url('admin/update_role_access')?>">
  <input type="hidden" name="role" value="<?= $role['id']?>">
        <table class="table table-hover">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Menu</th>
              <th scope="col">Access</th>
            </tr>
          </thead>
          <tbody>
            <?php $i = 1; ?>
            <?php foreach ($menu as $m) : ?>
              <tr>
                <th scope="row"><?= $i; ?></th>
                <td><?= $m['menu']; ?></td>
                <td>
                  <div class="form-check">
                    <!-- <input class="form-check-input" type="checkbox" <?= check_access($role['id'], $m['id']); ?> data-role="<?= $role['id']; ?>" data-menu="<?= $m['id']; ?>"> -->
                    <?php $cek_accessmenu = $this->db->get_where('user_access_menu', ['role_id'=>$role['id'], 'menu_id'=>$m['id']])->num_rows();?>

                    <input class="form-check" name="menu<?= $m['id']?>" type="checkbox" <?= $cek_accessmenu>0?'checked':'';?> >
                  </div>
                </td>
              </tr>
              <?php foreach ($submenu as $sm) : ?>
              <?php if($sm['menu_id']==$m['id']){ ?>
              <tr>
                <th scope="row"></th>
                <td><?= $sm['title']; ?></td>
                <td>
                  <div class="form-check">
                    <!-- <input class="form-check-inputsub" type="checkbox" <?= check_access_sub($role['id'], $sm['id']); ?> data-role="<?= $role['id']; ?>" data-submenu="<?= $sm['id']; ?>"> -->
                    <?php $cek_accesssubmenu = $this->db->get_where('user_access_submenu', ['role_id'=>$role['id'], 'submenu_id'=>$sm['id']])->num_rows();?>

                    <input class="form-check" name="submenu<?= $sm['id']?>" type="checkbox" <?= $cek_accesssubmenu>0?'checked':'';?> >
                  </div>
                </td>
              </tr> 
             <?php } ?>
              <?php endforeach; ?>          
              <?php $i++; ?>
            <?php endforeach; ?>
          </tbody>
        </table>
        <button class="btn btn-primary btn-block">Update</button>
        </form>
        <br>
        <div class="row">
          <div class="col-lg-4">
            <a href="<?= base_url('admin/role') ?>" class="btn btn-success"><i class="fa fa-backward"></i> Kembali</a>
          </div>
        </div>

      </div>
      <!-- /.box-body -->
    </div>
    <!-- /.box -->

  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->