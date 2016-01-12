<?php
class ModelBossblogComment extends Model {
	public function addComment($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "blog_comment SET author = '" . $this->db->escape($data['author']) . "', blog_article_id = '" . $this->db->escape($data['blog_article_id']) . "', text = '" . $this->db->escape(strip_tags($data['text'])) . "',  email = '" . $this->db->escape($data['email']) . "', status = '" . (int)$data['status'] . "', date_added = NOW()");
	
		$this->cache->delete('blog_article');
	}
	
	public function editComment($blog_comment_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "blog_comment SET author = '" . $this->db->escape($data['author']) . "', blog_article_id = '" . $this->db->escape($data['blog_article_id']) . "', text = '" . $this->db->escape(strip_tags($data['text'])) . "',  email = '" . $this->db->escape($data['email']) . "', status = '" . (int)$data['status'] . "', date_modified = NOW() WHERE blog_comment_id = '" . (int)$blog_comment_id . "'");
	
		$this->cache->delete('blog_article');
	}
	
	public function deleteComment($blog_comment_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "blog_comment WHERE blog_comment_id = '" . (int)$blog_comment_id . "'");
		
		$this->cache->delete('blog_article');
	}
	
	public function getComment($blog_comment_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT bad.name FROM " . DB_PREFIX . "blog_article_description bad WHERE bad.blog_article_id = bc.blog_article_id AND bad.language_id = '" . (int)$this->config->get('config_language_id') . "') AS article FROM " . DB_PREFIX . "blog_comment bc WHERE bc.blog_comment_id = '" . (int)$blog_comment_id . "'");
		
		return $query->row;
	}

	public function getComments($data = array()) {
		$sql = "SELECT bc.blog_comment_id, bad.name, bc.author, bc.email, bc.text, bc.status, bc.date_added FROM " . DB_PREFIX . "blog_comment bc LEFT JOIN " . DB_PREFIX . "blog_article_description bad ON (bc.blog_article_id = bad.blog_article_id) WHERE bad.language_id = '" . (int)$this->config->get('config_language_id') . "'";																																					  
		
		$sort_data = array(
			'bad.name',
			'bc.author',
			'bc.email',
            'bc.text',
			'bc.status',
			'bc.date_added'
		);	
			
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY bc.date_added";	
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
	}
	
	public function getTotalComments() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "blog_comment");
		
		return $query->row['total'];
	}
	
	public function getTotalCommentsAwaitingApproval() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "blog_comment WHERE status = '0'");
		
		return $query->row['total'];
	}	
    
    public function checkBlogComment() {       
		$create_blog_comment = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "blog_comment` (`blog_comment_id` int(11) NOT NULL auto_increment, `blog_article_id` int(11) NOT NULL , `customer_id` int(11) NOT NULL , `author` varchar(64) collate utf8_unicode_ci NOT NULL default '', `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, `text` text collate utf8_unicode_ci NOT NULL, `status` tinyint(1) NOT NULL default '0', `date_added` datetime default NULL, `date_modified` datetime default NULL, PRIMARY KEY  (`blog_comment_id`, `blog_article_id`, `customer_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;";
		$this->db->query($create_blog_comment);
		$insert_blog_comment = "INSERT INTO `" . DB_PREFIX . "blog_comment` (`blog_comment_id`, `blog_article_id`, `customer_id`, `author`, `email`, `text`, `status`, `date_added`, `date_modified`) VALUES
(1, 1, 0, 'Nguyen Linh', 'aaa@yahoo.com', 'Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.', 1, '2014-11-28 09:55:37', NULL),
(2, 2, 0, 'Rosa Lee', 'bbb@yahoo.com', 'Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.', 1, '2014-11-28 09:56:36', NULL),
(3, 4, 0, 'Herry Lee', 'aaa@yahoo.com', 'Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.', 1, '2014-11-28 15:57:49', NULL),
(4, 4, 0, 'Ji Yeon Park', 'bbb@yahoo.com', 'Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.', 1, '2014-11-28 15:58:37', NULL);";
		$this->db->query($insert_blog_comment);
	}	
}
?>