<?php
error_reporting(0);
defined('BASEPATH') or exit('No direct script access allowed');

class Preregistrasi extends CI_Controller
{

  public function __construct()
  {
    parent::__construct();
  }

 public function index()
 {
  $data['title'] = 'Preregistrasi SEKOLAH SIAKAD';
   $data['user'] = $this->db->get_where('user', ['email' =>
   $this->session->userdata('email')])->row_array();
   $data['tahunskrg']=date('Y');
   $data['tanggalskrg']=date('Y-m-d');
   $data['pendaftaran']=get_m_options('is_preregistrasi_online');
   $this->form_validation->set_rules('nama', 'nama', 'required');
   $this->form_validation->set_rules('hp', 'hp', 'required');
   $this->form_validation->set_rules('hp_ortu', 'hp_ortu', 'required');
   $this->form_validation->set_rules('asalsekolah', 'asalsekolah', 'required');
   $this->form_validation->set_rules('email', 'email', 'required|valid_email');
   if ($this->form_validation->run() == false) {
    $this->load->view('themes/backend/auth/header', $data);
   $this->load->view('preregistrasi', $data);
   $this->load->view('themes/backend/auth/footer');
   $this->load->view('themes/backend/footerajax');
   }else{

    $data = [
    'tanggal' => $this->input->post('tanggal'),
    'nama' => strtoupper($this->input->post('nama')),
    'hp' => $this->input->post('hp'),
    'hp_ortu' => $this->input->post('hp_ortu'),
    'asalsekolah' => $this->input->post('asalsekolah'),
    'email' => $this->input->post('email')
     ];
     $this->db->insert('ppdb_preregistrasi', $data);
     
     $this->session->set_flashdata('message', '<div class="alert alert-success" role"alert">Data telah tersimpan,Silahkan menunggu Konfirmasi Verifikasi Pembayaran 1 x 24 Jam, pemberitahuan Voucher dan Password akan kami info melalui Whatsapp / Email</div>');
     redirect('preregistrasi');
      }
 }
 //end
}