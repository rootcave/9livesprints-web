<?php
class ModelDesignColorDesignColor extends Model {

	public function getDesignColor($data = array()){
		$query = $this->db->query("SELECT  `setting`  FROM " . DB_PREFIX . "module WHERE `code` = 'boss_gallery' AND name='Design &amp; Color Images'");
		return $query->row['setting'];
	}
}