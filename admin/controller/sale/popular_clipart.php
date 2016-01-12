<?php
class ControllerSalePopularClipart extends Controller {
	private $error = array();

	public function index() {
		
		$this->document->setTitle($this->language->get('Popular Clipart'));
		$this->load->model('sale/halloffame_coupon');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('sale/popular_clipart', 'token=' . $this->session->data['token'], 'SSL')
		);

		$results = $this->model_sale_halloffame_coupon->getPopularClipart();
		
		foreach ($results as $result) {
			$data['cliparts'][] = array(
				'clipart_title' => $result['clipart_title'],
				'clipart_thumb' => $result['clipart_thumb']				
			);
		}

		$data['heading_title'] = 'Popular Clipart';
		$data['header']        = $this->load->controller('common/header');
		$data['column_left']   = $this->load->controller('common/column_left');
		$data['footer']        = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('sale/popular_clipart.tpl', $data));		
	}	
				
}
