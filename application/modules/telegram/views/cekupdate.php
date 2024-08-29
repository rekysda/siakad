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
<!-- <a href="<?= base_url('telegram/delete_webhook')?>" class="btn btn-danger">refresh Webhook</a> -->
<?= $this->session->flashdata('message') ?>
      <hr>
      <table class="table table-hover" id='example1'>
            <thead>
              <tr>
                <th>#</th>
                <th>date</th>
                <th>text</th>
                <th>chat_id</th>
                <th>@usernametele</th>
                <th>Email</th>
                <th>aksi</th>
              </tr>
            </thead>
            <tbody>
              <?php
                $json = json_decode($response, TRUE);
                $no='1';
                foreach ($telegram_autobot as $dt) : 

$text=$dt['text'];
$date=$dt['date'];
$chat_id=$dt['chat_id'];
$usernametele=$dt['usernametele'];
$email=$dt['email'];
$data = explode(" " , $text);
if($data[0]=='daftar'){
                ?>
                <tr>
                  <td><?= $no; ?></td>
                  <td><?= date('d-M-Y H:i:s', $date);?></td>
                  <td><?=$text?></td>
                  <td><?=$chat_id?></td>
                  <td>@<?=$usernametele?></td>
                  <td><?=$email?></td>
                  <td>
<button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#exampleModal<?= $no; ?>">
  chatt
</button>
<button type="button" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#exampleEdit<?= $no; ?>">
  edituser
</button>
</td>
<!-- Modal -->
<div class="modal fade" id="exampleModal<?= $no; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Kirim Pesan <?=$date?></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form action="<?= base_url('telegram/kirimpesan')?>" method="post">
              <div class="form-group <?php echo form_error('pesan') ? 'has-error' : '' ?>">
                <label for="name">Isi Pesan</label>
                <input class="form-control" type="text" name="pesan" value="Terima kasih telah melakukan pendafatran, permintaan anda akan kami proses 1x24 jam" required/>
                <?= form_error('pesan', '<span class="help-block">', '</small>'); ?>
              </div>
      </div>
      <div class="modal-footer">
      <input class="form-control" type="hidden" name="chat_id" value="<?=$chat_id?>"/>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
  </form>
    </div>
  </div>
</div>
<!-- Modal -->
<div class="modal fade" id="exampleEdit<?= $no; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit <?=$usernametele?></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form action="<?= base_url('telegram/edituser')?>" method="post">
              <div class="form-group <?php echo form_error('email') ? 'has-error' : '' ?>">
                <label for="name">Email</label>
                <input class="form-control" type="text" name="email" value="<?=$email?>" required/>
                <?= form_error('pesan', '<span class="help-block">', '</small>'); ?>
              </div>
      </div>
      <div class="modal-footer">
      <input class="form-control" type="hidden" name="chat_id" value="<?=$chat_id?>"/>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
  </form>
    </div>
  </div>
</div>
</tr>
<?php $no++;?>
<?php }?>
              <?php endforeach; ?>
            </tbody>
          </table>
          <hr>
          <!-- <?= $response2?> -->
      </div>
      <!-- /.box-body -->
    </div>
    <!-- /.box -->
  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->