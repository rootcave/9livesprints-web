<?php
class ControllerSaleHalloffameCoupon extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('sale/halloffame_coupon');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('sale/halloffame_coupon');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('sale/halloffame_coupon', 'token=' . $this->session->data['token'], 'SSL')
		);

		$results = $this->model_sale_halloffame_coupon->getCoupons();
		
		foreach ($results as $result) {
			$data['coupon'][] = array(
				'id'          => $result['hft_id'],
				'customer_id' => $result['customer_id'],	
				'status'      => $result['hft_status'],
				'delete'      => $this->url->link('sale/halloffame_coupon/delete', 'token=' . $this->session->data['token'] . '&id=' . $result['hft_id'], 'SSL')
			);
		}


		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_missing'] = $this->language->get('text_missing');


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('sale/halloffame_coupon.tpl', $data));


		
	}	
				
}
