<?php
function getkirimpesan($chatID,$message)
   {
     $telegram_api_token = options('telegram_api_token');
     $url = "https://api.telegram.org/bot" . $telegram_api_token . "/sendMessage";
     $data = ['chat_id' => $chatID, 'text' => $message, 'parse_mode' => 'markdown'];
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
  //   redirect('telegram/cekupdate');
    }
    function cekchatID($chat_id)
    {
        $ci = get_instance();
        $jumlahdata = $ci->db->get_where('telegram_autobot', ['chat_id' => $chat_id])->num_rows();
        return $jumlahdata;
    }

    function get_webhookinfo()
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
       // return $response;
         $json2 = json_encode(json_decode($response),JSON_UNESCAPED_SLASHES|JSON_PRETTY_PRINT); 
         return $json2;
 
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

?>