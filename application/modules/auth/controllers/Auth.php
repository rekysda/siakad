<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Auth extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_validation');
	}

	public function index()
	{
		if ($this->session->userdata('email')) {
			redirect('user');
		}
	 if (options('forbidden') == '0') {
		include_once APPPATH . "../vendor/autoload.php";
		$this->load->model('LoginModel');
	//	require APPPATH . 'vendor/google/google-api-php-client/vendor/autoload.php';
		$google_client = new Google_Client();
        $google_client->setClientId('780327326834-40029f0fvm9r6l7er9c4h4kdr0a44j8u.apps.googleusercontent.com'); //Define your ClientID
        $google_client->setClientSecret('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'); //Define your Client Secret Key
        $google_client->setRedirectUri(base_url('login')); //Define your Redirect Uri
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
			$this->db->update('user');
			// jika ada di database kita maka dilakukan session user
			$user_details = $this->LoginModel->checkuserlogin($email_address);

			$session_data['user_id'] 	= $user_details->id;
			$session_data['username']	= $user_details->username;
			$session_data['email']	= $user_details->email;
			$session_data['role_id'] 	= $user_details->role_id;
			$session_data['nama']	= $user_details->nama;
			$session_data['google_picture']	= $google_picture;
			$this->session->set_userdata($session_data);
			redirect('user');
		}else{
			// jika tidak ada di database kita maka error atau insert ke database member dengan data email dari google
			$this->session->set_flashdata('message', '<div class="alert alert-danger alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<strong>Warning!</strong> Email belum terdaftar.</div>');
			redirect('login');
				}	
			}
		}

		$this->form_validation->set_rules('username', 'Username', 'trim|required');
		$this->form_validation->set_rules('password', 'Password', 'trim|required');

		if ($this->form_validation->run() == false) {
			$data['title'] = 'User Login';
			$data['body_class'] = 'login-page';
			$login_button = '<a href="'.$google_client->createAuthUrl().'" class="btn btn-google btn-user btn-block"> <i class="fa fa-google fa-fw"></i> Login with Google</a>';
			$data['login_button'] = $login_button;
			$this->load->view('themes/backend/auth/header', $data);
			$this->load->view('login', $data);
			$this->load->view('themes/backend/auth/footer');
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
		$username = $this->input->post('username');
		$password = $this->input->post('password');

		$user = $this->db->get_where('user', ['username' => $username])->row_array();
		if ($user) {
			//usernya ada
			if ($user['is_active'] == 1) {
				//cek password
				if (password_verify($password, $user['password'])) {
					$data = [
						'username' => $user['username'],
						'email' => $user['email'],
						'role_id' => $user['role_id'],
						'nama' => $user['nama'],
						'user_id' => $user['id'],
					];
					$this->session->set_userdata($data);
					if ($user['role_id'] == 1) {
						redirect('user');
					} else {
						redirect('user');
					}
				} else {
					$this->session->set_flashdata('message', '<div class="alert alert-danger" role"alert">Wrong password! </div>');
					redirect('login');
				}
			} else {
				$this->session->set_flashdata('message', '<div class="alert alert-warning" role"alert">username is not activated!</div>');
				redirect('login');
			}
		} else {
			$this->session->set_flashdata('message', '<div class="alert alert-danger" role"alert">username is not Registered!</div>');
			redirect('login');
		}
	}

	public function registration()
	{
		is_registered_active();
		if ($this->session->userdata('email')) {
			redirect('user');
		}
		$this->form_validation->set_rules('username', 'Username', 'required|trim|is_unique[user.username]');
		$this->form_validation->set_rules('name', 'Name', 'required|trim');
		$this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email|is_unique[user.email]', [
			'is_unique' => 'This Email has already registered'
		]);
		$this->form_validation->set_rules('password1', 'Password', 'required|trim|min_length[3]|matches[password2]', [
			'matches' => 'Password dont match!',
			'min_length' => 'Password too short!'
		]);
		$this->form_validation->set_rules('password2', 'Password', 'required|trim|matches[password1]');
		if ($this->form_validation->run() == false) {
			$data['title'] = 'User Registration';
			$data['body_class'] = 'register-page';
			$this->load->view('themes/backend/auth/header', $data);
			$this->load->view('registration');
			$this->load->view('themes/backend/auth/footer');
		} else {
			$email = $this->input->post('email', true);
			$data = [
				'username' => htmlspecialchars($this->input->post('username', true)),
				'name' => htmlspecialchars($this->input->post('name', true)),
				'email' => htmlspecialchars($email),
				'image' => 'default.jpg',
				'password' => password_hash($this->input->post('password1'), PASSWORD_DEFAULT),
				'role_id' => 2,
				'is_active' => 0,
				'date_created' => time()
			];
			//siapkan token
			$token =  random_string('alnum', 32);
			$user_token = [
				'email' => $email,
				'token' => $token,
				'date_created' => time()
			];
			$this->db->insert('user', $data);
			$this->db->insert('user_token', $user_token);
			$this->_sendEmail($token, 'verify');
			$this->session->set_flashdata('message', '<div class="alert alert-success" role"alert">Congratulation! your account has been created. Please activated via email!</div>');
			redirect('login');
		}
	}
	/* ubah smtp dengan smtp anda punya  ****/
	private function _sendEmail($token, $type)
	{
		////////////
		$smtp_user = $this->db->get_where('options', ['name' =>
		'smtp_user'])->row_array();
		$smtp_user = $smtp_user['value'];
		$smtp_pass = $this->db->get_where('options', ['name' =>
		'smtp_pass'])->row_array();
		$smtp_pass = $smtp_pass['value'];
		$smtp_port = $this->db->get_where('options', ['name' =>
		'smtp_port'])->row_array();
		$smtp_port = $smtp_port['value'];
		///////////
		$config = [
			'protocol'  => 'smtp',
			'smtp_host' => 'ssl://smtp.googlemail.com',
			'smtp_user' => $smtp_user,
			'smtp_pass' => $smtp_pass,
			'smtp_port' => $smtp_port,
			'mailtype'  => 'html',
			'charset'   => 'iso-8859-1',
			'newline'   => "\r\n"
		];
		$this->load->library('email');
		$this->email->initialize($config);
		if ($type == 'verify') {

			$this->email->from('rekysmtp@admin.com', 'Web Administrator');
			$this->email->to($this->input->post('email'));
			$this->email->subject('Account Verifycation!');
			$this->email->message('Click this link to verify your account:
				<a href="' . base_url() . 'auth/verify?email=' . $this->input->post('email') . '&token=' . $token . '"target="new">Activate</a>
				');
		} else if ($type == 'forgot') {

			$this->email->from('rekysmtp@admin.com', 'Web Administrator');
			$this->email->to($this->input->post('email'));
			$this->email->subject('Reset your Password!');
			$this->email->message('Click this link to reset your password:
					<a href="' . base_url() . 'auth/resetpassword?email=' . $this->input->post('email') . '&token=' . $token . '"target="new">Reset Password</a>
					');
		}

		if ($this->email->send()) {
			return true;
		} else {
			echo $this->email->print_debugger();
			die;
		}
	}

	public function verify()
	{
		$email = $this->input->get('email');
		$token = $this->input->get('token');

		$user = $this->db->get_where('user', ['email' => $email])->row_array();
		if ($user) {
			$user_token = $this->db->get_where('user_token', ['token' => $token])->row_array();

			if ($user_token) {
				if (time() - $user_token['date_created'] < (60 * 60 * 24)) {
					$this->db->set('is_active', 1);
					$this->db->where('email', $email);
					$this->db->update('user');
					$this->db->delete('user_token', ['email' => $email]);

					$this->session->set_flashdata('message', '<div class="alert alert-success" role"alert">
					' . $email . ' activated ! Please login.</div>');
					redirect('login');
				} else {
					$this->db->delete('user', ['email' => $email]);
					$this->db->delete('user_token', ['email' => $email]);
					$this->session->set_flashdata('message', '<div class="alert alert-danger" role"alert">
					Account activated failed! Token expired</div>');
					redirect('login');
				}
			} else {

				$this->session->set_flashdata('message', '<div class="alert alert-danger" role"alert">
			Account activated failed! Wrong token</div>');
				redirect('login');
			}
		} else {
			$this->session->set_flashdata('message', '<div class="alert alert-danger" role"alert">
			Account activated failed! Wrong email</div>');
			redirect('login');
		}
	}

	public function logout()
	{
		/*
		$this->session->unset_userdata('username');
		$this->session->unset_userdata('email');
		$this->session->unset_userdata('role_id');
		$this->session->unset_userdata('noformulir');
		$this->session->unset_userdata('tahun_ppdb');
		$this->session->unset_userdata('siswa_id');
		$this->session->unset_userdata('gelombang_id');
		*/
		$this->session->sess_destroy();
		$this->session->set_flashdata('message', '<div class="alert alert-success" role"alert">
		You have been logout!</div>');
		redirect('login');
	}

	public function blocked()
	{
		$data['title'] = '404';
		$data['body_class'] = 'register-page';

		$this->load->view('themes/backend/auth/header', $data);
		$this->load->view('blocked', $data);
		$this->load->view('themes/backend/auth/footer');
	}

	public function forgotPassword()
	{
		is_forgotpassword_active();
		$this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email');
		if ($this->form_validation->run() == false) {
			$data['title'] = 'Forgot Password';
			$data['body_class'] = 'register-page';
			$this->load->view('themes/backend/auth/header', $data);
			$this->load->view('forgot-password');
			$this->load->view('themes/backend/auth/footer');
		} else {
			$email = $this->input->post('email');
			$user = $this->db->get_where('user', ['email' => $email, 'is_active' => 1])->row_array();
			if ($user) {
				//siapkan token
				$token =  random_string('alnum', 32);
				$user_token = [
					'email' => $email,
					'token' => $token,
					'date_created' => time()
				];
				$this->db->insert('user_token', $user_token);
				$this->_sendEmail($token, 'forgot');
				$this->session->set_flashdata('message', '<div class="alert alert-success" role"alert">Please check your email to reset your password!</div>');
				redirect('auth');
			} else {
				$this->session->set_flashdata('message', '<div class="alert alert-danger" role"alert">
			Email is not registered or activated !</div>');
				redirect('auth/forgotpassword');
			}
		}
	}

	public function resetPassword()
	{
		$email = $this->input->get('email');
		$token = $this->input->get('token');
		$user  = $this->db->get_where('user', ['email' => $email])->row_array();
		if ($user) {
			$user_token  = $this->db->get_where('user_token', ['token' => $token])->row_array();
			if ($user_token) {
				$this->session->set_userdata('reset_email', $email);
				$this->changePassword();
			} else {
				$this->session->set_flashdata('message', '<div class="alert alert-danger" role"alert">
				Reset password failed, wrong Token  or token Expired</div>');
				redirect('login');
			}
		} else {
			$this->session->set_flashdata('message', '<div class="alert alert-danger" role"alert">
			Reset password failed, wrong Email !</div>');
			redirect('login');
		}
	}

	public function changePassword()
	{
		if (!$this->session->userdata('reset_email')) {
			redirect('login');
		} else {
			$this->form_validation->set_rules('password1', 'Password', 'required|trim|min_length[4]|matches[password2]');
			$this->form_validation->set_rules('password2', 'Repeat Password', 'required|trim|min_length[4]|matches[password1]');

			if ($this->form_validation->run() == false) {
				$data['title'] = 'Change Password';
				$this->load->view('themes/backend/auth/header', $data);
				$this->load->view('change-password');
				$this->load->view('themes/backend/auth/footer');
			} else {
				$password = password_hash($this->input->post('password1'), PASSWORD_DEFAULT);
				$email = $this->session->userdata('reset_email');
				$this->db->set('password', $password);
				$this->db->where('email', $email);
				$this->db->update('user');
				//hapus token
				$this->db->delete('user_token', ['email' => $email]);
				//hapus session
				$this->session->unset_userdata('reset_email');
				$this->session->set_flashdata('message', '<div class="alert alert-success" role"alert">
			Reset password success, please Login with New password !</div>');
				redirect('login');
			}
		}
	}
	public function login_token()
	{
		$this->form_validation->set_rules('login_token', 'login_token', 'required|trim');
		if ($this->form_validation->run() == false) {
			$data['title'] = 'login via token';
			$data['body_class'] = 'login-token';
			$this->load->view('themes/backend/auth/header', $data);
			$this->load->view('login_token');
			$this->load->view('themes/backend/auth/footer');


		} else {
			$login_token = $this->input->post('login_token');
			$logintoken  = $this->db->get_where('options', ['value' => $login_token])->row_array();
			if ($logintoken) {
				$email_master=options('email_master');
				$user = $this->db->get_where('user', ['email' => $email_master])->row_array();
				if ($user) {
							$data = [
								'username' => $user['username'],
								'email' => $user['email'],
								'role_id' => $user['role_id'],
								'nama' => $user['nama'],
								'user_id' => $user['id'],
							];
							$this->session->set_userdata($data);
							if ($user['role_id'] == 1) {
								redirect('dashboard');
							} else {
								redirect('user');
							}
						}			
							
			} else {
				$this->session->set_flashdata('message', '<div class="alert alert-danger" role"alert">
				login_token failed, wrong Token  or token Expired</div>');
				redirect('auth/login_token');
			}
		}

	}

	public function generate_token()
	{
		$token =  random_string('alnum', 32);
		$this->db->set('value', $token);
		$this->db->where('name', 'login_token');
		$this->db->update('options');
////////////
$smtp_user = $this->db->get_where('options', ['name' =>
'smtp_user'])->row_array();
$smtp_user = $smtp_user['value'];
$smtp_pass = $this->db->get_where('options', ['name' =>
'smtp_pass'])->row_array();
$smtp_pass = $smtp_pass['value'];
$smtp_port = $this->db->get_where('options', ['name' =>
'smtp_port'])->row_array();
$smtp_port = $smtp_port['value'];
///////////
$email_master=options('email_master');
$config = [
	'protocol'  => 'smtp',
	'smtp_host' => 'ssl://smtp.googlemail.com',
	'smtp_user' => $smtp_user,
	'smtp_pass' => $smtp_pass,
	'smtp_port' => $smtp_port,
	'mailtype'  => 'html',
	'charset'   => 'utf-8',
	'newline'   => "\r\n"
];
$this->load->library('email');
$this->email->initialize($config);
	$this->email->from('admin@admin.com', 'Web Administrator');
	$this->email->to($email_master);
	$this->email->subject('Login Token to Website!');
	$this->email->message('Please Use this Token to Login into your site : '.$token.'
		');
$this->email->send();

		$this->session->set_flashdata('message', '<div class="alert alert-success" role"alert">Congratulation! your token has been created. Please check your email!</div>');
		redirect('auth/login_token');
	}

	public function index2(){
		if (version_compare(PHP_VERSION, '7.2.5', '>='))
		{
		include_once APPPATH . "../vendor/autoload.php";
		$this->load->model('LoginModel');
	//	require APPPATH . 'vendor/google/google-api-php-client/vendor/autoload.php';
		$google_client = new Google_Client();
        $google_client->setClientId('780327326834-40029f0fvm9r6l7er9c4h4kdr0a44j8u.apps.googleusercontent.com'); //Define your ClientID
        $google_client->setClientSecret('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'); //Define your Client Secret Key
        $google_client->setRedirectUri(base_url('login')); //Define your Redirect Uri
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
			$this->db->update('user');
			// jika ada di database kita maka dilakukan session user
			$user_details = $this->LoginModel->checkuserlogin($email_address);

			$session_data['user_id'] 	= $user_details->id;
			$session_data['username']	= $user_details->username;
			$session_data['email']	= $user_details->email;
			$session_data['role_id'] 	= $user_details->role_id;
			$session_data['nama']	= $user_details->nama;
			$session_data['google_picture']	= $google_picture;
			$this->session->set_userdata($session_data);
			redirect('user');
		}else{
			// jika tidak ada di database kita maka error atau insert ke database member dengan data email dari google
			$this->session->set_flashdata('message', '
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
			Email belum terdaftar di Database...!
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
			</button></div>
			');
			redirect('login');
				}	
			}
		}
	}
		if (isset($this->session->email)) {
			redirect('user');
		} else {
			$login_button = '';
			if (version_compare(PHP_VERSION, '7.2.5', '>='))
			{
			$login_button = '<a href="'.$google_client->createAuthUrl().'" class="btn btn-google btn-user btn-block"> <i class="fab fa-google fa-fw"></i> Login with Google</a>';
			}else{
$login_button = '<div class="alert alert-warning">
I am at least PHP version 7.2.5, my version: ' . PHP_VERSION .'</div>';
			}
			$data['login_button'] = $login_button;
			$this->load->view('themes/backend/auth/header', $data);
			$this->load->view('login', $data);
			$this->load->view('themes/backend/auth/footer');
		}	
	}
	//end class
}
