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
<!-- <a href="<?= base_url('telegram/delete_webhook')?>" class="btn btn-danger btn-xs">Delete Webhook</a>&nbsp;
<a href="<?= base_url('telegram/set_webhookdefault')?>" class="btn btn-default btn-xs">Set Webhook Default</a>&nbsp;
<a href="<?= base_url('telegram/ambil_webhook')?>" class="btn btn-primary btn-xs">Simpan Database</a>&nbsp;
<button type="button" class="btn btn-success btn-xs" data-toggle="modal" data-target="#getupdate">
WebHookGetUpdates
</button>
<a href="<?= base_url('telegram/alertdaftar')?>" class="btn btn-warning btn-xs">AlertDaftar</a>&nbsp; -->
<a href="<?= base_url('telegram/set_webhookonline')?>" class="btn btn-danger btn-xs">Set Webhook Online</a>&nbsp;
<hr>
<?= $this->session->flashdata('message') ?>
      <hr>
      <!-- <?= '<pre>'.$get_webhookinfo.'</pre>';?><br> -->
<?php      $json = json_decode($get_webhookinfo, TRUE);?>
WebHook URL: <?= $json['result']['url'];?>
      <table class="table table-hover" id='example1'>
            <thead>
              <tr>
                <th>#</th>
                <th>Date</th>
                <th>Text</th>
                <th>Chat_id</th>
                <th>Email</th>
                <th>@usernametele</th>
                <th>UsernameLogin</th>
                <th>Aksi</th>
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
$email=$dt['email'];
$usernametele=$dt['usernametele'];
$usernamelogin=$dt['usernamelogin'];
$data = explode(" " , $text);
                ?>
                <tr>
                  <td><?= $no; ?></td>
                  <td><?= date('d-M-Y H:i:s', $date);?></td>
                  <td><?=$text?></td>
                  <td><?=$chat_id?></td>
                  <td><?=$email?></td>
                  <td>@<?=$usernametele?></td>
                  <td><?=$usernamelogin?></td>
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
      <div class="form-group <?php echo form_error('usernamelogin') ? 'has-error' : '' ?>">
        <label for="name">UsernameLogin</label>
        <input class="form-control" type="text" name="usernamelogin" value="<?=$usernamelogin?>" required/>
        <?= form_error('usernamelogin', '<span class="help-block">', '</small>'); ?>
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

              <?php endforeach; ?>
            </tbody>
          </table>
          <hr>
          <!-- Modal -->
<div class="modal fade" id="getupdate" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">GetUpdates</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <?php
      $telegram_api_token = options('telegram_api_token');
      $telegram_master = options('telegram_master');
       // Load the curl library
       $curl = curl_init();
       curl_setopt_array($curl, array(
        CURLOPT_URL => 'https://api.telegram.org/bot'.$telegram_api_token.'/getUpdates',
         CURLOPT_RETURNTRANSFER => true,
         CURLOPT_ENCODING => '',
         CURLOPT_MAXREDIRS => 10,
         CURLOPT_TIMEOUT => 0,
         CURLOPT_FOLLOWLOCATION => true,
         CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
         CURLOPT_CUSTOMREQUEST => 'GET',
       ));
       $response = curl_exec($curl);
       curl_close($curl);
       $json2 = json_encode(json_decode($response),JSON_UNESCAPED_SLASHES|JSON_PRETTY_PRINT); 
       echo '<pre>'.$json2.'</pre>';
       ?>
    </div>
  </div>
</div>
          <!-- <?= $response2?> -->
      </div>
      <!-- /.box-body -->
    </div>
    <!-- /.box -->
  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->