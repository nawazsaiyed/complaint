<?php
defined('BASEPATH')OR exit("No Direct Script Access Allowed");
class User extends CI_Model
{
    public function __construct()
    {
      parent::__construct();
    }
    public function get_department()
    {
      $this->db->select(array('Dept_Name','deptid'));
      $this->db->from('deptmst');
      $r=$this->db->get();
      return $r->result();
    }
    public function get_single_department($deptid)
    {
      $this->db->select(array('Dept_Name','deptid'));
      $this->db->from('deptmst');
      $this->db->where('deptid',$deptid);
      $r=$this->db->get();
      return $r->result();
    }
    public function get_user($uid)
    {
      $this->db->select(array('u_id','full_name','address'));
      $this->db->from('user');
      $this->db->where('u_id',$uid);
      $q = $this->db->get();
      return $q->result();
    }
    public function get_ofice_location($uid)
    {
      $this->db->select('office_location');
      $this->db->from('user_dept');
      $this->db->where('u_id',$uid);
      $q = $this->db->get();
      return $q->result();
    }
    public function register($user,$department)
    {
      $this->db->insert('user',$user);
      $this->db->insert('user_dept',$department);

    }
}
 ?>
