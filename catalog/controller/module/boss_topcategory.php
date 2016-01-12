<?php
class ControllerModuleBossTopcategory extends Controller {
    public function index($setting) {
		if(empty($setting)) return;
        static $module = 0;
		
		$data['heading_title'] = $setting['boss_topcategory_module']['title'][$this->config->get('config_language_id')];

		$this->load->model('catalog/category');
		$this->load->model('tool/image');
		
		$data['categories'] = array();
	
		
		if (isset($setting['boss_topcategory_check'])) {
			$categories = $setting['boss_topcategory_check'];
			foreach($categories as $category_id){
                $children_data = array();

    			$children = $this->model_catalog_category->getCategories($category_id);
    
    			foreach ($children as $child) {
    
    				$children_data[] = array(
    					'category_id' => $child['category_id'],
    					'name'        => $child['name'],
    					'href'        => $this->url->link('product/category', 'path=' . $category_id . '_' . $child['category_id'])	
    				);		
    			}
                
				$catagory_name = array();
				
				$catagory_name = $this->model_catalog_category->getCategory($category_id);
				
				if (isset($catagory_name['image']) && $catagory_name['image']) {
					$image = $this->model_tool_image->resize($catagory_name['image'], isset($setting['boss_topcategory_module']['width'])?$setting['boss_topcategory_module']['width']:80, isset($setting['boss_topcategory_module']['height'])?$setting['boss_topcategory_module']['height']:80);
				} else {
					$image = false;
				}
				$data['categories'][] = array(
						'title'	 		 =>	isset($catagory_name['name'])?$catagory_name['name']:'',
						'href'        => $this->url->link('product/category', 'path=' . $category_id),	
						'image'       => $image,
                        'children_data'     => $children_data
				);
			}
		}
		
		$data['module'] = $module++; 
       
	  
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/boss_topcategory.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/boss_topcategory.tpl', $data);
		} else {
			return $this->load->view('default/template/module/boss_topcategory.tpl', $data);
		}
    }
}

?>