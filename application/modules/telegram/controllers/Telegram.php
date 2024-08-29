<?php
require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class Telegram extends CI_Controller
{

  public function __construct()
  {
    parent::__construct();
    is_logged_in();
    $this->load->helper('telegram');
  }

 public function setting()
 {
    $data['title'] = 'Tele Setting';
    $data['user'] = $this->db->get_where('user', ['email' =>
    $this->session->userdata('email')])->row_array();
    $telegram_api_token = options('telegram_api_token');
    $telegram_master = options('telegram_master');
    $data['telegram_api_token']=$telegram_api_token;
    $data['telegram_master']=$telegram_master;
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
      $telegram_api_token = options('telegram_api_token');
      $telegram_master = options('telegram_master');
      $data['telegram_autobot'] = $this->db->get('telegram_autobot')->result_array();
        // Load the curl library
        // $curl = curl_init();
        // curl_setopt_array($curl, array(
        //   CURLOPT_URL => 'https://api.telegram.org/bot'.$telegram_api_token.'/setWebhook?url=',
        //   CURLOPT_RETURNTRANSFER => true,
        //   CURLOPT_ENCODING => '',
        //   CURLOPT_MAXREDIRS => 10,
        //   CURLOPT_TIMEOUT => 0,
        //   CURLOPT_FOLLOWLOCATION => true,
        //   CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        //   CURLOPT_CUSTOMREQUEST => 'GET',
        // ));
        // $response = curl_exec($curl);
        // curl_close($curl);
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
        $data['response'] = $response;
        curl_close($curl);
        $json2 = json_encode(json_decode($response), JSON_PRETTY_PRINT); 
        $data['response2'] = '<pre>' . $json2 . '</pre>'; 
        curl_close($curl);
        $json3 = json_decode($response, TRUE);
        foreach ($json3['result'] as $dt) : 
          $update_id=$dt['update_id'];
          $chat_id = $dt['message']['chat']['id'];
          $text = $dt['message']['text'];
          $date = $dt['message']['date'];
          $username = $dt['message']['chat']['username'];
          $datas = explode(" " , $text);
          if($datas[0]=='daftar'){
          $jumlahdata = cekchatID($chat_id);
          if($jumlahdata=='0'){
            $datax = [
              'date' => $date,
              'chat_id' => $chat_id,
              'text' => $text,
              'usernametele' => $username
               ];
               $this->db->insert('telegram_autobot', $datax);
          }
        }
        endforeach;       
        $this->load->view('themes/backend/header', $data);
        $this->load->view('themes/backend/sidebar', $data);
        $this->load->view('themes/backend/topbar', $data);
        $this->load->view('cekupdate', $data);
        $this->load->view('themes/backend/footer');
        $this->load->view('themes/backend/footerajax');
      }

      
 public function delete_webhook()
 {
  $telegram_api_token = options('telegram_api_token');
  $telegram_master = options('telegram_master');
     // Load the curl library
     $curl = curl_init();
     curl_setopt_array($curl, array(
       CURLOPT_URL => 'https://api.telegram.org/bot'.$telegram_api_token.'/setWebhook?remove',
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

   public function kirimpesan()
   {
     $data['user'] = $this->db->get_where('user', ['email' =>
     $this->session->userdata('email')])->row_array();
     $telegram_api_token = options('telegram_api_token');
     $telegram_master = options('telegram_master');
     $message = $this->input->post('pesan');
     $chatID = $this->input->post('chat_id');
     $url = "https://api.telegram.org/bot" . $telegram_api_token . "/sendMessage";
     $data = ['chat_id' => $chatID, 'text' => $message, 'parse_mode' => 'HTML'];
     $ch = curl_init();
     curl_setopt($ch, CURLOPT_URL, $url);
     curl_setopt($ch, CURLOPT_POST, true);
     curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
     curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
 
     $response = curl_exec($ch);
 
 
     // here you can Handle cURL error
     if (curl_errno($ch)) {
         $error_msg = curl_error($ch);
         curl_close($ch);
         return json_encode(array('error' => $error_msg));
     }
 
     $http_code_message = curl_getinfo($ch, CURLINFO_HTTP_CODE);
     if ($http_code_message >= 200 && $http_code_message < 300) {
         $result = json_decode($response, true);
         if ($result['ok']) {
             $result = json_encode(array('success' => $result['ok']));
         } else {
             $result = json_encode(array('error' => $result));
         }
     } else {
         // And here you can Handle HTTP error
         $result = json_encode(array('error' => 'HTTP error ' . $http_code_message));
     }
 
     curl_close($ch);
    // echo $result;
     redirect('telegram/cekupdate');
   }

   public function edituser()
   {
     $data['user'] = $this->db->get_where('user', ['email' =>
     $this->session->userdata('email')])->row_array();
     $chat_id = $this->input->post('chat_id');
     $email = $this->input->post('email');
     $data = [
      'email' => $this->input->post('email')
       ];
        $this->db->where('chat_id', $chat_id);
        $this->db->update('telegram_autobot', $data);
     redirect('telegram/cekupdate');
   }


   public function get_webhookinfo()
   {
    $telegram_api_token = options('telegram_api_token');
    $telegram_master = options('telegram_master');
       // Load the curl library
       $curl = curl_init();
       curl_setopt_array($curl, array(
         CURLOPT_URL => 'https://api.telegram.org/bot'.$telegram_api_token.'/getWebhookInfo',
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

  //  {
  //   "ok": true,
  //   "result": {
  //     "url": "https://manybot.io/webhook/7422473997/b904c2cf34",
  //     "has_custom_certificate": false,
  //     "pending_update_count": 0,
  //     "max_connections": 40,
  //     "ip_address": "52.28.152.1"
  //   }
  // }
   }
}