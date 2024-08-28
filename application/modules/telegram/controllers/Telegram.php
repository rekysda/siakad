<?php
require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class Telegram extends CI_Controller
{

  public function __construct()
  {
    parent::__construct();
    is_logged_in();
    $this->$apitoken='7509304273:AAGkmKV7KgO2nSFWfh_q3tm4rq0hJxEC_EI';
  }

 public function setting()
 {
    $data['title'] = 'Tele Setting';
    $data['user'] = $this->db->get_where('user', ['email' =>
    $this->session->userdata('email')])->row_array();
    $data['apitoken']=$this->$apitoken;
    $this->load->view('themes/backend/header', $data);
    $this->load->view('themes/backend/sidebar', $data);
    $this->load->view('themes/backend/topbar', $data);
    $this->load->view('setting', $data);
    $this->load->view('themes/backend/footer');
    $this->load->view('themes/backend/footerajax');
 }

 public function cekupdate()
    {
      $data['title'] = 'Tele CekUpdate';
      $data['user'] = $this->db->get_where('user', ['email' =>
      $this->session->userdata('email')])->row_array();
        // Load the curl library
        $curl = curl_init();

        curl_setopt_array($curl, array(
          CURLOPT_URL => 'https://api.telegram.org/bot7509304273:AAGkmKV7KgO2nSFWfh_q3tm4rq0hJxEC_EI/getUpdates',
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
        $data['response'] =$response;
        $json2 = json_encode(json_decode($response), JSON_PRETTY_PRINT); 
        $data['response2'] = '<pre>' . $json2 . '</pre>'; 
        
        curl_close($curl);
        $this->load->view('themes/backend/header', $data);
        $this->load->view('themes/backend/sidebar', $data);
        $this->load->view('themes/backend/topbar', $data);
        $this->load->view('cekupdate', $data);
        $this->load->view('themes/backend/footer');
        $this->load->view('themes/backend/footerajax');
      }

      
 public function delete_webhook()
 {
     // Load the curl library
     $curl = curl_init();

     curl_setopt_array($curl, array(
       CURLOPT_URL => 'https://api.telegram.org/bot7509304273:AAGkmKV7KgO2nSFWfh_q3tm4rq0hJxEC_EI/setWebhook?url=',
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
     redirect('telegram/cekupdate');
    // echo $response;
   }
}