<?php
class ModelTshirtecommerceOrder extends Model {
	
	
	public function getItem($order_product_id)
	{		
		$item = $this->db->query("SELECT * FROM `" . DB_PREFIX . "tshirtdesign_order` WHERE order_product_id = '" . (int)$order_product_id . "'");
		if ($item->num_rows) 
		{
			$string = $item->row['options'];
			if ($string == '')
				return false;
			else
				return json_decode($string);
		}
		else
		{
			return false;
		}
	}
	
	// get product
	public function getProduct($product_id)
	{		
		$item = $this->db->query("SELECT product_id, design_product_id FROM `" . DB_PREFIX . "product` WHERE status = 1 AND product_id = '".$product_id."'");
				
		if ($item->num_rows)
		{			
			$data = array(
				'product_id' => $item->row['product_id'],
				'design_product_id' => $item->row['design_product_id'],
			);
			return $data;
		}
		
		return false;
	}
	
	// get all product design
	public function getProducts()
	{
		$items = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product` WHERE status = 1 AND design_product_id != ''");
		
		
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