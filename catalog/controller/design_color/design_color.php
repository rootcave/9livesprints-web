<?php
class ControllerDesignColorDesignColor extends Controller {
	public function index() {
		

		$this->load->model('design_color/design_color');
		$this->load->model('tool/image');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		

		

		
			$this->document->setTitle('Design and Color');
			$this->document->setDescription('9livesprints design and color');
			$this->document->setKeywords('9livesprints,popular,color,design and color,');

			$data['breadcrumbs'][] = array(
				'text' => 'Design and Color',
				'href' => $this->url->link('design_color/design_color')
			);
			
						
			
			
			
			$data['heading_title'] = 'Design and Color';
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/design_color/design_color.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/design_color/design_color.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/design_color/design_color.tpl', $data));
			}
		}
		
}