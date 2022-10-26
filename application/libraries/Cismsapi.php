<?php
/**
 * PHP QR Code porting for Codeigniter
 *
 * @package        	CodeIgniter
 * @subpackage    	Libraries
 * @category    	Libraries
 * 
 * @version		1.0
 */
 
class Cismsapi
{
    
    
    public function sendsms($destination, $message, $apiUsername,$apiKey)
    {
	$urlsoap = 'http://smsapi.rosihanari.net/api.php';
	require_once('smsapi/nusoap.php');
	$client = new nusoap_client($urlsoap);
	$result = $client->call('sendsms', array('destination' => $destination, 'message' => $message, 'username' => $apiUsername, 'apikey' => $apiKey));
	return $result;
    }
    function cekkredit($apiUsername,$apiKey)
{
	$urlsoap = 'http://smsapi.rosihanari.net/api.php';
	require_once('smsapi/nusoap.php');
	$client = new nusoap_client($urlsoap);
	$result = $client->call('cekkredit', array('username' => $apiUsername, 'apikey' => $apiKey));
	return $result;
}
}
