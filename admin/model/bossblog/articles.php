<?php
class ModelBossblogArticles extends Model {
	public function addArticle($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "blog_article SET author = '" . $this->db->escape($data['author']) . "', status = '" . (int)$data['status'] . "', allow_comment = '" . (int)$data['allow_comment'] . "', need_approval = '" . (int)$data['need_approval'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_added = NOW()");
		
		$blog_article_id = $this->db->getLastId();
		
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "blog_article SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE blog_article_id = '" . (int)$blog_article_id . "'");
		}
		
		foreach ($data['article_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "blog_article_description SET blog_article_id = '" . (int)$blog_article_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', title = '" . $this->db->escape($value['title']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', content = '" . $this->db->escape($value['content']) . "', tag = '" . $this->db->escape($value['tag']) . "'");
		}
		
		if (isset($data['article_store'])) {
			foreach ($data['article_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "blog_article_store SET blog_article_id = '" . (int)$blog_article_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		
		if (isset($data['article_category'])) {
			foreach ($data['article_category'] as $blog_category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "blog_article_category SET blog_article_id = '" . (int)$blog_article_id . "', blog_category_id = '" . (int)$blog_category_id . "'");
			}
		}
		
		if (isset($data['article_related'])) {
			foreach ($data['article_related'] as $related_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "blog_article_related WHERE blog_article_id = '" . (int)$blog_article_id . "' AND related_id = '" . (int)$related_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "blog_article_related SET blog_article_id = '" . (int)$blog_article_id . "', related_id = '" . (int)$related_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "blog_article_related WHERE blog_article_id = '" . (int)$related_id . "' AND related_id = '" . (int)$blog_article_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "blog_article_related SET blog_article_id = '" . (int)$related_id . "', related_id = '" . (int)$blog_article_id . "'");
			}
		}
        
        if (isset($data['product_related'])) {
			foreach ($data['product_related'] as $product_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "blog_product_related WHERE blog_article_id = '" . (int)$blog_article_id . "' AND product_id = '" . (int)$product_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "blog_product_related SET blog_article_id = '" . (int)$blog_article_id . "', product_id = '" . (int)$product_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "blog_product_related WHERE blog_article_id = '" . (int)$product_id . "' AND product_id = '" . (int)$blog_article_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "blog_product_related SET blog_article_id = '" . (int)$product_id . "', product_id = '" . (int)$blog_article_id . "'");
			}
		}

		if (isset($data['article_layout'])) {
			foreach ($data['article_layout'] as $store_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "blog_article_layout SET blog_article_id = '" . (int)$blog_article_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}
        
        if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'blog_article_id=" . (int)$blog_article_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
						
	}
	
	public function editArticle($blog_article_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "blog_article SET author = '" . $this->db->escape($data['author']) . "', status = '" . (int)$data['status'] . "', allow_comment = '" . (int)$data['allow_comment'] . "', need_approval = '" . (int)$data['need_approval'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_modified = '" . $this->db->escape($data['date_modified']) . "' WHERE blog_article_id = '" . (int)$blog_article_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "blog_article SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE blog_article_id = '" . (int)$blog_article_id . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_article_description WHERE blog_article_id = '" . (int)$blog_article_id . "'");
		
		foreach ($data['article_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "blog_article_description SET blog_article_id = '" . (int)$blog_article_id . "', language_id = '" . (int)$language_id . "',  name = '" . $this->db->escape($value['name']) . "', title = '" . $this->db->escape($value['title']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', content = '" . $this->db->escape($value['content']) . "', tag = '" . $this->db->escape($value['tag']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_article_store WHERE blog_article_id = '" . (int)$blog_article_id . "'");

		if (isset($data['article_store'])) {
			foreach ($data['article_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "blog_article_store SET blog_article_id = '" . (int)$blog_article_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
	
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_article_category WHERE blog_article_id = '" . (int)$blog_article_id . "'");
		
		if (isset($data['article_category'])) {
			foreach ($data['article_category'] as $blog_category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "blog_article_category SET blog_article_id = '" . (int)$blog_article_id . "', blog_category_id = '" . (int)$blog_category_id . "'");
			}		
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_article_related WHERE blog_article_id = '" . (int)$blog_article_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_article_related WHERE related_id = '" . (int)$blog_article_id . "'");
		
        if (isset($data['article_related'])) {
			foreach ($data['article_related'] as $related_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "blog_article_related WHERE blog_article_id = '" . (int)$blog_article_id . "' AND related_id = '" . (int)$related_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "blog_article_related SET blog_article_id = '" . (int)$blog_article_id . "', related_id = '" . (int)$related_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "blog_article_related WHERE blog_article_id = '" . (int)$related_id . "' AND related_id = '" . (int)$blog_article_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "blog_article_related SET blog_article_id = '" . (int)$related_id . "', related_id = '" . (int)$blog_article_id . "'");
			}
		}

        $this->db->query("DELETE FROM " . DB_PREFIX . "blog_product_related WHERE blog_article_id = '" . (int)$blog_article_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_product_related WHERE product_id = '" . (int)$blog_article_id . "'");

        if (isset($data['product_related'])) {
			foreach ($data['product_related'] as $product_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "blog_product_related WHERE blog_article_id = '" . (int)$blog_article_id . "' AND product_id = '" . (int)$product_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "blog_product_related SET blog_article_id = '" . (int)$blog_article_id . "', product_id = '" . (int)$product_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "blog_product_related WHERE blog_article_id = '" . (int)$product_id . "' AND product_id = '" . (int)$blog_article_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "blog_product_related SET blog_article_id = '" . (int)$product_id . "', product_id = '" . (int)$blog_article_id . "'");
			}
		}
		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_article_layout WHERE blog_article_id = '" . (int)$blog_article_id . "'");

		if (isset($data['article_layout'])) {
			foreach ($data['article_layout'] as $store_id => $layout) {
				if (isset($layout['layout_id']) && $layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "blog_article_layout SET blog_article_id = '" . (int)$blog_article_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}
        $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'blog_article_id=" . (int)$blog_article_id. "'");
        if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'blog_article_id=" . (int)$blog_article_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
										
		$this->cache->delete('blog_article');
	}
	
	public function deleteArticle($blog_article_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_article WHERE blog_article_id = '" . (int)$blog_article_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_article_description WHERE blog_article_id = '" . (int)$blog_article_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_article_related WHERE blog_article_id = '" . (int)$blog_article_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_article_related WHERE related_id = '" . (int)$blog_article_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "blog_product_related WHERE blog_article_id = '" . (int)$blog_article_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_product_related WHERE product_id = '" . (int)$blog_article_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_article_category WHERE blog_article_id = '" . (int)$blog_article_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_article_layout WHERE blog_article_id = '" . (int)$blog_article_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_article_store WHERE blog_article_id = '" . (int)$blog_article_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'blog_article_id=" . (int)$blog_article_id. "'");	
		$this->cache->delete('blog_article');
	}
	
	public function getArticle($blog_article_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'blog_article_id=" . (int)$blog_article_id . "') AS keyword FROM " . DB_PREFIX . "blog_article ba LEFT JOIN " . DB_PREFIX . "blog_article_description bad ON (ba.blog_article_id = bad.blog_article_id) WHERE ba.blog_article_id = '" . (int)$blog_article_id . "' AND bad.language_id = '" . (int)$this->config->get('config_language_id') . "'");
				
		return $query->row;
	}
	
	public function getArticles($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "blog_article ba LEFT JOIN " . DB_PREFIX . "blog_article_description bad ON (ba.blog_article_id = bad.blog_article_id)";
			
			if (!empty($data['filter_blog_category_id'])) {
				$sql .= " LEFT JOIN " . DB_PREFIX . "blog_article_category bac ON (ba.blog_article_id = bac.blog_article_id)";			
			}
					
			$sql .= " WHERE bad.language_id = '" . (int)$this->config->get('config_language_id') . "'"; 
			
			if (!empty($data['filter_name'])) {
				$sql .= " AND LCASE(bad.name) LIKE '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "%'";
			}
			
			if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
				$sql .= " AND ba.status = '" . (int)$data['filter_status'] . "'";
			}
					
			if (!empty($data['filter_blog_category_id'])) {
				if (!empty($data['filter_sub_category'])) {
					$implode_data = array();
					
					$implode_data[] = "blog_category_id = '" . (int)$data['filter_blog_category_id'] . "'";
					
					$this->load->model('bossblog/articles');
					
					$categories = $this->model_bossblog_category->getCategories($data['filter_blog_category_id']);
					
					foreach ($categories as $category) {
						$implode_data[] = "bac.blog_category_id = '" . (int)$category['blog_category_id'] . "'";
					}
					
					$sql .= " AND (" . implode(' OR ', $implode_data) . ")";			
				} else {
					$sql .= " AND bac.blog_category_id = '" . (int)$data['filter_blog_category_id'] . "'";
				}
			}
			
			$sql .= " GROUP BY ba.blog_article_id";
						
			$sort_data = array(
				'bad.name',
				'ba.status',
				'ba.sort_order'
			);	
			
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY bad.name";	
			}
			
			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}
		
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
		} else {
			$article_data = $this->cache->get('article.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));
		
			if (!$article_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog_article ba LEFT JOIN " . DB_PREFIX . "blog_article_description bad ON (ba.blog_article_id = bad.blog_article_id) WHERE bad.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY bad.name ASC");
	
				$article_data = $query->rows;
			
				$this->cache->set('article.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $article_data);
			}	
	
			return $article_data;
		}
	}
    
	public function getArticleDescriptions($blog_article_id) {
		$article_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog_article_description WHERE blog_article_id = '" . (int)$blog_article_id . "'");
		
		foreach ($query->rows as $result) {
			$article_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
                'title'            => $result['title'],
				'content'      => $result['content'],
				'meta_keyword'     => $result['meta_keyword'],
				'meta_description' => $result['meta_description'],
				'tag'              => $result['tag']
			);
		}
		
		return $article_description_data;
	}

	public function getArticleStores($blog_article_id) {
		$article_store_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog_article_store WHERE blog_article_id = '" . (int)$blog_article_id . "'");

		foreach ($query->rows as $result) {
			$article_store_data[] = $result['store_id'];
		}
		
		return $article_store_data;
	}

	public function getArticleLayouts($blog_article_id) {
		$article_layout_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog_article_layout WHERE blog_article_id = '" . (int)$blog_article_id . "'");
		
		foreach ($query->rows as $result) {
			$article_layout_data[$result['store_id']] = $result['layout_id'];
		}
		
		return $article_layout_data;
	}
		
	public function getArticleCategories($blog_article_id) {
		$article_category_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog_article_category WHERE blog_article_id = '" . (int)$blog_article_id . "'");
		
		foreach ($query->rows as $result) {
			$article_category_data[] = $result['blog_category_id'];
		}

		return $article_category_data;
	}

	public function getArticleRelated($blog_article_id) {
		$article_related_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog_article_related WHERE blog_article_id = '" . (int)$blog_article_id . "'");
		
		foreach ($query->rows as $result) {
			$article_related_data[] = $result['related_id'];
		}
		
		return $article_related_data;
	}
    
   	public function getBlogProductRelated($blog_article_id) {
		$product_related_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "blog_product_related WHERE blog_article_id = '" . (int)$blog_article_id . "'");
		
		foreach ($query->rows as $result) {
			$product_related_data[] = $result['product_id'];
		}
		
		return $product_related_data;
	}
	
	public function getTotalArticles($data = array()) {
		$sql = "SELECT COUNT(DISTINCT ba.blog_article_id) AS total FROM " . DB_PREFIX . "blog_article ba LEFT JOIN " . DB_PREFIX . "blog_article_description bad ON (ba.blog_article_id = bad.blog_article_id)";

		if (!empty($data['filter_blog_category_id'])) {
			$sql .= " LEFT JOIN " . DB_PREFIX . "blog_article_category bac ON (ba.blog_article_id = bac.blog_article_id)";			
		}
		 
		$sql .= " WHERE bad.language_id = '" . (int)$this->config->get('config_language_id') . "'";
		 			
		if (!empty($data['filter_name'])) {
			$sql .= " AND LCASE(bad.name) LIKE '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "%'";
		}
		
		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND ba.status = '" . (int)$data['filter_status'] . "'";
		}

		if (!empty($data['filter_blog_category_id'])) {
			if (!empty($data['filter_sub_category'])) {
				$implode_data = array();
				
				$implode_data[] = "bac.<strong>blog_category_id</strong> = '" . (int)$data['filter_blog_category_id'] . "'";
				
				$this->load->model('bossblog/articles');
				
				$categories = $this->model_bossblog_category->getCategories($data['filter_blog_category_id']);
				
				foreach ($categories as $category) {
					$implode_data[] = "bac.blog_category_id = '" . (int)$category['blog_category_id'] . "'";
				}
				
				$sql .= " AND (" . implode(' OR ', $implode_data) . ")";			
			} else {
				$sql .= " AND bac.blog_category_id = '" . (int)$data['filter_blog_category_id'] . "'";
			}
		}
		
		$query = $this->db->query($sql);
		
		return $query->row['total'];
	}	

	public function getTotalProductsByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "blog_article_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}
    
    public function checkBlogArticle() {       
		$create_blog_article = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_article` (`blog_article_id` int(11) NOT NULL auto_increment, `status` tinyint(1) NOT NULL default '0', `allow_comment` tinyint(1) NOT NULL default '0',`author` varchar(255) collate utf8_unicode_ci NOT NULL default '', `need_approval` tinyint(1) NOT NULL default '0', `sort_order` int(11) NOT NULL default '0', `viewed` int(5) NOT NULL default '0', `image` varchar(255) collate utf8_unicode_ci default NULL, `date_added` datetime default NULL, `date_modified` datetime default NULL, PRIMARY KEY  (`blog_article_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;";
		$this->db->query($create_blog_article);
		$insert_blog_article = "INSERT INTO `" . DB_PREFIX . "blog_article` (`blog_article_id`, `status`, `allow_comment`, `author`, `need_approval`, `sort_order`, `viewed`, `image`, `date_added`, `date_modified`) VALUES
(1, 1, 2, 'Admin', 2, 1, 20, 'catalog/bossblog/h1.jpg', '2014-11-11 12:00:41', '2014-11-28 00:00:00'),
(2, 1, 2, 'Admin', 2, 2, 29, 'catalog/bossblog/h2.jpg', '2014-11-11 12:02:21', '2014-11-11 00:00:00'),
(3, 1, 2, 'Admin', 2, 3, 2, 'catalog/bossblog/h3.jpg', '2014-11-11 12:04:08', '2014-11-28 00:00:00'),
(4, 1, 2, 'Admin', 2, 4, 75, 'catalog/bossblog/h4.jpg', '2014-11-11 12:05:20', '2014-11-11 00:00:00'),
(5, 1, 2, 'Admin', 2, 5, 1, 'catalog/bossblog/h5.jpg', '2014-11-11 12:06:48', '2014-11-28 00:00:00'),
(6, 1, 2, 'Admin', 2, 6, 1, 'catalog/bossblog/h6.jpg', '2014-11-11 12:07:52', '2014-11-28 00:00:00'),
(7, 1, 2, 'Admin', 2, 7, 1, 'catalog/bossblog/h7.jpg', '2014-11-11 12:09:33', '2014-11-28 00:00:00');";
		$this->db->query($insert_blog_article);
		
		
		$create_blog_article_descriptions = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_article_description` (`blog_article_id` int(11) NOT NULL default '0', `language_id` int(11) NOT NULL default '0', `name` varchar(255) collate utf8_unicode_ci NOT NULL default '',`title` varchar(500) collate utf8_unicode_ci NOT NULL default '', `meta_description` varchar(255) collate utf8_unicode_ci NOT NULL, `meta_keyword` varchar(255) collate utf8_unicode_ci NOT NULL, `content` text collate utf8_unicode_ci NOT NULL, `tag` text collate utf8_unicode_ci NOT NULL, PRIMARY KEY (`blog_article_id`,`language_id`),
		  FULLTEXT KEY `tag` (`tag`,`content`),
		  FULLTEXT KEY `tag_2` (`tag`),
		  FULLTEXT KEY `tag_3` (`tag`),
		  FULLTEXT KEY `tag_4` (`tag`),
		  FULLTEXT KEY `content` (`content`),
		  FULLTEXT KEY `content_2` (`content`),
		  FULLTEXT KEY `tag_5` (`tag`)
		) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;";
		$this->db->query($create_blog_article_descriptions);
		
		$add_fulltext ="ALTER TABLE `" . DB_PREFIX . "blog_article_description` ADD FULLTEXT(`tag`,`content`)";
        $this->db->query($add_fulltext);
		
		$insert_blog_article_descriptions = "INSERT INTO `" . DB_PREFIX . "blog_article_description` (`blog_article_id`, `language_id`, `name`, `title`, `meta_description`, `meta_keyword`, `content`, `tag`) VALUES
(1, 1, 'Aliquam pulvinar porttitor nulla, et consequat', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'dignissimos,ducimus,quiblanditiis,praesentium'),
(1, 2, 'Aliquam pulvinar porttitor nulla, et consequat', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'dignissimos,ducimus,quiblanditiis,praesentium'),
(2, 1, 'Donec a interdum ligula fusce convallis orci quis lorem bibendum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'dolorese,tquas'),
(2, 2, 'Donec a interdum ligula fusce convallis orci quis lorem bibendum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'dolorese,tquas'),
(3, 1, 'Nisl cursus sollicitudin paesent ultricies arcu', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'tristiqueu,stoporta'),
(3, 2, 'Nisl cursus sollicitudin paesent ultricies arcu', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'tristiqueu,stoporta'),
(4, 1, 'Nulla eu velit a enim congue ornare convallis orci quis lorem', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'aliquam,dapibus'),
(4, 2, 'Nulla eu velit a enim congue ornare convallis orci quis lorem', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'aliquam,dapibus'),
(5, 1, 'Tellus volutpat bibendum morbi pretium fringilla nulla a laoreet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'risus,volutpa'),
(5, 2, 'Tellus volutpat bibendum morbi pretium fringilla nulla a laoreet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'risus,volutpa'),
(6, 1, 'Voluptatem accusantium laudantium totam rem aperia', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'nsectetur,adipiscing'),
(6, 2, 'Voluptatem accusantium laudantium totam rem aperia', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'nsectetur,adipiscing');";
		$this->db->query($insert_blog_article_descriptions);
		
		$insert_blog_article_descriptions2 ="INSERT INTO `" . DB_PREFIX . "blog_article_description` (`blog_article_id`, `language_id`, `name`, `title`, `meta_description`, `meta_keyword`, `content`, `tag`) VALUES
(7, 1, 'Voluptatem accusantium laudantium, totam rem aperia', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'deserunt,moll'),
(7, 2, 'Voluptatem accusantium laudantium, totam rem aperia', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'deserunt,moll');";
        $this->db->query($insert_blog_article_descriptions2);
		
		$create_blog_article_category = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_article_category` (`blog_article_id` int(11) NOT NULL, `blog_category_id` int(11) NOT NULL, PRIMARY KEY  (`blog_article_id`, `blog_category_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;";
		$this->db->query($create_blog_article_category);
		$insert_blog_article_category = "INSERT INTO `" . DB_PREFIX . "blog_article_category` (`blog_article_id`, `blog_category_id`) VALUES
(1, 1),
(1, 2),
(1, 5),
(1, 6),
(1, 7),
(2, 1),
(2, 2),
(2, 3),
(2, 7),
(3, 3),
(3, 4),
(3, 6),
(3, 7),
(4, 1),
(4, 2),
(4, 5),
(5, 1),
(5, 2),
(5, 6),
(5, 7),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 6),
(7, 7);";
		$this->db->query($insert_blog_article_category);
		
		
		$create_blog_article_store = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_article_store` (`blog_article_id` int(11) NOT NULL, `store_id` int(11) NOT NULL, PRIMARY KEY  (`blog_article_id`, `store_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;";
		$this->db->query($create_blog_article_store);
		$insert_blog_article_store = "INSERT INTO `" . DB_PREFIX . "blog_article_store` (`blog_article_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0);
";
		$this->db->query($insert_blog_article_store);
		
        $create_blog_article_layout = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_article_layout` (`blog_article_id` int(11) NOT NULL, `store_id` int(11) NOT NULL, `layout_id` int(11) NOT NULL, PRIMARY KEY  (`blog_article_id`, `store_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;";
		$this->db->query($create_blog_article_layout);
		
        $create_blog_article_related = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_article_related` (`blog_article_id` int(11) NOT NULL, `related_id` int(11) NOT NULL, PRIMARY KEY  (`blog_article_id`, `related_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;";
		$this->db->query($create_blog_article_related);
		$insert_blog_article_related = "INSERT INTO `" . DB_PREFIX . "blog_article_related` (`blog_article_id`, `related_id`) VALUES
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 7),
(2, 1),
(2, 3),
(2, 5),
(2, 7),
(3, 1),
(3, 2),
(3, 5),
(3, 7),
(4, 1),
(4, 5),
(4, 7),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 7),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5);";
		$this->db->query($insert_blog_article_related);
		
        $create_blog_article_product = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_product_related` (`blog_article_id` int(11) NOT NULL, `product_id` int(11) NOT NULL, PRIMARY KEY  (`blog_article_id`, `product_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;";
		$this->db->query($create_blog_article_product);
	}	
}
?>