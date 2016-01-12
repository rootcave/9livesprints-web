<?php

class ModelShippingindividualshipping extends Model {
	function getQuote($address) {
		$this->load->language('shipping/individualshipping');
		
		if ($this->config->get('individualshipping_status')) {
			$status = true;
		} else {
			$status = FALSE;
		}

		$method_data = array();
	
		if ($status) {
			$quote_data = array();

			$this->load->model('catalog/product');

		        $cost=0;
		        $cost_arr=array();
		        $prods=$this->cart->getProducts();

			//print_r($prods);
			//print_r( get_class_methods($this->cart) );
			//die();


			$product_id_amounts = array();
			foreach($prods as $foo){
				$product_id_amounts[$foo["product_id"]]=$foo['quantity'];
			}

			foreach($product_id_amounts as $key => $amount){
				$obj_prod = $this->model_catalog_product->getProduct($key);
				$sku = trim( $obj_prod["location"] );
				if ( $sku == '' ){
					$sku = $this->config->get('individualshipping_default');
				}
				$i = strpos( $sku, '-' );
				if ( $i !== false ){
					$sku = trim(substr(0, $i));
				}
				if ( $sku == '' ){
					$cost_arr[$key] = 9999;
				} else {
					$skus = explode(',', $sku);
					if (count($skus) == 1){
						$skus[0] = trim($skus[0]);
						//lets check to see if its just a flate rate
						if ( strpos($skus[0], ':') === false ){
							$cost_arr[$key] = $skus[0] * $amount;
							continue;
						}
						$sku = $skus[0];
					} else {
						//we have to find the best sku
						$sku_highest = -1;
						$sku_price = false;
						$flat = false;
						//each sku should start with a amount
						foreach($skus as $s){
							//get the sku amount
							$i = strpos($s, ':');
							if($i === false){
								if($flat == false){
									$flat = $s;
								}
							} else {

								$sku_amount = substr($s, 0, $i);
								if ($sku_amount <= $amount){
									if ( $sku_amount > $sku_highest ){
										$sku_price = substr($s, $i+1);
										$sku_highest = $sku_amount;
									}
								}

							}
						}
						if ($sku_price == false){
							if ($flat != false){
								$cost_arr[$key] = $flat * $amount;
								continue;
							}
							//todo: hmm we have to find the lowest sku
							$sku_price = 0;
						}
						$cost_arr[$key] = $sku_price * $amount;
					}
				}
			}
		        //sum up all costs
			$cost = 0;
		        foreach($cost_arr as $fooid=>$val){
		            $cost+=$val;
		        }

		        $this->config->get('individualshipping_cost');



	      		$quote_data['individualshipping'] = array(
				'id'           => 'individualshipping.individualshipping',
				'code'           => 'individualshipping.individualshipping',
				'title'        => $this->language->get('text_title'),
				'cost'         => $cost,
				'tax_class_id' => $this->config->get('individualshipping_tax_class_id'),
		                'text'         => $this->currency->format($this->tax->calculate($cost, $this->config->get('individualshipping_tax_class_id'), $this->config->get('config_tax')))
	      		);

	      		$method_data = array(
				'id'         => 'individualshipping',
				'code'         => 'individualshipping',
				'title'      => $this->language->get('text_title'),
				'quote'      => $quote_data,
					'sort_order' => $this->config->get('individualshipping_sort_order'),
				'error'      => false
	      		);
		}
	
		return $method_data;
	}

}
?>
