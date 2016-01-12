<?php  
class ControllerModuleBossCategory extends Controller {
	public function index($setting) { 
		if(empty($setting)) return;
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/bossthemes/boss_category.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/bossthemes/boss_category.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/bossthemes/boss_category.css');
		}
	
		$data['heading_title'] = isset($setting['title'][$this->config->get('config_language_id')]) ? $setting['title'][$this->config->get('config_language_id')] : '';
		
		$data['column'] = isset($setting['column'])?$setting['column']:1;
		$data['width'] = isset($setting['width'])?$setting['width']:1;
		$skin = isset($setting['type'])?$setting['type']:1;
		$data['skin'] = isset($skin)?$skin:0;
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}			
		
		if (isset($parts[0])) {
			$data['category_id'] = $parts[0];
		} else {
			$data['category_id'] = 0;
		}
		
		if (isset($parts[1])) {
			$data['child_id'] = $parts[1];
		} else {
			$data['child_id'] = 0;
		}
		
		if (isset($parts[0])) {
			$data['category_id'] = $parts[0];
		} else {
			$data['category_id'] = 0;
		}
						
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			$total = $this->model_catalog_product->getTotalProducts(array('filter_category_id' => $category['category_id']));
			$children_data = array();
		
			$children = $this->model_catalog_category->getCategories($category['category_id']);

			foreach ($children as $child) {
				$data_filter = array(
					'filter_category_id'  => $child['category_id'],
					'filter_sub_category' => true
				);

				$product_total = $this->model_catalog_product->getTotalProducts($data_filter);

				$total += $product_total;

				$children_data[] = array(
					'category_id' => $child['category_id'],
					'name'        => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
					'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])	
				);		
			}
			$data['categories'][] = array(
				'category_id' => $category['category_id'],
				'name'        => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $total . ')' : ''),
				'children'	  => (isset($skin) && $skin==1)?$this->getChildrenCategory($category, $category['category_id']):$children_data,
				'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
			);	
			
		}					
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/boss_category.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/boss_category.tpl', $data);
		} else {
			return $this->load->view('default/template/module/boss_category.tpl', $data);
		}
		
		//$this->cache->set('boss_category.' . (int)$this->config->get('config_language_id'),$this->render());
		
		//$this->render();
	}
	
	private function getChildrenCategory($category, $path)
	{
		$children_data = array();
		
		$children = $this->model_catalog_category->getCategories($category['category_id']);
		
		foreach ($children as $child) {
			/*$data = array(
				'filter_category_id'  => $child['category_id'],
				'filter_sub_category' => true	
			);	*/	
								
			$children_data[] = array(
				'name'  	=> $child['name'],
				'children' 	=> $this->getChildrenCategory($child, $path . '_' . $child['category_id']),
				'column'   	=> 1,
				'href'  => $this->url->link('product/category', 'path=' . $path . '_' . $child['category_id'])	
			);
			
		}
		return $children_data;
	}
}
?>