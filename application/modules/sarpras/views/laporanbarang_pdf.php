<style>
    
body{font-size: 12px;color: black;}
table#tablestd{
	border-width: 1px;
	border-style: solid;
	border-color: #D8D8D8;
	border-collapse: collapse;
	margin: 10px 0px;
}
table#tablestd td{
	padding: 0.5em; 	color: #000;
	vertical-align: top;
	border-width: 0px;
	padding: 4px;
	border: 1px solid #000;
	
}

table#tablemodul1{
	border-width: 1px;
	border-style: solid;
	border-color: #000;
	border-collapse: collapse;
	margin: 10px 0px;
}
table#tablemodul1 td{
	padding:1px 6px 2px 6px;
	border: 1px solid #000; 
	
}

table#tablemodul1 th{
	padding:1px 6px 2px 6px;
	border: 1px solid #000; 
	
}

h1{
	font-size:24px;
}
</style>
<h1> <?= $title; ?></h1>
Gedung : <?= $getruangan['nama_gedung']; ?><br>
 Ruangan : <?= $getruangan['nama_ruangan']; ?>
 <br>
              <table  id="tablestd">
                <thead>
                  <tr>
                    <td>No</td>
                    <td>Nama</td>
                    <td>Jumlah</td>
                  </tr>
                </thead>
                <tbody>
                  <?php $i = 1; ?>
                  <?php foreach ($get_namabarang as $dt) : ?>
                  <?php if ( $dt['stok']>0) { ?>
                  <tr>
                      <td><?= $i; ?></td>
                      <td><?= $dt['namabarang']; ?></td>
                      <td><?= $dt['stok']; ?></td>                   
                    </tr>
                  <?php } ?>
                    <?php $i++; ?>
                 
                  <?php endforeach; ?>
                </tbody>
              </table>