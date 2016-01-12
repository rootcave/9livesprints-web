<?php
class ControllerTshirtecommerceDesigner extends Controller {
	
	private $error = array();

	public function index() {
		$data = array();
		
		$check = false;
		if ( isset($this->request->get['product_id']) && isset($this->request->get['parent_id']) ) 
		{
			$check 			= true;
			
			$product_id 	= $this->request->get['product_id'];
			$parent_id 		= $this->request->get['parent_id'];
		}
		else
		{
			$product_id 	= $this->config->get('tshirtecommerce_product');
			
			if ($product_id)
			{
				$this->load->model('tshirtecommerce/order');
				$product 	= $this->model_tshirtecommerce_order->getProduct((int)$product_id);
				
				if ($product !== false)
				{
					$check 		= true;
					$product_id = $product['design_product_id'];
					$parent_id 	= $product['product_id'];
				}
			}			
		}
		
		if( $check == true)
		{
			$url 			= HTTP_SERVER;
			$data['url'] 	= $url;
			
			$params = explode(':', $product_id);
			$view = '<div class="row-designer"></div>';
			if (count($params) > 1)
			{			
				$data['urlDesignload'] = $url.'/tshirtecommerce/index.php?product='.$params[2].'&color='.$params[3].'&user='.$params[0].'&id='.$params[1].'&parent='.$parent_id;
				$data['product_id']	= $product_id;
				$data['parent_id']	= $parent_id;
			}
			else
			{				
				$data['urlDesignload'] = $url.'/tshirtecommerce/index.php?product='.$product_id.'&parent='.$parent_id;
				$data['product_id']	= $product_id;
				$data['parent_id']	= $parent_id;
			}
		}
		else
		{
			$view 	= 'Product Not Found.';
		}
		
		$file = dirname(DIR_SYSTEM) . '/tshirtecommerce/data/settings.json';
		if ( file_exists($file) )
		{
			$setting = file_get_contents($file);
			
			$setting = json_decode($setting);
			
			if (isset($setting->site_name))
			{
				$this->document->setTitle($setting->site_name);
			}
			
			if (isset($setting->site_name))
			{
				$this->document->setDescription($setting->meta_description);
			}
			
			if (isset($setting->site_name))
			{
				$this->document->setKeywords($setting->meta_keywords);
			}			
		}
		
		$data['content']	= $view;
		
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		
		$this->response->setOutput($this->load->view('default/template/tshirtecommerce/design.tpl', $data));		
	}
	
	public function ajax()
	{
		$this->load->model('tshirtecommerce/order');
		$products 	= $this->model_tshirtecommerce_order->getProducts();
		
		if ($products == 0) return false;
		
		$design_ids = array();
		foreach($products as $product)
		{
			$temp = explode(':', $product['design_product_id']);
			if (count($temp) == 1)
			{
				$design[$product['design_product_id']] = $product['product_id'];
				$design_ids[] = $product['design_product_id'];
			}			
		}
		
		$file = dirname(DIR_SYSTEM) . '/tshirtecommerce/data/products.json';
		$array = array(
			'products' => array()
		);
		if (file_exists($file))
		{			
			$string = file_get_contents($file);
			if ($string != false)
			{
				$products = json_decode($string);
				if ( isset($products->products) && count($products->products) > 0)
				{
					// find categories
					$cate_products = $design_ids;
					if (isset($_POST['id']) && $_POST['id'] > 0)
					{
						$category_id = $_POST['id'];
						$cate_file = dirname(DIR_SYSTEM) .'/tshirtecommerce/data/product_categories.json';
						
						if (file_exists($cate_file))
						{
							$product_ids = array();
							$content = file_get_contents($cate_file);
							
							if ($content != false)
							{
								$data = json_decode($content);
								
								for($i=0; $i < count($data); $i++)
								{
									if ($data[$i]->cate_id == $category_id && !in_array($data[$i]->product_id, $product_ids))
									{
										$product_ids[] = $data[$i]->product_id;
									}
								}
							}
							$cate_products = $product_ids;
						}
					}
					
					//echo '<pre>'; print_r($cate_products); exit;
									
					
					foreach($products->products as $product)
					{
						if ( in_array($product->id, $design_ids) && in_array($product->id, $cate_products) )
						{
							$product->parent_id = $design[$product->id];
							
							if (isset($product->attributes->name))
							{
								$product->attribute = $this->getAttributes($product->attributes);
							}
							else
							{
								$product->attribute = '';
							}
							$product->attribute .= $this->quantity($product->min_order);
								
							$array['products'][] = $product;
						}
					}
				}
			}
		}
		echo json_encode($array);
		
		exit();
	}
	
	// get attribute of product
	public function getAttributes($attribute)
	{
		if (isset($attribute->name) && $attribute->name != '')
		{
			$attrs = new stdClass();
			
			if (is_string($attribute->name))
				$attrs->name 		= json_decode($attribute->name);
			else
				$attrs->name 		= $attribute->name;
			
			if (is_string($attribute->titles))
				$attrs->titles 		= json_decode($attribute->titles);
			else
				$attrs->titles 		= $attribute->titles;
			
			if (is_string($attribute->prices))
				$attrs->prices 		= json_decode($attribute->prices);
			else
				$attrs->prices 		= $attribute->prices;
			
			if (is_string($attribute->type))
				$attrs->type 		= json_decode($attribute->type);
			else
				$attrs->type 		= $attribute->type;
			
			$html 				= '';
			for ($i=0; $i<count($attrs->name); $i++)
			{
				$html 	.= '<div class="form-group product-fields">';
				$html 	.= 		'<label for="fields">'.$attrs->name[$i].'</label>';
				
				$id 	 = 'attribute['.$i.']';
				$html 	.= 		$this->field($attrs->name[$i], $attrs->titles[$i], $attrs->prices[$i], $attrs->type[$i], $id);
				
				$html 	.= '</div>';
			}
			return $html;
		}
		else
		{
			return '';
		}
	
	}
	
	function field($name, $title, $price, $type, $id)
	{
		$html = '<div class="dg-poduct-fields">';
		switch($type)
		{
			case 'checkbox':
				for ($i=0; $i<count($title); $i++)
				{
					$html .= '<label class="checkbox-inline">';
					$html .= 	'<input type="checkbox" name="'.$id.'['.$i.']" value="'.$i.'"> '.$title[$i];
					$html .= '</label>';
				}
			break;
			
			case 'selectbox':
				$html .= '<select class="form-control input-sm" name="'.$id.'">';
				
				for ($i=0; $i<count($title); $i++)
				{
					$html .= '<option value="'.$i.'">'.$title[$i].'</option>';
				}
				
				$html .= '</select>';
			break;
			
			case 'radio':
				for ($i=0; $i<count($title); $i++)
				{
					$html .= '<label class="radio-inline">';
					$html .= 	'<input type="radio" name="'.$id.'" value="'.$i.'"> '.$title[$i];
					$html .= '</label>';
				}
			break;
			
			case 'textlist':
				$html 		.= '<style>.product-quantity{display:none;}</style><ul class="p-color-sizes list-number col-md-12">';
				for ($i=0; $i<count($title); $i++)
				{
					$html .= '<li>';
					$html .= 	'<label>'.$title[$i].'</label>';
					$html .= 	'<input type="text" class="form-control input-sm size-number" name="'.$id.'['.$i.']">';					
					$html .= '</li>';
				}
				$html 		.= '</ul>';
			break;
		}
		$html	.= '</div>';
		
		return $html;
	}
	
	public function quantity($min = 1, $name = 'Quantity', $name2 = 'minimum quantity: '){
		if ($min < 1) $min = 1;
		
		$html = '<div class="form-group product-fields product-quantity">';
		$html .= 	'<label class="col-sm-4">'.$name.'</label>';
		$html .= 	'<div class="col-sm-6">';
		$html .= 		'<input type="text" class="form-control input-sm" value="0" data-count="'.$min.'" name="quantity" id="quantity">';
		$html .= 	'</div>';
		$html .= 	'<span class="help-block"><small>'.$name2.$min.'</small></span>';
		$html .= '</div>';
		
		return $html;
	}
}
?>