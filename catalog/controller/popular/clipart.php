<?php
class ControllerPopularClipart extends Controller {
	public function index() {
		

		$this->load->model('catalog/popular_clipart');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		

		

		
			$this->document->setTitle('Popular Clipart');
			$this->document->setDescription('9livesprints popular clipart');
			$this->document->setKeywords('9livesprints,popular,clipart,custom design clipart,');

			$data['breadcrumbs'][] = array(
				'text' => 'Popular Clipart',
				'href' => $this->url->link('popular/clipart')
			);
			
			$url = '';
			
			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
			} else {
				$page = 1;
			}

			if (isset($this->request->get['limit'])) {
				$limit = $this->request->get['limit'];
			} else {
				$limit = $this->config->get('config_product_limit');
			}


			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}


			$filter_data = array(				
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
			);

			$total_clipart = $this->model_catalog_popular_clipart->getTotalPopularClipart($filter_data);
			$results = $this->model_catalog_popular_clipart->getPopularClipart($filter_data);
			foreach ($results as $result) {
				$data['cliparts'][] = array(
					'clipart_title' => $result['clipart_title'],
					'clipart_thumb' => $result['clipart_thumb']				
				);
			}
		
			$pagination = new Pagination();
			$pagination->total = $total_clipart;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->url = $this->url->link('popular/clipart','&page={page}');

			$data['pagination'] = $pagination->render();

			$data['results'] = sprintf($this->language->get('text_pagination'), ($total_clipart) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($total_clipart - $limit)) ? $total_clipart : ((($page - 1) * $limit) + $limit), $total_clipart, ceil($total_clipart / $limit));

			$data['limit'] = $limit;



			$data['heading_title'] = 'Popular Clipart';
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/popular/clipart.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/popular/clipart.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/popular/clipart.tpl', $data));
			}
		}
		
}