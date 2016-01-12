<?php 
class ControllerBossthemesWishlist extends Controller {
	public function add() {
		$this->language->load('bossthemes/wishlist');
		
		$json = array();

		if (!isset($this->session->data['wishlist'])) {
			$this->session->data['wishlist'] = array();
		}
				
		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}
		
		$this->load->model('catalog/product');
		
		$product_info = $this->model_catalog_product->getProduct($product_id);
		
		if ($product_info) {
			if (!in_array($this->request->post['product_id'], $this->session->data['wishlist'])) {	
				$this->session->data['wishlist'][] = $this->request->post['product_id'];
			}
					 
			$this->load->model('tool/image'); 
			$image = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
			  
			$json['title'] = $this->language->get('text_title');
			$json['thumb'] = sprintf($this->language->get('text_thumb'), $image);
			if ($this->customer->isLogged()) {
				$json['success'] = sprintf($this->language->get('text_success'), $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']), $product_info['name'], $this->url->link('account/wishlist'));				
			} else {
				$json['success'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'), $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']), $product_info['name'], $this->url->link('account/wishlist'));				
			}
			
			$json['total'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}	
		
		$this->response->setOutput(json_encode($json));
	}		

}
?>