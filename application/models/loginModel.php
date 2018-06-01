<?php
defined('BASEPATH')OR exit("No Direct Script Access Allowed");
class LoginModel extends CI_Model
{
  public function admin_login($data)
  {
    		$table = 'admin';
    		$q = $this->db->get_where($table,$data);
    		if($q->num_rows())
    		{
    		  return  $q->row()->a_id;
    		}
    		else
    		{
    		  return FALSE;
    		}
  	}
    public function user_login($dataenrol)
    {
       $table='user';
       $this->db->select('u_id');
       $this->db->from($table);
       $this->db->where($dataenrol);
       $q=$this->db->get();
       if($q->num_rows() == 1)
       {
         return  $q->row()->u_id;
       }
       else
       {
         return FALSE;
       }
    }
    public function worker_login($logindata)
    {
       $table='worker';
       $this->db->select('w_id');
       $this->db->from($table);
       $this->db->where($logindata);
       $q=$this->db->get();
       if($q->num_rows() == 1)
       {
         return  $q->row()->w_id;
       }
       else
       {
         return FALSE;
       }
    }
}
?>
