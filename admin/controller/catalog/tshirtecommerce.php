<?php
class ControllerCatalogTshirtecommerce extends Controller{
	private $error = array();
	
    public function index(){	
		
		$this->language->load('module/tshirtecommerce');
		$this->document->setTitle($this->language->get('heading_title'));
		
		// get language
		$data['product_build'] = $this->language->get('product_build');
		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);
		
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/tshirtecommerce/index', 'token=' . $this->session->data['token'], 'SSL')
		);
		
		$url = str_replace('/admin/', '', HTTP_SERVER) . '/tshirtecommerce/admin/index.php';		
		$data['url'] = $url;
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/tshirtecommerce.tpl', $data));
    }	
	
	function write_to_file($text,$new_filename){
		$fp = fopen($new_filename, 'w');
		fwrite($fp, $text);
		fclose($fp);
	}
	
	// check update
	public function update()
	{
		
		$this->language->load('module/tshirtecommerce');
		$this->document->setTitle($this->language->get('heading_title'));
		
		// auto update
		if ($this->request->server['REQUEST_METHOD'] == 'POST')
		{
			$version = $this->request->post['update'];
			$file = 'http://updates.tshirtecommerce.com/opencart/'.$version;
			$content = $this->openURL($file);
			if ($content !== false)
			{
				// upload tool
				$path = dirname(DIR_SYSTEM) .'/tool_'. $version;
				if(file_put_contents($path, $content))
				{
					$zip = new ZipArchive();
					if ($zip->open($path))
					{
						$zip->extractTo(dirname(DIR_SYSTEM));
						$zip->close();
						$data['success'] = $this->language->get('updata_success');
					}
					else
					{
						$data['error_warning'] = $this->language->get('updata_not_update');
					}
				}
				else
				{
					$data['error_warning'] = $this->language->get('updata_not_update');
				}
				
				//upload opencart
				$file = 'http://updates.tshirtecommerce.com/opencart/'.VERSION .'/'. $version;
				$content = $this->openURL($file);
				if ($content !== false)
				{
					$path = dirname(DIR_SYSTEM) .'/opencart_'. $version;
					if(file_put_contents($path, $content))
					{
						$zip = new ZipArchive();
						if ($zip->open($path))
						{
							$zip->extractTo(dirname(DIR_SYSTEM));
							$zip->close();							
						}						
					}
				}
			}
			else
			{
				$data['error_warning'] = $this->language->get('updata_file_found');
			}
		}
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		}
		
		if (isset($this->error['code'])) {
			$data['error_warning'] = $this->error['code'];
		}
		
		// load language
		$data['updata_head'] = $this->language->get('updata_head');
		$data['updata_version'] = $this->language->get('updata_version');
		$data['updata_fontd'] = $this->language->get('updata_fontd');
		
		// check version
		$file 		= dirname(DIR_SYSTEM) . '/tshirtecommerce/version.json';
		$version	= '';
		if (file_exists($file))
		{
			$str 		= file_get_contents($file);
			if ($str !== false)
			{
				$content 	= json_decode($str);
				$version = $content->version;
			}
		}
		$data['version'] = $version;
		
		// load update content
		$file = 'http://updates.tshirtecommerce.com/opencart/updates.json';
		$content = $this->openURL($file);
		if ($content !== false)
		{
			$versions 		= json_decode($content);
			
			if (count($versions))
			{
				$data['versions'] = $versions;
			}
		}
		
		$data['link'] = $this->url->link('catalog/tshirtecommerce/update', 'token=' . $this->session->data['token'], 'SSL');
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $data['link']
		);
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/tshirtecommerce_update.tpl', $data));		
	}
	
	function openURL($url)
	{		
		if( ini_get('allow_url_fopen') )
		{
			$data = @file_get_contents($url);
			if ($data == false)
				return false;
		}
		else
		{		
			$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL, $url);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			$data = curl_exec($ch);
			curl_close($ch);
		}
		return $data;
	}
	
	public function ajax(){		
		$url = str_replace('/admin/', '', HTTP_SERVER) . '/tshirtecommerce/admin.php?key=123';			
		echo $this->openURL($url);		
		exit;
	}
	
	
	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/tshirtecommerce'))
		{
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if ($_FILES["import_design"]["name"] == '')
		{
			$this->error['code'] = $this->language->get('error_name');			
		}
		
		if (!$this->error)
		{
			return true;
		}
		else 
		{
			return $this->error;
		}	
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'catalog/tshirtecommerce')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['designer_code']) {
			$this->error['code'] = $this->language->get('error_code');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/tshirtecommerce')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true; 
		} else {
			return false;
		}
	}

	protected function validateRepair() {
		if (!$this->user->hasPermission('modify', 'catalog/tshirtecommerce')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true; 
		} else {
			return false;
		}
	}
}
?>