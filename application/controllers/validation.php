
<?php
defined('BASEPATH') OR exit('Direct Script Access not Allowed!');
class validation extends CI_Controller
{
  public function ValidateUniqueEmpnumber()
  {
      $this->load->library('form_validation');
      $this->form_validation->set_rules('empnumber','Employee number','is_unique[user.emp_no]');
      if($this->form_validation->run())
      {
        echo "success";
      }
      else
      {
        echo validation_errors();
      }
  }
/*  public function ValidateUniqueEmail()
  {
      $this->load->library('form_validation');
    //$empnumber = $this->input->post('empnumber');
    $this->form_validation->set_rules('empnumber','Employee number','is_unique[user.emp_no]');
  }
  public function ValidateUniqueContact()
  {
      $this->load->library('form_validation');
    //$empnumber = $this->input->post('empnumber');
    $this->form_validation->set_rules('empnumber','Employee number','is_unique[user.emp_no]');
  }*/
  public function Login()
  {
    $this->load->library('form_validation');
    $this->form_validation->set_rules('email','E-mail','valid_email');
    $this->form_validation->set_rules('password','Password','min_length[6]|max_length[14]');
    if($this->form_validation->run())
    {
            $u_type=$this->input->post('usertype');
            $email=$this->input->post('email');
            $pwd=$this->input->post('password');

            $user_data=array(
            'email'=> $email,
            'password'=>$pwd);

            $this->load->model('loginModel');
            $id=$this->loginModel->validate_login($user_data,$u_type);

            if($id)
            {
              return redirect(base_url('Home'));
            }
            else
            {

              $data['title']='Login';
              $data['valid']=1;
              $data['viewuser']='public';
              $data['islogin']='false';
              $this->load->view('public/header',$data);
        			$this->load->view('public/login');
        			$this->load->view('public/footer',$data);
            }
    }



  }
  public function register()
	{
		$this->load->library('form_validation');
	//	$this->form_validation->set_rules('fullname','Full Name');
		$this->form_validation->set_rules('empnumber','Employee Number','numeric|min_length[3]|max_length[4]');
		$this->form_validation->set_rules('email','E-mail','valid_email');
		$this->form_validation->set_rules('contact','Contact','numeric|min_length[10]|max_length[10]');
		$this->form_validation->set_rules('password','Password','min_length[6]|max_length[14]');
		$this->form_validation->set_rules('cpassword','Confirm Password','min_length[6]|max_length[14]');
		if(strcmp($this->input->post('cpassword'),$this->input->post('password')) != 0)
		{
			$data['cpass']=1;
		}
		else
		{
			$data['cpass']=0;
		}
    if($this->form_validation->run())
    {
        //  $data['title']='Register';
        echo "yes";
         $data['valid']=0;
          $user_data=array(
								'full_name' => $this->input->post('fullname'),
								'emp_no' => $this->input->post('empnumber'),
								'email' => $this->input->post('email'),
								'ph_no' => $this->input->post('contact'),
								'address' => $this->input->post('address'),
								'u_type' => $this->input->post('usertype'),
                'gender'=>$this->input->post('gender'),
								'password' =>$this->input->post('password'));
                $this->db->insert('user', $user_data);
                echo "data inserted sucessfully";
                return redirect(base_url('Home'));
    }
 else
    {
      $data['title']='Register';
      $data['valid']=1;
      $data['viewuser']='public';
      $data['islogin']='false';
      $this->load->view('public/header',$data);
			$this->load->view('public/register');
			$this->load->view('public/footer',$data);
    }

  }
}
?>
