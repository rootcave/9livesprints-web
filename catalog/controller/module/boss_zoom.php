<?php
class ControllerModuleBossZoom extends Controller {
	public function index($setting) {	
			if(empty($setting)) return;
			$this->document->addScript('catalog/view/javascript/bossthemes/fancybox/jquery.fancybox.js');
			$this->document->addStyle('catalog/view/javascript/bossthemes/fancybox/jquery.fancybox.css');			
			if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/bossthemes/cloud-zoom.1.0.3.css')) {
				$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/bossthemes/cloud-zoom.1.0.3.css');
			} else {
				$this->document->addStyle('catalog/view/theme/default/stylesheet/bossthemes/cloud-zoom.1.0.3.css');
			}
			
			$this->load->language('module/boss_zoom');

			$data['text_view_zoom'] = $this->language->get('text_view_zoom');
			
			
			$data['thumb_image_width'] = $setting['boss_zoom_module']['thumb_image_width']; 
			$data['thumb_image_heigth'] = $setting['boss_zoom_module']['thumb_image_height']; 
			$data['zoom_image_width'] = $setting['boss_zoom_module']['zoom_image_width']; 
			$data['zoom_image_heigth'] = $setting['boss_zoom_module']['zoom_image_height']; 
			$data['zoom_area_width'] = $setting['boss_zoom_module']['zoom_area_width']; 
			$data['zoom_area_heigth'] = $setting['boss_zoom_module']['zoom_area_height']; 
			$data['addition_image_width'] = $setting['boss_zoom_module']['addition_image_width']; 
			$data['addition_image_heigth'] = $setting['boss_zoom_module']['addition_image_height']; 
			$data['position_zoom_area'] = $setting['boss_zoom_module']['position_zoom_area']; 
			$data['adjustX'] = $setting['boss_zoom_module']['adjustX']; 
			$data['adjustY'] = $setting['boss_zoom_module']['adjustY']; 
			$data['title_image'] = $setting['boss_zoom_module']['title_image']; 
			$data['title_opacity'] = $setting['boss_zoom_module']['title_opacity']; 
			$data['tint'] = $setting['boss_zoom_module']['tint']; 
			$data['tintOpacity'] = $setting['boss_zoom_module']['tintOpacity']; 
			$data['softfocus'] = $setting['boss_zoom_module']['softfocus']; 
			$data['lensOpacity'] = $setting['boss_zoom_module']['lensOpacity']; 
			$data['smoothMove'] = $setting['boss_zoom_module']['smoothMove']; 
			
			if (isset($this->request->get['product_id'])) {
				$product_id = (int)$this->request->get['product_id'];
			} else {
				$product_id = 0;
			}
			
			$this->load->model('catalog/product');
			$product_info = $this->model_catalog_product->getProduct($product_id);
			$data['heading_title'] = $product_info['name'];
			
			$this->load->model('tool/image');
			$data['images'] = array();
			$results = $this->model_catalog_product->getProductImages($product_id);
			//Thumb Image
			if ($product_info['image']) {
				$data['popup'] = $this->model_tool_image->resize($product_info['image'], $data['zoom_image_width'] ,$data['zoom_image_heigth'] );
				$data['thumb'] = $this->model_tool_image->resize($product_info['image'], $data['thumb_image_width'], $data['thumb_image_heigth']);
			} else {
				if($results){
					$data['popup'] = $this->model_tool_image->resize($results[0]['image'], $data['zoom_image_width'] ,$data['zoom_image_heigth'] );
					$data['thumb'] = $this->model_tool_image->resize($results[0]['image'], $data['thumb_image_width'], $data['thumb_image_heigth']);
					unset($results[0]);
				}else{
					$data['popup'] = '';
					$data['thumb'] = '';
				}
			}
			//addition image
			if ($product_info['image']) {
				$data['images'][] =  array(
					'popup' =>$this->model_tool_image->resize($product_info['image'], $data['zoom_image_width'] ,$data['zoom_image_heigth'] ),
					'addition' => $this->model_tool_image->resize($product_info['image'], $data['addition_image_width'], $data['addition_image_heigth']),
					'thumb'   => $this->model_tool_image->resize($product_info['image'], $data['thumb_image_width'], $data['thumb_image_heigth']),
				);
			}
			foreach ($results as $result) {
				$data['images'][] = array(
					'popup' => $this->model_tool_image->resize($result['image'], $data['zoom_image_width'], $data['zoom_image_heigth']),
					'addition' => $this->model_tool_image->resize($result['image'], $data['addition_image_width'], $data['addition_image_heigth']),
					'thumb'   => $this->model_tool_image->resize($result['image'], $data['thumb_image_width'], $data['thumb_image_heigth']),
				);
			}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/boss_zoom.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/boss_zoom.tpl', $data);
		} else {
			return $this->load->view('default/template/module/boss_zoom.tpl', $data);
		}
	}
}
?>