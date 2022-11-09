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

        <?= $this->session->flashdata('message') ?>

        <!-- Default box -->
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">Pengaturan Akademik</h3>
            </div>
            <div class="box-body">

                <form class="form-horizontal" action="" method="post">
                    <div class="form-group">
                        <label for="name" class="col-sm-3 control-label">Tahun Angkatan Default</label>
                        <div class="col-sm-9">
                        <select name="tahun_default" id="tahun_default" class="form-control <?= form_error('tahun_default') ? 'is-invalid' : '' ?>">
                                <?php foreach ($m_tahunppdb as $dt) : ?>
                                <option value="<?= $dt['nama']; ?>" <?= $dt['nama'] == $tahun_default['value'] ? ' selected="selected"' : ''; ?>><?= $dt['nama']; ?></option>
                                <?php endforeach; ?>
                            </select>
                            <?= form_error('tahun_default', '<span class="help-block">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-3 control-label">Tahun PPDB Default</label>
                        <div class="col-sm-9">
                            <select name="tahun_ppdb_default" id="tahun_ppdb_default" class="form-control <?= form_error('tahun_ppdb_default') ? 'is-invalid' : '' ?>">
                            <?php foreach ($m_tahunppdb as $dt) : ?>
                                <option value="<?= $dt['nama']; ?>" <?= $dt['nama'] == $tahun_ppdb_default['value'] ? ' selected="selected"' : ''; ?>><?= $dt['nama']; ?></option>
                                <?php endforeach; ?>
                            </select>
                            <?= form_error('tahun_ppdb_default', '<span class="help-block">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-3 control-label">Tahun Akademik Default</label>
                        <div class="col-sm-9">
                            <select name="tahun_akademik_default" id="tahun_akademik_default" class="form-control <?= form_error('tahun_akademik_default') ? 'is-invalid' : '' ?>">
                                <?php foreach ($tahunakademik as $dt) : ?>
                                <option value="<?= $dt['id']; ?>" <?= $dt['id'] == $tahun_akademik_default['value'] ? ' selected="selected"' : ''; ?>><?= $dt['nama']; ?></option>
                                <?php endforeach; ?>
                            </select>
                            <?= form_error('tahun_id', '<span class="help-block">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                    <label for="name" class="col-sm-3 control-label">PPDB Online</label>
                    <div class="col-sm-9">
                            <div class="checkbox">
                                <label>
                                    <input class="form-check-input" type="checkbox" value="1" name="is_ppdb_online" id="is_ppdb_online" <?= $is_ppdb_online['value'] == '1' ? 'checked' : ''; ?>>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                    <label for="name" class="col-sm-3 control-label">Preregistrasi Online</label>
                    <div class="col-sm-9">
                            <div class="checkbox">
                                <label>
                                    <input class="form-check-input" type="checkbox" value="1" name="is_preregistrasi_online" id="is_preregistrasi_online" <?= $is_preregistrasi_online['value'] == '1' ? 'checked' : ''; ?>>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group <?= form_error('gelombang_ppdb_default') ? 'has-error' : '' ?>">
                        <label for="name" class="col-sm-3 control-label">Gelombang PPDB Default</label>
                        <div class="col-sm-9">
                            <select name="gelombang_ppdb_default" id="gelombang_ppdb_default" class="form-control <?= form_error('gelombang_ppdb_default') ? 'is-invalid' : '' ?>">
                                <?php foreach ($gelombangppdb as $dt) : ?>
                                <option value="<?= $dt['id']; ?>" <?= $dt['id'] == $gelombang_ppdb_default['value'] ? ' selected="selected"' : ''; ?>><?= $dt['nama']; ?></option>
                                <?php endforeach; ?>
                            </select>
                            <?= form_error('gelombang_ppdb_default', '<span class="help-block">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group <?= form_error('gelombang_ppdb_default') ? 'has-error' : '' ?>">
                    <label for="name" class="col-sm-3 control-label">Harga Formulir</label>
                        <div class="col-sm-9">
                        <input class="form-control <?php echo form_error('harga_formulir') ? 'is-invalid' : '' ?>" type="text" id="harga_formulir" name="harga_formulir" value="<?= $harga_formulir['value']; ?>" />
                        <div class="invalid-feedback">
                            <?= form_error('harga_formulir') ?>
                        </div>
                  </div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
                <input class="form-control" type="hidden" name="user_id" value="<?= $user['id']; ?>" />
                <button type="submit" class="btn btn-primary">Simpan</button>
                <a href="<?= base_url('akademik/setting'); ?> " class="btn btn-default">Cancel</a>
            </div>
            </form>
        </div>
        <!-- /.box -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->