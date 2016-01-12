<?php
class ModelCatalogPopularClipart extends Model {

	public function getPopularClipart($data = array()) {
		$sql = "SELECT clipart_title,COUNT(*) AS `count`,clipart_thumb FROM " . DB_PREFIX . "tshirtecommerce_clipart_use GROUP BY `clipart_id`";

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}		

		$query = $this->db->query($sql);
		return $query->rows;
	}
	
	public function getTotalPopularClipart($data = array()){
		$query = $this->db->query("SELECT DISTINCT COUNT(clipart_id) `total` FROM " . DB_PREFIX . "tshirtecommerce_clipart_use");
		return $query->row['total'];
	}
}