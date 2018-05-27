<?php
defined('BASEPATH')OR exit('NO Direct Script Access Allowed');
class Complaint extends CI_Controller
{
  public function __construct()
  {
    parent::__construct();
    $this->load->model('ComplaintModel');
    $this->load->model('User');
    date_default_timezone_set('Asia/kolkata');
  }
  public function get_category()
  {
    $json_obj = $this->input->post('obj');
    $obj = json_decode($json_obj);
    if($obj->location == 'residance')
      echo json_encode($this->ComplaintModel->get_category_description($obj->id,2));
    else
      echo json_encode($this->ComplaintModel->get_category_description($obj->id,1));
  }
  public function get_user_address()
  {
    $json_obj = $this->input->post('obj');
    $obj = json_decode($json_obj);
    if( $obj->location == 'hostel' || $obj->location == 'residance')
    {
      $user = $this->User->get_user($obj->uid);
      echo $user[0]->address;
    }
    else if( $obj->location == 'department')
    {
      $office = $this->User->get_ofice_location($obj->uid);
      echo $office[0]->office_location;
    }
  }
  public function register()
  {
    $cate_id = $this->input->post('complaintype');
    $uid = $this->input->post('empnumber');
    $description = $this->input->post('cdescription');
    $date = date('Y-m-d');
    $location = $this->input->post('address');
    $cnfo = array('cate_id' => $cate_id, 'u_id' => $uid, 'c_description' => $description, 'c_date' => $date);
    $this->ComplaintModel->register_complaint($cinfo,$location);
  }
}
 ?>
