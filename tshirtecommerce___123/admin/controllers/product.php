<?php
/**
 * @author tshirtecommerce - www.tshirtecommerce.com
 * @date: 2015-01-10
 * 
 * @copyright  Copyright (C) 2015 tshirtecommerce.com. All rights reserved.
 * @license    GNU General Public License version 2 or later; see LICENSE
 *
 */
if ( ! defined('ROOT')) exit('No direct script access allowed');

class Product extends Controllers
{
	
	public function index()
	{	
		$data = array();
		
		$data['title'] 		= 'Products';
		$data['sub_title'] 	= 'Manage';
		
		$dgClass 			= new dg();	
		$products 			= $dgClass->getProducts();	
		
		//sort array().
		$sort = array();
		foreach($products as $key=>$val)
		{
			$count = 0;
			$vl = array();
			foreach($products as $k=>$v)
			{
				if($count <= $k && !isset($sort[$k]))
				{
					$count = $k;
					$vl = $v;
				}
			}
			$sort[$count] = $vl;
		}
		
		$data['products']	= $sort;
		
		$this->view('products', $data);
	}
	
	public function page($segment = 0)
	{
		// get Products.
		$dgClass 			= new dg();	
		$products 			= $dgClass->getProducts();		
		
		if(isset($products))
		{
		
			$search = array();
			foreach($products as $key=>$val)
			{
				if(!empty($_POST['search_product']))
				{
					if(strpos(strtolower($val->title), strtolower($_POST["search_product"])) !== false)
						$search[$key] = $val;
				}else
				{
					$search[$key] = $val;
				}
			}
			
			//sort array().
			$sort = array();
			foreach($search as $key=>$val)
			{
				$count = 0;
				$vl = array();
				foreach($search as $k=>$v)
				{
					if($count <= $k && !isset($sort[$k]))
					{
						$count = $k;
						$vl = $v;
					}
				}
				$sort[$count] = $vl;
			}
			
			$page = array();
			if(isset($_POST['per_page']))
				$perpage = $_POST['per_page'];
			else
				$perpage = 10; 
				
			if($perpage == 'all')
				$perpage = count($sort);
			$j = 1;
			foreach($sort as $key=>$val)
			{
				if($j > $segment && $j <= ($perpage+$segment))
					$page[$key] = $sort[$key];
				$j++;
			}
			
			if($perpage < count($sort))
				$data['page'] = $perpage;
			else
				$data['page'] = 0;
			$data['products'] = $page;
			$data['total'] = count($sort);
			$data['segment'] = $segment;
			include_once(ROOT.DS.'views/product.php');
		}else
		{
			return;
		}
	}
	
	public function edit($id = 0, $error = 2)
	{
		$data = array();
		
		$data['title'] 		= 'Product';
		$data['sub_title'] 	= 'Add';
		$data['cate_checked']	= array();
		
		$is_new = true;
		if ($id > 0)
		{
			$dgClass 			= new dg();	
			$products 			= $dgClass->getProducts();		
			if (count($products) > 0)
			{
				foreach($products as $row)
				{
					if ($row->id == $id)
					{
						$is_new = false;
						$product = $row;
						break;
					}
				}
			}
			$product_cate = $dgClass->getProductCategories();
			$data_cate = array();
			foreach($product_cate as $val)
			{
				if($val->product_id == $id)
					$data_cate[] = $val->cate_id;
			}
			$data['cate_checked'] = $data_cate;
		}
		
		if ($is_new === true)
		{
			$product 		= new stdClass();			
		}
		$data['error']		= $error;
		$data['product']	= $product;
		
		$this->view('edit_product', $data);
	}
	
	public function colors($f = null, $id = null)
	{
		$data = array();
		$dgClass 			= new dg();	
		$colors 			= $dgClass->getColors();
		$data['colors']		= $colors;
		$data['function'] 	= $f;			
		$data['id'] 		= $id;
		
		$this->modal('color', $data);
	}
	
	public function design()
	{
		$data = array();
		$data['position'] 			= $_POST['position'];
		$data['color'] 				= $_POST['color'];
		$data['title'] 				= $_POST['title'];
		$data['number'] 			= $_POST['number'];
		
		$this->modal('design', $data);
	}
	
	public function save()
	{
		$data = $_POST['product'];
		
		$attributes = array();
		if (isset($data['fields']) && count($data['fields']) > 0)
		{
			$attributes['name'] 		= array();
			$attributes['prices'] 		= array();
			$attributes['titles'] 		= array();
			$attributes['type'] 		= array();
			$i=0;
			foreach($data['fields'] as $filed)
			{				
				$attributes['name'][$i] 	= $filed['name'];
				$attributes['prices'][$i] 	= $filed['prices'];
				$attributes['titles'][$i] 	= $filed['titles'];
				$attributes['type'][$i] 	= $filed['type'];
				$i++;
			}
		}
		unset($data['fields']);
		$data['attributes'] = $attributes;
		
		$dgClass 				= new dg();
		$content 				= array('products'=> array());		
		// get id
		if ($data['id'] == 0)
		{
			$id 				= 1;
			$products 			= $dgClass->getProducts();		
			if (count($products) > 0)
			{
				foreach($products as $product)
				{
					if ($product->id > $id)
						$id = $product->id;
				}
				$id = $id + 1;
			}
			$data['id'] = $id;
			
			$products[] = $data;
			$content['products'] = $products;
		}
		else
		{			
			$products 			= $dgClass->getProducts();
			
			$is_new 			= true;
			if (count($products) > 0)
			{
				foreach($products as $product)
				{
					if ($product->id == $data['id'])
					{
						$content['products'][]  = $data;
						$is_new 	= false;
					}
					else
					{
						$content['products'][] = $product;
					}
				}
			}
			
			if ($is_new === true)
			{
				$products[] = $data;
				$content['products']	= $products;
			}
		}
		
		$content = str_replace('\\\\', '', json_encode($content));
		
		// write file
		$path = dirname(ROOT) .DS. 'data' .DS. 'products.json';
		$check = $dgClass->WriteFile($path, $content);
		
		// update categories.
		$categories = $_POST['category'];
		if(count($categories))
		{ 
			$category = $dgClass->getProductCategories();
			$data_cate = array();
			$cid = 0;
			foreach($category as $val)
			{
				if($val->product_id != $data['id'])
				{
					$data_cate[] = $val;
					if($val->id > $cid)
						$cid = $val->id;
				}
			}
			
			foreach($categories as $val)
			{
				$cid++;
				$catedt = new stdClass();
				$catedt->id = $cid;
				$catedt->product_id = $data['id'];
				$catedt->cate_id = $val;
				$data_cate[] = $catedt;
			}
			
			// write file
			$path = dirname(ROOT) .DS. 'data' .DS. 'product_categories.json';
			$check = $dgClass->WriteFile($path, json_encode($data_cate));
		}
		
		if ($check === false)
			$dgClass->redirect('index.php/product/edit/'.$data['id'].'/0');
		else
			$dgClass->redirect('index.php/product/edit/'.$data['id'].'/1');
	}
	
	public function unpublish($id = 0)
	{
		$dgClass 				= new dg();
		
		if ($id > 0)
		{
			$products 			= $dgClass->getProducts();				
			if (count($products) > 0)
			{
				$content 		= array('products'=> array());
				foreach($products as $product)
				{
					if ($product->id == $id)
					{
						$product->published = 0;
					}
					$content['products'][] = $product;
				}
			}
			$path = dirname(ROOT) .DS. 'data' .DS. 'products.json';
			$check = $dgClass->WriteFile($path, json_encode($content));
		}
		
		
		$dgClass->redirect('index.php/product');
	}
	
	public function publish($id = 0)
	{
		$dgClass 				= new dg();
		
		if ($id > 0)
		{
			$products 			= $dgClass->getProducts();				
			if (count($products) > 0)
			{
				$content 		= array('products'=> array());
				foreach($products as $product)
				{
					if ($product->id == $id)
					{
						$product->published = 1;
					}
					$content['products'][] = $product;
				}
			}
			$path = dirname(ROOT) .DS. 'data' .DS. 'products.json';
			$check = $dgClass->WriteFile($path, json_encode($content));
		}
		
		
		$dgClass->redirect('index.php/product');
	}
	
	public function delete($id = 0)
	{
		$dgClass 				= new dg();
		
		if ($id > 0)
		{
			$products 			= $dgClass->getProducts();				
			if (count($products) > 0)
			{
				$content 		= array('products'=> array());
				foreach($products as $product)
				{
					if ($product->id != $id)
					{
						$content['products'][] = $product;
					}
				}
			}
			$path = dirname(ROOT) .DS. 'data' .DS. 'products.json';
			$check = $dgClass->WriteFile($path, json_encode($content));
		}
		
		
		$dgClass->redirect('index.php/product');
	}
	
	public function category()
	{
		if (isset($_POST['title']))
		{
			$title 		= $_POST['title'];
		}		
		
		if (isset($_POST['cateid']))
		{
			$parent_id 	= $_POST['cateid'];
		}
		
		if (isset($_POST['ids']))
		{
			$ids 	= $_POST['ids'];
		}
		else
		{
			$ids 	= array();
		}
		
		$dgClass = new dg();
		
		if(!empty($title))
		{
			$categories = $dgClass->getCategories();
			$cate_data = array();
			
			$cate_id = 0;
			if($parent_id == '')
				$parent_id = 0;
				
			foreach($categories as $cate)
			{
				$cate_data[] = array(
					'id' => $cate->id,
					'parent_id' => $cate->parent_id,
					'title' => $cate->title
				);
				
				if($cate->id > $cate_id)
					$cate_id = $cate->id;
			}
			
			$cate_data[] = array(
				'id' => $cate_id + 1,
				'parent_id' => $parent_id,
				'title' => $title
			);
			
			$path = dirname(ROOT) .DS. 'data' .DS. 'categories.json';
			$check = $dgClass->WriteFile($path, json_encode($cate_data));
		}
		elseif(count($ids))
		{
			$categories = $dgClass->getCategories();
			$cate_data = array();
			
			foreach($categories as $val)
			{
				if(!in_array($val->id, $ids))
					$cate_data[] = $val;
			}
			$path = dirname(ROOT) .DS. 'data' .DS. 'categories.json';
			$check = $dgClass->WriteFile($path, json_encode($cate_data));
		}
		
		$categories = $dgClass->getCategories();
		$categories = $dgClass->categoriesToTree($categories);
		$data['content'] 	= $dgClass->dispayTree( $categories, 0, array('type'=>'checkbox', 'name'=>'category[]') );				
		$data['list'] 		= '<option value="0">'. lang('product_parent_category', true) . '</option>' . $dgClass->dispayTree( $categories, 0, array('type'=>'select', 'name'=>'') );				
		echo json_encode($data);
		return;
	}
}

?>