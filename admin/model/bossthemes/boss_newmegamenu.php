<?php
class ModelBossthemesBossNewMegamenu extends Model { 
	public function createdb(){
		$sql = " SHOW TABLES LIKE '".DB_PREFIX."megamenu'";
		$query = $this->db->query( $sql );
		if( count($query->rows) > 0 ){
			
			$sql="delete from `".DB_PREFIX."megamenu`";
			$query = $this->db->query( $sql );
		}
		$sql = " SHOW TABLES LIKE '".DB_PREFIX."megamenu_column'";
		$query = $this->db->query( $sql );
		if( count($query->rows) > 0 ){
			
			$sql="delete from `".DB_PREFIX."megamenu_column`";
			$query = $this->db->query( $sql );
		}
		$sql = " SHOW TABLES LIKE '".DB_PREFIX."megamenu_description'";
		$query = $this->db->query( $sql );
		if( count($query->rows) > 0 ){
			
			$sql="delete from `".DB_PREFIX."megamenu_description`";
			$query = $this->db->query( $sql );
		}
		$sql = " SHOW TABLES LIKE '".DB_PREFIX."megamenu_row'";
		$query = $this->db->query( $sql );
		if( count($query->rows) > 0 ){
			
			$sql="delete from `".DB_PREFIX."megamenu_row`";
			$query = $this->db->query( $sql );
		}
		$sql = array();
		$sql[]  = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."megamenu` (
			  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
			  `status` tinyint(1) NOT NULL DEFAULT '0',
			  `sort_order` int(3) NOT NULL DEFAULT '0',
			  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
			  `icon` varchar(225) COLLATE utf8_unicode_ci DEFAULT NULL,
			  `label_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
			  `num_column` int(2) unsigned DEFAULT '1',
			  `icon_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
			  `icon_class_status` tinyint(1) NOT NULL DEFAULT '1',
			  `module_id` int(11) NOT NULL,
			  PRIMARY KEY (`menu_id`)
			) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=45 ;";
		$sql[] = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."megamenu_column` (
			`column_id` int(11) NOT NULL AUTO_INCREMENT,
			`row_id` int(11) NOT NULL,
			`sort_order` int(3) NOT NULL DEFAULT '0',
			`status` tinyint(1) NOT NULL,
			`num_column` int(2) unsigned NOT NULL DEFAULT '1',
			`type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
			`params` text COLLATE utf8_unicode_ci,
			PRIMARY KEY (`column_id`,`row_id`)
			) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=31 ;";
		
		$sql[] = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."megamenu_description` (
			`menu_id` int(11) NOT NULL,
		  `language_id` int(11) NOT NULL,
		  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
		  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
		  PRIMARY KEY (`menu_id`,`language_id`)
		) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;";

		$sql[] = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."megamenu_row` (
			`row_id` int(11) NOT NULL AUTO_INCREMENT,
		  `menu_id` int(11) NOT NULL,
		  `sort_order` int(3) NOT NULL DEFAULT '0',
		  `status` tinyint(1) NOT NULL,
		  `height` decimal(10,0) DEFAULT NULL,
		  `bg_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
		  `bg_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
		  PRIMARY KEY (`row_id`,`menu_id`)
		) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;";
		
		$sql[] = "INSERT INTO `".DB_PREFIX."megamenu` (`menu_id`, `status`, `sort_order`, `url`, `icon`, `label_color`, `num_column`, `icon_class`, `icon_class_status`, `module_id`) VALUES
(45, 1, 1, 'index.php?route=product/category&amp;path=20', '', '', 1, '', 0, 13),
(46, 1, 2, 'index.php?route=product/category&amp;path=20', '', '', 2, '', 0, 13),
(47, 1, 3, 'index.php?route=product/category&amp;path=20', '', '', 6, '', 0, 13),
(48, 1, 4, 'index.php?route=product/category&amp;path=20', '', '', 2, '', 0, 13),
(49, 1, 5, 'index.php?route=product/category&amp;path=20', '', '', 3, '', 0, 13),
(50, 1, 6, 'index.php?route=product/category&amp;path=20', '', '', 6, '', 0, 13),
(51, 1, 7, 'index.php?route=product/category&amp;path=20', '', '', 1, '', 0, 13),
(52, 1, 8, 'index.php?route=bossblog/bossblog', '', '', 1, '', 0, 13);";
		$sql[] = "INSERT INTO `".DB_PREFIX."megamenu_row` (`row_id`, `menu_id`, `sort_order`, `status`, `height`, `bg_color`, `bg_image`) VALUES
(16, 45, 1, 1, 300, '', ''),
(17, 46, 1, 1, 0, '', ''),
(18, 47, 1, 1, 0, '', ''),
(19, 48, 1, 1, 0, '', ''),
(20, 48, 2, 1, 0, '', ''),
(21, 49, 1, 1, 0, '', ''),
(22, 50, 1, 1, 0, '', ''),
(23, 51, 1, 1, 0, '', '');";
		$param1 =  $this->db->escape('{"category_id":"25","product_img_w":"","product_img_h":"","manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"\\t\\t\\t\\t\\t\\t","2":"\\t\\t\\t\\t\\t\\t"}}');
		$param2 =  $this->db->escape('{"category_id":"25","product_img_w":"","product_img_h":"","manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"\\t\\t\\t\\t\\t\\t","2":"\\t\\t\\t\\t\\t\\t"}}');
		$param3 =  $this->db->escape('{"category_id":"34","product_img_w":"","product_img_h":"","manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"\\t\\t\\t\\t\\t\\t","2":"\\t\\t\\t\\t\\t\\t"}}');
		$param4 =  $this->db->escape('{"category_id":"0","product_img_w":"","product_img_h":"","manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"&lt;div class=&quot;menu-block-sub&quot;&gt;\\n&lt;p class=&quot;parent&quot;&gt;Totes &amp;amp; hobos&lt;\\/p&gt;\\n\\n&lt;a alt=&quot;sample logo&quot; href=&quot;#&quot;&gt;&lt;img alt=&quot;sample logo&quot; src=&quot;http:\\/\\/demo.bossthemes.com\\/parallax_v2\\/image\\/catalog\\/bt_parallax\\/brand.png&quot;&gt;&lt;\\/a&gt;\\n\\n&lt;p&gt;Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.&lt;\\/p&gt;\\n\\n\\n&lt;p&gt;Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia.&lt;\\/p&gt;\\n\\n&lt;\\/div&gt;\\t\\t\\t\\t\\t\\t","2":"&lt;div class=&quot;menu-block-sub&quot;&gt;\\n&lt;p class=&quot;parent&quot;&gt;Totes &amp;amp; hobos&lt;\\/p&gt;\\n\\n&lt;a alt=&quot;sample logo&quot; href=&quot;#&quot;&gt;&lt;img alt=&quot;sample logo&quot; src=&quot;http:\\/\\/demo.bossthemes.com\\/parallax_v2\\/image\\/catalog\\/bt_parallax\\/brand.png&quot;&gt;&lt;\\/a&gt;\\n\\n&lt;p&gt;Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.&lt;\\/p&gt;\\n\\n\\n&lt;p&gt;Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia.&lt;\\/p&gt;\\n\\n&lt;\\/div&gt;\\t\\t\\t\\t\\t\\t"}}');
		$param5 =  $this->db->escape('{"category_id":"0","product_img_w":"200","product_img_h":"200","product_ids":["42"],"manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"\\t\\t\\t\\t\\t\\t","2":"\\t\\t\\t\\t\\t\\t"}}');
		$param6 =  $this->db->escape('{"category_id":"0","product_img_w":"200","product_img_h":"200","product_ids":["30"],"manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"\\t\\t\\t\\t\\t\\t","2":"\\t\\t\\t\\t\\t\\t"}}');
		$param7 =  $this->db->escape('{"category_id":"20","product_img_w":"","product_img_h":"","manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"\\t\\t\\t\\t\\t\\t","2":"\\t\\t\\t\\t\\t\\t"}}');
		$param8 =  $this->db->escape('{"category_id":"18","product_img_w":"","product_img_h":"","manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"\\t\\t\\t\\t\\t\\t","2":"\\t\\t\\t\\t\\t\\t"}}');
		$param9 =  $this->db->escape('{"category_id":"25","product_img_w":"","product_img_h":"","manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"\\t\\t\\t\\t\\t\\t","2":"\\t\\t\\t\\t\\t\\t"}}');
		$param10 =  $this->db->escape('{"category_id":"0","product_img_w":"170","product_img_h":"170","product_ids":["28","41"],"manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"\\t\\t\\t\\t\\t\\t","2":"\\t\\t\\t\\t\\t\\t"}}');
		$param11 =  $this->db->escape('{"category_id":"0","product_img_w":"170","product_img_h":"170","product_ids":["45","29"],"manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"\\t\\t\\t\\t\\t\\t","2":"\\t\\t\\t\\t\\t\\t"}}');
		$param12 =  $this->db->escape('{"category_id":"0","product_img_w":"","product_img_h":"","manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"&lt;div class=&quot;menu-block-main&quot;&gt;&lt;span&gt;lorem ipsum dolor sit amet&lt;\\/span&gt;\\n&lt;p&gt;Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.&lt;\\/p&gt;\\n\\n\\n&lt;p&gt;Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia.&lt;\\/p&gt;\\n\\n&lt;span&gt;lorem ipsum dolor sit amet&lt;\\/span&gt;\\n\\n&lt;p&gt;Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.&lt;\\/p&gt;\\n\\n&lt;\\/div&gt;","2":"&lt;div class=&quot;menu-block-main&quot;&gt;&lt;span&gt;lorem ipsum dolor sit amet&lt;\\/span&gt;\\n&lt;p&gt;Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.&lt;\\/p&gt;\\n\\n\\n&lt;p&gt;Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia.&lt;\\/p&gt;\\n\\n&lt;span&gt;lorem ipsum dolor sit amet&lt;\\/span&gt;\\n\\n&lt;p&gt;Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.&lt;\\/p&gt;\\n\\n&lt;\\/div&gt;"}}');
		$param13 =  $this->db->escape('{"category_id":"0","product_img_w":"","product_img_h":"","manufacturer_img_w":"114","manufacturer_img_h":"35","manufacturer_name":"0","manufacturer_id":["8","9","10","7","5","6"],"content_text":{"1":"\\t\\t\\t\\t\\t\\t","2":"\\t\\t\\t\\t\\t\\t"}}');
		$param14 =  $this->db->escape('{"category_id":"0","product_img_w":"","product_img_h":"","manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","information_id":["4","6","3","5"],"content_text":{"1":"\\t\\t\\t\\t\\t\\t","2":"\\t\\t\\t\\t\\t\\t"}}');
		$sql[] = "INSERT INTO `".DB_PREFIX."megamenu_column` (`column_id`, `row_id`, `sort_order`, `status`, `num_column`, `type`, `params`) VALUES
(31, 16, 1, 1, 1, 'category', '".$param1."'),
(32, 17, 1, 1, 1, 'category', '".$param2."'),
(33, 17, 1, 1, 1, 'category', '".$param3."'),
(34, 18, 0, 1, 1, 'html', '".$param4."'),
(35, 18, 2, 1, 1, 'product', '".$param5."'),
(36, 18, 3, 1, 1, 'product', '".$param6."'),
(37, 18, 4, 1, 1, 'category', '".$param7."'),
(38, 18, 5, 1, 1, 'category', '".$param8."'),
(39, 18, 6, 1, 1, 'category', '".$param9."'),
(40, 19, 1, 1, 2, 'product', '".$param10."'),
(41, 20, 1, 1, 2, 'product', '".$param11."'),
(42, 21, 1, 1, 3, 'html', '".$param12."'),
(43, 22, 1, 1, 6, 'manufacturer', '".$param13."'),
(44, 23, 1, 1, 1, 'information', '".$param14."');";
		$sql[] = "INSERT INTO `".DB_PREFIX."megamenu_description` (`menu_id`, `language_id`, `title`, `label`) VALUES
(45, 1, 'Totes &amp; Hobos', ''),
(45, 2, 'Totes &amp; Hobos', ''),
(46, 1, 'Covers', ''),
(46, 2, 'Covers', ''),
(47, 1, 'Leather', ''),
(47, 2, 'Leather', ''),
(48, 1, 'Cutches', ''),
(48, 2, 'Cutches', ''),
(49, 1, 'Messengers', ''),
(49, 2, 'Messengers', ''),
(50, 1, 'Bowlings', ''),
(50, 2, 'Bowlings', ''),
(51, 1, 'Men''s Bags', ''),
(51, 2, 'Men''s Bags', ''),
(52, 1, 'Blog', ''),
(52, 2, 'Blog', '');";
		
		foreach( $sql as $q ){
			$query = $this->db->query($q);
		}
	}
	public function addMenu($module_id,$data){
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "megamenu SET status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "',num_column = '" . (int)$data['num_column'] . "', url = '" . $this->db->escape($data['url']) . "',icon = '" . $this->db->escape($data['icon']) . "',label_color = '" . $this->db->escape($data['label_color']) . "', icon_class_status = '" . (int)$data['icon_class_status'] . "', icon_class = '" . $this->db->escape($data['icon_class']) . "',module_id = '" . (int)$module_id . "'");
		
		$menu_id = $this->db->getLastId();

		foreach ($data['menudes'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "megamenu_description SET menu_id = '" . (int)$menu_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "',label = '" . $this->db->escape($value['label']) . "'");
		}
	}
	
	public function addMenuRow($menu_id,$data){
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "megamenu_row SET menu_id = '" . (int)$menu_id . "', status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "', height = '" . (float)$data['height'] . "', bg_color = '" . $this->db->escape($data['bg_color']) . "', bg_image = '" . $this->db->escape($data['bg_image']) . "'");
	}
	
	public function addMenuColumn($row_id,$data){
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "megamenu_column SET row_id = '" . (int)$row_id . "', status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "', num_column = '" . (int)$data['num_column'] . "', type = '" . $this->db->escape($data['type']) . "', params = '" . $this->db->escape(json_encode($data['params'])) . "'");
	}
	
	public function editMenu($menu_id,$data) {
		$this->db->query("UPDATE " . DB_PREFIX . "megamenu SET status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "',url = '" . $this->db->escape($data['url']) . "', icon_class_status = '" . (int)$data['icon_class_status'] . "', icon_class = '" . $this->db->escape($data['icon_class']) . "', num_column = '" . (int)$data['num_column'] . "', icon = '" . $this->db->escape($data['icon']) . "',label_color = '" . $this->db->escape($data['label_color']) . "' WHERE menu_id = '" . (int)$menu_id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "megamenu_description WHERE menu_id = '" . (int)$menu_id . "'");

		foreach ($data['menudes'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "megamenu_description SET menu_id = '" . (int)$menu_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "',label = '" . $this->db->escape($value['label']) . "'");
		}
	}
	
	public function editMenuRow($row_id,$data) {
		$this->db->query("UPDATE " . DB_PREFIX . "megamenu_row SET menu_id = '" . (int)$data['menu_id'] . "', status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "', height = '" . (float)$data['height'] . "', bg_color = '" . $this->db->escape($data['bg_color']) . "', bg_image = '" . $this->db->escape($data['bg_image']) . "' WHERE row_id = '" . (int)$row_id . "'");
	}
	
	public function editMenuColumn($column_id,$data) {
		$this->db->query("UPDATE " . DB_PREFIX . "megamenu_column SET status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "', num_column = '" . (int)$data['num_column'] . "', type = '" . $this->db->escape($data['type']) . "', params = '" . $this->db->escape(json_encode($data['params'])) . "' WHERE column_id = '" . (int)$column_id . "'");
	}
	
	public function deleteMenu($menu_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "megamenu WHERE menu_id = '" . (int)$menu_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "megamenu_description WHERE menu_id = '" . (int)$menu_id . "'");
	}
	
	public function deleteMenuRow($row_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "megamenu_row WHERE row_id = '" . (int)$row_id . "'");
	}
	public function deleteMenuColumn($column_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "megamenu_column WHERE column_id = '" . (int)$column_id . "'");
	}
	
	public function getMenus(){
		$sql = "SELECT * FROM " . DB_PREFIX . "megamenu m LEFT JOIN " . DB_PREFIX . "megamenu_description md ON (m.menu_id = md.menu_id)";
		
		$sql .= " WHERE md.language_id = '" . (int)$this->config->get('config_language_id') . "'";
		
		$sql .= " GROUP BY m.menu_id";
		
		$sql .= " ORDER BY m.sort_order";
		
		$query = $this->db->query($sql);

		return $query->rows;
		
	}
	public function getMenusByModuleId($module_id){
		$sql = "SELECT * FROM " . DB_PREFIX . "megamenu m LEFT JOIN " . DB_PREFIX . "megamenu_description md ON (m.menu_id = md.menu_id)";
		
		$sql .= " WHERE m.module_id = '" . (int)$module_id . "' and md.language_id = '" . (int)$this->config->get('config_language_id') . "'";
		
		$sql .= " GROUP BY m.menu_id";
		
		$sql .= " ORDER BY m.sort_order";
		
		$query = $this->db->query($sql);

		return $query->rows;
		
	}
	
	public function getMenuRows($menu_id){
		$sql = "SELECT * FROM " . DB_PREFIX . "megamenu_row mr WHERE mr.menu_id = '" . (int)$menu_id . "'";
		
		$sql .= " ORDER BY mr.sort_order";
		
		$query = $this->db->query($sql);

		return $query->rows;
		
	}
	
	public function getMenuColumns($row_id){
		$sql = "SELECT * FROM " . DB_PREFIX . "megamenu_column mc WHERE mc.row_id = '" . (int)$row_id . "'";
		
		$sql .= " ORDER BY mc.sort_order";
		
		$query = $this->db->query($sql);

		return $query->rows;
		
	}
	
	public function getMenu($menu_id){
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "megamenu m LEFT JOIN " . DB_PREFIX . "megamenu_description md ON (m.menu_id = md.menu_id) WHERE m.menu_id = '" . $menu_id . "' AND md.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
		
	}
	
	public function getMenuRow($row_id){
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "megamenu_row mr WHERE mr.row_id = '" . (int)$row_id . "'");

		return $query->row;
		
	}
	
	public function getMenuColumn($column_id){
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "megamenu_column mc WHERE mc.column_id = '" . (int)$column_id . "'");

		return $query->row;
		
	}
	
	public function getMenuDescription($menu_id){
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "megamenu_description md WHERE md.menu_id = '" . $menu_id . "'");

		foreach ($query->rows as $result) {
			$menu_description_data[$result['language_id']] = array(
				'title'             => $result['title'],
				'label'             => $result['label']
			);
		}

		return $menu_description_data;
		
	}
	
	public function updateSortMenu($data){
		$count = 1;
		foreach ($data as $menu_id) {
			$query = "UPDATE " . DB_PREFIX . "megamenu SET sort_order = " . $count . " WHERE menu_id = " . $menu_id;
			$this->db->query($query);
			$count ++;	
		}
	}
	public function updateSortRow($menu_id,$data){
		$count = 1;
		foreach ($data as $row_id) {
			$this->db->query("UPDATE " . DB_PREFIX . "megamenu_row SET sort_order = " . $count . " WHERE menu_id = " . $menu_id." AND row_id = ".$row_id);
			$count ++;	
		}
	}
	public function updateSortColumn($row_id,$data){
		$count = 1;
		foreach ($data as $column_id) {
			$this->db->query("UPDATE " . DB_PREFIX . "megamenu_column SET sort_order = " . $count . " WHERE row_id = " . $row_id." AND column_id = ".$column_id);
			$count ++;	
		}
	}
	
	public function install(){
		$sql = " SHOW TABLES LIKE '".DB_PREFIX."megamenu'";
		$query = $this->db->query( $sql );
		if( count($query->rows) > 0 ){
			
			$sql="delete from `".DB_PREFIX."megamenu`";
			$query = $this->db->query( $sql );
			$sql = array();			
			$sql[]  = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."megamenu` (
			  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
			  `status` tinyint(1) NOT NULL DEFAULT '0',
			  `sort_order` int(3) NOT NULL DEFAULT '0',
			  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
			  `icon` varchar(225) COLLATE utf8_unicode_ci DEFAULT NULL,
			  `label_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
			  `num_column` int(2) unsigned DEFAULT '1',
			  `icon_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
			  `icon_class_status` tinyint(1) NOT NULL DEFAULT '1',
			  `module_id` int(11) NOT NULL,
			  PRIMARY KEY (`menu_id`)
			) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=45 ;";
			$sql[] = "CREATECREATE TABLE IF NOT EXISTS `".DB_PREFIX."megamenu_description` (
			  `menu_id` int(11) NOT NULL,
			  `language_id` int(11) NOT NULL,
			  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
			  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
			  PRIMARY KEY (`menu_id`,`language_id`)
			) ENGINE=MyISAM DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;";
			$sql[] = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."megamenu_row` (
				  `row_id` int(11) NOT NULL AUTO_INCREMENT,
				  `menu_id` int(11) NOT NULL,
				  `sort_order` int(3) NOT NULL DEFAULT '0',
				  `status` tinyint(1) NOT NULL,
				  `height` decimal(10,0) DEFAULT NULL,
				  `bg_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
				  `bg_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
				  PRIMARY KEY (`row_id`,`menu_id`)
				) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;";
			$sql[] = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."megamenu_column` (
				  `column_id` int(11) NOT NULL AUTO_INCREMENT,
				  `row_id` int(11) NOT NULL,
				  `sort_order` int(3) NOT NULL DEFAULT '0',
				  `status` tinyint(1) NOT NULL,
				  `num_column` int(2) unsigned NOT NULL DEFAULT '1',
				  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
				  `params` text COLLATE utf8_unicode_ci,
				  PRIMARY KEY (`column_id`,`row_id`)
				) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=32 ;";
			foreach( $sql as $q ){
				$query = $this->db->query( $q );
			}
		}else{ 
			$sql = array();
			$sql[]  = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."megamenu` (
			  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
			  `status` tinyint(1) NOT NULL DEFAULT '0',
			  `sort_order` int(3) NOT NULL DEFAULT '0',
			  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
			  `icon` varchar(225) COLLATE utf8_unicode_ci DEFAULT NULL,
			  `label_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
			  `num_column` int(2) unsigned DEFAULT '1',
			  `icon_class` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL,
			  `icon_class_status` tinyint(1) NOT NULL DEFAULT '1',
			  `module_id` int(11) NOT NULL,
			  PRIMARY KEY (`menu_id`)
			) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=45 ;";
			$sql[] = "CREATECREATE TABLE IF NOT EXISTS `".DB_PREFIX."megamenu_description` (
			  `menu_id` int(11) NOT NULL,
			  `language_id` int(11) NOT NULL,
			  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
			  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
			  PRIMARY KEY (`menu_id`,`language_id`)
			) ENGINE=MyISAM DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;";
			$sql[] = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."megamenu_row` (
				  `row_id` int(11) NOT NULL AUTO_INCREMENT,
				  `menu_id` int(11) NOT NULL,
				  `sort_order` int(3) NOT NULL DEFAULT '0',
				  `status` tinyint(1) NOT NULL,
				  `height` decimal(10,0) DEFAULT NULL,
				  `bg_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
				  `bg_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
				  PRIMARY KEY (`row_id`,`menu_id`)
				) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;";
			$sql[] = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."megamenu_column` (
				  `column_id` int(11) NOT NULL AUTO_INCREMENT,
				  `row_id` int(11) NOT NULL,
				  `sort_order` int(3) NOT NULL DEFAULT '0',
				  `status` tinyint(1) NOT NULL,
				  `num_column` int(2) unsigned NOT NULL DEFAULT '1',
				  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
				  `params` text COLLATE utf8_unicode_ci,
				  PRIMARY KEY (`column_id`,`row_id`)
				) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=32 ;";

			foreach( $sql as $q ){
				$query = $this->db->query( $q );
			}
		}	
	}
}

?>