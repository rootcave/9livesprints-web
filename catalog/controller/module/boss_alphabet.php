<?php  
class ControllerModuleBossAlphabet extends Controller {
	public function index($setting) { 
		if(empty($setting)) return;
		$data['heading_title'] = isset($setting['boss_alphabet_module']['title'][$this->config->get('config_language_id')]) ? $setting['boss_alphabet_module']['title'][$this->config->get('config_language_id')] : '';
		
		$alphabet = array("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z");
		foreach($alphabet as $char)
		{
			$data['alphabet'][] = array(
				'char' 		=> $char,
				'href'      => $this->url->link('bossthemes/product_by_alphabet', 'c=' . $char)
			);
		}
		$data['alphabet'][] = array(
			'char'		=> "#",
			'href'     	=> $this->url->link('bossthemes/product_by_alphabet', 'c=0')
		);

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/boss_alphabet.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/boss_alphabet.tpl';
			return $this->load->view($this->config->get('config_template') . '/template/module/boss_alphabet.tpl', $data);
		} else {
			return $this->load->view('default/template/module/boss_alphabet.tpl', $data);
		}
		
		
  	}
}
?>