<?php
class ModelTshirtecommerceOrder extends Model {
	
	
	public function getItem($order_product_id, $product_id = 0)
	{	
		$item = $this->db->query("SELECT * FROM `" . DB_PREFIX . "tshirtdesign_order` WHERE order_product_id = '" . (int)$order_product_id . "'");
		$design = '';
		if ($item->num_rows) 
		{
			$string = $item->row['options'];
			if ($string != '')
				$design = json_decode($string);
		}
			
		if (empty($design->rowid))
		{
			if ($product_id == 0) return false;
			
			$product = $this->db->query("SELECT design_product_id FROM `" . DB_PREFIX . "product` WHERE product_id = '" . (int)$product_id . "'");
			if ($product->num_rows)
			{
				$obj = explode(':', $product->row['design_product_id']);
				if (count($obj) == 1)
				{
					return false;
				}
				else
				{
					$obj['idea'] = true;
					if (isset($design->price))
						$obj['price'] = $design->price;
				}
				
				$design = $obj;
			}
			else
			{
				return false;
			}
		}		
		return $design;
	}
	
	// get all product design
	public function getProducts()
	{
		$items = $this->db->query("SELECT p.*, name FROM `" . DB_PREFIX . "product` as p, `" . DB_PREFIX . "product_description` as pd WHERE status = 1 AND p.product_id = pd.product_id AND design_product_title_img != ''");
		
		
		$products = 0;
		if ($items->num_rows)
		{
			$products = array();
			foreach($items->rows as $item)
			{				
				$design_product_id = $item['design_product_id'];
				$n = explode(':', $design_product_id);
				if ( count($n) == 1)
				{
					$products[] = $item;
				}
			}
		}
		
		return $products;
	}
}