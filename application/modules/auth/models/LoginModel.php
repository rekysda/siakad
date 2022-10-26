<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class LoginModel extends CI_Model {

    function Is_already_register_email($email)
    {
        $this->db->where('email', $email);
        $query = $this->db->get('user');
        if ($query->num_rows() > 0) {
            return true;
        } else {
            return false;
        }
    }

    function Update_user_data($data, $id)
    {
        $this->db->where('login_oauth_uid', $id);
        $this->db->update('user', $data);
    }

    public function checkuserlogin($useremail){
		$user_details = $this->db->select('*')
							->from('user')
							->where('email',$useremail)
							->get()
							->row();
		return 	$user_details;
	}

}