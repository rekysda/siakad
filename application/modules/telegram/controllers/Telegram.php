<?php
require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class Telegram extends CI_Controller
{

  public function __construct()
  {
    parent::__construct();
   // is_logged_in();
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
    $this->form_validation->set_rules('token', 'token', 'required');
    $this->form_validation->set_rules('telegram_master', 'telegram_master', 'required');
    if ($this->form_validation->run() == false) {
    $this->load->view('themes/backend/header', $data);
    $this->load->view('themes/backend/sidebar', $data);
    $this->load->view('themes/backend/topbar', $data);
    $this->load->view('setting', $data);
    $this->load->view('themes/backend/footer');
    $this->load->view('themes/backend/footerajax');
    }else{
      $token = $this->input->post('token');
      $telegram_master = $this->input->post('telegram_master');
      $this->db->set('value', $token);
      $this->db->where('name','telegram_api_token');
      $this->db->update('options');
      $this->db->set('value', $telegram_master);
      $this->db->where('name','telegram_master');
      $this->db->update('options');
      
    $this->session->set_flashdata('message', '<div class="alert alert-success  alert-dismissible" role"alert" ><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>Data Changed!</div>');
      redirect('telegram/setting');
    }
 }

 public function cekupdate()
    {
      $data['title'] = 'Tele CekUpdate';
      $data['user'] = $this->db->get_where('user', ['email' =>
      $this->session->userdata('email')])->row_array(); 
      $data['telegram_autobot'] = $this->db->get('telegram_autobot')->result_array(); 
      $data['get_webhookinfo'] = get_webhookinfo();
        $this->load->view('themes/backend/header', $data);
        $this->load->view('themes/backend/sidebar', $data);
        $this->load->view('themes/backend/topbar', $data);
        $this->load->view('cekupdate', $data);
        $this->load->view('themes/backend/footer');
        $this->load->view('themes/backend/footerajax');

      }

      public function  set_webhookdefault()
      {
        $telegram_api_token = options('telegram_api_token');
        $telegram_master = options('telegram_master');
        $data['telegram_autobot'] = $this->db->get('telegram_autobot')->result_array();
        $data['telegram_api_token']=$telegram_api_token;
          // Load the curl library
          $curl = curl_init();
          curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://api.telegram.org/bot'.$telegram_api_token.'/setWebhook?url=https://manybot.io/webhook/7422473997/b904c2cf34',
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

      }
        public function ambil_webhook()
        {
          $telegram_api_token = options('telegram_api_token');
          $telegram_master = options('telegram_master');
          $data['telegram_autobot'] = $this->db->get('telegram_autobot')->result_array();
          $data['telegram_api_token']=$telegram_api_token;
            // Load the curl library
            $curl = curl_init();
            curl_setopt_array($curl, array(
              CURLOPT_URL => 'https://api.telegram.org/bot'.$telegram_api_token.'/setWebhook?url=',
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
              if($datas[0]=='daftar'or $datas[0]=='Daftar'){
              $jumlahdata = cekchatID($chat_id);
              if($jumlahdata=='0'){
                if($username==''){
                  $username='tidakada';
                }
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
            redirect('telegram/cekupdate');
        }
      
 public function delete_webhook()
 {
  $telegram_api_token = options('telegram_api_token');
  $telegram_master = options('telegram_master');
     // Load the curl library
     $curl = curl_init();
     curl_setopt_array($curl, array(
       CURLOPT_URL => 'https://api.telegram.org/bot'.$telegram_api_token.'/setWebhook?url=',
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

   public function get_update()
   {
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
    }

    public function alertdaftar()
    {
      $telegram_api_token = options('telegram_api_token');
      $telegram_master = options('telegram_master');
      $telegram_autobot = $this->db->get('telegram_autobot')->result_array();
      $data['telegram_api_token']=$telegram_api_token;
      foreach ($telegram_autobot as $dt) :
      $text=$dt['text'];
      $date=$dt['date'];
      $chat_id=$dt['chat_id'];
      $usernametele=$dt['usernametele'];
      $email=$dt['email'];
      $alertdaftar=$dt['alertdaftar'];
      $data = explode(" " , $text);
      if($alertdaftar=='0'){
        $message='Terima kasih telah melakukan pendaftaran, permintaan anda akan kami proses 1x24 jam';
        getkirimpesan($chat_id,$message);
        $this->db->set('alertdaftar', '1');
        $this->db->where('chat_id',$chat_id);
        $this->db->update('telegram_autobot');
      }
     endforeach;
     redirect('telegram/cekupdate');
    }
    public function set_webhookonline()
    {
     $telegram_api_token = options('telegram_api_token');
     $telegram_master = options('telegram_master');
        // Load the curl library
        $curl = curl_init();
        curl_setopt_array($curl, array(
          CURLOPT_URL => 'https://api.telegram.org/bot'.$telegram_api_token.'/setWebhook?url=https://pusatwebmurah.my.id/siakad/telegram/webhook',
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

    public function webhook()
    {
      // $message = file_get_contents('php://input');
      // $fp = fopen('debug.txt', 'w');
      // fwrite($fp, $message);
      // fclose($fp);
      // $datax = [
      //   'response' => $message
      //   ];
      //   $this->db->insert('telegram_webhook', $datax);
        $data = json_decode(file_get_contents('php://input'), true);
        $update_id = $data['update_id'];
        $chat_id = $data['message']['chat']['id'];
        $username = $data['message']['chat']['username'];
        $text = $data['message']['text'];
        $date = $data['message']['date'];
        // $text='Anda mengetik: '.$text .', pada: '.date('d/M/Y',$date);
        // getkirimpesan($chat_id,$text);
        $datas = explode(" " , $text);
        $usernamelogin = $datas[1];
          if($datas[0]=='daftar'or $datas[0]=='Daftar'){
            $jumlahdata = cekchatID($chat_id);
            if($jumlahdata=='0'){
              if($username==''){
                $username='tidakada';
              }
              $datax = [
                'date' => $date,
                'chat_id' => $chat_id,
                'text' => $text,
                'usernametele' => $username
                ];
                $this->db->insert('telegram_autobot', $datax);
                $text='Selamat bergabung '.$usernamelogin.' di Siadu03Bot,'.PHP_EOL.'persetujuan anda akan kami proses sesuai username pendaftaran,'.PHP_EOL.'kami akan menginformasikan pada anda selama 1x24 jam pada jam kerja' ;
                getkirimpesan($chat_id,$text);
            }else{
              $text='Pendaftaran dengan username '.$usernamelogin.' mengalami kegagalan,'.PHP_EOL.'kami mendeteksi anda melakukan pendaftaran sebanyak 2 kali dengan device yang sama.' ;
              getkirimpesan($chat_id,$text);
            }
          }else{
        $text='Selamat datang di Siadu03Bot, untuk melakukan pendaftaran '.PHP_EOL.'ketik daftar spasi username kirim ke Siadu03Bot '.PHP_EOL.'contoh: daftar arman' ;
        getkirimpesan($chat_id,$text);
          }
    }
}