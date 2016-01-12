<?php
class ModelBossthemesBossRevolutionSlider extends Model { 

	public function createdb(){
	
		$sql = " SHOW TABLES LIKE '".DB_PREFIX."btslider'";
		$query = $this->db->query( $sql );
		if( count($query->rows) > 0 ){
			
			$sql="DELETE FROM `".DB_PREFIX."btslider`";
			$query = $this->db->query( $sql );
		}
		
		$sql = " SHOW TABLES LIKE '".DB_PREFIX."btslider_slide'";
		$query = $this->db->query( $sql );
		if( count($query->rows) > 0 ){
			
			$sql="DELETE FROM `".DB_PREFIX."btslider_slide`";
			$query = $this->db->query( $sql );
		}
		
		$sql = array();
		$sql[]  = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."btslider` (
		  `id` int(11) NOT NULL AUTO_INCREMENT,
		  `setting` text COLLATE utf8_unicode_ci,
		  PRIMARY KEY (`id`)
		) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;";
		
		$sql[] = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."btslider_slide` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`slider_id` int(11) NOT NULL,
			`status` tinyint(4) NOT NULL DEFAULT '0',
			`sort_order` int(3) NOT NULL DEFAULT '0',
			`slideset` text COLLATE utf8_unicode_ci,
			`caption` text COLLATE utf8_unicode_ci,
			PRIMARY KEY (`id`)
		) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;";
		
		$setting =  $this->db->escape('{"slider_type":"fullscreen","slider_width":"1600","slider_height":"790","delay":"5000","startWithSlide":"0","stopslider":"on","stopafterloops":"-1","stopatslide":"-1","touchenabled":"on","onhoverstop":"on","timeline":"on","timerlineposition":"top","shadow":"0","navigationtype":"bullet","navigationarrow":"nexttobullets","navigationstyle":"preview1","navigationhalign":"center","navigationvalign":"bottom","navigationhoffset":"0","navigationvoffset":"0","soloarrowlefthalign":"left","soloarrowleftvalign":"top","soloarrowlefthoffset":"0","soloarrowleftvoffset":"0","soloarrowrighthalign":"left","soloarrowrightvalign":"top","soloarrowrighthoffset":"0","soloarrowrightvoffset":"0","timehidethumbnail":"0","thumbnailwidth":"0","thumbnailheight":"0","thumbamount":"0","hidecapptionatlimit":"0","hideallcapptionatlimit":"0","hideslideratlimit":"0"}');
		$slideset1 =  $this->db->escape('{"url":"#","enablelink":"1","type_background":"image_bg","background":"catalog/bt_parallax/slide1.jpg","transitions":"curtain-2","slotamount":"7","masterspeed":"500","delay":"5000","target":"_self","kenburns":"off","enablefullvideo":"0"}');
		$caption1 =  $this->db->escape('[{"text_caption":{"1":"The Parallax bag","2":"The Parallax bag"},"datax":"415","type_caption":"text","datay":"300","class_css":"very_large_white_text","hideunderwidth":"100","dataspeed":"300","datastart":"500","dataend":"5000","dataafterspeed":"300","incom_animation":"fade","outgo_animation":"fadeout","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"Welcom to &lt;span style=&quot;font-weight:900&quot;&gt;Parabag&lt;/span&gt;, a parallax &lt;span style=&quot;font-weight:900&quot;&gt;bagstore&lt;/span&gt; theme!","2":"Welcom to &lt;span style=&quot;font-weight:900&quot;&gt;Parabag&lt;/span&gt;, a parallax &lt;span style=&quot;font-weight:900&quot;&gt;bagstore&lt;/span&gt; theme!"},"datax":"510","type_caption":"text","datay":"395","class_css":"medium_white","hideunderwidth":"100","dataspeed":"500","datastart":"1000","dataend":"5000","dataafterspeed":"300","incom_animation":"lfb","outgo_animation":"randomrotateout","easing":"easeInCirc","endeasing":"easeInQuint"},{"image_caption":"catalog/bt_parallax/slide_button.png","datax":"675","type_caption":"image","datay":"510","class_css":"randomrotate","hideunderwidth":"100","dataspeed":"500","datastart":"1500","dataend":"5000","dataafterspeed":"400","incom_animation":"randomrotate","outgo_animation":"ltt","easing":"easeOutBack","endeasing":"easeOutBack"}]');
		$slideset2 =  $this->db->escape('{"url":"#","enablelink":"0","type_background":"image_bg","background":"catalog/bt_parallax/slide2.jpg","transitions":"3dcurtain-horizontal","slotamount":"7","masterspeed":"500","delay":"5000","target":"_self","kenburns":"off","enablefullvideo":"0"}');
		$caption2 =  $this->db->escape('[{"text_caption":{"1":"Attractive","2":"Attractive"},"datax":"575","type_caption":"text","datay":"280","class_css":"very_large_white_text","hideunderwidth":"100","dataspeed":"500","datastart":"500","dataend":"5000","dataafterspeed":"300","incom_animation":"lft","outgo_animation":"ltb","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"Simply a beautiful theme with sexy visual&lt;span style=&quot;font-weight:900;text-decoration:underline;&quot;&gt;effects.&lt;/span&gt;","2":"Simply a beautiful theme with sexy visual&lt;span style=&quot;font-weight:900;text-decoration:underline;&quot;&gt;effects.&lt;/span&gt;"},"datax":"510","type_caption":"text","datay":"375","class_css":"medium_white","hideunderwidth":"100","dataspeed":"500","datastart":"1000","dataend":"5000","dataafterspeed":"300","incom_animation":"lft","outgo_animation":"ltb","easing":"easeOutBack","endeasing":"easeOutBack"},{"image_caption":"catalog/bt_parallax/slide_button.png","datax":"675","type_caption":"image","datay":"510","class_css":"randomrotate","hideunderwidth":"100","dataspeed":"500","datastart":"1500","dataend":"5000","dataafterspeed":"500","incom_animation":"randomrotate","outgo_animation":"fadeout","easing":"easeOutBack","endeasing":"easeOutBack"}]');
		$slideset3 =  $this->db->escape('{"url":"#","enablelink":"0","type_background":"image_bg","background":"catalog/bt_parallax/slide3.jpg","transitions":"papercut","slotamount":"7","masterspeed":"500","delay":"5000","target":"_self","kenburns":"off","enablefullvideo":"0"}');
		$caption3 =  $this->db->escape('[{"text_caption":{"1":"Fluid &amp; intuitive","2":"Fluid &amp; intuitive"},"datax":"470","type_caption":"text","datay":"300","class_css":"very_large_white_text","hideunderwidth":"100","dataspeed":"500","datastart":"500","dataend":"5000","dataafterspeed":"300","incom_animation":"lfb","outgo_animation":"ltt","easing":"easeOutBack","endeasing":"easeOutBack"},{"text_caption":{"1":"Paralbag comes with &lt;span style=&quot;font-weight:900;text-decoration:underline;&quot;&gt;great performance&lt;/span&gt;and intuitive.","2":"Paralbag comes with &lt;span style=&quot;font-weight:900;text-decoration:underline;&quot;&gt;great performance&lt;/span&gt;and intuitive."},"datax":"480","type_caption":"text","datay":"395","class_css":"medium_white","hideunderwidth":"100","dataspeed":"500","datastart":"1000","dataend":"5000","dataafterspeed":"300","incom_animation":"sfb","outgo_animation":"ltt","easing":"easeOutBack","endeasing":"easeOutBack"},{"image_caption":"catalog/bt_parallax/slide_button.png","datax":"675","type_caption":"image","datay":"510","class_css":"randomrotate","hideunderwidth":"100","dataspeed":"500","datastart":"1500","dataend":"5000","dataafterspeed":"300","incom_animation":"lfb","outgo_animation":"ltt","easing":"easeOutBack","endeasing":"easeOutBack"}]');
		$sql[] = "INSERT INTO `".DB_PREFIX."btslider` (`id`, `setting`) VALUES
(24, '".$setting."');";
		$sql[] = "INSERT INTO `".DB_PREFIX."btslider_slide` (`id`, `slider_id`, `status`, `sort_order`, `slideset`, `caption`) VALUES
(17, 24, 1, 1, '".$slideset1."', '".$caption1."'),
(18, 24, 1, 2, '".$slideset2."', '".$caption2."'),
(19, 24, 1, 3, '".$slideset3."', '".$caption3."');";
		foreach( $sql as $q ){
			$query = $this->db->query( $q );
		}
	}

	public function addSlide($data){
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "btslider_slide SET slider_id = '" . (int)$data['slider_id'] . "', status = '" . (int)$data['status'] . "',slideset = '" . $data['slideset'] . "',caption = '" . $data['caption'] . "', sort_order = '" . (int)$data['sort_order'] . "'");
	}
	
	public function addSlide_New($slider_id,$data){
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "btslider_slide SET slider_id = '" . (int)$slider_id . "', status = '" . (int)$data['status'] . "',slideset = '" . json_encode($data['slideset']) . "',caption = '" . json_encode($data['caption']) . "', sort_order = '" . (int)$data['sort_order'] . "'");
	}
	
	public function editSlide($slide_id,$slider_id,$data){
		$this->db->query("UPDATE " . DB_PREFIX . "btslider_slide SET slider_id = '" . (int)$slider_id . "', slideset = '" . json_encode($data['slideset']) . "',caption = '" . json_encode($data['caption']) . "', status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "' WHERE id = '" . (int)$slide_id . "'");
	}
	
	public function addSlider($data){
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "btslider SET setting = '" . json_encode($data['setting']) . "'");
		
		$slider_id = $this->db->getLastId();
		
		return $slider_id;
	}
	
	public function getLastId(){
		$sql = "SELECT * FROM " . DB_PREFIX . "btslider s";
		
		$query = $this->db->query($sql);
		
		$slider_id = $this->db->getLastId();
		
		return $slider_id;
	}
	
	public function editSlider($slider_id,$data){
		
		$this->db->query("UPDATE " . DB_PREFIX . "btslider SET setting = '" . json_encode($data['setting']) . "' WHERE id = '" . (int)$slider_id . "'");
	}
	
	public function getModules($group, $store_id = 0){
		$data = array(); 
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `group` = '" . $this->db->escape($group) . "'");
		
		foreach ($query->rows as $result) {
			if (!$result['serialized']) {
				$data[$result['key']] = $result['value'];
			} else {
				$data[$result['key']] = unserialize($result['value']);
			}
		}

		return $data;
	}
	
	public function getSliders(){
		$sql = "SELECT * FROM " . DB_PREFIX . "btslider s";
		
		$sql .= " GROUP BY s.id";
		
		$query = $this->db->query($sql);

		return $query->rows;
	}
	
	public function getSlider($slider_id){
		$sql = "SELECT * FROM " . DB_PREFIX . "btslider s WHERE s.id = '" . (int)$slider_id . "'";
		
		$sql .= " GROUP BY s.id";
		
		$query = $this->db->query($sql);

		return $query->row;
	}
	
	public function getSlide($slide_id){
		$sql = "SELECT * FROM " . DB_PREFIX . "btslider_slide ss WHERE ss.id = '" . (int)$slide_id . "'";
		
		$query = $this->db->query($sql);

		return $query->row;
	}
	
	public function getSlides($slider_id){
		$sql = "SELECT * FROM " . DB_PREFIX . "btslider_slide ss WHERE ss.slider_id = '" . (int)$slider_id . "'";
		
		$sql .= " GROUP BY ss.id";
		
		$sql .= " ORDER BY ss.sort_order";
		
		$query = $this->db->query($sql);

		return $query->rows;
	}
	
	public function copySlide($slide_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "btslider_slide WHERE id = '" . (int)$slide_id . "'");

		if ($query->num_rows) {
			$data = array();

			$data = $query->row;
			$this->addSlide($data);
		}
	}
	
	public function deleteSlider($slider_id){
		$this->db->query("DELETE FROM " . DB_PREFIX . "btslider WHERE id = '" . (int)$slider_id . "'");
	}
	
	public function deleteSlide($slide_id){
		$this->db->query("DELETE FROM " . DB_PREFIX . "btslider_slide WHERE id = '" . (int)$slide_id . "'");
	}
	
	public function updateSortSlide($data){
		$count = 1;
		foreach ($data as $slide_id) {
			$query = "UPDATE " . DB_PREFIX . "btslider_slide SET sort_order = " . $count . " WHERE id = " . $slide_id;
			$this->db->query($query);
			$count ++;	
		}
	}
	
	public function getTotalslidesBySliderId($slider_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "btslider_slide WHERE slider_id = '" . (int)$slider_id . "'");

		return $query->row['total'];
	}
}
?>