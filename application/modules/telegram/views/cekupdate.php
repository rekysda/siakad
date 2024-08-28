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
<a href="<?= base_url('telegram/delete_webhook')?>" class="btn btn-danger">refresh Webhook</a>
      <hr>
      <table class="table table-hover" id='example1'>
            <thead>
              <tr>
                <th>#</th>
                <th>date</th>
                <th>text</th>
                <th>chat_id</th>
                <th>name</th>
              </tr>
            </thead>
            <tbody>
              <?php
                $json = json_decode($response, TRUE);
                foreach ($json['result'] as $dt) : 
$update_id=$dt['update_id'];
$chat_id=$dt['message']['chat']['id'];
$first_name=$dt['message']['chat']['first_name'];
$last_name=$dt['message']['chat']['last_name'];
$date=$dt['message']['date'];
$text=$dt['message']['text'];
                ?>
                <tr>
                  <td><?= $update_id; ?></td>
                  <td><?=$date?></td>
                  <td><?=$text?></td>
                  <td><?=$chat_id?></td>
                  <td><?=$first_name?><?=$last_name?></td>
                </tr>
              <?php endforeach; ?>
            </tbody>
          </table>
          <hr>
          <?= $response2?>
      </div>
      <!-- /.box-body -->
    </div>
    <!-- /.box -->
  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->