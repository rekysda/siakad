<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Authguru extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_validation');
	}

	public function index()
	{
		if ($this->session->userdata('nip')) {
			redirect('user');
		}
	 if (options('forbidden') == '0') {
		include_once APPPATH . "../vendor/autoload.php";
		$this->load->model('LoginModel');
	//	require APPPATH . 'vendor/google/google-api-php-client/vendor/autoload.php';
		$google_client = new Google_Client();

        $google_client->setRedirectUri(base_url('loginguru')); //Define your Redirect Uri
        $google_client->addScope('email');
        $google_client->addScope('profile');
		if(isset($_GET["code"]))
        {
        $token = $google_client->fetchAccessTokenWithAuthCode($_GET["code"]);

                if(!isset($token["error"]))
                {
                    $google_client->setAccessToken($token['access_token']);
                    $this->session->set_userdata('access_token', $token['access_token']);
                    $google_service = new Google_Service_Oauth2($google_client);
                    $data = $google_service->userinfo->get();
					// Data dari Google
					$first_name= $data['given_name'];
                    $last_name  = $data['family_name'];
                    $email_address = $data['email'];
					$login_oauth_uid = $data['id'];
					$google_picture = $data['picture'];

		if($this->LoginModel->Is_already_register_email($email_address))
		{
			$this->db->set('login_oauth_uid', $login_oauth_uid);
			$this->db->where('email',$email_address);
			$this->db->update('m_pegawai');
			// jika ada di database kita maka dilakukan session user
			$user_details = $this->LoginModel->checkuserlogin($email_address);

			$session_data['nip'] 	= $user_details->nip;
			$session_data['role_id']	= '5';
			$session_data['guru_id']	= $user_details->id;
			$session_data['google_picture']	= $google_picture;
			$this->session->set_userdata($session_data);
			redirect('guru');
		}else{
			// jika tidak ada di database kita maka error atau insert ke database member dengan data email dari google
			$this->session->set_flashdata('message', '<div class="alert alert-danger alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<strong>Warning!</strong> Email belum terdaftar.</div>');
			redirect('loginguru');
				}	
			}
		}

		$this->form_validation->set_rules('nip', 'NIP', 'trim|required');
		$this->form_validation->set_rules('password', 'Password', 'trim|required');

		if ($this->form_validation->run() == false) {
			$data['title'] = 'User Login';
			$data['body_class'] = 'login-page';
			$login_button = '<a href="'.$google_client->createAuthUrl().'" class="btn btn-google btn-user btn-block"> <i class="fa fa-google fa-fw"></i> Login with Google</a>';
			$data['login_button'] = $login_button;
			$this->load->view('themes/guru/auth/header', $data);
			$this->load->view('login', $data);
			$this->load->view('themes/guru/auth/footer');
		} else {
			//validasi sukses
			$this->_login();
		}
	}else{
		redirect('forbidden');
	}

	}

	private function _login()
	{
		$nip = $this->input->post('nip');
		$password = $this->input->post('password');
		$user = $this->db->get_where('m_pegawai', ['nip' => $nip])->row_array();
		if ($user) {
				//cek password
				if ($password==$user['password']) {
					$datapegawai = $this->db->get_where('m_pegawai', ['nip' => $nip])->row_array();
					if($datapegawai){
						$data = [
							'nip' => $datapegawai['nip'],
							'role_id' => '5',
							'guru_id'=> $datapegawai['id']
						];
						$this->session->set_userdata($data);
					redirect('guru');
				}}else {
					$this->session->set_flashdata('message', '<div class="alert alert-danger" role"alert">Wrong password!</div>');
					redirect('loginguru');
					}
				}else{
					$this->session->set_flashdata('message', '<div class="alert alert-danger" role"alert">Wrong Username and password!</div>');
					redirect('loginguru');
				}
	}


	public function logout()
	{
		$this->session->unset_userdata('email');
		$this->session->unset_userdata('nip');
		$this->session->unset_userdata('role_id');
		$this->session->unset_userdata('guru_id');
		$this->session->set_flashdata('message', '<div class="alert alert-success" role"alert">
		You have been logout!</div>');
		redirect('loginguru');
	}

	public function blocked()
	{
		$data['title'] = '404';
		$data['body_class'] = 'register-page';

		$this->load->view('themes/guru/auth/header', $data);
		$this->load->view('blocked', $data);
		$this->load->view('themes/guru/auth/footer');
	}


	//end class
}
