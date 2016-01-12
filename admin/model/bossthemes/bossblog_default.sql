-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 18, 2014 at 09:39 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `test_site48`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_blog_category`
--

CREATE TABLE IF NOT EXISTS `oc_blog_category` (
  `blog_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`blog_category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `oc_blog_category`
--

INSERT INTO `oc_blog_category` (`blog_category_id`, `status`, `parent_id`, `sort_order`, `image`, `date_added`, `date_modified`) VALUES
(1, 1, 0, 1, 'catalog/bossblog/blog_cat.jpg', '2014-11-11 11:49:07', '2014-11-11 11:49:07'),
(2, 1, 0, 2, 'catalog/bossblog/h55.jpg', '2014-11-11 11:50:17', '2014-11-11 11:50:17'),
(3, 1, 2, 3, 'catalog/bossblog/h8.jpg', '2014-11-11 11:51:23', '2014-11-11 11:51:33'),
(4, 1, 3, 4, 'catalog/bossblog/h12.jpg', '2014-11-11 11:52:29', '2014-11-11 11:52:29'),
(5, 1, 2, 0, 'catalog/bossblog/h12.jpg', '2014-11-11 11:54:03', '2014-11-11 11:54:03'),
(6, 1, 0, 0, 'catalog/bossblog/h44.jpg', '2014-11-11 11:54:48', '2014-11-11 11:54:48'),
(7, 1, 0, 0, 'catalog/bossblog/h77.jpg', '2014-11-11 11:55:27', '2014-11-11 11:55:27');

--
-- Table structure for table `oc_blog_category_description`
--

CREATE TABLE IF NOT EXISTS `oc_blog_category_description` (
  `blog_category_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `meta_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`blog_category_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oc_blog_category_description`
--

INSERT INTO `oc_blog_category_description` (`blog_category_id`, `language_id`, `name`, `meta_description`, `meta_keyword`, `description`) VALUES
(1, 1, 'Smart phone', 'bossblog', 'bossblog', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor.&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br /&gt;\r\n&lt;br /&gt;\r\nFusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;'),
(2, 1, 'Technology', 'bossblog', 'bossblog', '&lt;p&gt;Microsoft tapped Tami Reller, the chief financial officer and head of marketing for Windows, to run business operations for the division, while Microsoft veteran Julie Larson-Green will take over responsibility for the technical features and product blueprints for Windows software and hardware such as the Surface tablet computer.&lt;/p&gt;'),
(3, 1, 'Digital Camera', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor.&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;\r\n&lt;br&gt;\r\nFusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;'),
(4, 1, 'Sony', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor.&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br /&gt;\r\n&lt;br /&gt;\r\nFusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;'),
(5, 1, 'Smart phone', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor.&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br /&gt;\r\n&lt;br /&gt;\r\nFusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;'),
(6, 1, 'Business', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor.&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br /&gt;\r\n&lt;br /&gt;\r\nFusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;'),
(7, 1, 'Sport', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor.&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br /&gt;\r\n&lt;br /&gt;\r\nFusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;');


--
-- Table structure for table `oc_blog_category_layout`
--

CREATE TABLE IF NOT EXISTS `oc_blog_category_layout` (
  `blog_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`blog_category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `oc_blog_category_store`
--

CREATE TABLE IF NOT EXISTS `oc_blog_category_store` (
  `blog_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`blog_category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oc_blog_category_store`
--

INSERT INTO `oc_blog_category_store` (`blog_category_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0);

--
-- Table structure for table `oc_blog_comment`
--

CREATE TABLE IF NOT EXISTS `oc_blog_comment` (
  `blog_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_article_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`blog_comment_id`,`blog_article_id`,`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `oc_blog_comment`
--

INSERT INTO `oc_blog_comment` (`blog_comment_id`, `blog_article_id`, `customer_id`, `author`, `email`, `text`, `status`, `date_added`, `date_modified`) VALUES
(1, 1, 0, 'Nguyen Linh', 'aaa@yahoo.com', 'Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.', 1, '2014-11-28 09:55:37', NULL),
(2, 2, 0, 'Rosa Lee', 'bbb@yahoo.com', 'Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.', 1, '2014-11-28 09:56:36', NULL),
(3, 4, 0, 'Herry Lee', 'aaa@yahoo.com', 'Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.', 1, '2014-11-28 15:57:49', NULL),
(4, 4, 0, 'Ji Yeon Park', 'bbb@yahoo.com', 'Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.', 1, '2014-11-28 15:58:37', NULL);


CREATE TABLE IF NOT EXISTS `oc_blog_product_related` (
  `blog_article_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`blog_article_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oc_blog_product_related`
--

INSERT INTO `oc_blog_product_related` (`blog_article_id`, `product_id`) VALUES
(1, 28),
(1, 30),
(1, 31),
(1, 42),
(1, 46),
(1, 47),
(1, 49),
(2, 31),
(2, 34),
(2, 40),
(2, 43),
(3, 30),
(3, 45),
(4, 47),
(5, 30),
(5, 36),
(5, 40),
(7, 31),
(7, 32),
(7, 36),
(7, 45),
(7, 46),
(28, 1),
(30, 1),
(30, 3),
(30, 5),
(31, 1),
(31, 2),
(31, 7),
(32, 7);

--
-- Table structure for table `oc_blog_article`
--

CREATE TABLE IF NOT EXISTS `oc_blog_article` (
  `blog_article_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) NOT NULL DEFAULT '0',
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `need_approval` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`blog_article_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `oc_blog_article`
--

INSERT INTO `oc_blog_article` (`blog_article_id`, `status`, `allow_comment`, `author`, `need_approval`, `sort_order`, `viewed`, `image`, `date_added`, `date_modified`) VALUES
(1, 1, 2, 'Admin', 2, 1, 20, 'catalog/bossblog/h1.jpg', '2014-11-11 12:00:41', '2014-11-28 00:00:00'),
(2, 1, 2, 'Admin', 2, 2, 29, 'catalog/bossblog/h2.jpg', '2014-11-11 12:02:21', '2014-11-11 00:00:00'),
(3, 1, 2, 'Admin', 2, 3, 2, 'catalog/bossblog/h3.jpg', '2014-11-11 12:04:08', '2014-11-28 00:00:00'),
(4, 1, 2, 'Admin', 2, 4, 75, 'catalog/bossblog/h4.jpg', '2014-11-11 12:05:20', '2014-11-11 00:00:00'),
(5, 1, 2, 'Admin', 2, 5, 1, 'catalog/bossblog/h5.jpg', '2014-11-11 12:06:48', '2014-11-28 00:00:00'),
(6, 1, 2, 'Admin', 2, 6, 1, 'catalog/bossblog/h6.jpg', '2014-11-11 12:07:52', '2014-11-28 00:00:00'),
(7, 1, 2, 'Admin', 2, 7, 1, 'catalog/bossblog/h7.jpg', '2014-11-11 12:09:33', '2014-11-28 00:00:00');


--
-- Table structure for table `oc_blog_article_category`
--

CREATE TABLE IF NOT EXISTS `oc_blog_article_category` (
  `blog_article_id` int(11) NOT NULL,
  `blog_category_id` int(11) NOT NULL,
  PRIMARY KEY (`blog_article_id`,`blog_category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oc_blog_article_category`
--

INSERT INTO `oc_blog_article_category` (`blog_article_id`, `blog_category_id`) VALUES
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
(7, 7);

--
-- Table structure for table `oc_blog_article_description`
--

CREATE TABLE IF NOT EXISTS `oc_blog_article_description` (
  `blog_article_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `meta_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `tag` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`blog_article_id`,`language_id`),
  FULLTEXT KEY `tag` (`tag`,`content`),
  FULLTEXT KEY `tag_2` (`tag`),
  FULLTEXT KEY `tag_3` (`tag`),
  FULLTEXT KEY `tag_4` (`tag`),
  FULLTEXT KEY `content` (`content`),
  FULLTEXT KEY `content_2` (`content`),
  FULLTEXT KEY `tag_5` (`tag`),
  FULLTEXT KEY `tag_6` (`tag`,`content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oc_blog_article_description`
--

INSERT INTO `oc_blog_article_description` (`blog_article_id`, `language_id`, `name`, `title`, `meta_description`, `meta_keyword`, `content`, `tag`) VALUES
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
(6, 2, 'Voluptatem accusantium laudantium totam rem aperia', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'nsectetur,adipiscing');
INSERT INTO `oc_blog_article_description` (`blog_article_id`, `language_id`, `name`, `title`, `meta_description`, `meta_keyword`, `content`, `tag`) VALUES
(7, 1, 'Voluptatem accusantium laudantium, totam rem aperia', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'deserunt,moll'),
(7, 2, 'Voluptatem accusantium laudantium, totam rem aperia', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'deserunt,moll');

--
-- Table structure for table `oc_blog_article_layout`
--

CREATE TABLE IF NOT EXISTS `oc_blog_article_layout` (
  `blog_article_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`blog_article_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `oc_blog_article_related`
--

CREATE TABLE IF NOT EXISTS `oc_blog_article_related` (
  `blog_article_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`blog_article_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oc_blog_article_related`
--

INSERT INTO `oc_blog_article_related` (`blog_article_id`, `related_id`) VALUES
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
(7, 5);

--
-- Table structure for table `oc_blog_article_store`
--

CREATE TABLE IF NOT EXISTS `oc_blog_article_store` (
  `blog_article_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`blog_article_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oc_blog_article_store`
--

INSERT INTO `oc_blog_article_store` (`blog_article_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
