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
            <li>PPDB</li>
            <li><?= $title; ?></li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">

        <!-- Default box -->
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">Edit</h3>
            </div>
            <div class="box-body">

                <div style="display: none;">
<?= $this->session->flashdata('message') ?>
</div>

                <form class="form-horizontal" action="<?php base_url('ppdb/editpreregistrasi') ?>" method="post">
                <div class="form-group <?php echo form_error('tanggal') ? 'has-error' : '' ?>">
                        <label for="name" class="col-sm-2 control-label">Tanggal</label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" id="tanggal" name="tanggal" value="<?= $getpreregistrasi['tanggal']; ?>" />
                            <?= form_error('tanggal', '<span class="help-block">', '</small>'); ?>
                        </div>
                    </div>
                <div class="form-group <?php echo form_error('nama') ? 'has-error' : '' ?>">
                        <label for="name" class="col-sm-2 control-label">Nama</label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" id="nama" name="nama" value="<?= $getpreregistrasi['nama']; ?>" />
                            <?= form_error('nama', '<span class="help-block">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group <?php echo form_error('asalsekolah') ? 'has-error' : '' ?>">
                        <label for="name" class="col-sm-2 control-label">Asalsekolah</label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" id="asalsekolah" name="asalsekolah" value="<?= $getpreregistrasi['asalsekolah']; ?>" />
                            <?= form_error('asalsekolah', '<span class="help-block">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group <?php echo form_error('email') ? 'has-error' : '' ?>">
                        <label for="name" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" id="email" name="email" value="<?= $getpreregistrasi['email']; ?>" />
                            <?= form_error('email', '<span class="help-block">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group <?php echo form_error('noformulir') ? 'has-error' : '' ?>">
                        <label for="name" class="col-sm-2 control-label">No.Formulir</label>
                        <?php $noformulir = $getpreregistrasi['noformulir'] ?>
                        <div class="col-sm-10">
<?php if($noformulir==''){?>
<select name="noformulir" class="js-example-basic-single form-control">
<option value="">== noformulir ==</option>
<?php foreach ($formulir as $dt) : ?>
<option value="<?= $dt['noformulir']; ?>" <?= $dt['noformulir'] == $noformulir ? ' selected="selected"' : ''; ?>><?= $dt['noformulir']; ?></option>
<?php endforeach; ?>
</select>
<?php }else{?>
    <input class="form-control" type="text" value="<?= $noformulir ?>"readonly>   
<?php }?>    
                    </div>
                    </div>

            </div>
            <!-- /.box-body -->
            <div class="box-footer">
                <input class="form-control" type="hidden" name="user_id" value="<?= $user['id']; ?>">
                <input class="form-control" type="hidden" name="id" value="<?= $getpreregistrasi['id']; ?>">
                <?php if($noformulir==''){?>
                <button type="submit" class="btn btn-primary">Simpan</button>
                <?php }?>   
                <a href="<?= base_url('ppdb/preregistrasi'); ?> " class="btn btn-default">Cancel</a>
            </div>
            </form>
        </div>
        <!-- /.box -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->