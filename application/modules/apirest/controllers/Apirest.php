<?php
use Restserver\Libraries\REST_Controller;
require(APPPATH . 'libraries/REST_Controller.php');

class Apirest extends REST_Controller{
// constructor
function __construct($config = 'rest') {
  parent::__construct($config);
  $this->load->database();
}

public function index_get(){
  // testing response
      $id = $this->get('id');
      if ($id == '') {
          $siswa = $this->db->get('ppdb_siswa')->result();
      } else {
          $this->db->where('id', $id);
          $siswa = $this->db->get('ppdb_siswa')->result();
      }
      $this->response($siswa, 200);     

  }
  public function keuangansiswa_get(){
    // testing response
        $siswa_id = $this->get('siswa_id');
        if ($siswa_id == '') {
            $siswabayar = $this->db->get('siswa_keuangan')->result();
        } else {
            $this->db->where('siswa_id', $siswa_id);
            $siswabayar = $this->db->get('siswa_keuangan')->result();
        }
        $this->response($siswabayar, 200);     
  
    }
    public function katbiaya_get(){
      // testing response
          $id = $this->get('id');
          if ($id == '') {
              $m_biaya_categories = $this->db->get('m_biaya_categories')->result();
          } else {
              $this->db->where('m_biaya_categories', $id);
              $m_biaya_categories = $this->db->get('m_biaya_categories')->result();
          }
          $this->response($m_biaya_categories, 200);     
    
      }
    public function masterbiaya_get(){
      // testing response
          $id = $this->get('id');
          if ($id == '') {
              $m_biaya = $this->db->get('m_biaya')->result();
          } else {
              $this->db->where('m_biaya', $id);
              $m_biaya = $this->db->get('m_biaya')->result();
          }
          $this->response($m_biaya, 200);     
    
      }
      public function mgelombang_get(){
        // testing response
            $id = $this->get('id');
            if ($id == '') {
                $m_gelombang = $this->db->get('m_gelombang')->result();
            } else {
                $this->db->where('m_gelombang', $id);
                $m_gelombang = $this->db->get('m_gelombang')->result();
            }
            $this->response($m_gelombang, 200);     
      
        }
        public function mjalur_get(){
          // testing response
              $id = $this->get('id');
              if ($id == '') {
                  $m_jalur = $this->db->get('m_jalur')->result();
              } else {
                  $this->db->where('m_jalur', $id);
                  $m_jalur = $this->db->get('m_jalur')->result();
              }
              $this->response($m_jalur, 200);     
        
          }
}
?>