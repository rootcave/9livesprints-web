<?php
class ControllerModuleBossBlogfeatured extends Controller {
	public function index($setting) {
		static $module = 0;
		$data['heading_title'] = $setting['title'][$this->config->get('config_language_id')];
		
		$data['button_cart'] = $this->language->get('button_cart');
		
		$data['use_slider'] = $setting['useslider'];
		
		$this->load->model('bossblog/article'); 
		
		$this->load->model('tool/image');

		$data['articles'] = array();

		$articles = $setting['article'];		

		if (!isset($setting['limit']) || empty($setting['limit'])) {
			$setting['limit'] = 5;
		}
		if (!isset($setting['limit_article']) || empty($setting['limit_article'])) {
			$setting['limit_article'] = 30;
		}
		if (!isset($setting['limit_des']) || empty($setting['limit_des'])) {
			$setting['limit_des'] = 50;
		}
		if(isset($articles) && !empty($articles)){
			$articles = array_slice($articles, 0, (int)$setting['limit']);
			
			foreach ($articles as $article_id) {
				$article_info = $this->model_bossblog_article->getArticle($article_id);
				
				if ($article_info) {
					if ($article_info['image']) {
						$image = $this->model_tool_image->resize($article_info['image'], $setting['image_width'], $setting['image_height']);
					} else {
						$image = false;
					}
					$this->load->model('bossblog/comment');
					 
					$data['articles'][] = array(
						'article_id' => $article_info['blog_article_id'],
						'thumb'   	 => $image,
						'content' => utf8_substr(strip_tags(html_entity_decode($article_info['content'], ENT_QUOTES, 'UTF-8')), 0, $setting['limit_des']),
						'name'    	 => utf8_substr(strip_tags(html_entity_decode($article_info['name'], ENT_QUOTES, 'UTF-8')), 0, $setting['limit_article']),
						'comment'     => $this->model_bossblog_comment->getTotalCommentsByArticleId($article_info['blog_article_id']),
						'date_added' => $article_info['date_added'],
						'author'     => $article_info['author'],
						'href'    	 => $this->url->link('bossblog/article', 'blog_article_id=' . $article_info['blog_article_id'])
					);
				}
			}
		}
		
		$data['module'] = $module++; 
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/boss_blogfeatured.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/boss_blogfeatured.tpl', $data);
		} else {
			return $this->load->view('default/template/module/boss_blogfeatured.tpl', $data);
		}
	}
}
?>