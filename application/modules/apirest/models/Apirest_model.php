<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Apirest_model extends CI_Model
{
    public function getsiswaAll()
    {
        return $this->db->get('ppdb_siswa')->result_array();
    }
}