<?php
class ModelSaleHalloffameCoupon extends Model {	
	
	public function getCoupons() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "hall_of_fame_sell_track ORDER BY hft_id ASC");
		return $query->rows;
	}

	public function getCustomer($customer_id) {
		$query = $this->db->query("SELECT concat( firstname, ' ', lastname ) AS customer_name, email, telephone FROM " . DB_PREFIX . "customer WHERE customer_id='". (int)$customer_id."'");
		return $query->row;
	}

	public function getPopularClipart() {
		$query = $this->db->query("SELECT clipart_title,COUNT(*) AS `count`,clipart_thumb FROM " . DB_PREFIX . "tshirtecommerce_clipart_use GROUP BY `clipart_id`");
		return $query->rows;
	}	
}