<?php
class Upload extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->helper(array('html','url'));
	}
	public function upload_image()
	{
		$config['upload_path'] = './assets/images/uploads';
		$config['allowed_types'] = 'gif|jpg|png';
		$config['max_size'] = 100;
		$config['max_width'] = 1024;
		$config['max_height'] = 720;
		$this->load->library('upload',$config);
		if(!$this->upload->do_upload('file'))
		{
			echo json_encode(array('error'=> $this->upload->display_errors(), 'has-error' =>  'TRUE'));
		}
		else
		{
			json_encode(aray('data' => $this->upload->data(), 'has-error' => FALSE));
		}
	}
}
?>
