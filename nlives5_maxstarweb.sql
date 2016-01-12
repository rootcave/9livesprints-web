-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 12, 2016 at 11:05 AM
-- Server version: 5.6.23-log
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nlives5_maxstarweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_address`
--

CREATE TABLE IF NOT EXISTS `oc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `custom_field` text NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `oc_address`
--

INSERT INTO `oc_address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`, `custom_field`) VALUES
(1, 1, 'linh', 'nguyen', '', '249 Ung Van Khiem Street, Binh Thanh District, HCM city', '', 'HCM', '084', 222, 3513, ''),
(2, 2, 'test', 'test', '', 'sdf sdfds fs ', '', 'sd fsdfs f', '34321', 222, 3529, ''),
(3, 3, 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 63, 1008, 'a:0:{}'),
(6, 6, 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '3432423', 222, 3515, ''),
(7, 7, 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '323123', 222, 3520, ''),
(4, 4, 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 222, 3529, 'a:0:{}'),
(5, 5, 'Pino', 'Sag', 'Eh', 'HhhCa', '', 'Cairo', '', 63, 1011, 'a:0:{}'),
(8, 6, 'Reshmi', 'Saha', 'kj', 'gfg', 'fgfdg', 'aa', '3432423', 222, 3515, ''),
(9, 4, 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 63, 1011, ''),
(10, 8, 'Sumana', 'Sah', '', 'Address Egypt Road', '', 'Egypt City', '700000', 63, 1011, 'a:0:{}'),
(14, 12, 'Rani', 'Saha', '', 'kolkata', '', 'kolkata', '', 63, 1016, ''),
(19, 17, 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 63, 1011, 'a:0:{}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_activity`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_login`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`affiliate_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_api`
--

CREATE TABLE IF NOT EXISTS `oc_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `password` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `oc_api`
--

INSERT INTO `oc_api` (`api_id`, `username`, `firstname`, `lastname`, `password`, `status`, `date_added`, `date_modified`) VALUES
(2, 'oiSbMERd5yuFT24HT1e6ZzsWjZSuPqc5aP4QkL2kpGEPJFsFBthbtIuKP3EkCFrj', '', '', 'FUYc0qVERwRw2qZZlAcT5zoUxuryr1zklvuB8iq6wyVqeo8HEnQj92a2O8NZOBz9Ak978x4KIOS879ZMYo5M6TFygklXohruQxFR1a9wXBInTrsolCdMuHmGri2t6bc3aWE8mZ7wfMzphw4erx3jbTBwv4AbGsEZbT5CPwyIetZEnP7ro5LUB1SzqoBhIXjTVnpduhg2Wo11mF3RebWccxcQeu4BDY6kHURRIoH9G6LBcSsOMUZ7wGeDKOq10xMN', 1, '2014-10-22 11:04:47', '2014-10-22 11:04:47');

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute`
--

CREATE TABLE IF NOT EXISTS `oc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_description`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(3, 1, 'Clockspeed'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8');

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Memory'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor');

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner`
--

CREATE TABLE IF NOT EXISTS `oc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 1),
(7, 'Home Page Slideshow', 1),
(8, 'Manufacturers', 1),
(9, 'Boss Carousel', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image`
--

CREATE TABLE IF NOT EXISTS `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=107 ;

--
-- Dumping data for table `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `link`, `image`, `sort_order`) VALUES
(79, 7, 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(80, 7, '', 'catalog/demo/banners/MacBookAir.jpg', 0),
(87, 6, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(88, 8, '', 'catalog/demo/manufacturer/harley.png', 0),
(89, 8, '', 'catalog/demo/manufacturer/dell.png', 0),
(90, 8, '', 'catalog/demo/manufacturer/disney.png', 0),
(91, 8, '', 'catalog/demo/manufacturer/cocacola.png', 0),
(92, 8, '', 'catalog/demo/manufacturer/burgerking.png', 0),
(93, 8, '', 'catalog/demo/manufacturer/canon.png', 0),
(94, 8, '', 'catalog/demo/manufacturer/nfl.png', 0),
(95, 8, '', 'catalog/demo/manufacturer/redbull.png', 0),
(96, 8, '', 'catalog/demo/manufacturer/sony.png', 0),
(97, 8, '', 'catalog/demo/manufacturer/starbucks.png', 0),
(98, 8, '', 'catalog/demo/manufacturer/nintendo.png', 0),
(99, 9, '##', 'catalog/bt_parallax/brand1.png', 1),
(100, 9, '#', 'catalog/bt_parallax/brand2.png', 2),
(101, 9, '', 'catalog/bt_parallax/brand3.png', 3),
(102, 9, '', 'catalog/bt_parallax/brand4.png', 4),
(103, 9, '', 'catalog/bt_parallax/brand5.png', 5),
(104, 9, '', 'catalog/bt_parallax/brand6.png', 6),
(105, 9, '', 'catalog/bt_parallax/brand7.png', 7),
(106, 9, '', 'catalog/bt_parallax/brand8.png', 8);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image_description`
--

CREATE TABLE IF NOT EXISTS `oc_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner_image_description`
--

INSERT INTO `oc_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(79, 1, 7, 'iPhone 6'),
(80, 1, 7, 'MacBookAir'),
(87, 1, 6, 'HP Banner'),
(88, 1, 8, 'Harley Davidson'),
(89, 1, 8, 'Dell'),
(90, 1, 8, 'Disney'),
(91, 1, 8, 'Coca Cola'),
(92, 1, 8, 'Burger King'),
(93, 1, 8, 'Canon'),
(94, 1, 8, 'NFL'),
(95, 1, 8, 'RedBull'),
(96, 1, 8, 'Sony'),
(97, 1, 8, 'Starbucks'),
(98, 1, 8, 'Nintendo'),
(99, 1, 9, 'BossThemes'),
(100, 1, 9, 'CodeSpot'),
(101, 1, 9, 'Extreme Magento'),
(102, 1, 9, 'Gala Theme'),
(103, 1, 9, 'PresThemes'),
(104, 1, 9, 'Design Shopify'),
(105, 1, 9, 'WPDance'),
(106, 1, 9, 'EggThemes');

-- --------------------------------------------------------

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

-- --------------------------------------------------------

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

-- --------------------------------------------------------

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
(1, 1, 'Aliquam pulvinar porttitor nulla, et consequat', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'dignissimos,ducimus,quiblanditiis,praesentium'),
(1, 2, 'Aliquam pulvinar porttitor nulla, et consequat', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'dignissimos,ducimus,quiblanditiis,praesentium'),
(2, 1, 'Donec a interdum ligula fusce convallis orci quis lorem bibendum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'dolorese,tquas'),
(2, 2, 'Donec a interdum ligula fusce convallis orci quis lorem bibendum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'dolorese,tquas'),
(3, 1, 'Nisl cursus sollicitudin paesent ultricies arcu', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'tristiqueu,stoporta'),
(3, 2, 'Nisl cursus sollicitudin paesent ultricies arcu', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'tristiqueu,stoporta'),
(4, 1, 'Nulla eu velit a enim congue ornare convallis orci quis lorem', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'aliquam,dapibus'),
(4, 2, 'Nulla eu velit a enim congue ornare convallis orci quis lorem', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'aliquam,dapibus'),
(5, 1, 'Tellus volutpat bibendum morbi pretium fringilla nulla a laoreet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'risus,volutpa'),
(5, 2, 'Tellus volutpat bibendum morbi pretium fringilla nulla a laoreet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'risus,volutpa'),
(6, 1, 'Voluptatem accusantium laudantium totam rem aperia', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'nsectetur,adipiscing'),
(6, 2, 'Voluptatem accusantium laudantium totam rem aperia', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'nsectetur,adipiscing');
INSERT INTO `oc_blog_article_description` (`blog_article_id`, `language_id`, `name`, `title`, `meta_description`, `meta_keyword`, `content`, `tag`) VALUES
(7, 1, 'Voluptatem accusantium laudantium, totam rem aperia', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'deserunt,moll'),
(7, 2, 'Voluptatem accusantium laudantium, totam rem aperia', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Aliquam pulvinar porttitor nulla, et consequat nisl cursus sollicitudin. Praesent ultricies arcu id tellus volutpat bibendum.', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p class=&quot;second_image&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bossblog/blogdetail_img2.jpg&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum&lt;/p&gt;\r\n\r\n&lt;p&gt;vestibulum sagittis lectus tristique justo porta molestie. Donec venenatis nulla at libero dictum id placerat eros elementum. Aliquam dapibus adipiscing enim vitae tempor. Nullam at semper mauris. Maecenas commodo tincidunt leo eget mattis. Aenean nec felis eu velit interdum laoreet eget vitae purus. Donec vel sem sapien, a interdum ligula. Fusce convallis orci quis lorem bibendum ullamcorper. Maecenas convallis sapien non lorem semper quis convallis libero varius. Duis cursus nibh vel magna lobortis vehicula.&lt;br&gt;&lt;br&gt;Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo. Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;\r\n\r\n&lt;p&gt;Duis cursus nibh vel magna lobortis vehicula. Fusce consectetur, velit eu pretium euismod, eros urna sollicitudin enim, eu ornare tellus magna quis justo. Etiam placerat, diam sed rutrum rutrum, orci risus volutpat augue, semper varius velit enim quis leo.&lt;br&gt;&lt;br&gt;Cras lectus quam, vulputate eget scelerisque at, sodales at turpis. Nulla tincidunt, velit et posuere pharetra, magna massa sagittis ligula, ac placerat ipsum elit ac risus.&lt;/p&gt;', 'deserunt,moll');

-- --------------------------------------------------------

--
-- Table structure for table `oc_blog_article_layout`
--

CREATE TABLE IF NOT EXISTS `oc_blog_article_layout` (
  `blog_article_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`blog_article_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

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

-- --------------------------------------------------------

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

-- --------------------------------------------------------

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

-- --------------------------------------------------------

--
-- Table structure for table `oc_blog_category_layout`
--

CREATE TABLE IF NOT EXISTS `oc_blog_category_layout` (
  `blog_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`blog_category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

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

-- --------------------------------------------------------

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

-- --------------------------------------------------------

--
-- Table structure for table `oc_blog_product_related`
--

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
(32, 7),
(34, 2),
(36, 5),
(36, 7),
(40, 2),
(40, 5),
(42, 1),
(43, 2),
(45, 3),
(45, 7),
(46, 1),
(46, 7),
(47, 1),
(47, 4),
(49, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_btslider`
--

CREATE TABLE IF NOT EXISTS `oc_btslider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setting` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Dumping data for table `oc_btslider`
--

INSERT INTO `oc_btslider` (`id`, `setting`) VALUES
(24, '{"slider_type":"fullscreen","slider_width":"1600","slider_height":"590","delay":"5000","startWithSlide":"0","stopslider":"on","stopafterloops":"-1","stopatslide":"-1","touchenabled":"on","onhoverstop":"on","timeline":"on","timerlineposition":"top","shadow":"0","navigationtype":"bullet","navigationarrow":"nexttobullets","navigationstyle":"preview1","navigationhalign":"center","navigationvalign":"bottom","navigationhoffset":"0","navigationvoffset":"0","soloarrowlefthalign":"left","soloarrowleftvalign":"top","soloarrowlefthoffset":"0","soloarrowleftvoffset":"0","soloarrowrighthalign":"left","soloarrowrightvalign":"top","soloarrowrighthoffset":"0","soloarrowrightvoffset":"0","timehidethumbnail":"0","thumbnailwidth":"0","thumbnailheight":"0","thumbamount":"0","hidecapptionatlimit":"0","hideallcapptionatlimit":"0","hideslideratlimit":"0"}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_btslider_slide`
--

CREATE TABLE IF NOT EXISTS `oc_btslider_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slider_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `slideset` text COLLATE utf8_unicode_ci,
  `caption` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;

--
-- Dumping data for table `oc_btslider_slide`
--

INSERT INTO `oc_btslider_slide` (`id`, `slider_id`, `status`, `sort_order`, `slideset`, `caption`) VALUES
(17, 24, 1, 1, '{"url":"#","enablelink":"1","type_background":"image_bg","background":"catalog/bt_parallax/bo1.jpg","transitions":"slideright","slotamount":"7","masterspeed":"500","delay":"5000","target":"_self","kenburns":"off","enablefullvideo":"0"}', '""'),
(20, 24, 1, 0, '{"url":"#","enablelink":"0","type_background":"image_bg","background":"catalog/b2n.jpg","transitions":"slideright","slotamount":"7","masterspeed":"500","delay":"5000","target":"_self","kenburns":"off","enablefullvideo":"0"}', '""'),
(21, 24, 1, 0, '{"url":"#","enablelink":"0","type_background":"image_bg","background":"catalog/b3n.jpg","transitions":"slideright","slotamount":"7","masterspeed":"500","delay":"5000","target":"_self","kenburns":"off","enablefullvideo":"0"}', '""'),
(22, 24, 1, 0, '{"url":"#","enablelink":"0","type_background":"image_bg","background":"catalog/b4n.jpg","transitions":"slideright","slotamount":"7","masterspeed":"500","delay":"5000","target":"_self","kenburns":"off","enablefullvideo":"0"}', '""'),
(23, 24, 1, 0, '{"url":"#","enablelink":"0","type_background":"image_bg","background":"catalog/b5n.jpg","transitions":"slideright","slotamount":"7","masterspeed":"500","delay":"5000","target":"_self","kenburns":"off","enablefullvideo":"0"}', '""');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category`
--

CREATE TABLE IF NOT EXISTS `oc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=74 ;

--
-- Dumping data for table `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(17, '', 0, 0, 1, 4, 1, '2009-01-03 21:08:57', '2014-03-11 09:06:14'),
(24, '', 0, 1, 1, 5, 1, '2009-01-20 02:36:26', '2014-03-11 09:06:25'),
(25, 'catalog/bt_product/women.jpg', 0, 1, 1, 0, 1, '2009-01-31 01:04:25', '2015-11-19 07:34:43'),
(60, 'catalog/kids11.jpg', 0, 0, 1, 2, 1, '2015-10-01 08:35:40', '2015-10-09 00:36:45'),
(65, 'catalog/card.jpg', 0, 0, 1, 5, 1, '2015-10-07 14:03:27', '2015-10-08 10:04:59'),
(63, 'catalog/mug.jpg', 0, 0, 1, 3, 1, '2015-10-07 14:02:20', '2015-10-08 10:12:34'),
(72, '', 0, 0, 1, 0, 1, '2015-10-07 14:21:54', '2015-10-10 04:13:21'),
(71, '', 0, 0, 1, 0, 1, '2015-10-07 14:21:33', '2015-10-08 10:13:33'),
(70, '', 0, 0, 1, 0, 1, '2015-10-07 14:21:11', '2015-10-08 10:11:48'),
(67, 'catalog/sticker.jpg', 0, 0, 1, 7, 1, '2015-10-07 14:04:28', '2015-10-08 10:14:07'),
(69, '', 0, 0, 1, 0, 1, '2015-10-07 14:14:12', '2015-10-08 10:08:15'),
(66, 'catalog/button.jpg', 0, 0, 1, 6, 1, '2015-10-07 14:03:57', '2015-10-08 10:05:28'),
(73, 'catalog/other.jpg', 0, 0, 1, 9, 1, '2015-10-08 03:51:43', '2015-10-08 10:13:02'),
(68, 'catalog/keychain.jpg', 0, 0, 1, 8, 1, '2015-10-07 14:04:51', '2015-10-08 10:08:48'),
(57, 'catalog/men11.jpg', 0, 0, 1, 1, 1, '2011-04-26 08:53:16', '2015-10-15 09:31:10'),
(64, 'catalog/moble.jpg', 0, 0, 1, 4, 1, '2015-10-07 14:02:58', '2015-10-08 10:10:29');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_description`
--

CREATE TABLE IF NOT EXISTS `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(17, 1, 'Software', '', '', '', ''),
(24, 1, 'Phones &amp; PDAs', '', '', '', ''),
(25, 1, 'Women', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Women', '', ''),
(60, 1, 'Kids', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'kids', '', ''),
(67, 1, 'Stickers', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Stickers', '', ''),
(68, 1, 'Keychains	', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Keychains', '', ''),
(69, 1, 'Hall Of Fame', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Hall Of Fame', '', ''),
(70, 1, 'Most Popular', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Most Popular', '', ''),
(71, 1, 'Special Orders', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Special Orders', '', ''),
(72, 1, 'Design &amp; Color', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Design &amp; color', '', ''),
(65, 1, 'Business Cards', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Business Cards', '', ''),
(66, 1, 'Buttons', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Buttons', '', ''),
(73, 1, 'Others', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Others', '', ''),
(57, 1, 'Men', '', 'Men', '', ''),
(63, 1, 'Mugs', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Mugs', '', ''),
(64, 1, 'Mobile Cases', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Mobile Cases', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_filter`
--

CREATE TABLE IF NOT EXISTS `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_path`
--

CREATE TABLE IF NOT EXISTS `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(17, 17, 0),
(24, 24, 0),
(25, 25, 0),
(72, 72, 0),
(71, 71, 0),
(73, 73, 0),
(70, 70, 0),
(69, 69, 0),
(68, 68, 0),
(67, 67, 0),
(66, 66, 0),
(65, 65, 0),
(60, 60, 0),
(57, 57, 0),
(64, 64, 0),
(63, 63, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_to_layout`
--

INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(57, 0, 3),
(60, 0, 0),
(25, 0, 0),
(73, 0, 0),
(63, 0, 0),
(64, 0, 0),
(65, 0, 0),
(66, 0, 0),
(67, 0, 0),
(68, 0, 0),
(69, 0, 0),
(70, 0, 0),
(71, 0, 0),
(72, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(17, 0),
(25, 0),
(57, 0),
(60, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0),
(72, 0),
(73, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_country`
--

CREATE TABLE IF NOT EXISTS `oc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=258 ;

--
-- Dumping data for table `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Armenia', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Azerbaijan', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Belarus', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, 'China', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D''Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TL', 'TLS', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Georgia', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'Korea, Republic of', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'FYROM', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Moldova, Republic of', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Russian Federation', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Tajikistan', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Turkmenistan', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Ukraine', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Uzbekistan', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 1),
(243, 'Serbia', 'RS', 'SRB', '', 0, 1),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 1),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 1),
(246, 'Curacao', 'CW', 'CUW', '', 0, 1),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 1),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 1),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 1),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 1),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 1),
(252, 'Ascension Island (British)', 'AC', 'ASC', '', 0, 1),
(253, 'Kosovo, Republic of', 'XK', 'UNK', '', 0, 1),
(254, 'Isle of Man', 'IM', 'IMN', '', 0, 1),
(255, 'Tristan da Cunha', 'TA', 'SHN', '', 0, 1),
(256, 'Guernsey', 'GG', 'GGY', '', 0, 1),
(257, 'Jersey', 'JE', 'JEY', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon`
--

CREATE TABLE IF NOT EXISTS `oc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'F', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 1, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18'),
(7, '100% discount', '9live', 'P', '100.0000', 0, 0, '0.0000', '2015-12-21', '2016-05-28', 1, '1', 1, '2015-12-21 06:16:12');

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_category`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_coupon_category`
--

INSERT INTO `oc_coupon_category` (`coupon_id`, `category_id`) VALUES
(4, 57),
(4, 63);

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_history`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_product`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `oc_coupon_product`
--

INSERT INTO `oc_coupon_product` (`coupon_product_id`, `coupon_id`, `product_id`) VALUES
(4, 4, 63);

-- --------------------------------------------------------

--
-- Table structure for table `oc_currency`
--

CREATE TABLE IF NOT EXISTS `oc_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(4, 'EGP', 'EGP', '£', '', '2', 1.00000000, 1, '2016-01-12 10:15:17'),
(2, 'US Dollar', 'USD', '$', '', '2', 0.12770000, 0, '2016-01-12 09:15:08');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer`
--

CREATE TABLE IF NOT EXISTS `oc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL,
  `address_id` int(11) NOT NULL,
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `oc_customer`
--

INSERT INTO `oc_customer` (`customer_id`, `customer_group_id`, `store_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `custom_field`, `ip`, `status`, `approved`, `safe`, `token`, `date_added`) VALUES
(1, 1, 0, 'linh', 'nguyen', 'aaa@yahoo.com', '123456789', '', 'e4bdf32b792b3d60a0d28fc2f774c9abaab99550', '247a59d5d', 'a:0:{}', 'a:5:{i:0;i:42;i:1;i:33;i:2;i:41;i:3;s:2:"40";i:4;s:2:"30";}', 0, 1, '', '192.168.1.99', 1, 1, 0, '', '2014-11-13 11:18:46'),
(2, 1, 0, 'test', 'test', 'test@yahoo.com', '2323232', '', '19037d8477762cc49845b5cf60349d8e7a159210', '01a17b827', 'a:1:{s:40:"YToxOntzOjEwOiJwcm9kdWN0X2lkIjtpOjQxO30=";i:1;}', 'a:1:{i:0;s:2:"28";}', 0, 2, '', '192.168.1.31', 1, 1, 0, '', '2014-12-08 16:14:29'),
(3, 1, 0, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', '0deba3e22ed9ea31f634619bb7732ed975ffd72e', '5b9280ca5', 'a:0:{}', 'a:1:{i:0;s:2:"75";}', 1, 3, 'a:0:{}', '41.187.32.38', 1, 1, 1, '', '2015-10-15 06:57:24'),
(4, 1, 0, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'cf22a8d26db4bdb584589d393f4a32884f87f6e9', '4a541b852', 'a:1:{s:84:"YToyOntzOjEwOiJwcm9kdWN0X2lkIjtpOjc4O3M6Njoib3B0aW9uIjthOjE6e2k6MjQwO3M6MjoiNzAiO319";i:1;}', '', 0, 4, 'a:0:{}', '45.113.88.2', 1, 1, 1, '', '2015-10-15 13:41:37'),
(12, 1, 0, 'Rani', 'Saha', 'wbtkolkata@gmail.com', '343453', '', '537e01b84df569f46ad0c438bfe421646a53f140', '91e59d6ed', 'a:1:{s:84:"YToyOntzOjEwOiJwcm9kdWN0X2lkIjtpOjc4O3M6Njoib3B0aW9uIjthOjE6e2k6MjQwO3M6MjoiNzAiO319";i:1;}', '', 0, 14, '', '45.113.88.2', 1, 1, 0, '', '2015-12-29 05:20:57'),
(17, 1, 0, 'Gehad', 'Hashim', 'gehadhashim@gmail.com', '+201003388314', '', '386e4b65e3e8c7311f847aa5cf9a8f466e4f9f5a', 'eba925ef6', 'a:0:{}', '', 1, 19, 'a:0:{}', '41.187.32.38', 1, 1, 0, '', '2015-12-30 06:45:35'),
(5, 1, 0, 'Pino', 'Ssg', 'pino.ssg@gmail.com', '1234456789', '', '1f97d1d404d5b47a43594c30b5c4626c55c522f9', '698951606', 'a:1:{s:40:"YToxOntzOjEwOiJwcm9kdWN0X2lkIjtpOjUyO30=";i:1;}', '', 0, 5, 'a:0:{}', '198.46.81.196', 1, 1, 0, '', '2015-10-16 06:36:58'),
(6, 1, 0, 'Reshmi', 'Saha', 'maxstar1.gaf@gmail.com', '4342', '', '0ae74c58441a3961039cdbd304bcf4385e2a6a57', 'b61bf0316', 'a:1:{s:720:"YToyOntzOjEwOiJwcm9kdWN0X2lkIjtpOjUyO3M6Njoib3B0aW9uIjthOjE6e3M6NjoiZGVzaWduIjthOjg6e3M6NToicm93aWQiO3M6MzI6ImFiZTllZjljMTQ3ODhiNzc1ZmNlYmYwN2M4NTM1YjEyIjtzOjU6InByaWNlIjtzOjE6IjAiO3M6ODoicXVhbnRpdHkiO3M6MToiMSI7czo5OiJjb2xvcl9oZXgiO3M6NjoiRkZGRkZGIjtzOjExOiJjb2xvcl90aXRsZSI7czo1OiJXaGl0ZSI7czo2OiJpbWFnZXMiO3M6MTU1OiJ7JnF1b3Q7ZnJvbnQmcXVvdDs6JnF1b3Q7dXBsb2FkZWRcLzIwMTVcLzExXC9cL2NhcnQtZnJvbnQtMTQ0ODQ2MDEwNi5wbmcmcXVvdDssJnF1b3Q7YmFjayZxdW90OzomcXVvdDt1cGxvYWRlZFwvMjAxNVwvMTFcL1wvY2FydC1iYWNrLTE0NDg0NjAxMDYucG5nJnF1b3Q7fSI7czo3OiJvcHRpb25zIjthOjE6e2k6MDthOjM6e3M6NDoibmFtZSI7czo0OiJTaXplIjtzOjQ6InR5cGUiO3M6ODoidGV4dGxpc3QiO3M6NToidmFsdWUiO2E6MTp7czoxOiJTIjtzOjE6IjEiO319fXM6MTA6InByb2R1Y3RfaWQiO3M6MjoiNTIiO319fQ==";i:1;}', '', 0, 6, '', '45.113.88.2', 1, 1, 0, '', '2015-10-27 14:55:12'),
(7, 1, 0, 'Reshmi', 'Saha', 'maxstar11.gaf@gmail.com', '21212', '', 'f98417d9007c5ea8708adea80304207a7a5bde0e', '8b3d8fe64', 'a:1:{s:720:"YToyOntzOjEwOiJwcm9kdWN0X2lkIjtpOjUyO3M6Njoib3B0aW9uIjthOjE6e3M6NjoiZGVzaWduIjthOjg6e3M6NToicm93aWQiO3M6MzI6IjU3ZmJjOTk5ZjQ0NTM1YjFmZmU5MjdmYzU3YmI3MGI2IjtzOjU6InByaWNlIjtzOjE6IjIiO3M6ODoicXVhbnRpdHkiO3M6MToiMSI7czo5OiJjb2xvcl9oZXgiO3M6NjoiRkZGRkZGIjtzOjExOiJjb2xvcl90aXRsZSI7czo1OiJXaGl0ZSI7czo2OiJpbWFnZXMiO3M6MTU1OiJ7JnF1b3Q7ZnJvbnQmcXVvdDs6JnF1b3Q7dXBsb2FkZWRcLzIwMTVcLzExXC9cL2NhcnQtZnJvbnQtMTQ0NzA2MzE5My5wbmcmcXVvdDssJnF1b3Q7YmFjayZxdW90OzomcXVvdDt1cGxvYWRlZFwvMjAxNVwvMTFcL1wvY2FydC1iYWNrLTE0NDcwNjMxOTMucG5nJnF1b3Q7fSI7czo3OiJvcHRpb25zIjthOjE6e2k6MDthOjM6e3M6NDoibmFtZSI7czo0OiJTaXplIjtzOjQ6InR5cGUiO3M6ODoidGV4dGxpc3QiO3M6NToidmFsdWUiO2E6MTp7czoxOiJTIjtzOjE6IjEiO319fXM6MTA6InByb2R1Y3RfaWQiO3M6MjoiNTIiO319fQ==";i:1;}', '', 0, 7, '', '45.113.88.2', 1, 1, 0, '', '2015-11-09 05:15:40'),
(8, 1, 0, 'Sumana', 'Sah', 'suman32@gmail.com', '99658965899', '', '1637e19e905abbab6f082551424bf873828f996f', '6c2e694ed', 'a:0:{}', '', 0, 10, 'a:0:{}', '45.113.88.2', 1, 1, 0, '', '2015-12-28 12:31:04');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_activity`
--

CREATE TABLE IF NOT EXISTS `oc_customer_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=217 ;

--
-- Dumping data for table `oc_customer_activity`
--

INSERT INTO `oc_customer_activity` (`activity_id`, `customer_id`, `key`, `data`, `ip`, `date_added`) VALUES
(1, 1, 'register', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-11-13 11:18:47'),
(2, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-11-17 16:33:48'),
(3, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-11-18 11:32:20'),
(4, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-11-18 11:43:14'),
(5, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-11-18 11:59:37'),
(6, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-11-18 12:17:31'),
(7, 1, 'edit', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-11-18 12:17:34'),
(8, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-11-18 12:45:42'),
(9, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-11-18 14:16:53'),
(10, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-11-18 14:18:14'),
(11, 1, 'order_account', 'a:3:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";s:8:"order_id";i:1;}', '192.168.1.99', '2014-11-18 14:22:36'),
(12, 1, 'return_account', 'a:3:{s:9:"return_id";i:1;s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-11-18 14:41:47'),
(13, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-11-19 10:53:29'),
(14, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-11-19 11:01:40'),
(15, 1, 'order_account', 'a:3:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";s:8:"order_id";i:2;}', '192.168.1.99', '2014-11-19 11:11:42'),
(16, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-11-19 11:44:40'),
(17, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-11-20 08:58:08'),
(18, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-11-21 10:39:52'),
(19, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-11-25 14:36:54'),
(20, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-11-27 14:09:24'),
(21, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-12-08 09:56:56'),
(22, 1, 'edit', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-12-08 09:58:54'),
(23, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-12-08 11:22:07'),
(24, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-12-08 14:52:24'),
(25, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-12-08 16:09:12'),
(26, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-12-08 16:11:53'),
(27, 2, 'register', 'a:2:{s:11:"customer_id";s:1:"2";s:4:"name";s:9:"test test";}', '192.168.1.31', '2014-12-08 16:14:31'),
(28, 2, 'login', 'a:2:{s:11:"customer_id";s:1:"2";s:4:"name";s:9:"test test";}', '192.168.1.31', '2014-12-10 10:10:27'),
(29, 2, 'order_account', 'a:3:{s:11:"customer_id";s:1:"2";s:4:"name";s:9:"test test";s:8:"order_id";i:6;}', '192.168.1.31', '2014-12-10 10:12:03'),
(30, 2, 'return_account', 'a:3:{s:11:"customer_id";s:1:"2";s:4:"name";s:9:"test test";s:9:"return_id";i:2;}', '192.168.1.31', '2014-12-10 10:23:11'),
(31, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-12-10 16:10:13'),
(32, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-12-10 16:25:13'),
(33, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-12-10 16:36:04'),
(34, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-12-10 16:55:13'),
(35, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-12-11 09:09:03'),
(36, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-12-11 10:49:49'),
(37, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:11:"linh nguyen";}', '192.168.1.99', '2014-12-11 12:02:58'),
(38, 0, 'order_guest', 'a:2:{s:4:"name";s:11:"Remi Sahani";s:8:"order_id";i:10;}', '45.113.88.2', '2015-10-07 08:17:03'),
(39, 0, 'order_guest', 'a:2:{s:4:"name";s:5:"ra ra";s:8:"order_id";i:11;}', '45.113.88.2', '2015-10-07 08:59:11'),
(40, 3, 'register', 'a:2:{s:11:"customer_id";i:3;s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-10-15 06:57:24'),
(41, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:12;}', '41.33.187.161', '2015-10-15 07:05:39'),
(42, 4, 'register', 'a:2:{s:11:"customer_id";i:4;s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-10-15 13:41:38'),
(43, 4, 'forgotten', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-10-15 13:42:14'),
(44, 4, 'forgotten', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-10-15 13:42:29'),
(45, 5, 'register', 'a:2:{s:11:"customer_id";i:5;s:4:"name";s:8:"Pino Sag";}', '197.133.255.214', '2015-10-16 06:36:58'),
(46, 6, 'register', 'a:2:{s:11:"customer_id";i:6;s:4:"name";s:11:"Reshmi Saha";}', '103.57.243.49', '2015-10-27 14:55:12'),
(47, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-10-28 03:47:50'),
(48, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:13;}', '41.33.187.161', '2015-10-28 07:22:44'),
(49, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";}', '103.57.242.190', '2015-10-28 09:37:00'),
(50, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";}', '103.57.242.190', '2015-10-28 09:56:16'),
(51, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-10-30 05:15:56'),
(52, 6, 'order_account', 'a:3:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:14;}', '45.113.88.2', '2015-10-30 05:22:58'),
(53, 6, 'order_account', 'a:3:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:15;}', '45.113.88.2', '2015-10-30 05:30:36'),
(54, 6, 'order_account', 'a:3:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:16;}', '45.113.88.2', '2015-10-30 05:39:17'),
(55, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-11-02 05:36:11'),
(56, 3, 'forgotten', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.34.41.113', '2015-11-02 10:16:29'),
(57, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-11-04 03:19:45'),
(58, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-11-04 23:33:36'),
(59, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-11-05 00:17:38'),
(60, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-11-05 01:57:19'),
(61, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-11-05 02:02:47'),
(62, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-11-05 02:21:01'),
(63, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-11-05 03:20:39'),
(64, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-11-05 03:28:21'),
(65, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-11-05 05:47:54'),
(66, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:17;}', '41.33.187.161', '2015-11-05 05:48:54'),
(67, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-11-05 08:56:18'),
(68, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-11-05 09:11:09'),
(69, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-11-05 12:14:34'),
(70, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.69.110.1', '2015-11-06 04:57:20'),
(71, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.69.110.1', '2015-11-06 05:39:59'),
(72, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-11-08 12:59:10'),
(73, 7, 'register', 'a:2:{s:11:"customer_id";i:7;s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-11-09 05:15:40'),
(74, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-11-09 05:42:32'),
(75, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";}', '1.39.38.225', '2015-11-09 06:12:31'),
(76, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-11-09 07:56:12'),
(77, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-11-09 08:39:52'),
(78, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-11-09 09:33:44'),
(79, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:18;}', '45.113.88.2', '2015-11-09 10:45:40'),
(80, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-11-09 11:01:39'),
(81, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-11-09 11:04:04'),
(82, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-11-09 11:44:20'),
(83, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.69.110.1', '2015-11-09 19:56:27'),
(84, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:19;}', '41.69.110.1', '2015-11-09 19:59:04'),
(85, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.34.10.227', '2015-11-10 07:41:44'),
(86, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:8:"Pino Ssg";}', '41.34.10.227', '2015-11-10 11:25:01'),
(87, 5, 'order_account', 'a:3:{s:11:"customer_id";s:1:"5";s:4:"name";s:8:"Pino Ssg";s:8:"order_id";i:20;}', '41.34.54.170', '2015-11-10 12:15:32'),
(88, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-11-11 05:46:00'),
(89, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-11-12 04:53:04'),
(90, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '197.39.49.62', '2015-11-15 12:58:33'),
(91, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-11-17 05:14:07'),
(92, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-11-19 11:06:50'),
(93, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-11-21 00:57:44'),
(94, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-11-21 04:49:19'),
(95, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-11-21 06:42:30'),
(96, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '105.198.243.51', '2015-11-22 10:10:49'),
(97, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-11-23 05:24:23'),
(98, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-11-25 04:43:44'),
(99, 6, 'login', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-11-25 07:14:34'),
(100, 6, 'address_add', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-11-25 07:15:35'),
(101, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-11-25 08:23:00'),
(102, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-11-25 09:09:41'),
(103, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-11-25 09:16:50'),
(104, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-11-26 07:13:28'),
(105, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-12-01 14:43:56'),
(106, 4, 'address_add', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-12-01 14:46:13'),
(107, 4, 'order_account', 'a:3:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:22;}', '45.113.88.2', '2015-12-01 14:48:16'),
(108, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '105.198.243.116', '2015-12-07 11:21:12'),
(109, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:23;}', '105.198.243.116', '2015-12-07 11:22:52'),
(110, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-12-07 13:10:53'),
(111, 4, 'order_account', 'a:3:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:29;}', '45.113.88.2', '2015-12-07 13:44:38'),
(112, 4, 'order_account', 'a:3:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:31;}', '45.113.88.2', '2015-12-07 13:59:27'),
(113, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.186.129', '2015-12-08 03:52:21'),
(114, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.186.129', '2015-12-08 09:32:55'),
(115, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:34;}', '41.33.186.129', '2015-12-08 09:34:04'),
(116, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.235.132.54', '2015-12-08 11:57:48'),
(117, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:35;}', '41.235.132.54', '2015-12-08 11:58:06'),
(118, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:36;}', '41.235.132.54', '2015-12-08 12:11:40'),
(119, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.235.132.54', '2015-12-08 12:12:52'),
(120, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:37;}', '41.235.132.54', '2015-12-08 12:13:17'),
(121, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-12-08 13:02:12'),
(122, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-12-09 07:00:48'),
(123, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-12-09 07:33:15'),
(124, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-12-09 13:34:11'),
(125, 4, 'order_account', 'a:3:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:43;}', '45.113.88.2', '2015-12-09 13:44:52'),
(126, 4, 'order_account', 'a:3:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:44;}', '45.113.88.2', '2015-12-09 13:53:21'),
(127, 4, 'order_account', 'a:3:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:46;}', '45.113.88.2', '2015-12-09 14:17:38'),
(128, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-12-12 14:21:26'),
(129, 4, 'order_account', 'a:3:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:48;}', '45.113.88.2', '2015-12-12 14:30:00'),
(130, 4, 'order_account', 'a:3:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:50;}', '45.113.88.2', '2015-12-12 15:06:33'),
(131, 4, 'order_account', 'a:3:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:51;}', '45.113.88.2', '2015-12-12 15:39:37'),
(132, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-12-12 23:56:23'),
(133, 4, 'order_account', 'a:3:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:53;}', '45.113.88.2', '2015-12-13 00:08:38'),
(134, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-12-18 00:28:02'),
(135, 4, 'order_account', 'a:3:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:54;}', '45.113.88.2', '2015-12-18 00:34:24'),
(136, 4, 'order_account', 'a:3:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:55;}', '45.113.88.2', '2015-12-18 01:08:42'),
(137, 4, 'order_account', 'a:3:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:56;}', '45.113.88.2', '2015-12-18 01:10:14'),
(138, 4, 'order_account', 'a:3:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:57;}', '45.113.88.2', '2015-12-18 01:15:20'),
(139, 4, 'order_account', 'a:3:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:58;}', '45.113.88.2', '2015-12-18 01:17:00'),
(140, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.69.73.55', '2015-12-22 07:09:44'),
(141, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:59;}', '41.69.73.55', '2015-12-22 08:42:42'),
(142, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:60;}', '41.69.73.55', '2015-12-22 08:46:04'),
(143, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-12-26 01:15:34'),
(144, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-12-26 01:16:09'),
(145, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-12-26 01:18:23'),
(146, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-12-26 01:19:06'),
(147, 4, 'order_account', 'a:3:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:61;}', '45.113.88.2', '2015-12-26 01:22:23'),
(148, 4, 'order_account', 'a:3:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:62;}', '45.113.88.2', '2015-12-26 01:28:11'),
(149, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-12-26 03:13:10'),
(150, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-12-26 04:03:08'),
(151, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.69.79.171', '2015-12-26 15:09:43'),
(152, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-12-26 15:56:24'),
(153, 4, 'order_account', 'a:3:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:63;}', '45.113.88.2', '2015-12-26 15:58:24'),
(154, 4, 'order_account', 'a:3:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:64;}', '45.113.88.2', '2015-12-26 16:03:25'),
(155, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-12-27 03:53:54'),
(156, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:65;}', '41.33.187.161', '2015-12-27 03:56:52'),
(157, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:66;}', '41.33.187.161', '2015-12-27 03:58:08'),
(158, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:67;}', '41.33.187.161', '2015-12-27 04:00:18'),
(159, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:68;}', '41.33.187.161', '2015-12-27 04:01:08'),
(160, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:69;}', '41.33.187.161', '2015-12-27 04:01:51'),
(161, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:70;}', '41.33.187.161', '2015-12-27 04:02:49'),
(162, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:71;}', '41.33.187.161', '2015-12-28 04:49:57'),
(163, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:72;}', '41.33.187.161', '2015-12-28 04:54:04'),
(164, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:73;}', '41.33.187.161', '2015-12-28 05:02:42'),
(165, 8, 'register', 'a:2:{s:11:"customer_id";i:8;s:4:"name";s:10:"Sumana Sah";}', '45.113.88.2', '2015-12-28 12:31:04'),
(166, 8, 'order_account', 'a:3:{s:11:"customer_id";s:1:"8";s:4:"name";s:10:"Sumana Sah";s:8:"order_id";i:75;}', '45.113.88.2', '2015-12-28 12:37:24'),
(167, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-12-28 12:38:30'),
(168, 4, 'order_account', 'a:3:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:76;}', '45.113.88.2', '2015-12-28 12:41:06'),
(169, 4, 'order_account', 'a:3:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:77;}', '45.113.88.2', '2015-12-28 12:44:18'),
(170, 8, 'login', 'a:2:{s:11:"customer_id";s:1:"8";s:4:"name";s:10:"Sumana Sah";}', '45.113.88.2', '2015-12-28 13:52:57'),
(171, 8, 'order_account', 'a:3:{s:11:"customer_id";s:1:"8";s:4:"name";s:10:"Sumana Sah";s:8:"order_id";i:78;}', '45.113.88.2', '2015-12-28 14:04:58'),
(172, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-12-28 14:08:04'),
(173, 4, 'order_account', 'a:3:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";s:8:"order_id";i:79;}', '45.113.88.2', '2015-12-28 14:09:35'),
(174, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:80;}', '41.33.187.161', '2015-12-29 03:08:35'),
(175, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:82;}', '41.33.187.161', '2015-12-29 03:10:02'),
(176, 3, 'forgotten', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-12-29 03:34:47'),
(177, 3, 'forgotten', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-12-29 03:39:02'),
(178, 4, 'forgotten', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-12-29 03:44:30'),
(179, 9, 'register', 'a:2:{s:11:"customer_id";i:9;s:4:"name";s:15:"Silky Chowdhury";}', '45.113.88.2', '2015-12-29 03:59:10'),
(180, 9, 'order_account', 'a:3:{s:11:"customer_id";s:1:"9";s:4:"name";s:15:"Silky Chowdhury";s:8:"order_id";i:83;}', '45.113.88.2', '2015-12-29 04:05:06'),
(181, 9, 'order_account', 'a:3:{s:11:"customer_id";s:1:"9";s:4:"name";s:15:"Silky Chowdhury";s:8:"order_id";i:84;}', '45.113.88.2', '2015-12-29 04:11:06'),
(182, 4, 'forgotten', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-12-29 04:12:09'),
(183, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-12-29 04:29:01'),
(184, 10, 'register', 'a:2:{s:11:"customer_id";i:10;s:4:"name";s:9:"Rani Saha";}', '45.113.88.2', '2015-12-29 04:36:15'),
(185, 4, 'forgotten', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:11:"Reshmi Saha";}', '45.113.88.2', '2015-12-29 05:18:07'),
(186, 12, 'register', 'a:2:{s:11:"customer_id";i:12;s:4:"name";s:9:"Rani Saha";}', '45.113.88.2', '2015-12-29 05:20:57'),
(187, 13, 'register', 'a:2:{s:11:"customer_id";i:13;s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-12-29 05:21:32'),
(188, 12, 'order_account', 'a:3:{s:11:"customer_id";s:2:"12";s:4:"name";s:9:"Rani Saha";s:8:"order_id";i:85;}', '45.113.88.2', '2015-12-29 05:23:49'),
(189, 3, 'forgotten', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-12-29 05:27:00'),
(190, 12, 'order_account', 'a:3:{s:11:"customer_id";s:2:"12";s:4:"name";s:9:"Rani Saha";s:8:"order_id";i:86;}', '45.113.88.2', '2015-12-29 05:34:55'),
(191, 3, 'forgotten', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-12-29 05:35:11'),
(192, 12, 'forgotten', 'a:2:{s:11:"customer_id";s:2:"12";s:4:"name";s:9:"Rani Saha";}', '45.113.88.2', '2015-12-29 05:43:53'),
(193, 12, 'login', 'a:2:{s:11:"customer_id";s:2:"12";s:4:"name";s:9:"Rani Saha";}', '45.113.88.2', '2015-12-29 05:45:09'),
(194, 13, 'forgotten', 'a:2:{s:11:"customer_id";s:2:"13";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-12-29 05:45:31'),
(195, 12, 'password', 'a:2:{s:11:"customer_id";s:2:"12";s:4:"name";s:9:"Rani Saha";}', '45.113.88.2', '2015-12-29 05:45:52'),
(196, 3, 'forgotten', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-12-29 06:12:47'),
(197, 14, 'register', 'a:2:{s:11:"customer_id";i:14;s:4:"name";s:12:"Gehad Farouk";}', '41.33.187.161', '2015-12-29 06:16:46'),
(198, 3, 'forgotten', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '216.54.31.82', '2015-12-29 06:24:17'),
(199, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-12-29 09:11:23'),
(200, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:87;}', '41.33.187.161', '2015-12-29 09:13:24'),
(201, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:88;}', '41.33.187.161', '2015-12-29 09:14:16'),
(202, 3, 'forgotten', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-12-29 09:14:43'),
(203, 15, 'register', 'a:2:{s:11:"customer_id";i:15;s:4:"name";s:12:"Gehad Farouk";}', '41.33.187.161', '2015-12-29 09:15:58'),
(204, 12, 'login', 'a:2:{s:11:"customer_id";s:2:"12";s:4:"name";s:9:"Rani Saha";}', '45.113.88.2', '2015-12-29 11:46:51'),
(205, 12, 'order_account', 'a:3:{s:11:"customer_id";s:2:"12";s:4:"name";s:9:"Rani Saha";s:8:"order_id";i:89;}', '45.113.88.2', '2015-12-29 11:55:45'),
(206, 3, 'forgotten', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-12-30 03:46:56'),
(207, 16, 'register', 'a:2:{s:11:"customer_id";i:16;s:4:"name";s:12:"Gehad Farouk";}', '41.33.187.161', '2015-12-30 03:52:25'),
(208, 3, 'forgotten', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-12-30 06:24:08'),
(209, 3, 'forgotten', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-12-30 06:39:30'),
(210, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-12-30 06:40:04'),
(211, 17, 'register', 'a:2:{s:11:"customer_id";i:17;s:4:"name";s:12:"Gehad Hashim";}', '41.33.187.161', '2015-12-30 06:45:36'),
(212, 3, 'forgotten', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.69.92.118', '2015-12-30 14:40:52'),
(213, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";}', '41.187.32.38', '2016-01-12 04:17:00'),
(214, 3, 'order_account', 'a:3:{s:11:"customer_id";s:1:"3";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:90;}', '41.187.32.38', '2016-01-12 04:20:05'),
(215, 17, 'login', 'a:2:{s:11:"customer_id";s:2:"17";s:4:"name";s:12:"Gehad Hashim";}', '41.187.32.38', '2016-01-12 05:18:01'),
(216, 17, 'order_account', 'a:3:{s:11:"customer_id";s:2:"17";s:4:"name";s:12:"Gehad Hashim";s:8:"order_id";i:91;}', '41.187.32.38', '2016-01-12 05:24:37');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_ban_ip`
--

CREATE TABLE IF NOT EXISTS `oc_customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`customer_ban_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_history`
--

CREATE TABLE IF NOT EXISTS `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_ip`
--

CREATE TABLE IF NOT EXISTS `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `oc_customer_ip`
--

INSERT INTO `oc_customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '192.168.1.99', '2014-11-13 11:18:47'),
(2, 2, '192.168.1.31', '2014-12-08 16:14:31'),
(3, 3, '41.33.187.161', '2015-10-15 06:57:25'),
(4, 4, '45.113.88.2', '2015-10-15 13:41:38'),
(5, 5, '197.133.255.214', '2015-10-16 06:36:59'),
(6, 6, '103.57.243.49', '2015-10-27 14:55:13'),
(7, 6, '103.57.242.190', '2015-10-28 09:37:01'),
(8, 6, '45.113.88.2', '2015-10-30 05:15:56'),
(9, 3, '41.69.110.1', '2015-11-06 04:57:20'),
(10, 7, '45.113.88.2', '2015-11-09 05:15:41'),
(11, 6, '1.39.38.225', '2015-11-09 06:12:31'),
(12, 6, '1.39.37.56', '2015-11-09 06:59:07'),
(13, 6, '1.39.137.40', '2015-11-09 07:25:24'),
(14, 3, '45.113.88.2', '2015-11-09 10:00:14'),
(15, 3, '41.34.10.227', '2015-11-10 07:41:44'),
(16, 5, '41.34.10.227', '2015-11-10 11:25:01'),
(17, 5, '41.34.54.170', '2015-11-10 12:10:19'),
(18, 5, '198.46.81.196', '2015-11-11 04:40:25'),
(19, 3, '197.39.49.62', '2015-11-15 12:58:33'),
(20, 3, '105.198.243.51', '2015-11-22 10:10:50'),
(21, 3, '105.198.243.116', '2015-12-07 11:21:13'),
(22, 3, '41.34.30.106', '2015-12-07 13:35:46'),
(23, 3, '41.33.186.129', '2015-12-08 03:52:21'),
(24, 3, '41.235.132.54', '2015-12-08 11:57:49'),
(25, 3, '41.69.73.55', '2015-12-22 07:09:46'),
(26, 3, '41.69.79.171', '2015-12-26 15:09:44'),
(27, 8, '45.113.88.2', '2015-12-28 12:31:06'),
(30, 12, '45.113.88.2', '2015-12-29 05:20:58'),
(35, 17, '41.33.187.161', '2015-12-30 06:45:39'),
(36, 3, '41.187.32.38', '2016-01-12 04:17:00'),
(37, 17, '41.187.32.38', '2016-01-12 05:18:02');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_login`
--

CREATE TABLE IF NOT EXISTS `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `oc_customer_login`
--

INSERT INTO `oc_customer_login` (`customer_login_id`, `email`, `ip`, `total`, `date_added`, `date_modified`) VALUES
(2, 'bbb@yahoo.com', '192.168.1.99', 1, '2014-12-10 10:24:54', '2014-12-10 10:24:54'),
(9, 'maxstar.gaf1@gmail.com', '45.113.88.2', 1, '2015-11-05 06:14:48', '2015-11-05 06:14:48'),
(13, 'reshmi32@gmail.com', '45.113.88.2', 1, '2015-12-28 19:07:57', '2015-12-28 19:07:57'),
(15, 'maxstar.gaf@gmail.com', '45.113.88.2', 2, '2015-12-29 08:45:40', '2015-12-29 09:41:06');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_online`
--

CREATE TABLE IF NOT EXISTS `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_reward`
--

CREATE TABLE IF NOT EXISTS `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `points` int(8) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_description`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value_description`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download`
--

CREATE TABLE IF NOT EXISTS `oc_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download_description`
--

CREATE TABLE IF NOT EXISTS `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_event`
--

CREATE TABLE IF NOT EXISTS `oc_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension`
--

CREATE TABLE IF NOT EXISTS `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=503 ;

--
-- Dumping data for table `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(22, 'total', 'shipping'),
(23, 'payment', 'cod'),
(57, 'total', 'sub_total'),
(58, 'total', 'tax'),
(59, 'total', 'total'),
(349, 'total', 'handling'),
(350, 'total', 'low_order_fee'),
(499, 'shipping', 'flat'),
(389, 'total', 'coupon'),
(390, 'total', 'credit'),
(393, 'total', 'reward'),
(398, 'total', 'voucher'),
(407, 'payment', 'free_checkout'),
(462, 'module', 'bossblog'),
(463, 'module', 'blogcategory'),
(464, 'module', 'blogrecentcomment'),
(465, 'module', 'blogrecentpost'),
(466, 'module', 'blogsearch'),
(467, 'module', 'blogtagcloud'),
(468, 'module', 'boss_alphabet'),
(469, 'module', 'boss_carousel'),
(470, 'module', 'boss_category'),
(471, 'module', 'boss_filterproduct'),
(472, 'module', 'boss_gallery'),
(473, 'module', 'boss_manager'),
(474, 'module', 'boss_zoom'),
(475, 'module', 'boss_topcategory'),
(476, 'module', 'boss_tagcloud'),
(477, 'module', 'boss_revolutionslider'),
(479, 'module', 'boss_manufacturer'),
(481, 'module', 'html'),
(483, 'module', 'boss_newmegamenu'),
(484, 'module', 'featured'),
(485, 'module', 'newslettersubscribe'),
(486, 'module', 'filter'),
(489, 'module', 'boss_quickshop'),
(496, 'module', 'slideshow'),
(491, 'module', 'zlclite'),
(492, 'shipping', 'free'),
(500, 'module', 'tshirtecommerce'),
(494, 'shipping', 'parcelforce_48'),
(497, 'module', 'social_media_login'),
(501, 'shipping', 'item'),
(502, 'shipping', 'weight');

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter`
--

CREATE TABLE IF NOT EXISTS `oc_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `oc_filter`
--

INSERT INTO `oc_filter` (`filter_id`, `filter_group_id`, `sort_order`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 1),
(5, 2, 2),
(6, 2, 3),
(7, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_description`
--

CREATE TABLE IF NOT EXISTS `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_filter_description`
--

INSERT INTO `oc_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES
(1, 1, 1, 'Red'),
(2, 1, 1, 'Purple'),
(3, 1, 1, 'Yellow'),
(4, 1, 2, '&lt; $80'),
(5, 1, 2, '$80-$90'),
(6, 1, 2, '$90-$100'),
(7, 1, 2, '&gt; $100');

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group`
--

CREATE TABLE IF NOT EXISTS `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `oc_filter_group`
--

INSERT INTO `oc_filter_group` (`filter_group_id`, `sort_order`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_filter_group_description`
--

INSERT INTO `oc_filter_group_description` (`filter_group_id`, `language_id`, `name`) VALUES
(1, 1, 'Filter - Color'),
(2, 1, 'Filter - Price');

-- --------------------------------------------------------

--
-- Table structure for table `oc_geo_zone`
--

CREATE TABLE IF NOT EXISTS `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(5, 'Egypt Shipping Rate', 'Egypt Shipping Rate', '2015-12-29 04:04:27', '2015-11-25 06:53:40'),
(4, 'UK Shipping Cost', 'UK Shipping Zones', '2015-11-25 06:54:54', '2009-06-23 01:14:53'),
(6, 'United States shipping cost', 'United States shipping cost', '0000-00-00 00:00:00', '2015-11-25 06:54:29'),
(7, 'Cairo', 'Cairo', '0000-00-00 00:00:00', '2015-12-28 06:15:14'),
(8, 'Alexandria', 'Alexandria', '0000-00-00 00:00:00', '2015-12-28 06:16:17'),
(9, 'Giza', 'Giza', '0000-00-00 00:00:00', '2015-12-28 07:37:49');

-- --------------------------------------------------------

--
-- Table structure for table `oc_hall_of_fame_sell_count`
--

CREATE TABLE IF NOT EXISTS `oc_hall_of_fame_sell_count` (
  `hsc_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL,
  `hsc_total` bigint(20) NOT NULL,
  PRIMARY KEY (`hsc_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `oc_hall_of_fame_sell_count`
--

INSERT INTO `oc_hall_of_fame_sell_count` (`hsc_id`, `customer_id`, `hsc_total`) VALUES
(1, 8, 5),
(2, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `oc_hall_of_fame_sell_track`
--

CREATE TABLE IF NOT EXISTS `oc_hall_of_fame_sell_track` (
  `hft_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL,
  `hft_date` date NOT NULL,
  `hft_status` enum('y','n') NOT NULL DEFAULT 'n',
  PRIMARY KEY (`hft_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `oc_hall_of_fame_sell_track`
--

INSERT INTO `oc_hall_of_fame_sell_track` (`hft_id`, `customer_id`, `hft_date`, `hft_status`) VALUES
(1, 8, '2015-12-30', 'n'),
(2, 3, '2015-12-30', 'y'),
(3, 8, '2015-12-30', 'n'),
(4, 3, '2015-12-30', 'y'),
(5, 3, '2015-12-30', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information`
--

CREATE TABLE IF NOT EXISTS `oc_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 0),
(5, 1, 4, 1),
(6, 1, 2, 1),
(7, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_description`
--

CREATE TABLE IF NOT EXISTS `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(3, 1, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', 'Privacy Policy', '', ''),
(4, 1, 'About Us', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis lobortis felis vel feugiat eleifend. Integer gravida vitae nulla sed lacinia. Aenean dictum eros in tempus porta. Ut lobortis leo nunc, sed aliquam risus fringilla ut. Phasellus pellentesque feugiat malesuada. Nulla venenatis ipsum nisi, sed dapibus ipsum dictum eu. Proin pellentesque vulputate dolor, non tincidunt diam aliquet ac.&lt;/p&gt;\r\n\r\n&lt;p&gt;Nunc arcu ipsum, sodales in justo sed, ullamcorper iaculis purus. Aliquam erat volutpat. Mauris sed malesuada mauris. Integer tortor nibh, congue nec nisl non, luctus condimentum mauris. Curabitur mattis sollicitudin facilisis. Vestibulum bibendum lectus ligula, eu facilisis metus porta sed. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae.&lt;/p&gt;\r\n\r\n&lt;p&gt;Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras dignissim eget felis a facilisis. Nulla congue ultricies pulvinar. Morbi sit amet laoreet elit. Cras imperdiet ac sem non elementum. Integer pharetra tincidunt quam nec faucibus. Suspendisse id ultricies lorem, eget sollicitudin elit. In posuere pretium massa ac consequat. Duis congue velit laoreet, interdum leo quis, ullamcorper turpis. Etiam eget venenatis magna, non malesuada sem. Phasellus tincidunt ipsum at diam bibendum interdum ac quis sapien. Etiam ut erat sed risus laoreet vehicula. Phasellus egestas non nulla ac interdum. Vivamus tincidunt leo id turpis laoreet, sit amet eleifend lacus venenatis. Donec vel vestibulum tellus. Nunc volutpat ipsum eu turpis auctor porta.&lt;/p&gt;\r\n\r\n&lt;p&gt;In tristique leo mi, non faucibus dui rhoncus non. Vestibulum enim odio, sodales ac tincidunt a, viverra vitae ante. Curabitur metus erat, viverra a augue id, placerat tristique lacus. Nulla facilisi. Aenean vitae vestibulum erat, ut dignissim massa. Morbi ac consequat orci. Quisque sit amet nibh id nisl dictum viverra. Proin orci lectus, rhoncus nec libero at, adipiscing dapibus velit. Mauris sit amet sapien et nibh eleifend lobortis a commodo quam. Nam at leo et eros fermentum ultrices.&lt;/p&gt;\r\n\r\n&lt;p&gt;Etiam laoreet vel tortor id lacinia. Mauris quis metus vel nisl lobortis accumsan. Pellentesque elementum, ipsum eu porttitor vestibulum, lectus nibh molestie erat, nec vulputate velit tortor at ipsum. Phasellus sed varius libero. Morbi et ipsum scelerisque, ultrices diam at, lacinia mi. Vivamus nec tellus iaculis, sodales nibh lobortis, placerat justo. Aliquam placerat lacus magna, non tristique nunc laoreet eget.&lt;/p&gt;\r\n\r\n&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis lobortis felis vel feugiat eleifend. Integer gravida vitae nulla sed lacinia. Aenean dictum eros in tempus porta. Ut lobortis leo nunc, sed aliquam risus fringilla ut. Phasellus pellentesque feugiat malesuada. Nulla venenatis ipsum nisi, sed dapibus ipsum dictum eu. Proin pellentesque vulputate dolor, non tincidunt diam aliquet ac.&lt;/p&gt;\r\n&lt;p&gt;Etiam laoreet vel tortor id lacinia. Mauris quis metus vel nisl lobortis accumsan. Pellentesque elementum, ipsum eu porttitor vestibulum, lectus nibh molestie erat, nec vulputate velit tortor at ipsum. Phasellus sed varius libero. Morbi et ipsum scelerisque, ultrices diam at, lacinia mi. Vivamus nec tellus iaculis, sodales nibh lobortis, placerat justo. Aliquam placerat lacus magna, non tristique nunc laoreet eget.&lt;/p&gt;\r\n&lt;p&gt;In tristique leo mi, non faucibus dui rhoncus non. Vestibulum enim odio, sodales ac tincidunt a, viverra vitae ante. Curabitur metus erat, viverra a augue id, placerat tristique lacus. Nulla facilisi. Aenean vitae vestibulum erat, ut dignissim massa. Morbi ac consequat orci. Quisque sit amet nibh id nisl dictum viverra. Proin orci lectus, rhoncus nec libero at, adipiscing dapibus velit. Mauris sit amet sapien et nibh eleifend lobortis a commodo quam. Nam at leo et eros fermentum ultrices.&lt;/p&gt;\r\n&lt;p&gt;Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras dignissim eget felis a facilisis. Nulla congue ultricies pulvinar. Morbi sit amet laoreet elit. Cras imperdiet ac sem non elementum. Integer pharetra tincidunt quam nec faucibus. Suspendisse id ultricies lorem, eget sollicitudin elit. In posuere pretium massa ac consequat. Duis congue velit laoreet, interdum leo quis, ullamcorper turpis. Etiam eget venenatis magna, non malesuada sem. Phasellus tincidunt ipsum at diam bibendum interdum ac quis sapien. Etiam ut erat sed risus laoreet vehicula. Phasellus egestas non nulla ac interdum. Vivamus tincidunt leo id turpis laoreet, sit amet eleifend lacus venenatis. Donec vel vestibulum tellus. Nunc volutpat ipsum eu turpis auctor porta.&lt;/p&gt;', 'company', '', ''),
(5, 1, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', 'Terms &amp; Conditions', '', ''),
(6, 1, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', 'Delivery Information', '', ''),
(7, 1, 'Special Orders', '&lt;p&gt;Special Orders&lt;br&gt;&lt;/p&gt;', 'Special Orders', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_to_layout`
--

INSERT INTO `oc_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES
(4, 0, 0),
(7, 0, 0),
(6, 0, 0),
(3, 0, 0),
(5, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_language`
--

CREATE TABLE IF NOT EXISTS `oc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `filename` varchar(64) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`, `filename`) VALUES
(1, 'English', 'en', 'en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 1, 1, 'english');

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout`
--

CREATE TABLE IF NOT EXISTS `oc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10002 ;

--
-- Dumping data for table `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Login'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(9999, 'All Layout'),
(10000, 'Boss Blog'),
(10001, 'Register');

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_module`
--

CREATE TABLE IF NOT EXISTS `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=702 ;

--
-- Dumping data for table `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(699, 6, 'social_media_login', 'content_bottom', 0),
(186, 12, 'blogcategory', 'column_left', 1),
(187, 12, 'blogrecentpost.0', 'column_left', 2),
(188, 12, 'blogrecentcomment.0', 'column_left', 3),
(189, 12, 'blogtagcloud.0', 'column_left', 4),
(190, 12, 'boss_staticblock.4', 'column_left', 5),
(697, 9999, 'boss_newmegamenu.13', 'mainmenu', 1),
(691, 2, 'boss_zoom.19', 'content_top', 1),
(690, 2, 'boss_alphabet.15', 'column_left', 2),
(689, 2, 'featured.16', 'column_left', 3),
(398, 10000, 'blogsearch.23', 'column_left', 1),
(399, 10000, 'blogcategory.20', 'column_left', 2),
(400, 10000, 'blogrecentpost.22', 'column_left', 3),
(401, 10000, 'blogrecentcomment.21', 'column_left', 4),
(402, 10000, 'blogtagcloud.24', 'column_left', 5),
(403, 10000, 'html.5', 'column_left', 6),
(413, 5, 'boss_alphabet.15', 'column_left', 2),
(414, 5, 'boss_category.14', 'column_left', 1),
(415, 5, 'featured.16', 'column_left', 3),
(416, 5, 'boss_tagcloud.17', 'column_left', 4),
(417, 5, 'html.5', 'column_left', 5),
(674, 4, 'zlclite', 'content_bottom', 1),
(672, 1, 'html.6', 'content_top', 7),
(673, 1, 'zlclite', 'content_bottom', 1),
(671, 1, 'boss_gallery.10', 'content_top', 6),
(670, 1, 'html.7', 'content_top', 9),
(669, 1, 'newslettersubscribe.25', 'content_top', 7),
(668, 1, 'boss_filterproduct.1', 'content_top', 4),
(688, 2, 'boss_tagcloud.17', 'column_left', 4),
(680, 3, 'boss_tagcloud.17', 'column_left', 4),
(679, 3, 'featured.16', 'column_left', 3),
(678, 3, 'boss_alphabet.15', 'column_left', 2),
(677, 3, 'boss_category.14', 'column_left', 1),
(676, 3, 'html.5', 'column_left', 5),
(675, 3, 'boss_quickshop.35', 'content_top', 0),
(664, 1, 'boss_topcategory.9', 'content_top', 4),
(665, 1, 'html.8', 'content_top', 3),
(666, 1, 'html.2', 'content_top', 1),
(667, 1, 'boss_revolutionslider.29', 'content_top', 2),
(663, 1, 'boss_quickshop.35', 'content_top', 0),
(662, 1, 'html.4', 'content_top', 2),
(681, 3, 'html.3', 'content_top', 1),
(682, 3, 'boss_manufacturer.30', 'column_left', 6),
(683, 3, 'filter', 'column_left', 3),
(684, 3, 'zlclite', 'content_bottom', 1),
(696, 9999, 'boss_carousel.11', 'boss_footer', 1),
(692, 2, 'boss_category.14', 'column_left', 1),
(693, 2, 'html.5', 'column_left', 5),
(694, 2, 'boss_quickshop.35', 'content_top', 0),
(695, 2, 'zlclite', 'content_bottom', 1),
(698, 9999, 'zlclite', 'content_bottom', 1),
(701, 10001, 'social_media_login', 'content_top', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_route`
--

CREATE TABLE IF NOT EXISTS `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=166 ;

--
-- Dumping data for table `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(17, 10, 0, 'affiliate/%'),
(23, 7, 0, 'checkout/%'),
(24, 11, 0, 'information/information'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(163, 6, 0, 'account/account'),
(162, 6, 0, 'account/login'),
(160, 2, 0, 'product/product'),
(132, 10000, 0, 'bossblog/%'),
(134, 5, 0, 'product/manufacturer'),
(158, 1, 0, 'common/home'),
(159, 3, 0, 'product/category'),
(161, 9999, 0, ''),
(165, 10001, 0, 'account/register');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class`
--

CREATE TABLE IF NOT EXISTS `oc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class_description`
--

CREATE TABLE IF NOT EXISTS `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimeter', 'cm'),
(2, 1, 'Millimeter', 'mm'),
(3, 1, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Table structure for table `oc_location`
--

CREATE TABLE IF NOT EXISTS `oc_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer`
--

CREATE TABLE IF NOT EXISTS `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'Gala Themes', 'catalog/bt_parallax/brand4.png', 4),
(6, 'PresThemes', 'catalog/bt_parallax/brand5.png', 5),
(7, 'Extreme Magento', 'catalog/bt_parallax/brand3.png', 3),
(8, 'Bossthemes', 'catalog/bt_parallax/brand1.png', 1),
(9, 'Codespot', 'catalog/bt_parallax/brand2.png', 2),
(10, 'DesignShopify', 'catalog/bt_parallax/brand6.png', 6),
(11, 'WPDance', 'catalog/bt_parallax/brand7.png', 7),
(12, 'Eggthemes', 'catalog/bt_parallax/brand8.png', 8);

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_marketing`
--

CREATE TABLE IF NOT EXISTS `oc_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_megamenu`
--

CREATE TABLE IF NOT EXISTS `oc_megamenu` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=67 ;

--
-- Dumping data for table `oc_megamenu`
--

INSERT INTO `oc_megamenu` (`menu_id`, `status`, `sort_order`, `url`, `icon`, `label_color`, `num_column`, `icon_class`, `icon_class_status`, `module_id`) VALUES
(45, 1, 1, 'men', '', '', 1, '', 0, 13),
(46, 1, 2, '/women', '', '', 1, '', 0, 13),
(47, 1, 3, '/kids', '', '', 6, '', 0, 13),
(60, 1, 4, '/mugs', '', '', 1, '', 0, 13),
(61, 1, 5, '/mobilecases', '', '', 1, '', 0, 13),
(63, 1, 6, '/businesscard', '', '', 1, '', 0, 13),
(64, 1, 7, '/buttons', '', '', 1, '', 0, 13),
(65, 1, 8, '/stickers', '', '', 1, '', 0, 13),
(66, 1, 9, '/keychains', '', '', 1, '', 0, 13),
(53, 0, 0, '#', '', '', 1, '', 0, 18),
(54, 1, 0, '#', '', '', 1, '', 0, 18),
(55, 1, 0, '#', '', '', 1, '', 0, 18),
(56, 1, 0, '#', '', '', 1, '', 0, 18),
(57, 1, 0, '#', '', '', 1, '', 0, 18),
(58, 1, 0, '#', '', '', 1, '', 0, 18),
(59, 1, 0, '#', '', '', 1, '', 0, 18);

-- --------------------------------------------------------

--
-- Table structure for table `oc_megamenu_column`
--

CREATE TABLE IF NOT EXISTS `oc_megamenu_column` (
  `column_id` int(11) NOT NULL AUTO_INCREMENT,
  `row_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `num_column` int(2) unsigned NOT NULL DEFAULT '1',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`column_id`,`row_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=47 ;

--
-- Dumping data for table `oc_megamenu_column`
--

INSERT INTO `oc_megamenu_column` (`column_id`, `row_id`, `sort_order`, `status`, `num_column`, `type`, `params`) VALUES
(34, 18, 0, 1, 1, 'html', '{"category_id":"0","product_img_w":"","product_img_h":"","manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"&lt;div class=&quot;menu-block-sub&quot;&gt;\\n&lt;p class=&quot;parent&quot;&gt;Totes &amp;amp; hobos&lt;\\/p&gt;\\n\\n\\n&lt;a alt=&quot;sample logo&quot; href=&quot;#&quot;&gt;&lt;img alt=&quot;sample logo&quot; src=&quot;http:\\/\\/demo.bossthemes.com\\/parallax_v2\\/image\\/catalog\\/bt_parallax\\/brand.png&quot;&gt;&lt;\\/a&gt;\\n\\n&lt;p&gt;Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.&lt;\\/p&gt;\\n\\n\\n\\n&lt;p&gt;Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia.&lt;\\/p&gt;\\n\\n\\n&lt;\\/div&gt;","2":"&lt;div class=&quot;menu-block-sub&quot;&gt;\\n&lt;p class=&quot;parent&quot;&gt;Totes &amp;amp; hobos&lt;\\/p&gt;\\n\\n\\n&lt;a alt=&quot;sample logo&quot; href=&quot;#&quot;&gt;&lt;img alt=&quot;sample logo&quot; src=&quot;http:\\/\\/demo.bossthemes.com\\/parallax_v2\\/image\\/catalog\\/bt_parallax\\/brand.png&quot;&gt;&lt;\\/a&gt;\\n\\n&lt;p&gt;Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.&lt;\\/p&gt;\\n\\n\\n\\n&lt;p&gt;Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia.&lt;\\/p&gt;\\n\\n\\n&lt;\\/div&gt;"}}'),
(35, 18, 2, 1, 1, 'product', '{"category_id":"0","product_img_w":"200","product_img_h":"200","product_ids":["42"],"manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"\\t\\t\\t\\t\\t\\t","2":"\\t\\t\\t\\t\\t\\t"}}'),
(36, 18, 3, 1, 1, 'product', '{"category_id":"0","product_img_w":"200","product_img_h":"200","product_ids":["30"],"manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"\\t\\t\\t\\t\\t\\t","2":"\\t\\t\\t\\t\\t\\t"}}'),
(37, 18, 4, 1, 1, 'category', '{"category_id":"20","product_img_w":"","product_img_h":"","manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"\\t\\t\\t\\t\\t\\t","2":"\\t\\t\\t\\t\\t\\t"}}'),
(38, 18, 5, 1, 1, 'category', '{"category_id":"18","product_img_w":"","product_img_h":"","manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"\\t\\t\\t\\t\\t\\t","2":"\\t\\t\\t\\t\\t\\t"}}'),
(46, 19, 0, 1, 1, 'html', '{"category_id":"0","product_img_w":"","product_img_h":"","manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"Design Coming soon&lt;br&gt;"}}'),
(42, 21, 1, 1, 3, 'html', '{"category_id":"0","product_img_w":"","product_img_h":"","manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","content_text":{"1":"&lt;div class=&quot;menu-block-main&quot;&gt;&lt;span&gt;lorem ipsum dolor sit amet&lt;\\/span&gt;\\n&lt;p&gt;Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.&lt;\\/p&gt;\\n\\n\\n&lt;p&gt;Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia.&lt;\\/p&gt;\\n\\n&lt;span&gt;lorem ipsum dolor sit amet&lt;\\/span&gt;\\n\\n&lt;p&gt;Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.&lt;\\/p&gt;\\n\\n&lt;\\/div&gt;","2":"&lt;div class=&quot;menu-block-main&quot;&gt;&lt;span&gt;lorem ipsum dolor sit amet&lt;\\/span&gt;\\n&lt;p&gt;Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.&lt;\\/p&gt;\\n\\n\\n&lt;p&gt;Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia.&lt;\\/p&gt;\\n\\n&lt;span&gt;lorem ipsum dolor sit amet&lt;\\/span&gt;\\n\\n&lt;p&gt;Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.&lt;\\/p&gt;\\n\\n&lt;\\/div&gt;"}}'),
(43, 22, 1, 1, 6, 'manufacturer', '{"category_id":"0","product_img_w":"","product_img_h":"","manufacturer_img_w":"114","manufacturer_img_h":"35","manufacturer_name":"0","manufacturer_id":["8","9","10","7","5","6"],"content_text":{"1":"\\t\\t\\t\\t\\t\\t","2":"\\t\\t\\t\\t\\t\\t"}}'),
(44, 23, 1, 1, 1, 'information', '{"category_id":"0","product_img_w":"","product_img_h":"","manufacturer_img_w":"","manufacturer_img_h":"","manufacturer_name":"0","information_id":["4","6","3","5"],"content_text":{"1":"\\t\\t\\t\\t\\t\\t","2":"\\t\\t\\t\\t\\t\\t"}}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_megamenu_description`
--

CREATE TABLE IF NOT EXISTS `oc_megamenu_description` (
  `menu_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`menu_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oc_megamenu_description`
--

INSERT INTO `oc_megamenu_description` (`menu_id`, `language_id`, `title`, `label`) VALUES
(45, 1, 'Men', ''),
(46, 1, 'Women', ''),
(66, 1, 'Keychains', ''),
(47, 1, 'Kids', ''),
(60, 1, 'Mugs', ''),
(61, 1, 'Mobile Cases', ''),
(63, 1, 'Business cards', ''),
(64, 1, 'Buttons', ''),
(65, 1, 'Stickers', ''),
(53, 1, '', ''),
(53, 2, '', ''),
(54, 1, '', ''),
(54, 2, '', ''),
(55, 1, '', ''),
(55, 2, '', ''),
(56, 1, '', ''),
(56, 2, '', ''),
(57, 1, '', ''),
(57, 2, '', ''),
(58, 1, '', ''),
(58, 2, '', ''),
(59, 1, '', ''),
(59, 2, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_megamenu_row`
--

CREATE TABLE IF NOT EXISTS `oc_megamenu_row` (
  `row_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `height` decimal(10,0) DEFAULT NULL,
  `bg_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bg_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`row_id`,`menu_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;

--
-- Dumping data for table `oc_megamenu_row`
--

INSERT INTO `oc_megamenu_row` (`row_id`, `menu_id`, `sort_order`, `status`, `height`, `bg_color`, `bg_image`) VALUES
(19, 48, 1, 1, '0', '', ''),
(20, 48, 2, 1, '0', '', ''),
(21, 49, 1, 1, '0', '', ''),
(22, 50, 1, 1, '0', '', ''),
(23, 51, 1, 1, '0', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_modification`
--

CREATE TABLE IF NOT EXISTS `oc_modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `oc_modification`
--

INSERT INTO `oc_modification` (`modification_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(28, '<font color="#0000"><b>Padding Sub Module</font>', 'paddingsubmenu11', '<font color="#CC0000"><b>Bossthemes</font>', '<b>1.0</b>', 'http://www.bossthemes.com', '<modification>\r\n   <name><![CDATA[<font color="#0000"><b>Padding Sub Module</font>]]></name>\r\n    <version><![CDATA[<b>1.0</b>]]></version>\r\n    <author><![CDATA[<font color="#CC0000"><b>Bossthemes</font>]]></author>\r\n    <link><![CDATA[http://www.bossthemes.com]]></link>\r\n	<code>paddingsubmenu11</code>\r\n<!-- sw-ad@hotmail.com -->	                      \r\n<file path="admin/view/template/extension/module.tpl">		\r\n		<operation>\r\n			<search><![CDATA[\r\n			<td class="text-left"><?php echo $module[''name'']; ?></td>\r\n			]]></search>\r\n			<add position="replace"><![CDATA[\r\n			<td class="text-left" style="padding-left:30px"><?php echo $module[''name'']; ?></td>\r\n			]]></add>\r\n		</operation>		\r\n</file>\r\n</modification>					   \r\n					   ', 1, '2014-12-08 11:56:11'),
(29, '<font color="#0000"><b>Edit Language</font>', 'editlanguage', '<font color="#CC0000"><b>Bossthemes</font>', '<b>1.0</b>', 'http://www.bossthemes.com', '<modification>\r\n   <name><![CDATA[<font color="#0000"><b>Edit Language</font>]]></name>\r\n    <version><![CDATA[<b>1.0</b>]]></version>\r\n    <author><![CDATA[<font color="#CC0000"><b>Bossthemes</font>]]></author>\r\n    <link><![CDATA[http://www.bossthemes.com]]></link>\r\n	<code>editlanguage</code>\r\n<!-- sw-ad@hotmail.com -->	                      \r\n<file path="catalog/language/english/english.php">\r\n		<operation>\r\n			<search><![CDATA[\r\n			$_[''text_home'']             = ''<i class="fa fa-home"></i>'';\r\n			]]></search>\r\n			<add position="replace"><![CDATA[\r\n			$_[''text_home'']             = ''Home'';\r\n			]]></add>\r\n		</operation>\r\n</file>\r\n<file path="catalog/controller/product/compare.php">\r\n		<operation>\r\n			<search><![CDATA[\r\n			$data[''button_remove''] = $this->language->get(''button_remove'');\r\n			]]></search>\r\n			<add position="after"><![CDATA[\r\n			$data[''button_wishlist''] = $this->language->get(''button_wishlist'');\r\n			]]></add>\r\n		</operation>\r\n</file>\r\n</modification>					   \r\n					   ', 1, '2014-12-08 16:15:58'),
(32, '<font color="#0000"><b>Add Newsletter Menu</font>', 'Newletter', '<font color="#CC0000"><b>Bossthemes</font>', '<b>1.0</b>', 'http://www.bossthemes.com', '<modification>\r\n   <name><![CDATA[<font color="#0000"><b>Add Newsletter Menu</font>]]></name>\r\n    <version><![CDATA[<b>1.0</b>]]></version>\r\n    <author><![CDATA[<font color="#CC0000"><b>Bossthemes</font>]]></author>\r\n    <link><![CDATA[http://www.bossthemes.com]]></link>\r\n	<code>Newletter</code>\r\n	<file path="admin/controller/common/menu.php">\r\n		<operation>\r\n			<search><![CDATA[\r\n            $this->load->language(''common/menu'');\r\n            ]]></search>\r\n			<add position="after"><![CDATA[\r\n            $data[''text_newssubscribe''] = $this->language->get(''text_newssubscribe'');\r\n			$data[''newssubscribe''] = $this->url->link(''sale/newssubscribers'', ''token='' . $this->session->data[''token''], ''SSL'');\r\n            ]]></add>\r\n		</operation>\r\n	</file>\r\n    	<file path="admin/language/*/common/menu.php">\r\n		<operation>\r\n			<search><![CDATA[$_[''text_system'']                      = ''System'';]]></search>\r\n			<add position="after"><![CDATA[$_[''text_newssubscribe'']     = ''Newsletter Subscribers'';]]></add>\r\n		</operation>\r\n	</file>\r\n    	<file path="admin/controller/marketing/contact.php">\r\n		<operation>\r\n			<search><![CDATA[\r\n            case ''newsletter'':\r\n            ]]></search>\r\n			<add position="after"><![CDATA[\r\n            $results = $this->model_sale_customer->getNewsletterSubscribers();\r\n\r\n						foreach ($results as $result) {\r\n							$emails["s".$result[''id'']] = $result[''email_id''];\r\n						}\r\n            ]]></add>\r\n		</operation>\r\n	</file>\r\n    <file path="admin/model/sale/customer.php">\r\n		<operation>\r\n			<search><![CDATA[\r\n            class ModelSaleCustomer extends Model {\r\n            ]]></search>\r\n			<add position="after"><![CDATA[\r\n            public function getNewsletterSubscribers() {\r\n		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "subscribe");\r\n\r\n		return $query->rows;\r\n	}\r\n            ]]></add>\r\n		</operation>\r\n	</file>\r\n    <file path="admin/view/template/common/menu.tpl">\r\n		<operation>\r\n			<search><![CDATA[\r\n            <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>\r\n            ]]></search>\r\n			<add position="after"><![CDATA[\r\n            <li><a href="<?php echo $newssubscribe; ?>"><?php echo $text_newssubscribe; ?></a></li>\r\n            ]]></add>\r\n		</operation>\r\n	</file>\r\n</modification>', 1, '2014-12-09 11:45:30'),
(34, '<font color="#0000"><b>Add new position</font>', 'addnewposition1', '<font color="#CC0000"><b>Bossthemes</font>', '<b>1.0</b>', 'http://www.bossthemes.com', '<modification>\r\n   <name><![CDATA[<font color="#0000"><b>Add new position</font>]]></name>\r\n    <version><![CDATA[<b>1.0</b>]]></version>\r\n    <author><![CDATA[<font color="#CC0000"><b>Bossthemes</font>]]></author>\r\n    <link><![CDATA[http://www.bossthemes.com]]></link>\r\n	<code>addnewposition1</code>\r\n<!-- sw-ad@hotmail.com -->	    \r\n<file path="catalog/controller/common/header.php">\r\n		<operation>\r\n			<search><![CDATA[\r\n			$data[''links''] = $this->document->getLinks();\r\n			]]></search>\r\n			<add position="after"><![CDATA[\r\n			$data[''slideshow''] = $this->load->controller(''common/slideshow'');			\r\n			]]></add>\r\n		</operation>\r\n</file>                  \r\n<file path="admin/view/template/design/layout_form.tpl">\r\n		<operation>\r\n			<search><![CDATA[\r\n			<td class="text-left"><select name="layout_module[<?php echo $module_row; ?>][position]" class="form-control">                   \r\n			]]></search>\r\n			<add position="after"><![CDATA[\r\n            <option value="header" <?php echo ($layout_module[''position''] == ''header'')?''selected="selected"'':''''; ?>><?php echo ''Header''; ?></option>\r\n			<option value="mainmenu" <?php echo ($layout_module[''position''] == ''mainmenu'')?''selected="selected"'':''''; ?>><?php echo ''Main Menu''; ?></option>\r\n			<option value="slideshow" <?php echo ($layout_module[''position''] == ''slideshow'')?''selected="selected"'':''''; ?>><?php echo ''Slideshow''; ?></option>\r\n			<option value="boss_footer" <?php echo ($layout_module[''position''] == ''boss_footer'')?''selected="selected"'':''''; ?>><?php echo ''Boss Footer''; ?></option>\r\n			]]></add>\r\n		</operation>\r\n		<operation>\r\n			<search><![CDATA[\r\n			html += ''    <option value="column_right"><?php echo $text_column_right; ?></option>'';\r\n			]]></search>\r\n			<add position="after"><![CDATA[\r\n            html += ''    <option value="header"><?php echo ''Header''; ?></option>'';\r\n			html += ''    <option value="mainmenu"><?php echo ''Main Menu''; ?></option>'';\r\n			html += ''    <option value="slideshow"><?php echo ''Slideshow''; ?></option>'';\r\n			html += ''    <option value="boss_footer"><?php echo ''Boss Footer''; ?></option>'';\r\n			]]></add>\r\n		</operation>		\r\n</file>\r\n</modification>					   \r\n					   ', 1, '2014-12-09 15:25:56'),
(35, '<font color="#0000"><b>Name Customer link Logout Header</font>', 'ManuellaNameCustomerHeader', '<font color="#CC0000"><b>Leandro R.P.P.O</font>', '<b>1.0</b>', 'http://www.swad.com.br', '<modification>\r\n   <name><![CDATA[<font color="#0000"><b>Name Customer link Logout Header</font>]]></name>\r\n   <code>ManuellaNameCustomerHeader</code>\r\n    <version><![CDATA[<b>1.0</b>]]></version>\r\n    <author><![CDATA[<font color="#CC0000"><b>Leandro R.P.P.O</font>]]></author>\r\n    <link><![CDATA[http://www.swad.com.br]]></link>\r\n<!--                                                                         \r\nmore extensions: http://www.opencart.com/index.php?route=extension/extension&filter_username=leandrorppo  \r\nRedistribution in any form without written permission is prohibited\r\nhttp://www.facebook.com/leandrorppo                                                                      \r\n -->\r\n<!-- Config Language -->\r\n<file path="catalog/language/english/common/header.php">\r\n        <operation>\r\n            <search><![CDATA[\r\n			<?php\r\n			]]></search>\r\n            <add position="after"><![CDATA[	\r\n             $_[''text_logged'']  = ''You are logged in as <b><a href="%s">%s</a></b> <b>(</b> <a href="%s">Logout</a> <b>)</b>'';          \r\n	  ]]></add>\r\n       </operation>\r\n</file>\r\n<file path="catalog/language/portuguese-br/common/header.php">\r\n        <operation>\r\n            <search><![CDATA[\r\n			<?php\r\n			]]></search>\r\n            <add position="after"><![CDATA[	\r\n             $_[''text_logged'']  = ''Você está logado como <b><a href="%s" >%s</a></b> <b>(</b> <a href="%s">Sair</a> <b>)</b>'';          \r\n	  ]]></add>\r\n       </operation>\r\n</file>\r\n<!-- End Config Language -->\r\n<file path="catalog/view/theme/*/template/common/header.tpl">\r\n       <operation>\r\n            <search><![CDATA[\r\n			<?php echo $telephone; ?></span>\r\n			]]></search>\r\n            <add position="after"><![CDATA[	\r\n	         <?php if ($logged) { ?>\r\n             <?php echo $text_logged; ?>\r\n            <?php } else { ?>\r\n            <?php } ?>\r\n	  ]]></add>\r\n        </operation>\r\n</file>\r\n</modification>\r\n\r\n', 0, '2015-10-28 09:53:11');

-- --------------------------------------------------------

--
-- Table structure for table `oc_module`
--

CREATE TABLE IF NOT EXISTS `oc_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(1, 'Filter product - Home', 'boss_filterproduct', 'a:3:{s:4:"name";s:21:"Filter product - Home";s:6:"status";s:1:"0";s:25:"boss_filterproduct_module";a:7:{s:4:"tabs";a:3:{i:0;a:2:{s:5:"title";a:1:{i:1;s:8:"Featured";}s:12:"type_product";s:6:"latest";}i:1;a:2:{s:5:"title";a:1:{i:1;s:12:"Best Sellers";}s:12:"type_product";s:11:"best_seller";}i:2;a:2:{s:5:"title";a:1:{i:1;s:7:"Popular";}s:12:"type_product";s:7:"popular";}}s:11:"image_width";s:3:"255";s:12:"image_height";s:3:"255";s:5:"limit";s:2:"16";s:19:"use_scrolling_panel";s:1:"1";s:6:"scroll";s:1:"4";s:7:"use_tab";s:1:"0";}}'),
(2, 'This is NINE LIVES', 'html', 'a:3:{s:4:"name";s:18:"This is NINE LIVES";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:1135:"&lt;div class=&quot;container&quot;&gt;&lt;div class=&quot;row&quot;&gt;\r\n&lt;div class=&quot;col-lg-12 col-md-12 col-sm-12 col-xs-12 not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;400&quot;&gt;\r\n&lt;div class=&quot;block-hompage-special&quot;&gt;\r\n&lt;div class=&quot;col-lg-2&quot;&gt;&lt;img src=&quot;image/logoninelives.png&quot;&gt;&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n&lt;div class=&quot;col-lg-10&quot; style=&quot;text-align:left;font-size:17px;font-weight:bold;line-height:26px&quot;&gt;Want to design your own custom stuff but don’t know where to start? NineLives is your answer! Find your favorite photo, design, or image and upload it onto one of our many templates and exercise your artistic side. You can even add your own text to craft a message for the whole world to see. Start from scratch to make your own or personalize an existing design found in our marketplace. With numerous styles, sizes, and colors, your choices are almost endless! Customize a it for yourself, or create one as a gift.\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n&lt;/div&gt;";}}s:6:"status";s:1:"1";}'),
(3, 'Banner Category', 'html', 'a:3:{s:4:"name";s:15:"Banner Category";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:506:"&lt;div class=&quot;block-cate-page not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;400&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;banner category&quot;&gt;&lt;img alt=&quot;banner-category&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bt_parallax/banner_ca.jpg&quot;&gt;&lt;span&gt;&lt;img alt=&quot;banner-category&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bt_parallax/text_banner.png&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/div&gt;";}}s:6:"status";s:1:"0";}'),
(4, 'NINE LIVES makes it easy and inexpensive to order custom tshirts', 'html', 'a:3:{s:4:"name";s:64:"NINE LIVES makes it easy and inexpensive to order custom tshirts";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:2842:"&lt;div class=&quot;block-home-feature main-bg&quot; style=&quot;background-image: url(image/bgblack.jpg);&quot;&gt;\r\n\r\n&lt;div class=&quot;container&quot;&gt;\r\n\r\n&lt;div class=&quot;row&quot;&gt;\r\n\r\n&lt;div class=&quot;col-lg-12 col-md-12 col-sm-12 col-xs-12 not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;200&quot;&gt;\r\n\r\n&lt;h3&gt;NINE LIVES makes it easy and inexpensive to order custom tshirts&lt;/h3&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;p&gt;Whether you''re ordering one or a thousand tshirts, we''ll help you save on your order.&lt;/p&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;div class=&quot;block-feature-detail not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;400&quot;&gt;\r\n\r\n&lt;div class=&quot;feature feature-1 col-lg-4 col-md-3 col-sm-3 col-xs-12&quot;&gt;&lt;a class=&quot;image&quot; hrel=&quot;#&quot; title=&quot;&quot;&gt;&lt;img alt=&quot;Awesomely low prices&quot; src=&quot;image/banner_icon1.png&quot;&gt;&lt;/a&gt; &lt;span&gt;Awesomely low prices&lt;/span&gt;&lt;p&gt;We have made careful use of every last penny we had and, to this day, understand the importance of frugality as a virtue. We are committed to providing nicely discounted t-shirt printing to our customers. &lt;/p&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;div class=&quot;feature feature-2 col-lg-4 col-md-3 col-sm-3 col-xs-12&quot;&gt;&lt;a class=&quot;image&quot; hrel=&quot;#&quot; title=&quot;&quot;&gt;&lt;img alt=&quot;Impeccable print quality&quot; src=&quot;image/banner_icon2.png&quot;&gt;&lt;/a&gt; &lt;span&gt;Impeccable print quality&lt;/span&gt;&lt;p&gt;High quality printing comes from years of printing experience, use of top-notch inks, and an unwavering commitment to producing well made, long-lasting products. We guarantee our prints will last wash after wash, and that our garments will come free of material defects -- or we''ll redo your order from scratch. &lt;/p&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;div class=&quot;feature feature-4 col-lg-4 col-md-3 col-sm-3 col-xs-12&quot;&gt;&lt;a class=&quot;image&quot; hrel=&quot;#&quot; title=&quot;&quot;&gt;&lt;img alt=&quot;Rave-worthy service&quot; src=&quot;image/banner_icon4.png&quot;&gt;&lt;/a&gt; &lt;span&gt;Rave-worthy service&lt;/span&gt;&lt;p&gt;Our support staff is available 96 hours a week over the phone, email, and live chat. We welcome questions of all kind -- from questions about how to design your own t-shirt to explanations about the types of t-shirt printing to any fun or off-topic question of your choice. Either way, we''re here to help. &lt;/p&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n&lt;a onclick=&quot;email_subscribe(25)&quot; class=&quot;btn btn-primary&quot;&gt;Start Designing Now !&lt;/a&gt;\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n&lt;/div&gt;";}}s:6:"status";s:1:"0";}'),
(5, 'Banner - Left', 'html', 'a:3:{s:4:"name";s:13:"Banner - Left";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:439:"&lt;div class=&quot;block-banner-left not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;300&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;Discount&quot;&gt;&lt;img alt=&quot;BagParallax&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bt_parallax/banner.jpg&quot; title=&quot;BagParallax&quot;&gt;&lt;/a&gt;&lt;p&gt;&lt;span&gt;&lt;span&gt;20%&lt;/span&gt;discount&lt;/span&gt;&lt;/p&gt;&lt;/div&gt;";}}s:6:"status";s:1:"0";}'),
(6, 'Promotion Video', 'html', 'a:3:{s:4:"name";s:15:"Promotion Video";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:813:"&lt;div class=&quot;block-home-feature&quot; style=&quot;background-image: url(http://demo.bossthemes.com/parallax_v2/image/catalog/bt_parallax/bg_video.jpg);&quot;&gt;&lt;div class=&quot;container&quot;&gt;&lt;div class=&quot;row&quot;&gt;&lt;div class=&quot;col-lg-12 col-md-12 col-sm-12 col-xs-12 not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;400&quot;&gt;&lt;div&gt;&lt;h3&gt;promotion video&lt;/h3&gt;&lt;p&gt;let’s show an &lt;span&gt;awesome&lt;/span&gt; video of your store&lt;/p&gt;&lt;div class=&quot;video-content&quot;&gt;&lt;iframe allowfullscreen=&quot;&quot; src=&quot;//www.youtube.com/embed/q82lHEiOkLc&quot; frameborder=&quot;0&quot; height=&quot;480&quot; width=&quot;800&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;";}}s:6:"status";s:1:"0";}'),
(7, 'satisfaction', 'html', 'a:3:{s:4:"name";s:12:"satisfaction";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:833:"&lt;div class=&quot;container&quot;&gt;&lt;div class=&quot;row&quot;&gt;&lt;div class=&quot;col-xs-12 col-sm-12 col-md-12 not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;300&quot;&gt;&lt;div class=&quot;block-home-testimonial&quot;&gt;\r\n&lt;br&gt;&lt;div style=&quot;text-align:center;width:400px;margin:0 auto&quot;&gt;\r\n&lt;img src=&quot;http://custom.maxstarweb.com/image/catalog/logoblack.jpg&quot; title=&quot;Custom Tshirt Design Online Store&quot; alt=&quot;Custom Tshirt Design Online Store&quot; class=&quot;img-responsive&quot;&gt;\r\n&lt;/div&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;\r\n\r\n\r\n&lt;h1 style=&quot;line-height:42px&quot;&gt;We promise 100% satisfaction. If you don''t &lt;br&gt;absolutely love it, we''ll take it back!&lt;/h1&gt;\r\n\r\n\r\n&lt;/div&gt;\r\n\r\n\r\n&lt;/div&gt;\r\n\r\n\r\n&lt;/div&gt;\r\n\r\n\r\n&lt;/div&gt;";}}s:6:"status";s:1:"1";}'),
(8, 'Spread it with Nine Lives', 'html', 'a:3:{s:4:"name";s:25:"Spread it with Nine Lives";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:648:"&lt;div class=&quot;block-home-shipping&quot;&gt;\r\n&lt;div class=&quot;container&quot;&gt;\r\n&lt;div class=&quot;row&quot;&gt;\r\n&lt;div class=&quot;col-lg-12 col-md-12 col-sm-12 col-xs-12 not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;300&quot;&gt;\r\n&lt;div&gt;\r\n&lt;span class=&quot;title &quot;&gt;&lt;span&gt;Spread&lt;/span&gt; it with NINE LIVES&lt;/span&gt;\r\n&lt;p&gt;Buy from our Design collection or Create Your Own&lt;/p&gt;\r\n\r\n\r\n\r\n\r\n&lt;a href=&quot;#&quot; title=&quot;Read more&quot;&gt;Design Your Own&lt;/a&gt;\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n&lt;/div&gt;";}}s:6:"status";s:1:"0";}'),
(9, 'Top Category - Home', 'boss_topcategory', 'a:4:{s:4:"name";s:19:"Top Category - Home";s:23:"boss_topcategory_module";a:3:{s:5:"title";a:1:{i:1;s:37:"It Starts With Our 9 Perfect Products";}s:5:"width";s:3:"360";s:6:"height";s:3:"300";}s:6:"status";s:1:"1";s:22:"boss_topcategory_check";a:10:{i:25;s:2:"25";i:57;s:2:"57";i:60;s:2:"60";i:63;s:2:"63";i:64;s:2:"64";i:65;s:2:"65";i:66;s:2:"66";i:67;s:2:"67";i:68;s:2:"68";i:73;s:2:"73";}}'),
(10, 'Gallery - Home', 'boss_gallery', 'a:4:{s:4:"name";s:14:"Gallery - Home";s:18:"boss_gallery_title";a:1:{i:1;s:16:"Our Specialities";}s:6:"status";s:1:"1";s:18:"boss_gallery_image";a:4:{i:0;a:4:{s:25:"gallery_image_description";a:1:{i:1;s:12:"Most Popular";}s:4:"link";s:16:"/popular-clipart";s:5:"image";s:25:"catalog/bt_parallax/1.jpg";s:5:"class";s:0:"";}i:1;a:4:{s:25:"gallery_image_description";a:1:{i:1;s:12:"Hall Of Fame";}s:4:"link";s:11:"/halloffame";s:5:"image";s:17:"catalog/funny.jpg";s:5:"class";s:0:"";}i:2;a:4:{s:25:"gallery_image_description";a:1:{i:1;s:14:"Special Orders";}s:4:"link";s:14:"/special-order";s:5:"image";s:19:"catalog/special.jpg";s:5:"class";s:0:"";}i:3;a:4:{s:25:"gallery_image_description";a:1:{i:1;s:18:"Design &amp; Color";}s:4:"link";s:13:"/design_color";s:5:"image";s:23:"catalog/designcolor.jpg";s:5:"class";s:0:"";}}}'),
(11, 'Carousel - Footer', 'boss_carousel', 'a:3:{s:4:"name";s:17:"Carousel - Footer";s:20:"boss_carousel_module";a:4:{s:9:"banner_id";s:1:"9";s:5:"limit";s:1:"6";s:5:"width";s:3:"135";s:6:"height";s:2:"68";}s:6:"status";s:1:"1";}'),
(13, 'MainMenu', 'boss_newmegamenu', 'a:3:{s:4:"name";s:8:"MainMenu";s:6:"status";s:1:"1";s:23:"boss_newmegamenu_module";a:3:{s:10:"menu_width";s:0:"";s:10:"num_column";s:1:"6";s:9:"module_id";s:2:"13";}}'),
(14, 'Boss - Category', 'boss_category', 'a:6:{s:4:"name";s:15:"Boss - Category";s:4:"type";s:1:"0";s:5:"title";a:1:{i:1;s:7:"Shop by";}s:6:"column";s:1:"2";s:5:"width";s:3:"380";s:6:"status";s:1:"0";}'),
(15, 'Boss - Products by Alphabet', 'boss_alphabet', 'a:3:{s:4:"name";s:27:"Boss - Products by Alphabet";s:20:"boss_alphabet_module";a:1:{s:5:"title";a:1:{i:1;s:12:"Quick Select";}}s:6:"status";s:1:"0";}'),
(16, 'Featured', 'featured', 'a:6:{s:4:"name";s:8:"Featured";s:7:"product";a:3:{i:0;s:2:"42";i:1;s:2:"41";i:2;s:2:"43";}s:5:"limit";s:1:"3";s:5:"width";s:2:"80";s:6:"height";s:2:"80";s:6:"status";s:1:"1";}'),
(17, 'Tag Cloud', 'boss_tagcloud', 'a:3:{s:4:"name";s:9:"Tag Cloud";s:20:"boss_tagcloud_module";a:5:{s:5:"title";a:1:{i:1;s:12:"Popular tags";}s:5:"limit";s:2:"20";s:13:"min_font_size";s:1:"9";s:13:"max_font_size";s:2:"25";s:11:"font_weight";s:6:"normal";}s:6:"status";s:1:"0";}'),
(19, 'Boss - Zoom', 'boss_zoom', 'a:3:{s:4:"name";s:11:"Boss - Zoom";s:6:"status";s:1:"1";s:16:"boss_zoom_module";a:18:{s:17:"thumb_image_width";s:3:"480";s:18:"thumb_image_height";s:3:"480";s:20:"addition_image_width";s:2:"90";s:21:"addition_image_height";s:2:"90";s:16:"zoom_image_width";s:3:"700";s:17:"zoom_image_height";s:3:"700";s:15:"zoom_area_width";s:3:"480";s:16:"zoom_area_height";s:3:"480";s:18:"position_zoom_area";s:6:"inside";s:7:"adjustX";s:1:"0";s:7:"adjustY";s:1:"0";s:11:"title_image";s:1:"1";s:13:"title_opacity";s:3:"0.5";s:4:"tint";s:7:"#FFFFFF";s:11:"tintOpacity";s:3:"0.5";s:9:"softfocus";s:1:"1";s:11:"lensOpacity";s:3:"0.7";s:10:"smoothMove";s:1:"3";}}'),
(20, 'Blog Category', 'blogcategory', 'a:3:{s:4:"name";s:13:"Blog Category";s:5:"count";s:1:"1";s:6:"status";s:1:"1";}'),
(21, 'Blog Recent Comment', 'blogrecentcomment', 'a:4:{s:4:"name";s:19:"Blog Recent Comment";s:5:"title";a:2:{i:1;s:19:"Blog Recent Comment";i:2;s:19:"Blog Recent Comment";}s:5:"limit";s:1:"3";s:6:"status";s:1:"1";}'),
(22, 'Blog Recent Post', 'blogrecentpost', 'a:3:{s:4:"name";s:16:"Blog Recent Post";s:21:"blogrecentpost_module";a:2:{s:5:"title";a:2:{i:1;s:16:"Blog Recent Post";i:2;s:16:"Blog Recent Post";}s:5:"limit";s:1:"3";}s:6:"status";s:1:"1";}'),
(23, 'Blog Search', 'blogsearch', 'a:2:{s:4:"name";s:11:"Blog Search";s:6:"status";s:1:"1";}'),
(24, 'Blog Tag Cloud', 'blogtagcloud', 'a:3:{s:4:"name";s:14:"Blog Tag Cloud";s:19:"blogtagcloud_module";a:5:{s:5:"title";a:1:{i:1;s:14:"Blog Tag Cloud";}s:5:"limit";s:1:"3";s:13:"min_font_size";s:1:"9";s:13:"max_font_size";s:2:"25";s:11:"font_weight";s:6:"normal";}s:6:"status";s:1:"0";}'),
(25, 'News Letter', 'newslettersubscribe', 'a:13:{s:4:"name";s:11:"News Letter";s:6:"status";s:1:"0";s:26:"newslettersubscribe_module";a:2:{s:5:"title";a:1:{i:1;s:13:"Keep in touch";}s:9:"module_id";s:2:"25";}s:18:"option_unsubscribe";s:1:"1";s:31:"newslettersubscribe_mail_status";s:1:"0";s:30:"newslettersubscribe_registered";s:1:"1";s:32:"newslettersubscribe_option_field";s:1:"6";s:33:"newslettersubscribe_option_field1";s:5:"test1";s:33:"newslettersubscribe_option_field2";s:5:"test2";s:33:"newslettersubscribe_option_field3";s:5:"test3";s:33:"newslettersubscribe_option_field4";s:5:"test4";s:33:"newslettersubscribe_option_field5";s:5:"test5";s:33:"newslettersubscribe_option_field6";s:5:"test6";}'),
(29, 'Slideshow', 'boss_revolutionslider', 'a:3:{s:4:"name";s:9:"Slideshow";s:6:"status";s:1:"1";s:9:"slider_id";s:2:"24";}'),
(30, 'Manufacturer - Left', 'boss_manufacturer', 'a:3:{s:4:"name";s:19:"Manufacturer - Left";s:24:"boss_manufacturer_module";a:1:{s:5:"title";a:1:{i:1;s:12:"Manufacturer";}}s:6:"status";s:1:"0";}'),
(35, 'Boss Quickshop', 'boss_quickshop', 'a:4:{s:4:"name";s:14:"Boss Quickshop";s:4:"code";s:14:"boss_quickshop";s:6:"status";i:1;s:21:"boss_quickshop_module";a:3:{s:5:"title";a:2:{i:1;s:10:"Quick Shop";i:2;s:10:"Quick Shop";}s:20:"array_class_selected";s:158:".box-product&gt;li,.bt-item-extra&gt;section,.bt-product-large&gt;section,.relt_product&gt;div,.product-list&gt;div, .product-grid&gt;div, .box-product&gt;div";s:5:"width";i:900;}}'),
(36, 'Design &amp; Color Images', 'boss_gallery', 'a:4:{s:4:"name";s:25:"Design &amp; Color Images";s:18:"boss_gallery_title";a:1:{i:1;s:25:"Design &amp; Color Images";}s:6:"status";s:1:"1";s:18:"boss_gallery_image";a:4:{i:0;a:4:{s:25:"gallery_image_description";a:1:{i:1;s:4:"img1";}s:4:"link";s:1:"#";s:5:"image";s:22:"catalog/logofooter.png";s:5:"class";s:0:"";}i:1;a:4:{s:25:"gallery_image_description";a:1:{i:1;s:4:"img2";}s:4:"link";s:1:"#";s:5:"image";s:25:"catalog/logoninelives.png";s:5:"class";s:0:"";}i:2;a:4:{s:25:"gallery_image_description";a:1:{i:1;s:0:"";}s:4:"link";s:0:"";s:5:"image";s:24:"catalog/shutterstock.png";s:5:"class";s:0:"";}i:4;a:4:{s:25:"gallery_image_description";a:1:{i:1;s:7:"Image 3";}s:4:"link";s:1:"#";s:5:"image";s:60:"catalog/cropped-tumblr_static_bwstt5be1q80ckws44004kokc2.png";s:5:"class";s:0:"";}}}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option`
--

CREATE TABLE IF NOT EXISTS `oc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_description`
--

CREATE TABLE IF NOT EXISTS `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(5, 1, 'Select'),
(6, 1, 'Add Note'),
(7, 1, 'File'),
(8, 1, 'Date'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(11, 1, 'Size'),
(12, 1, 'Delivery Date');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value`
--

CREATE TABLE IF NOT EXISTS `oc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(23, 2, '', 1),
(24, 2, '', 2),
(31, 1, '', 2),
(32, 1, '', 1),
(39, 5, '', 1),
(40, 5, '', 2),
(41, 5, '', 3),
(42, 5, '', 4),
(43, 1, '', 3),
(44, 2, '', 3),
(45, 2, '', 4),
(48, 11, '', 3),
(47, 11, '', 2),
(46, 11, '', 1),
(49, 11, '', 4);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value_description`
--

CREATE TABLE IF NOT EXISTS `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(31, 1, 1, 'Medium'),
(32, 1, 1, 'Small'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(41, 1, 5, 'Green'),
(42, 1, 5, 'Yellow'),
(43, 1, 1, 'Large'),
(44, 1, 2, 'Checkbox 3'),
(45, 1, 2, 'Checkbox 4'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small'),
(49, 1, 11, 'Xtra large');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order`
--

CREATE TABLE IF NOT EXISTS `oc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL,
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL,
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(40) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=92 ;

--
-- Dumping data for table `oc_order`
--

INSERT INTO `oc_order` (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `custom_field`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_custom_field`, `payment_method`, `payment_code`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_custom_field`, `shipping_method`, `shipping_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `marketing_id`, `tracking`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `date_added`, `date_modified`) VALUES
(1, 0, 'INV-2013-00', 0, 'Framework Opencart Parallax By BossThemes', 'http://192.168.1.31/48_Parallax/trunk/site/', 1, 1, 'linh', 'nguyen', 'aaa@yahoo.com', '123456789', '', 'b:0;', 'linh', 'nguyen', '', '249 Ung Van Khiem Street, Binh Thanh District, HCM city', '', 'HCM', '084', 'United Kingdom', 222, 'Aberdeen', 3513, '', 'b:0;', 'Cash On Delivery', 'cod', 'linh', 'nguyen', '', '249 Ung Van Khiem Street, Binh Thanh District, HCM city', '', 'HCM', '084', 'United Kingdom', 222, 'Aberdeen', 3513, '', 'b:0;', 'Flat Shipping Rate', 'flat.flat', '', '253.2000', 1, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '192.168.1.99', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 'en-US,en;q=0.5', '2014-11-18 14:22:33', '2014-11-18 14:22:35'),
(2, 0, 'INV-2013-00', 0, 'Framework Opencart Parallax By BossThemes', 'http://192.168.1.31/48_Parallax/trunk/site/', 1, 1, 'linh', 'nguyen', 'aaa@yahoo.com', '123456789', '', 'b:0;', 'linh', 'nguyen', '', '249 Ung Van Khiem Street, Binh Thanh District, HCM city', '', 'HCM', '084', 'United Kingdom', 222, 'Aberdeen', 3513, '', 'b:0;', 'Cash On Delivery', 'cod', 'linh', 'nguyen', '', '249 Ung Van Khiem Street, Binh Thanh District, HCM city', '', 'HCM', '084', 'United Kingdom', 222, 'Aberdeen', 3513, '', 'b:0;', 'Flat Shipping Rate', 'flat.flat', '', '372.0000', 1, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '192.168.1.99', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 'en-US,en;q=0.5', '2014-11-19 11:11:28', '2014-11-19 11:11:40'),
(3, 0, 'INV-2013-00', 0, 'Framework Opencart Parallax By BossThemes', 'http://192.168.1.31/48_Parallax/trunk/site/', 1, 1, 'linh', 'nguyen', 'aaa@yahoo.com', '123456789', '', 'b:0;', 'linh', 'nguyen', '', '249 Ung Van Khiem Street, Binh Thanh District, HCM city', '', 'HCM', '084', 'United Kingdom', 222, 'Aberdeen', 3513, '', 'b:0;', 'Cash On Delivery', 'cod', 'linh', 'nguyen', '', '249 Ung Van Khiem Street, Binh Thanh District, HCM city', '', 'HCM', '084', 'United Kingdom', 222, 'Aberdeen', 3513, '', 'b:0;', 'Flat Shipping Rate', 'flat.flat', '', '1943.2000', 0, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '192.168.1.99', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 'en-US,en;q=0.5', '2014-11-19 17:04:06', '2014-11-19 17:04:06'),
(4, 0, 'INV-2013-00', 0, 'Framework Opencart Parallax By BossThemes', 'http://192.168.1.31/48_Parallax/trunk/site/', 1, 1, 'linh', 'nguyen', 'aaa@yahoo.com', '123456789', '', 'b:0;', 'linh', 'nguyen', '', '249 Ung Van Khiem Street, Binh Thanh District, HCM city', '', 'HCM', '084', 'United Kingdom', 222, 'Aberdeen', 3513, '', 'b:0;', 'Cash On Delivery', 'cod', 'linh', 'nguyen', '', '249 Ung Van Khiem Street, Binh Thanh District, HCM city', '', 'HCM', '084', 'United Kingdom', 222, 'Aberdeen', 3513, '', 'b:0;', 'Flat Shipping Rate', 'flat.flat', '', '3157.6000', 0, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '192.168.1.99', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 'en-US,en;q=0.5', '2014-12-08 16:31:32', '2014-12-08 16:31:32'),
(5, 0, 'INV-2013-00', 0, 'Framework Opencart Parallax By BossThemes', 'http://192.168.1.31/48_Parallax/trunk/site/', 1, 1, 'linh', 'nguyen', 'aaa@yahoo.com', '123456789', '', 'b:0;', 'linh', 'nguyen', '', '249 Ung Van Khiem Street, Binh Thanh District, HCM city', '', 'HCM', '084', 'United Kingdom', 222, 'Aberdeen', 3513, '', 'b:0;', 'Cash On Delivery', 'cod', 'linh', 'nguyen', '', '249 Ung Van Khiem Street, Binh Thanh District, HCM city', '', 'HCM', '084', 'United Kingdom', 222, 'Aberdeen', 3513, '', 'b:0;', 'Flat Shipping Rate', 'flat.flat', '', '3157.6000', 0, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '192.168.1.99', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 'en-US,en;q=0.5', '2014-12-08 16:32:15', '2014-12-08 16:32:15'),
(6, 0, 'INV-2013-00', 0, 'Framework Opencart Parallax By BossThemes', 'http://192.168.1.31/48_Parallax/trunk/site/', 2, 1, 'test', 'test', 'test@yahoo.com', '2323232', '', 'b:0;', 'test', 'test', '', 'sdf sdfds fs ', '', 'sd fsdfs f', '34321', 'United Kingdom', 222, 'Cheshire', 3529, '', 'b:0;', 'Cash On Delivery', 'cod', 'test', 'test', '', 'sdf sdfds fs ', '', 'sd fsdfs f', '34321', 'United Kingdom', 222, 'Cheshire', 3529, '', 'b:0;', 'Flat Shipping Rate', 'flat.flat', '', '130.0000', 1, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '192.168.1.31', '', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36', 'vi-VN,vi;q=0.8,fr-FR;q=0.6,fr;q=0.4,en-US;q=0.2,en;q=0.2,de;q=0.2,es;q=0.2,nl;q=0.2,sv;q=0.2', '2014-12-10 10:11:59', '2014-12-10 10:12:02'),
(7, 0, 'INV-2013-00', 0, 'Framework Opencart Parallax By BossThemes', 'http://192.168.1.31/48_Parallax/trunk/site/', 1, 1, 'linh', 'nguyen', 'aaa@yahoo.com', '123456789', '', 'b:0;', 'linh', 'nguyen', '', '249 Ung Van Khiem Street, Binh Thanh District, HCM city', '', 'HCM', '084', 'United Kingdom', 222, 'Aberdeen', 3513, '', 'b:0;', 'Cash On Delivery', 'cod', 'linh', 'nguyen', '', '249 Ung Van Khiem Street, Binh Thanh District, HCM city', '', 'HCM', '084', 'United Kingdom', 222, 'Aberdeen', 3513, '', 'b:0;', 'Flat Shipping Rate', 'flat.flat', '', '3401.6000', 0, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '192.168.1.99', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 'en-US,en;q=0.5', '2014-12-10 16:26:06', '2014-12-10 16:26:06'),
(8, 0, 'INV-2013-00', 0, 'Framework Opencart Parallax By BossThemes', 'http://192.168.1.31/48_Parallax/trunk/site/', 1, 1, 'linh', 'nguyen', 'aaa@yahoo.com', '123456789', '', 'b:0;', 'linh', 'nguyen', '', '249 Ung Van Khiem Street, Binh Thanh District, HCM city', '', 'HCM', '084', 'United Kingdom', 222, 'Aberdeen', 3513, '', 'b:0;', 'Cash On Delivery', 'cod', 'linh', 'nguyen', '', '249 Ung Van Khiem Street, Binh Thanh District, HCM city', '', 'HCM', '084', 'United Kingdom', 222, 'Aberdeen', 3513, '', 'b:0;', 'Flat Shipping Rate', 'flat.flat', '', '3401.6000', 0, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '192.168.1.99', '', 'Mozilla/5.0 (Windows NT 6.1; rv:34.0) Gecko/20100101 Firefox/34.0', 'en-US,en;q=0.5', '2014-12-11 11:41:17', '2014-12-11 11:41:17'),
(9, 0, 'INV-2013-00', 0, 'Framework Opencart Parallax By BossThemes', 'http://192.168.1.31/48_Parallax/trunk/site/', 1, 1, 'linh', 'nguyen', 'aaa@yahoo.com', '123456789', '', 'b:0;', 'linh', 'nguyen', '', '249 Ung Van Khiem Street, Binh Thanh District, HCM city', '', 'HCM', '084', 'United Kingdom', 222, 'Aberdeen', 3513, '', 'b:0;', 'Cash On Delivery', 'cod', 'linh', 'nguyen', '', '249 Ung Van Khiem Street, Binh Thanh District, HCM city', '', 'HCM', '084', 'United Kingdom', 222, 'Aberdeen', 3513, '', 'b:0;', 'Flat Shipping Rate', 'flat.flat', '', '3523.6000', 0, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '192.168.1.99', '', 'Mozilla/5.0 (Windows NT 6.1; rv:34.0) Gecko/20100101 Firefox/34.0', 'en-US,en;q=0.5', '2014-12-11 12:03:41', '2014-12-11 12:03:41'),
(10, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://custom.maxstarweb.com/', 0, 1, 'Remi', 'Sahani', 'maxstar.gaf@gmail.com', '5543534', '', 'a:0:{}', 'Remi', 'Sahani', '', 'kolkata', '', 'kolkata', '6567565', 'United Kingdom', 222, 'Berkshire', 3519, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Remi', 'Sahani', '', 'kolkata', '', 'kolkata', '6567565', 'United Kingdom', 222, 'Berkshire', 3519, '', 'a:0:{}', 'Flat Shipping Rate', 'flat.flat', 'test', '19.0000', 1, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; rv:41.0) Gecko/20100101 Firefox/41.0', 'en-US,en;q=0.5', '2015-10-07 08:16:59', '2015-10-07 08:17:02'),
(11, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://custom.maxstarweb.com/', 0, 1, 'ra', 'ra', 'maxstar.gaf@gmail.com', '32432', '434', 'a:0:{}', 'ra', 'ra', '', 'kolkata', '', 'kolkata', '6567565', 'United Kingdom', 222, 'Berkshire', 3519, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'ra', 'ra', '', 'kolkata', '', 'kolkata', '6567565', 'United Kingdom', 222, 'Berkshire', 3519, '', 'a:0:{}', 'Flat Shipping Rate', 'flat.flat', '', '16.0000', 1, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; rv:41.0) Gecko/20100101 Firefox/41.0', 'en-US,en;q=0.5', '2015-10-07 08:59:03', '2015-10-07 08:59:10'),
(12, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://custom.maxstarweb.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'b:0;', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'b:0;', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'b:0;', 'Flat Shipping Rate', 'flat.flat', '', '25.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.33.187.161', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'en-US,en;q=0.8', '2015-10-15 07:05:27', '2015-10-15 07:05:38'),
(13, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://custom.maxstarweb.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'b:0;', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'b:0;', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'b:0;', 'Flat Shipping Rate', 'flat.flat', '', '25.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.33.187.161', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', 'en-US,en;q=0.8', '2015-10-28 07:22:37', '2015-10-28 07:22:43'),
(14, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://custom.maxstarweb.com/', 6, 1, 'Reshmi', 'Saha', 'maxstar1.gaf@gmail.com', '4342', '', 'b:0;', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '3432423', 'United Kingdom', 222, 'Anglesey', 3515, '', 'b:0;', 'Cash On Delivery', 'cod', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '3432423', 'United Kingdom', 222, 'Anglesey', 3515, '', 'b:0;', 'Free Shipping', 'free.free', '', '22.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; rv:41.0) Gecko/20100101 Firefox/41.0', 'en-US,en;q=0.5', '2015-10-30 05:22:36', '2015-10-30 05:22:58'),
(15, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://custom.maxstarweb.com/', 6, 1, 'Reshmi', 'Saha', 'maxstar1.gaf@gmail.com', '4342', '', 'b:0;', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '3432423', 'United Kingdom', 222, 'Anglesey', 3515, '', 'b:0;', 'Cash On Delivery', 'cod', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '3432423', 'United Kingdom', 222, 'Anglesey', 3515, '', 'b:0;', 'Free Shipping', 'free.free', '', '2.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; rv:41.0) Gecko/20100101 Firefox/41.0', 'en-US,en;q=0.5', '2015-10-30 05:30:32', '2015-10-30 05:30:35'),
(16, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://custom.maxstarweb.com/', 6, 1, 'Reshmi', 'Saha', 'maxstar1.gaf@gmail.com', '4342', '', 'b:0;', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '3432423', 'United Kingdom', 222, 'Anglesey', 3515, '', 'b:0;', 'Cash On Delivery', 'cod', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '3432423', 'United Kingdom', 222, 'Anglesey', 3515, '', 'b:0;', 'Free Shipping', 'free.free', '', '1.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; rv:41.0) Gecko/20100101 Firefox/41.0', 'en-US,en;q=0.5', '2015-10-30 05:39:14', '2015-10-30 05:39:17'),
(17, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://custom.maxstarweb.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Free Shipping', 'free.free', '', '63.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.33.187.161', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', 'en-US,en;q=0.8', '2015-11-05 05:48:31', '2015-11-05 05:48:53'),
(18, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Free Shipping', 'free.free', '', '25.0000', 1, 0, '0.0000', 0, '', 1, 2, 'USD', '0.12460000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-11-09 10:45:35', '2015-11-09 10:45:39'),
(19, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Free Shipping', 'free.free', '', '20.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.69.110.1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', 'ar,en-US;q=0.8,en;q=0.6', '2015-11-09 19:58:59', '2015-11-09 19:59:04'),
(20, 1, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://9livesprints.com/', 5, 1, 'Pino', 'Ssg', 'pino.ssg@gmail.com', '1234456789', '', 'a:0:{}', 'Pino', 'Sag', 'Eh', 'HhhCa', '', 'Cairo', '', 'Egypt', 63, 'Al Qahirah', 1011, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Pino', 'Sag', 'Eh', 'HhhCa', '', 'Cairo', '', 'Egypt', 63, 'Al Qahirah', 1011, '', 'a:0:{}', 'Free Shipping', 'free.free', '', '24.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.34.54.170', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', 'en-US,en;q=0.8', '2015-11-10 12:15:28', '2015-11-10 12:15:32'),
(21, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 6, 1, 'Reshmi', 'Saha', 'maxstar1.gaf@gmail.com', '4342', '', 'b:0;', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '3432423', 'United Kingdom', 222, 'Anglesey', 3515, '', 'b:0;', 'Cash On Delivery', 'cod', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '3432423', 'United Kingdom', 222, 'Anglesey', 3515, '', 'b:0;', 'Shipping Rate', 'individualshipping.individualshipping', '', '65.0000', 0, 0, '0.0000', 0, '', 1, 2, 'USD', '0.12770000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-11-21 06:43:41', '2015-11-21 06:43:41'),
(22, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', 'weight.weight_5', '', '30.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-01 14:48:11', '2015-12-01 14:48:15'),
(23, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', 'weight.weight_5', '', '28.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '105.198.243.116', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.73 Safari/537.36', 'ar,en-US;q=0.8,en;q=0.6', '2015-12-07 11:22:45', '2015-12-07 11:22:49'),
(24, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', 'weight.weight_5', '', '25.0000', 0, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-07 13:13:49', '2015-12-07 13:13:49'),
(25, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', 'weight.weight_5', '', '25.0000', 0, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-07 13:21:07', '2015-12-07 13:21:07'),
(26, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', 'weight.weight_5', '', '25.0000', 0, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-07 13:29:40', '2015-12-07 13:29:40'),
(27, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', 'weight.weight_5', '', '25.0000', 0, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-07 13:34:45', '2015-12-07 13:34:45'),
(28, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', 'weight.weight_5', '', '25.0000', 0, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-07 13:41:40', '2015-12-07 13:41:40'),
(29, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', 'weight.weight_5', '', '25.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-07 13:44:30', '2015-12-07 13:44:37'),
(30, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', 'weight.weight_5', '', '25.0000', 0, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-07 13:53:37', '2015-12-07 13:53:37'),
(31, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', 'weight.weight_5', '', '25.0000', 0, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-07 13:59:21', '2015-12-07 13:59:21'),
(32, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', 'weight.weight_5', '', '25.0000', 0, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-07 14:03:29', '2015-12-07 14:03:29'),
(33, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', 'weight.weight_5', '', '25.0000', 0, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.33.186.129', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.73 Safari/537.36', 'en-US,en;q=0.8', '2015-12-08 03:53:25', '2015-12-08 03:53:25'),
(34, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', 'weight.weight_5', '', '29.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.33.186.129', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.73 Safari/537.36', 'en-US,en;q=0.8', '2015-12-08 09:33:59', '2015-12-08 09:34:04'),
(35, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', 'weight.weight_5', '', '29.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.235.132.54', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.73 Safari/537.36', 'ar,en-US;q=0.8,en;q=0.6', '2015-12-08 11:58:03', '2015-12-08 11:58:05'),
(36, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', 'weight.weight_5', '', '29.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.235.132.54', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.73 Safari/537.36', 'ar,en-US;q=0.8,en;q=0.6', '2015-12-08 12:11:37', '2015-12-08 12:11:40'),
(37, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', 'weight.weight_5', '', '29.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.235.132.54', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'en-US,en;q=0.5', '2015-12-08 12:13:11', '2015-12-08 12:13:15'),
(38, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', 'weight.weight_5', '', '25.0000', 0, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-08 13:03:40', '2015-12-08 13:03:40'),
(39, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', 'weight.weight_5', '', '25.0000', 0, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-08 13:04:01', '2015-12-08 13:04:01'),
(40, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', 'weight.weight_5', '', '25.0000', 0, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-08 13:04:52', '2015-12-08 13:04:52'),
(41, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 1.00kg)', 'weight.weight_5', '', '35.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-09 07:03:11', '2015-12-09 07:03:36'),
(42, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '24.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.33.187.161', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.73 Safari/537.36', 'en-US,en;q=0.8', '2015-12-09 07:33:26', '2015-12-09 07:34:25'),
(43, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '23.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-09 13:44:47', '2015-12-09 13:44:51'),
(44, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '20.0000', 0, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-09 13:53:14', '2015-12-09 13:53:14'),
(45, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '20.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-09 13:55:25', '2015-12-09 14:03:55'),
(46, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '20.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-09 14:17:33', '2015-12-09 14:17:38'),
(47, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 1.00kg)', 'weight.weight_5', '', '35.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-12 14:21:55', '2015-12-12 14:24:39'),
(48, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '20.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-12 14:29:50', '2015-12-12 14:30:00'),
(49, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '20.0000', 0, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-12 14:32:30', '2015-12-12 14:32:30'),
(50, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '20.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-12 15:06:29', '2015-12-12 15:06:32'),
(51, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '24.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-12 15:39:34', '2015-12-12 15:39:37'),
(52, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '23.0000', 0, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-12 23:56:46', '2015-12-12 23:56:46'),
(53, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '23.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; rv:42.0) Gecko/20100101 Firefox/42.0', 'en-US,en;q=0.5', '2015-12-13 00:08:13', '2015-12-13 00:08:38'),
(54, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '23.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2015-12-18 00:34:14', '2015-12-18 00:34:23'),
(55, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '20.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2015-12-18 00:40:26', '2015-12-18 01:08:41'),
(56, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '20.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2015-12-18 01:10:10', '2015-12-18 01:10:13'),
(57, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '20.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2015-12-18 01:15:16', '2015-12-18 01:15:19'),
(58, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '20.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2015-12-18 01:16:57', '2015-12-18 01:17:00'),
(59, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '20.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.69.73.55', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 'ar,en-US;q=0.8,en;q=0.6', '2015-12-22 08:42:34', '2015-12-22 08:42:41'),
(60, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '23.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.69.73.55', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 'ar,en-US;q=0.8,en;q=0.6', '2015-12-22 08:46:00', '2015-12-22 08:46:04'),
(61, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '20.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2015-12-26 01:22:18', '2015-12-26 01:22:22'),
(62, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '20.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2015-12-26 01:27:59', '2015-12-26 01:28:10'),
(63, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '23.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2015-12-26 15:58:17', '2015-12-26 15:58:24'),
(64, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '24.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2015-12-26 16:03:21', '2015-12-26 16:03:25'),
(65, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '20.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.33.187.161', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 'en-US,en;q=0.8', '2015-12-27 03:56:39', '2015-12-27 03:56:51'),
(66, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Egypt Shipping Rate  (Weight: 2.50kg)', 'weight.weight_5', '', '80.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.33.187.161', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 'en-US,en;q=0.8', '2015-12-27 03:58:03', '2015-12-27 03:58:07'),
(67, 2, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Egypt Shipping Rate  (Weight: 6.00kg)', 'weight.weight_5', '', '185.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.33.187.161', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 'en-US,en;q=0.8', '2015-12-27 04:00:13', '2015-12-27 04:00:18');
INSERT INTO `oc_order` (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `custom_field`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_custom_field`, `payment_method`, `payment_code`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_custom_field`, `shipping_method`, `shipping_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `marketing_id`, `tracking`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `date_added`, `date_modified`) VALUES
(68, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '20.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.33.187.161', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 'en-US,en;q=0.8', '2015-12-27 04:01:03', '2015-12-27 04:01:08'),
(69, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '20.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.33.187.161', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 'en-US,en;q=0.8', '2015-12-27 04:01:48', '2015-12-27 04:01:51'),
(70, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '20.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.33.187.161', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 'en-US,en;q=0.8', '2015-12-27 04:02:46', '2015-12-27 04:02:49'),
(71, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Egypt Shipping Rate  (Weight: 5.50kg)', 'weight.weight_5', '', '170.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.33.187.161', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 'en-US,en;q=0.8', '2015-12-28 04:49:52', '2015-12-28 04:49:56'),
(72, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '23.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.33.187.161', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 'en-US,en;q=0.8', '2015-12-28 04:54:00', '2015-12-28 04:54:03'),
(73, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Egypt Shipping Rate  (Weight: 11.00kg)', 'weight.weight_5', '', '335.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.33.187.161', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 'en-US,en;q=0.8', '2015-12-28 05:02:38', '2015-12-28 05:02:41'),
(74, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Giza  (Weight: 0.50kg)', 'weight.weight_9', '', '40.0000', 0, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.33.187.161', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 'en-US,en;q=0.8', '2015-12-28 07:40:51', '2015-12-28 07:40:51'),
(75, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 8, 1, 'Sumana', 'Sah', 'suman32@gmail.com', '99658965899', '', 'a:0:{}', 'Sumana', 'Sah', '', 'Address Egypt Road', '', 'Egypt City', '700000', 'Egypt', 63, 'Al Qahirah', 1011, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Sumana', 'Sah', '', 'Address Egypt Road', '', 'Egypt City', '700000', 'Egypt', 63, 'Al Qahirah', 1011, '', 'a:0:{}', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '20.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2015-12-28 12:37:15', '2015-12-28 12:37:22'),
(76, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 1.00kg)', 'weight.weight_5', '', '39.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2015-12-28 12:41:00', '2015-12-28 12:41:04'),
(77, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 7.00kg)', 'weight.weight_5', '', '215.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2015-12-28 12:44:15', '2015-12-28 12:44:17'),
(78, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 8, 1, 'Sumana', 'Sah', 'suman32@gmail.com', '99658965899', '', 'a:0:{}', 'Sumana', 'Sah', '', 'Address Egypt Road', '', 'Egypt City', '700000', 'Egypt', 63, 'Al Qahirah', 1011, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Sumana', 'Sah', '', 'Address Egypt Road', '', 'Egypt City', '700000', 'Egypt', 63, 'Al Qahirah', 1011, '', 'a:0:{}', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '24.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2015-12-28 14:04:52', '2015-12-28 14:04:56'),
(79, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 4, 1, 'Reshmi', 'Saha', 'maxstar.gaf@gmail.com', '12345679', '', 'a:0:{}', 'Reshmi', 'Saha', '', 'kolkata', '', 'kolkata', '5654', 'United Kingdom', 222, 'Cheshire', 3529, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Reshmi', 'Chowdhury', '', 'hgfhf', 'fhgfhf', 'hkjjh', '5654', 'Egypt', 63, 'Al Qahirah', 1011, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '20.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2015-12-28 14:09:31', '2015-12-28 14:09:34'),
(80, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Giza  (Weight: 0.50kg)', 'weight.weight_9', '', '44.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.33.187.161', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 'en-US,en;q=0.8', '2015-12-29 03:08:29', '2015-12-29 03:08:35'),
(81, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Giza  (Weight: 11.50kg)', 'weight.weight_9', '', '370.0000', 0, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.33.187.161', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 'en-US,en;q=0.8', '2015-12-29 03:09:59', '2015-12-29 03:09:59'),
(82, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Giza  (Weight: 11.50kg)', 'weight.weight_9', '', '370.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.33.187.161', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 'en-US,en;q=0.8', '2015-12-29 03:09:59', '2015-12-29 03:10:02'),
(83, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 9, 1, 'Silky', 'Chowdhury', 'wbtkolkata@gmail.com', '09933421233', '', 'b:0;', 'Silky', 'Chowdhury', 'kolkata', 'kolkata', '', 'kolkata', '6546', 'Egypt', 63, 'Bani Suwayf', 1018, '', 'b:0;', 'Cash On Delivery', 'cod', 'Silky', 'Chowdhury', 'kolkata', 'kolkata', '', 'kolkata', '6546', 'Egypt', 63, 'Bani Suwayf', 1018, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '20.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2015-12-29 04:05:00', '2015-12-29 04:05:05'),
(84, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 9, 1, 'Silky', 'Chowdhury', 'wbtkolkata@gmail.com', '09933421233', '', 'b:0;', 'Silky', 'Chowdhury', 'kolkata', 'kolkata', '', 'kolkata', '6546', 'Egypt', 63, 'Bani Suwayf', 1018, '', 'b:0;', 'Cash On Delivery', 'cod', 'Silky', 'Chowdhury', 'kolkata', 'kolkata', '', 'kolkata', '6546', 'Egypt', 63, 'Bani Suwayf', 1018, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 10.00kg)', 'weight.weight_5', '', '305.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2015-12-29 04:11:00', '2015-12-29 04:11:05'),
(85, 0, 'INV-2013-00', 0, 'Custom Tshirt Design Online Store', 'http://dev.9livesprints.com/', 12, 1, 'Rani', 'Saha', 'wbtkolkata@gmail.com', '343453', '', 'b:0;', 'Rani', 'Saha', '', 'kolkata', '', 'kolkata', '', 'Egypt', 63, 'Aswan', 1016, '', 'b:0;', 'Cash On Delivery', 'cod', 'Rani', 'Saha', '', 'kolkata', '', 'kolkata', '', 'Egypt', 63, 'Aswan', 1016, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '20.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2015-12-29 05:23:43', '2015-12-29 05:23:48'),
(86, 0, 'INV-2013-00', 0, 'NineLives', 'http://dev.9livesprints.com/', 12, 1, 'Rani', 'Saha', 'wbtkolkata@gmail.com', '343453', '', 'b:0;', 'Rani', 'Saha', '', 'kolkata', '', 'kolkata', '', 'Egypt', 63, 'Aswan', 1016, '', 'b:0;', 'Cash On Delivery', 'cod', 'Rani', 'Saha', '', 'kolkata', '', 'kolkata', '', 'Egypt', 63, 'Aswan', 1016, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '20.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2015-12-29 05:34:48', '2015-12-29 05:34:53'),
(87, 0, 'INV-2013-00', 0, 'NineLives', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Giza  (Weight: 15.00kg)', 'weight.weight_9', '', '565.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.33.187.161', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 'en-US,en;q=0.8', '2015-12-29 09:13:16', '2015-12-29 09:13:21'),
(88, 0, 'INV-2013-00', 0, 'NineLives', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Giza  (Weight: 7.50kg)', 'weight.weight_9', '', '250.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.33.187.161', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 'en-US,en;q=0.8', '2015-12-29 09:14:12', '2015-12-29 09:14:14'),
(89, 0, 'INV-2013-00', 0, 'NineLives', 'http://dev.9livesprints.com/', 12, 1, 'Rani', 'Saha', 'wbtkolkata@gmail.com', '343453', '', 'b:0;', 'Rani', 'Saha', '', 'kolkata', '', 'kolkata', '', 'Egypt', 63, 'Aswan', 1016, '', 'b:0;', 'Cash On Delivery', 'cod', 'Rani', 'Saha', '', 'kolkata', '', 'kolkata', '', 'Egypt', 63, 'Aswan', 1016, '', 'b:0;', 'Egypt Shipping Rate  (Weight: 0.50kg)', 'weight.weight_5', '', '20.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '45.113.88.2', '', 'Mozilla/5.0 (Windows NT 6.1; rv:43.0) Gecko/20100101 Firefox/43.0', 'en-US,en;q=0.5', '2015-12-29 11:55:38', '2015-12-29 11:55:41'),
(90, 0, 'INV-2016-00', 0, 'NineLives', 'http://dev.9livesprints.com/', 3, 1, 'Gehad', 'Hashim', 'gehad_hashim@hotmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Jizah', 1008, '', 'a:0:{}', 'Egypt Shipping Rate  (Weight: 500.00g)', 'weight.weight_5', '', '24.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.187.32.38', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 'en-US,en;q=0.8', '2016-01-12 04:19:59', '2016-01-12 04:20:03'),
(91, 0, 'INV-2016-00', 0, 'NineLives', 'http://dev.9livesprints.com/', 17, 1, 'Gehad', 'Hashim', 'gehadhashim@gmail.com', '+201003388314', '', 'a:0:{}', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Qahirah', 1011, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'Gehad', 'Hashim', 'Nine Lives', '64b el rashed st', '', 'Giza', '12657', 'Egypt', 63, 'Al Qahirah', 1011, '', 'a:0:{}', 'Egypt Shipping Rate  (Weight: 500.00g)', 'weight.weight_5', '', '14.0000', 1, 0, '0.0000', 0, '', 1, 4, 'EGP', '1.00000000', '41.187.32.38', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 'en-US,en;q=0.8', '2016-01-12 05:24:27', '2016-01-12 05:24:35');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_custom_field`
--

CREATE TABLE IF NOT EXISTS `oc_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL,
  PRIMARY KEY (`order_custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_fraud`
--

CREATE TABLE IF NOT EXISTS `oc_order_fraud` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `country_match` varchar(3) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `high_risk_country` varchar(3) NOT NULL,
  `distance` int(11) NOT NULL,
  `ip_region` varchar(255) NOT NULL,
  `ip_city` varchar(255) NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) NOT NULL,
  `ip_org` varchar(255) NOT NULL,
  `ip_asnum` int(11) NOT NULL,
  `ip_user_type` varchar(255) NOT NULL,
  `ip_country_confidence` varchar(3) NOT NULL,
  `ip_region_confidence` varchar(3) NOT NULL,
  `ip_city_confidence` varchar(3) NOT NULL,
  `ip_postal_confidence` varchar(3) NOT NULL,
  `ip_postal_code` varchar(10) NOT NULL,
  `ip_accuracy_radius` int(11) NOT NULL,
  `ip_net_speed_cell` varchar(255) NOT NULL,
  `ip_metro_code` int(3) NOT NULL,
  `ip_area_code` int(3) NOT NULL,
  `ip_time_zone` varchar(255) NOT NULL,
  `ip_region_name` varchar(255) NOT NULL,
  `ip_domain` varchar(255) NOT NULL,
  `ip_country_name` varchar(255) NOT NULL,
  `ip_continent_code` varchar(2) NOT NULL,
  `ip_corporate_proxy` varchar(3) NOT NULL,
  `anonymous_proxy` varchar(3) NOT NULL,
  `proxy_score` int(3) NOT NULL,
  `is_trans_proxy` varchar(3) NOT NULL,
  `free_mail` varchar(3) NOT NULL,
  `carder_email` varchar(3) NOT NULL,
  `high_risk_username` varchar(3) NOT NULL,
  `high_risk_password` varchar(3) NOT NULL,
  `bin_match` varchar(10) NOT NULL,
  `bin_country` varchar(2) NOT NULL,
  `bin_name_match` varchar(3) NOT NULL,
  `bin_name` varchar(255) NOT NULL,
  `bin_phone_match` varchar(3) NOT NULL,
  `bin_phone` varchar(32) NOT NULL,
  `customer_phone_in_billing_location` varchar(8) NOT NULL,
  `ship_forward` varchar(3) NOT NULL,
  `city_postal_match` varchar(3) NOT NULL,
  `ship_city_postal_match` varchar(3) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int(11) NOT NULL,
  `maxmind_id` varchar(8) NOT NULL,
  `error` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_history`
--

CREATE TABLE IF NOT EXISTS `oc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=69 ;

--
-- Dumping data for table `oc_order_history`
--

INSERT INTO `oc_order_history` (`order_history_id`, `order_id`, `order_status_id`, `notify`, `comment`, `date_added`) VALUES
(1, 1, 1, 0, '', '2014-11-18 14:22:35'),
(2, 2, 1, 0, '', '2014-11-19 11:11:40'),
(3, 6, 1, 0, '', '2014-12-10 10:12:02'),
(4, 10, 1, 0, '', '2015-10-07 08:17:02'),
(5, 11, 1, 0, '', '2015-10-07 08:59:10'),
(6, 12, 1, 0, '', '2015-10-15 07:05:38'),
(7, 13, 1, 0, '', '2015-10-28 07:22:43'),
(8, 14, 1, 0, '', '2015-10-30 05:22:58'),
(9, 15, 1, 0, '', '2015-10-30 05:30:35'),
(10, 16, 1, 0, '', '2015-10-30 05:39:17'),
(11, 17, 1, 0, '', '2015-11-05 05:48:53'),
(12, 18, 1, 0, '', '2015-11-09 10:45:39'),
(13, 19, 1, 0, '', '2015-11-09 19:59:04'),
(14, 20, 1, 0, '', '2015-11-10 12:15:32'),
(15, 22, 1, 0, '', '2015-12-01 14:48:15'),
(16, 23, 1, 0, '', '2015-12-07 11:22:49'),
(17, 29, 1, 0, '', '2015-12-07 13:44:37'),
(18, 34, 1, 0, '', '2015-12-08 09:34:04'),
(19, 35, 1, 0, '', '2015-12-08 11:58:05'),
(20, 36, 1, 0, '', '2015-12-08 12:11:40'),
(21, 37, 1, 0, '', '2015-12-08 12:13:15'),
(22, 41, 1, 0, '', '2015-12-09 07:03:36'),
(23, 42, 1, 0, '', '2015-12-09 07:34:23'),
(24, 42, 1, 0, '', '2015-12-09 07:34:25'),
(25, 43, 1, 0, '', '2015-12-09 13:44:51'),
(26, 45, 1, 0, '', '2015-12-09 14:03:55'),
(27, 46, 1, 0, '', '2015-12-09 14:17:38'),
(28, 47, 1, 0, '', '2015-12-12 14:24:39'),
(29, 48, 1, 0, '', '2015-12-12 14:30:00'),
(30, 50, 1, 0, '', '2015-12-12 15:06:32'),
(31, 51, 1, 0, '', '2015-12-12 15:39:37'),
(32, 53, 1, 0, '', '2015-12-13 00:08:38'),
(33, 54, 1, 0, '', '2015-12-18 00:34:23'),
(34, 55, 1, 0, '', '2015-12-18 01:08:41'),
(35, 56, 1, 0, '', '2015-12-18 01:10:13'),
(36, 57, 1, 0, '', '2015-12-18 01:15:19'),
(37, 58, 1, 0, '', '2015-12-18 01:17:00'),
(38, 59, 1, 0, '', '2015-12-22 08:42:41'),
(39, 60, 1, 0, '', '2015-12-22 08:46:04'),
(40, 61, 1, 0, '', '2015-12-26 01:22:22'),
(41, 62, 1, 0, '', '2015-12-26 01:28:10'),
(42, 63, 1, 0, '', '2015-12-26 15:58:24'),
(43, 64, 1, 0, '', '2015-12-26 16:03:25'),
(44, 65, 1, 0, '', '2015-12-27 03:56:51'),
(45, 66, 1, 0, '', '2015-12-27 03:58:07'),
(46, 67, 1, 0, '', '2015-12-27 04:00:18'),
(47, 68, 1, 0, '', '2015-12-27 04:01:08'),
(48, 69, 1, 0, '', '2015-12-27 04:01:51'),
(49, 70, 1, 0, '', '2015-12-27 04:02:49'),
(50, 71, 1, 0, '', '2015-12-28 04:49:56'),
(51, 72, 1, 0, '', '2015-12-28 04:54:03'),
(52, 73, 1, 0, '', '2015-12-28 05:02:41'),
(53, 75, 1, 0, '', '2015-12-28 12:37:22'),
(54, 76, 1, 0, '', '2015-12-28 12:41:04'),
(55, 77, 1, 0, '', '2015-12-28 12:44:17'),
(56, 78, 1, 0, '', '2015-12-28 14:04:56'),
(57, 79, 1, 0, '', '2015-12-28 14:09:34'),
(58, 80, 1, 0, '', '2015-12-29 03:08:35'),
(59, 82, 1, 0, '', '2015-12-29 03:10:02'),
(60, 83, 1, 0, '', '2015-12-29 04:05:05'),
(61, 84, 1, 0, '', '2015-12-29 04:11:05'),
(62, 85, 1, 0, '', '2015-12-29 05:23:48'),
(63, 86, 1, 0, '', '2015-12-29 05:34:53'),
(64, 87, 1, 0, '', '2015-12-29 09:13:21'),
(65, 88, 1, 0, '', '2015-12-29 09:14:14'),
(66, 89, 1, 0, '', '2015-12-29 11:55:41'),
(67, 90, 1, 0, '', '2016-01-12 04:20:03'),
(68, 91, 1, 0, '', '2016-01-12 05:24:35');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_option`
--

CREATE TABLE IF NOT EXISTS `oc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `oc_order_option`
--

INSERT INTO `oc_order_option` (`order_option_id`, `order_id`, `order_product_id`, `product_option_id`, `product_option_value_id`, `name`, `value`, `type`) VALUES
(1, 3, 7, 225, 0, 'Delivery Date', '2011-04-22', 'date'),
(2, 4, 12, 225, 0, 'Delivery Date', '2011-04-22', 'date'),
(3, 5, 17, 225, 0, 'Delivery Date', '2011-04-22', 'date'),
(4, 7, 24, 225, 0, 'Delivery Date', '2011-04-22', 'date'),
(5, 8, 30, 225, 0, 'Delivery Date', '2011-04-22', 'date'),
(6, 9, 36, 225, 0, 'Delivery Date', '2011-04-22', 'date'),
(7, 55, 88, 233, 41, 'Size', 'Small', 'select'),
(8, 56, 89, 233, 41, 'Size', 'Small', 'select'),
(9, 57, 90, 233, 42, 'Size', 'Medium', 'select'),
(10, 58, 91, 233, 42, 'Size', 'Medium', 'select'),
(11, 59, 92, 231, 34, 'Size', 'Medium', 'select'),
(12, 61, 94, 233, 42, 'Size', 'Medium', 'select'),
(13, 65, 98, 233, 42, 'Size', 'Medium', 'select'),
(14, 66, 99, 233, 42, 'Size', 'Medium', 'select'),
(15, 67, 100, 233, 41, 'Size', 'Small', 'select'),
(16, 68, 101, 233, 42, 'Size', 'Medium', 'select'),
(17, 69, 102, 233, 42, 'Size', 'Medium', 'select'),
(18, 70, 103, 233, 42, 'Size', 'Medium', 'select'),
(19, 71, 104, 234, 46, 'Size', 'Medium', 'select'),
(20, 73, 106, 237, 58, 'Size', 'Medium', 'select'),
(21, 76, 110, 238, 62, 'Size', 'Medium', 'select'),
(22, 77, 111, 238, 62, 'Size', 'Medium', 'select'),
(23, 79, 113, 240, 70, 'Size', 'Medium', 'select'),
(24, 81, 115, 241, 74, 'Size', 'Medium', 'select'),
(25, 82, 116, 241, 74, 'Size', 'Medium', 'select'),
(26, 83, 117, 240, 70, 'Size', 'Medium', 'select'),
(27, 84, 118, 240, 69, 'Size', 'Small', 'select'),
(28, 85, 119, 240, 69, 'Size', 'Small', 'select'),
(29, 86, 120, 240, 69, 'Size', 'Small', 'select'),
(30, 88, 122, 242, 78, 'Size', 'Medium', 'select'),
(31, 89, 123, 240, 70, 'Size', 'Medium', 'select');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_product`
--

CREATE TABLE IF NOT EXISTS `oc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=126 ;

--
-- Dumping data for table `oc_order_product`
--

INSERT INTO `oc_order_product` (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`, `tax`, `reward`) VALUES
(1, 1, 41, 'Cum sociis natoque bag', 'Product 14', 1, '100.0000', '100.0000', '22.0000', 0),
(2, 1, 40, 'Donec semper sem nec bag', 'product 11', 1, '101.0000', '101.0000', '22.2000', 0),
(3, 2, 33, 'Varius neque at enim bag', 'Product 6', 1, '200.0000', '200.0000', '42.0000', 0),
(4, 2, 41, 'Cum sociis natoque bag', 'Product 14', 1, '100.0000', '100.0000', '22.0000', 0),
(5, 3, 41, 'Cum sociis natoque bag', 'Product 14', 4, '100.0000', '400.0000', '22.0000', 0),
(6, 3, 40, 'Donec semper sem nec bag', 'product 11', 1, '101.0000', '101.0000', '22.2000', 0),
(7, 3, 47, 'Arcu vitae imperdiet bag', 'Product 21', 1, '100.0000', '100.0000', '22.0000', 300),
(8, 3, 46, 'Suspendisse potenti bag', 'Product 19', 1, '1000.0000', '1000.0000', '202.0000', 0),
(9, 4, 41, 'Cum sociis natoque bag', 'Product 14', 7, '100.0000', '700.0000', '22.0000', 0),
(10, 4, 40, 'Donec semper sem nec bag', 'product 11', 3, '101.0000', '303.0000', '22.2000', 0),
(11, 4, 43, 'Nascetur ridiculus mus bag', 'Product 16', 1, '500.0000', '500.0000', '102.0000', 600),
(12, 4, 47, 'Arcu vitae imperdiet bag', 'Product 21', 1, '100.0000', '100.0000', '22.0000', 300),
(13, 4, 46, 'Suspendisse potenti bag', 'Product 19', 1, '1000.0000', '1000.0000', '202.0000', 0),
(14, 5, 41, 'Cum sociis natoque bag', 'Product 14', 7, '100.0000', '700.0000', '22.0000', 0),
(15, 5, 40, 'Donec semper sem nec bag', 'product 11', 3, '101.0000', '303.0000', '22.2000', 0),
(16, 5, 43, 'Nascetur ridiculus mus bag', 'Product 16', 1, '500.0000', '500.0000', '102.0000', 600),
(17, 5, 47, 'Arcu vitae imperdiet bag', 'Product 21', 1, '100.0000', '100.0000', '22.0000', 300),
(18, 5, 46, 'Suspendisse potenti bag', 'Product 19', 1, '1000.0000', '1000.0000', '202.0000', 0),
(19, 6, 41, 'Cum sociis natoque bag', 'Product 14', 1, '100.0000', '100.0000', '22.0000', 0),
(20, 7, 28, 'Consectetur adipiscing bag', 'Product 1', 2, '100.0000', '200.0000', '22.0000', 800),
(21, 7, 41, 'Cum sociis natoque bag', 'Product 14', 7, '100.0000', '700.0000', '22.0000', 0),
(22, 7, 40, 'Donec semper sem nec bag', 'product 11', 3, '101.0000', '303.0000', '22.2000', 0),
(23, 7, 43, 'Nascetur ridiculus mus bag', 'Product 16', 1, '500.0000', '500.0000', '102.0000', 600),
(24, 7, 47, 'Arcu vitae imperdiet bag', 'Product 21', 1, '100.0000', '100.0000', '22.0000', 300),
(25, 7, 46, 'Suspendisse potenti bag', 'Product 19', 1, '1000.0000', '1000.0000', '202.0000', 0),
(26, 8, 28, 'Consectetur adipiscing bag', 'Product 1', 2, '100.0000', '200.0000', '22.0000', 800),
(27, 8, 41, 'Cum sociis natoque bag', 'Product 14', 7, '100.0000', '700.0000', '22.0000', 0),
(28, 8, 40, 'Donec semper sem nec bag', 'product 11', 3, '101.0000', '303.0000', '22.2000', 0),
(29, 8, 43, 'Nascetur ridiculus mus bag', 'Product 16', 1, '500.0000', '500.0000', '102.0000', 600),
(30, 8, 47, 'Arcu vitae imperdiet bag', 'Product 21', 1, '100.0000', '100.0000', '22.0000', 300),
(31, 8, 46, 'Suspendisse potenti bag', 'Product 19', 1, '1000.0000', '1000.0000', '202.0000', 0),
(32, 9, 28, 'Consectetur adipiscing bag', 'Product 1', 3, '100.0000', '300.0000', '22.0000', 1200),
(33, 9, 41, 'Cum sociis natoque bag', 'Product 14', 7, '100.0000', '700.0000', '22.0000', 0),
(34, 9, 40, 'Donec semper sem nec bag', 'product 11', 3, '101.0000', '303.0000', '22.2000', 0),
(35, 9, 43, 'Nascetur ridiculus mus bag', 'Product 16', 1, '500.0000', '500.0000', '102.0000', 600),
(36, 9, 47, 'Arcu vitae imperdiet bag', 'Product 21', 1, '100.0000', '100.0000', '22.0000', 300),
(37, 9, 46, 'Suspendisse potenti bag', 'Product 19', 1, '1000.0000', '1000.0000', '202.0000', 0),
(38, 10, 50, 'Sample', 'demo', 1, '11.0000', '11.0000', '0.0000', 0),
(39, 11, 50, 'Sample', 'demo', 1, '11.0000', '11.0000', '0.0000', 0),
(40, 12, 52, 'Men Tshirt1', '01', 1, '20.0000', '20.0000', '0.0000', 0),
(41, 13, 52, 'Men Tshirt1', '01', 1, '20.0000', '20.0000', '0.0000', 0),
(42, 14, 52, 'Men Tshirt1', '01', 1, '22.0000', '22.0000', '0.0000', 0),
(43, 15, 53, 'Men Tshirt2', 'Men Tshirt2', 1, '2.0000', '2.0000', '0.0000', 0),
(44, 16, 53, 'Men Tshirt2', 'Men Tshirt2', 1, '1.0000', '1.0000', '0.0000', 0),
(45, 17, 52, 'Men Tshirt1', '01', 1, '23.0000', '23.0000', '0.0000', 0),
(46, 17, 52, 'Men Tshirt1', '01', 1, '20.0000', '20.0000', '0.0000', 0),
(47, 17, 52, 'Men Tshirt1', '01', 1, '20.0000', '20.0000', '0.0000', 0),
(48, 18, 52, 'Men Tshirt1', '01', 1, '25.0000', '25.0000', '0.0000', 0),
(49, 19, 52, 'Men Tshirt1', '01', 1, '20.0000', '20.0000', '0.0000', 0),
(50, 20, 52, 'Men Tshirt1', '01', 1, '24.0000', '24.0000', '0.0000', 0),
(51, 21, 60, 'Kids shirt', 'kids', 2, '20.0000', '40.0000', '0.0000', 0),
(52, 21, 60, 'Kids shirt', 'kids', 1, '20.0000', '20.0000', '0.0000', 0),
(53, 22, 52, 'Men Tshirt1', '01', 1, '20.0000', '20.0000', '0.0000', 0),
(54, 23, 52, 'Men Tshirt1', '01', 1, '18.0000', '18.0000', '0.0000', 0),
(55, 24, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(56, 25, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(57, 26, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(58, 27, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(59, 28, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(60, 29, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(61, 30, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(62, 31, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(63, 32, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(64, 33, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(65, 34, 52, 'Men Tshirt1', '01', 1, '19.0000', '19.0000', '0.0000', 0),
(66, 35, 52, 'Men Tshirt1', '01', 1, '19.0000', '19.0000', '0.0000', 0),
(67, 36, 52, 'Men Tshirt1', '01', 1, '19.0000', '19.0000', '0.0000', 0),
(68, 37, 52, 'Men Tshirt1', '01', 1, '19.0000', '19.0000', '0.0000', 0),
(69, 38, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(70, 39, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(71, 40, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(72, 41, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(73, 41, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(74, 42, 52, 'Men Tshirt1', '01', 1, '19.0000', '19.0000', '0.0000', 0),
(75, 43, 52, 'Men Tshirt1', '01', 1, '18.0000', '18.0000', '0.0000', 0),
(76, 44, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(77, 45, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(78, 46, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(79, 47, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(80, 47, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(81, 48, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(82, 49, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(83, 50, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(84, 51, 52, 'Men Tshirt1', '01', 1, '19.0000', '19.0000', '0.0000', 0),
(85, 52, 52, 'Men Tshirt1', '01', 1, '18.0000', '18.0000', '0.0000', 0),
(86, 53, 52, 'Men Tshirt1', '01', 1, '18.0000', '18.0000', '0.0000', 0),
(87, 54, 52, 'Men Tshirt1', '01', 1, '18.0000', '18.0000', '0.0000', 0),
(88, 55, 71, 'Men Tshirt1__71', '01_71', 1, '15.0000', '15.0000', '0.0000', 0),
(89, 56, 71, 'Men Tshirt1__71', '01_71', 1, '15.0000', '15.0000', '0.0000', 0),
(90, 57, 71, 'Men Tshirt1__71', '01_71', 1, '15.0000', '15.0000', '0.0000', 0),
(91, 58, 71, 'Men Tshirt1__71', '01_71', 1, '15.0000', '15.0000', '0.0000', 0),
(92, 59, 69, 'Men Tshirt1__69', '01_69', 1, '15.0000', '15.0000', '0.0000', 0),
(93, 60, 52, 'Men Tshirt1', '01', 1, '18.0000', '18.0000', '0.0000', 0),
(94, 61, 71, 'Men Tshirt1__71', '01_71', 1, '15.0000', '15.0000', '0.0000', 0),
(95, 62, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(96, 63, 52, 'Men Tshirt1', '01', 1, '18.0000', '18.0000', '0.0000', 0),
(97, 64, 52, 'Men Tshirt1', '01', 1, '19.0000', '19.0000', '0.0000', 0),
(98, 65, 71, 'Men Tshirt1__71', '01_71', 1, '15.0000', '15.0000', '0.0000', 0),
(99, 66, 71, 'Men Tshirt1__71', '01_71', 5, '15.0000', '75.0000', '0.0000', 0),
(100, 67, 71, 'Men Tshirt1__71', '01_71', 12, '15.0000', '180.0000', '0.0000', 0),
(101, 68, 71, 'Men Tshirt1__71', '01_71', 1, '15.0000', '15.0000', '0.0000', 0),
(102, 69, 71, 'Men Tshirt1__71', '01_71', 1, '15.0000', '15.0000', '0.0000', 0),
(103, 70, 71, 'Men Tshirt1__71', '01_71', 1, '15.0000', '15.0000', '0.0000', 0),
(104, 71, 72, 'Men Tshirt1__72', '01_72', 11, '15.0000', '165.0000', '0.0000', 0),
(105, 72, 52, 'Men Tshirt1', '01', 1, '18.0000', '18.0000', '0.0000', 0),
(106, 73, 75, 'Men Tshirt1__75', '01_75', 22, '15.0000', '330.0000', '0.0000', 0),
(107, 74, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(108, 75, 52, 'Men Tshirt1', '01', 1, '15.0000', '15.0000', '0.0000', 0),
(109, 76, 52, 'Men Tshirt1', '01', 1, '19.0000', '19.0000', '0.0000', 0),
(110, 76, 76, 'Men Tshirt1__76', '01_76', 1, '15.0000', '15.0000', '0.0000', 0),
(111, 77, 76, 'Men Tshirt1__76', '01_76', 14, '15.0000', '210.0000', '0.0000', 0),
(112, 78, 52, 'Men Tshirt1', '01', 1, '19.0000', '19.0000', '0.0000', 0),
(113, 79, 78, 'Men Tshirt1__78', '01_78', 1, '15.0000', '15.0000', '0.0000', 0),
(114, 80, 52, 'Men Tshirt1', '01', 1, '19.0000', '19.0000', '0.0000', 0),
(115, 81, 79, 'Men Tshirt1__79', '01_79', 23, '15.0000', '345.0000', '0.0000', 0),
(116, 82, 79, 'Men Tshirt1__79', '01_79', 23, '15.0000', '345.0000', '0.0000', 0),
(117, 83, 78, 'Men Tshirt1__78', '01_78', 1, '15.0000', '15.0000', '0.0000', 0),
(118, 84, 78, 'Men Tshirt1__78', '01_78', 20, '15.0000', '300.0000', '0.0000', 0),
(119, 85, 78, 'Men Tshirt1__78', '01_78', 1, '15.0000', '15.0000', '0.0000', 0),
(120, 86, 78, 'Men Tshirt1__78', '01_78', 1, '15.0000', '15.0000', '0.0000', 0),
(121, 87, 52, 'Men Tshirt1', '01', 30, '18.0000', '540.0000', '0.0000', 0),
(122, 88, 80, 'Men Tshirt1__80', '01_80', 15, '15.0000', '225.0000', '0.0000', 0),
(123, 89, 78, 'Men Tshirt1__78', '01_78', 1, '15.0000', '15.0000', '0.0000', 0),
(124, 90, 52, 'Men Tshirt1', '01', 1, '19.0000', '19.0000', '0.0000', 0),
(125, 91, 52, 'Men Tshirt1', '01', 1, '19.0000', '19.0000', '0.0000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_status`
--

CREATE TABLE IF NOT EXISTS `oc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(2, 1, 'Processing'),
(3, 1, 'Shipped'),
(5, 1, 'Complete'),
(7, 1, 'Canceled'),
(8, 1, 'Denied'),
(9, 1, 'Canceled Reversal'),
(10, 1, 'Failed'),
(11, 1, 'Refunded'),
(12, 1, 'Reversed'),
(13, 1, 'Chargeback'),
(14, 1, 'Expired'),
(15, 1, 'Processed'),
(16, 1, 'Voided');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_total`
--

CREATE TABLE IF NOT EXISTS `oc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=295 ;

--
-- Dumping data for table `oc_order_total`
--

INSERT INTO `oc_order_total` (`order_total_id`, `order_id`, `code`, `title`, `value`, `sort_order`) VALUES
(1, 1, 'sub_total', 'Sub-Total', '201.0000', 1),
(2, 1, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(3, 1, 'tax', 'Eco Tax (-2.00)', '6.0000', 5),
(4, 1, 'tax', 'VAT (20%)', '41.2000', 5),
(5, 1, 'total', 'Total', '253.2000', 9),
(6, 2, 'sub_total', 'Sub-Total', '300.0000', 1),
(7, 2, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(8, 2, 'tax', 'Eco Tax (-2.00)', '6.0000', 5),
(9, 2, 'tax', 'VAT (20%)', '61.0000', 5),
(10, 2, 'total', 'Total', '372.0000', 9),
(11, 3, 'sub_total', 'Sub-Total', '1601.0000', 1),
(12, 3, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(13, 3, 'tax', 'Eco Tax (-2.00)', '16.0000', 5),
(14, 3, 'tax', 'VAT (20%)', '321.2000', 5),
(15, 3, 'total', 'Total', '1943.2000', 9),
(16, 4, 'sub_total', 'Sub-Total', '2603.0000', 1),
(17, 4, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(18, 4, 'tax', 'Eco Tax (-2.00)', '28.0000', 5),
(19, 4, 'tax', 'VAT (20%)', '521.6000', 5),
(20, 4, 'total', 'Total', '3157.6000', 9),
(21, 5, 'sub_total', 'Sub-Total', '2603.0000', 1),
(22, 5, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(23, 5, 'tax', 'Eco Tax (-2.00)', '28.0000', 5),
(24, 5, 'tax', 'VAT (20%)', '521.6000', 5),
(25, 5, 'total', 'Total', '3157.6000', 9),
(26, 6, 'sub_total', 'Sub-Total', '100.0000', 1),
(27, 6, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(28, 6, 'tax', 'Eco Tax (-2.00)', '4.0000', 5),
(29, 6, 'tax', 'VAT (20%)', '21.0000', 5),
(30, 6, 'total', 'Total', '130.0000', 9),
(31, 7, 'sub_total', 'Sub-Total', '2803.0000', 1),
(32, 7, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(33, 7, 'tax', 'Eco Tax (-2.00)', '32.0000', 5),
(34, 7, 'tax', 'VAT (20%)', '561.6000', 5),
(35, 7, 'total', 'Total', '3401.6000', 9),
(36, 8, 'sub_total', 'Sub-Total', '2803.0000', 1),
(37, 8, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(38, 8, 'tax', 'Eco Tax (-2.00)', '32.0000', 5),
(39, 8, 'tax', 'VAT (20%)', '561.6000', 5),
(40, 8, 'total', 'Total', '3401.6000', 9),
(41, 9, 'sub_total', 'Sub-Total', '2903.0000', 1),
(42, 9, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(43, 9, 'tax', 'Eco Tax (-2.00)', '34.0000', 5),
(44, 9, 'tax', 'VAT (20%)', '581.6000', 5),
(45, 9, 'total', 'Total', '3523.6000', 9),
(46, 10, 'sub_total', 'Sub-Total', '11.0000', 1),
(47, 10, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(48, 10, 'tax', 'Eco Tax (-2.00)', '2.0000', 5),
(49, 10, 'tax', 'VAT (20%)', '1.0000', 5),
(50, 10, 'total', 'Total', '19.0000', 9),
(51, 11, 'sub_total', 'Sub-Total', '11.0000', 1),
(52, 11, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(53, 11, 'total', 'Total', '16.0000', 9),
(54, 12, 'sub_total', 'Sub-Total', '20.0000', 1),
(55, 12, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(56, 12, 'total', 'Total', '25.0000', 9),
(57, 13, 'sub_total', 'Sub-Total', '20.0000', 1),
(58, 13, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(59, 13, 'total', 'Total', '25.0000', 9),
(60, 14, 'sub_total', 'Sub-Total', '22.0000', 1),
(61, 14, 'shipping', 'Free Shipping', '0.0000', 3),
(62, 14, 'total', 'Total', '22.0000', 9),
(63, 15, 'sub_total', 'Sub-Total', '2.0000', 1),
(64, 15, 'shipping', 'Free Shipping', '0.0000', 3),
(65, 15, 'total', 'Total', '2.0000', 9),
(66, 16, 'sub_total', 'Sub-Total', '1.0000', 1),
(67, 16, 'shipping', 'Free Shipping', '0.0000', 3),
(68, 16, 'total', 'Total', '1.0000', 9),
(69, 17, 'sub_total', 'Sub-Total', '63.0000', 1),
(70, 17, 'shipping', 'Free Shipping', '0.0000', 3),
(71, 17, 'total', 'Total', '63.0000', 9),
(72, 18, 'sub_total', 'Sub-Total', '25.0000', 1),
(73, 18, 'shipping', 'Free Shipping', '0.0000', 3),
(74, 18, 'total', 'Total', '25.0000', 9),
(75, 19, 'sub_total', 'Sub-Total', '20.0000', 1),
(76, 19, 'shipping', 'Free Shipping', '0.0000', 3),
(77, 19, 'total', 'Total', '20.0000', 9),
(78, 20, 'sub_total', 'Sub-Total', '24.0000', 1),
(79, 20, 'shipping', 'Free Shipping', '0.0000', 3),
(80, 20, 'total', 'Total', '24.0000', 9),
(81, 21, 'sub_total', 'Sub-Total', '60.0000', 1),
(82, 21, 'shipping', 'Shipping Rate', '5.0000', 3),
(83, 21, 'total', 'Total', '65.0000', 9),
(84, 22, 'sub_total', 'Sub-Total', '20.0000', 1),
(85, 22, 'shipping', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', '10.0000', 3),
(86, 22, 'total', 'Total', '30.0000', 9),
(87, 23, 'sub_total', 'Sub-Total', '18.0000', 1),
(88, 23, 'shipping', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', '10.0000', 3),
(89, 23, 'total', 'Total', '28.0000', 9),
(90, 24, 'sub_total', 'Sub-Total', '15.0000', 1),
(91, 24, 'shipping', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', '10.0000', 3),
(92, 24, 'total', 'Total', '25.0000', 9),
(93, 25, 'sub_total', 'Sub-Total', '15.0000', 1),
(94, 25, 'shipping', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', '10.0000', 3),
(95, 25, 'total', 'Total', '25.0000', 9),
(96, 26, 'sub_total', 'Sub-Total', '15.0000', 1),
(97, 26, 'shipping', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', '10.0000', 3),
(98, 26, 'total', 'Total', '25.0000', 9),
(99, 27, 'sub_total', 'Sub-Total', '15.0000', 1),
(100, 27, 'shipping', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', '10.0000', 3),
(101, 27, 'total', 'Total', '25.0000', 9),
(102, 28, 'sub_total', 'Sub-Total', '15.0000', 1),
(103, 28, 'shipping', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', '10.0000', 3),
(104, 28, 'total', 'Total', '25.0000', 9),
(105, 29, 'sub_total', 'Sub-Total', '15.0000', 1),
(106, 29, 'shipping', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', '10.0000', 3),
(107, 29, 'total', 'Total', '25.0000', 9),
(108, 30, 'sub_total', 'Sub-Total', '15.0000', 1),
(109, 30, 'shipping', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', '10.0000', 3),
(110, 30, 'total', 'Total', '25.0000', 9),
(111, 31, 'sub_total', 'Sub-Total', '15.0000', 1),
(112, 31, 'shipping', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', '10.0000', 3),
(113, 31, 'total', 'Total', '25.0000', 9),
(114, 32, 'sub_total', 'Sub-Total', '15.0000', 1),
(115, 32, 'shipping', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', '10.0000', 3),
(116, 32, 'total', 'Total', '25.0000', 9),
(117, 33, 'sub_total', 'Sub-Total', '15.0000', 1),
(118, 33, 'shipping', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', '10.0000', 3),
(119, 33, 'total', 'Total', '25.0000', 9),
(120, 34, 'sub_total', 'Sub-Total', '19.0000', 1),
(121, 34, 'shipping', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', '10.0000', 3),
(122, 34, 'total', 'Total', '29.0000', 9),
(123, 35, 'sub_total', 'Sub-Total', '19.0000', 1),
(124, 35, 'shipping', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', '10.0000', 3),
(125, 35, 'total', 'Total', '29.0000', 9),
(126, 36, 'sub_total', 'Sub-Total', '19.0000', 1),
(127, 36, 'shipping', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', '10.0000', 3),
(128, 36, 'total', 'Total', '29.0000', 9),
(129, 37, 'sub_total', 'Sub-Total', '19.0000', 1),
(130, 37, 'shipping', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', '10.0000', 3),
(131, 37, 'total', 'Total', '29.0000', 9),
(132, 38, 'sub_total', 'Sub-Total', '15.0000', 1),
(133, 38, 'shipping', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', '10.0000', 3),
(134, 38, 'total', 'Total', '25.0000', 9),
(135, 39, 'sub_total', 'Sub-Total', '15.0000', 1),
(136, 39, 'shipping', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', '10.0000', 3),
(137, 39, 'total', 'Total', '25.0000', 9),
(138, 40, 'sub_total', 'Sub-Total', '15.0000', 1),
(139, 40, 'shipping', 'Egypt Shipping Rate  (Weight: 1,000.00kg)', '10.0000', 3),
(140, 40, 'total', 'Total', '25.0000', 9),
(141, 41, 'sub_total', 'Sub-Total', '30.0000', 1),
(142, 41, 'shipping', 'Egypt Shipping Rate  (Weight: 1.00kg)', '5.0000', 3),
(143, 41, 'total', 'Total', '35.0000', 9),
(144, 42, 'sub_total', 'Sub-Total', '19.0000', 1),
(145, 42, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(146, 42, 'total', 'Total', '24.0000', 9),
(147, 43, 'sub_total', 'Sub-Total', '18.0000', 1),
(148, 43, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(149, 43, 'total', 'Total', '23.0000', 9),
(150, 44, 'sub_total', 'Sub-Total', '15.0000', 1),
(151, 44, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(152, 44, 'total', 'Total', '20.0000', 9),
(153, 45, 'sub_total', 'Sub-Total', '15.0000', 1),
(154, 45, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(155, 45, 'total', 'Total', '20.0000', 9),
(156, 46, 'sub_total', 'Sub-Total', '15.0000', 1),
(157, 46, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(158, 46, 'total', 'Total', '20.0000', 9),
(159, 47, 'sub_total', 'Sub-Total', '30.0000', 1),
(160, 47, 'shipping', 'Egypt Shipping Rate  (Weight: 1.00kg)', '5.0000', 3),
(161, 47, 'total', 'Total', '35.0000', 9),
(162, 48, 'sub_total', 'Sub-Total', '15.0000', 1),
(163, 48, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(164, 48, 'total', 'Total', '20.0000', 9),
(165, 49, 'sub_total', 'Sub-Total', '15.0000', 1),
(166, 49, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(167, 49, 'total', 'Total', '20.0000', 9),
(168, 50, 'sub_total', 'Sub-Total', '15.0000', 1),
(169, 50, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(170, 50, 'total', 'Total', '20.0000', 9),
(171, 51, 'sub_total', 'Sub-Total', '19.0000', 1),
(172, 51, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(173, 51, 'total', 'Total', '24.0000', 9),
(174, 52, 'sub_total', 'Sub-Total', '18.0000', 1),
(175, 52, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(176, 52, 'total', 'Total', '23.0000', 9),
(177, 53, 'sub_total', 'Sub-Total', '18.0000', 1),
(178, 53, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(179, 53, 'total', 'Total', '23.0000', 9),
(180, 54, 'sub_total', 'Sub-Total', '18.0000', 1),
(181, 54, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(182, 54, 'total', 'Total', '23.0000', 9),
(183, 55, 'sub_total', 'Sub-Total', '15.0000', 1),
(184, 55, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(185, 55, 'total', 'Total', '20.0000', 9),
(186, 56, 'sub_total', 'Sub-Total', '15.0000', 1),
(187, 56, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(188, 56, 'total', 'Total', '20.0000', 9),
(189, 57, 'sub_total', 'Sub-Total', '15.0000', 1),
(190, 57, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(191, 57, 'total', 'Total', '20.0000', 9),
(192, 58, 'sub_total', 'Sub-Total', '15.0000', 1),
(193, 58, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(194, 58, 'total', 'Total', '20.0000', 9),
(195, 59, 'sub_total', 'Sub-Total', '15.0000', 1),
(196, 59, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(197, 59, 'total', 'Total', '20.0000', 9),
(198, 60, 'sub_total', 'Sub-Total', '18.0000', 1),
(199, 60, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(200, 60, 'total', 'Total', '23.0000', 9),
(201, 61, 'sub_total', 'Sub-Total', '15.0000', 1),
(202, 61, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(203, 61, 'total', 'Total', '20.0000', 9),
(204, 62, 'sub_total', 'Sub-Total', '15.0000', 1),
(205, 62, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(206, 62, 'total', 'Total', '20.0000', 9),
(207, 63, 'sub_total', 'Sub-Total', '18.0000', 1),
(208, 63, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(209, 63, 'total', 'Total', '23.0000', 9),
(210, 64, 'sub_total', 'Sub-Total', '19.0000', 1),
(211, 64, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(212, 64, 'total', 'Total', '24.0000', 9),
(213, 65, 'sub_total', 'Sub-Total', '15.0000', 1),
(214, 65, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(215, 65, 'total', 'Total', '20.0000', 9),
(216, 66, 'sub_total', 'Sub-Total', '75.0000', 1),
(217, 66, 'shipping', 'Egypt Shipping Rate  (Weight: 2.50kg)', '5.0000', 3),
(218, 66, 'total', 'Total', '80.0000', 9),
(219, 67, 'sub_total', 'Sub-Total', '180.0000', 1),
(220, 67, 'shipping', 'Egypt Shipping Rate  (Weight: 6.00kg)', '5.0000', 3),
(221, 67, 'total', 'Total', '185.0000', 9),
(222, 68, 'sub_total', 'Sub-Total', '15.0000', 1),
(223, 68, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(224, 68, 'total', 'Total', '20.0000', 9),
(225, 69, 'sub_total', 'Sub-Total', '15.0000', 1),
(226, 69, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(227, 69, 'total', 'Total', '20.0000', 9),
(228, 70, 'sub_total', 'Sub-Total', '15.0000', 1),
(229, 70, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(230, 70, 'total', 'Total', '20.0000', 9),
(231, 71, 'sub_total', 'Sub-Total', '165.0000', 1),
(232, 71, 'shipping', 'Egypt Shipping Rate  (Weight: 5.50kg)', '5.0000', 3),
(233, 71, 'total', 'Total', '170.0000', 9),
(234, 72, 'sub_total', 'Sub-Total', '18.0000', 1),
(235, 72, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(236, 72, 'total', 'Total', '23.0000', 9),
(237, 73, 'sub_total', 'Sub-Total', '330.0000', 1),
(238, 73, 'shipping', 'Egypt Shipping Rate  (Weight: 11.00kg)', '5.0000', 3),
(239, 73, 'total', 'Total', '335.0000', 9),
(240, 74, 'sub_total', 'Sub-Total', '15.0000', 1),
(241, 74, 'shipping', 'Giza  (Weight: 0.50kg)', '25.0000', 3),
(242, 74, 'total', 'Total', '40.0000', 9),
(243, 75, 'sub_total', 'Sub-Total', '15.0000', 1),
(244, 75, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(245, 75, 'total', 'Total', '20.0000', 9),
(246, 76, 'sub_total', 'Sub-Total', '34.0000', 1),
(247, 76, 'shipping', 'Egypt Shipping Rate  (Weight: 1.00kg)', '5.0000', 3),
(248, 76, 'total', 'Total', '39.0000', 9),
(249, 77, 'sub_total', 'Sub-Total', '210.0000', 1),
(250, 77, 'shipping', 'Egypt Shipping Rate  (Weight: 7.00kg)', '5.0000', 3),
(251, 77, 'total', 'Total', '215.0000', 9),
(252, 78, 'sub_total', 'Sub-Total', '19.0000', 1),
(253, 78, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(254, 78, 'total', 'Total', '24.0000', 9),
(255, 79, 'sub_total', 'Sub-Total', '15.0000', 1),
(256, 79, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(257, 79, 'total', 'Total', '20.0000', 9),
(258, 80, 'sub_total', 'Sub-Total', '19.0000', 1),
(259, 80, 'shipping', 'Giza  (Weight: 0.50kg)', '25.0000', 3),
(260, 80, 'total', 'Total', '44.0000', 9),
(261, 81, 'sub_total', 'Sub-Total', '345.0000', 1),
(262, 81, 'shipping', 'Giza  (Weight: 11.50kg)', '25.0000', 3),
(263, 81, 'total', 'Total', '370.0000', 9),
(264, 82, 'sub_total', 'Sub-Total', '345.0000', 1),
(265, 82, 'shipping', 'Giza  (Weight: 11.50kg)', '25.0000', 3),
(266, 82, 'total', 'Total', '370.0000', 9),
(267, 83, 'sub_total', 'Sub-Total', '15.0000', 1),
(268, 83, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(269, 83, 'total', 'Total', '20.0000', 9),
(270, 84, 'sub_total', 'Sub-Total', '300.0000', 1),
(271, 84, 'shipping', 'Egypt Shipping Rate  (Weight: 10.00kg)', '5.0000', 3),
(272, 84, 'total', 'Total', '305.0000', 9),
(273, 85, 'sub_total', 'Sub-Total', '15.0000', 1),
(274, 85, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(275, 85, 'total', 'Total', '20.0000', 9),
(276, 86, 'sub_total', 'Sub-Total', '15.0000', 1),
(277, 86, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(278, 86, 'total', 'Total', '20.0000', 9),
(279, 87, 'sub_total', 'Sub-Total', '540.0000', 1),
(280, 87, 'shipping', 'Giza  (Weight: 15.00kg)', '25.0000', 3),
(281, 87, 'total', 'Total', '565.0000', 9),
(282, 88, 'sub_total', 'Sub-Total', '225.0000', 1),
(283, 88, 'shipping', 'Giza  (Weight: 7.50kg)', '25.0000', 3),
(284, 88, 'total', 'Total', '250.0000', 9),
(285, 89, 'sub_total', 'Sub-Total', '15.0000', 1),
(286, 89, 'shipping', 'Egypt Shipping Rate  (Weight: 0.50kg)', '5.0000', 3),
(287, 89, 'total', 'Total', '20.0000', 9),
(288, 90, 'sub_total', 'Sub-Total', '19.0000', 1),
(289, 90, 'shipping', 'Egypt Shipping Rate  (Weight: 500.00g)', '5.0000', 3),
(290, 90, 'total', 'Total', '24.0000', 9),
(291, 91, 'sub_total', 'Sub-Total', '19.0000', 1),
(292, 91, 'shipping', 'Egypt Shipping Rate  (Weight: 500.00g)', '5.0000', 3),
(293, 91, 'coupon', 'Coupon (2222)', '-10.0000', 4),
(294, 91, 'total', 'Total', '14.0000', 9);

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_voucher`
--

CREATE TABLE IF NOT EXISTS `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product`
--

CREATE TABLE IF NOT EXISTS `oc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL,
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL,
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL,
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `viewed` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `design_product_id` varchar(255) NOT NULL DEFAULT '',
  `design_product_title_img` varchar(255) NOT NULL DEFAULT '',
  `is_hall_of_fame` enum('y','n') NOT NULL DEFAULT 'n',
  `customer_id_hall_of_fame` bigint(20) NOT NULL,
  `order_product_id_hall_of_fame` bigint(20) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=83 ;

--
-- Dumping data for table `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`, `design_product_id`, `design_product_title_img`, `is_hall_of_fame`, `customer_id_hall_of_fame`, `order_product_id_hall_of_fame`) VALUES
(60, 'kids', '', '', '', '', '', '', '5', 100, 6, 'catalog/kids11.jpg', 0, 1, '20.0000', 0, 0, '2015-11-08', '500.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1000, 1, 2, '2015-11-08 05:08:32', '2015-11-25 07:10:46', '7', 'Kids shirt::http://custom.maxstarweb.com/tshirtecommerce//uploaded/dg-designer-70efba66144698104429202971310692838.jpg', 'n', 0, 0),
(61, '03', '', '', '', '', '', '', '', 1, 6, 'catalog/f47f5ffbc878e1d9ee3aaeb3d6508113.jpg', 0, 1, '0.0000', 0, 0, '2015-11-08', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 1, '2015-11-08 05:24:18', '0000-00-00 00:00:00', '8', 'Pins::http://custom.maxstarweb.com/tshirtecommerce//uploaded/dg-designer-7a6a6127144698160647075253210168759.jpg', 'n', 0, 0),
(52, '01', '', '', '', '', '', '', '', 99, 6, 'catalog/242_1_red_model_lg.jpg', 0, 1, '15.0000', 0, 0, '2015-10-10', '500.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 113, '2015-10-10 07:21:12', '2015-12-09 07:02:40', '3', 'Custom Product::http://custom.maxstarweb.com/tshirtecommerce//uploaded/design/dg-designer-25daeb9b144448685917368461010164946.png', 'n', 0, 0),
(53, 'Men Tshirt2', '', '', '', '', '', '', '', 100, 6, 'catalog/li_352FtR_indiebazaar_mens-tshirts-and-hoodies_ShriAlbertTshirt_EDiOTS.jpg', 0, 1, '0.0000', 0, 0, '2015-10-10', '200.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 9, '2015-10-10 07:26:41', '2015-11-25 07:11:43', '3', 'Custom Product::http://custom.maxstarweb.com/tshirtecommerce//uploaded/design/dg-designer-25daeb9b144448685917368461010164946.png', 'n', 0, 0),
(54, 'Men Tshirt3', '', '', '', '', '', '', '', 1000, 6, 'catalog/li_362JZx_indiebazaar_mens-tshirts-and-hoodies_CheShotTshirt_EDiOTS.jpg', 0, 1, '0.0000', 0, 0, '2015-10-10', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 5, '2015-10-10 07:28:52', '2015-10-13 11:08:58', '3', 'Custom Product::http://custom.maxstarweb.com/tshirtecommerce//uploaded/design/dg-designer-25daeb9b144448685917368461010164946.png', 'n', 0, 0),
(55, 'Men Tshirt4', '', '', '', '', '', '', '', 100, 6, 'catalog/tangodeal.com-Sisley-Men-Gents-Short-Sleeve-Blue-T-shirt-SIZE--S-TD-3010-31._sisley-men-gents-short-sleeve-blue-t-shirt-size-s.jpg', 0, 1, '34.0000', 0, 0, '2015-10-10', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 4, '2015-10-10 07:35:38', '2015-10-13 11:09:41', '3', 'Custom Product::http://custom.maxstarweb.com/tshirtecommerce//uploaded/design/dg-designer-25daeb9b144448685917368461010164946.png', 'n', 0, 0),
(56, 'Men Tshirt5', '', '', '', '', '', '', '', 100, 6, 'catalog/cali-bear-mens-t-shirt-gray-1_grande.jpeg', 0, 1, '56.0000', 0, 0, '2015-10-10', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 4, '2015-10-10 07:37:28', '2015-10-13 11:09:49', '3', 'Custom Product::http://custom.maxstarweb.com/tshirtecommerce//uploaded/design/dg-designer-25daeb9b144448685917368461010164946.png', 'n', 0, 0),
(59, 'Sticker', '', '', '', '', '', '', '', 1, 6, 'catalog/mug-template.jpg', 0, 1, '0.0000', 0, 0, '2015-11-07', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1000, 1, 1, '2015-11-07 07:47:40', '2015-11-07 07:49:26', '6', 'Sticker::http://custom.maxstarweb.com/tshirtecommerce//uploaded/dg-designer-fa75185614469037403924942071020225.jpg', 'n', 0, 0),
(50, 'demo', '', '', '', '', '', '', '', 100, 6, 'catalog/designcolor.jpg', 0, 1, '10.0000', 0, 0, '2015-09-30', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 7, '2015-09-30 12:54:45', '2015-11-08 04:52:38', '4', 'Polo T-shirt::http://custom.maxstarweb.com/tshirtecommerce//uploaded/dg-designer-f23b3df7144681797234485559610271989.jpg', 'n', 0, 0),
(51, 'sdk2', '', '', '', '', '', '', '', 100, 6, '', 0, 1, '10.0000', 0, 0, '2015-09-30', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 3, '2015-09-30 13:12:11', '0000-00-00 00:00:00', '2', 'SS::http://custom.maxstarweb.com/tshirtecommerce//uploaded/design/front-hooded-sweatshirt-6.png', 'n', 0, 0),
(63, 'Mug', '', '', '', '', '', '', '', 100, 6, 'catalog/mug.jpg', 0, 1, '10.0000', 0, 0, '2015-11-26', '500.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 1, '2015-11-26 07:12:50', '0000-00-00 00:00:00', '9', 'Mug::http://dev.9livesprints.com/tshirtecommerce//uploaded/dg-designer-f00e1df0144853960171353572511096201.jpg', 'n', 0, 0),
(64, 'Mug', '', '', '', '', '', '', '', 100, 6, 'catalog/mug.jpg', 0, 1, '10.0000', 0, 0, '2015-11-26', '500.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2015-11-26 07:12:50', '0000-00-00 00:00:00', '9', 'Mug::http://dev.9livesprints.com/tshirtecommerce//uploaded/dg-designer-f00e1df0144853960171353572511096201.jpg', 'n', 0, 0),
(82, '01_82', '', '', '', '', '', '', '', 99, 6, 'catalog/hall_of_fame/cart-front-1452594035.png', 0, 1, '15.0000', 0, 0, '2015-10-10', '500.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 113, '2015-10-10 07:21:12', '2015-12-09 07:02:40', '3', 'Custom Product::http://custom.maxstarweb.com/tshirtecommerce//uploaded/design/dg-designer-25daeb9b144448685917368461010164946.png', 'y', 17, 125),
(81, '01_81', '', '', '', '', '', '', '', 99, 6, 'catalog/hall_of_fame/cart-front-1452590365.png', 0, 1, '15.0000', 0, 0, '2015-10-10', '500.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 113, '2015-10-10 07:21:12', '2015-12-09 07:02:40', '3', 'Custom Product::http://custom.maxstarweb.com/tshirtecommerce//uploaded/design/dg-designer-25daeb9b144448685917368461010164946.png', 'y', 3, 124),
(80, '01_80', '', '', '', '', '', '', '', 99, 6, 'catalog/hall_of_fame/cart-front-1451398356.png', 0, 1, '15.0000', 0, 0, '2015-10-10', '500.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 114, '2015-10-10 07:21:12', '2015-12-09 07:02:40', '3', 'Custom Product::http://custom.maxstarweb.com/tshirtecommerce//uploaded/design/dg-designer-25daeb9b144448685917368461010164946.png', 'y', 3, 121),
(79, '01_79', '', '', '', '', '', '', '', 99, 6, 'catalog/hall_of_fame/cart-front-1451376452.png', 0, 1, '15.0000', 0, 0, '2015-10-10', '500.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 114, '2015-10-10 07:21:12', '2015-12-09 07:02:40', '3', 'Custom Product::http://custom.maxstarweb.com/tshirtecommerce//uploaded/design/dg-designer-25daeb9b144448685917368461010164946.png', 'y', 3, 114),
(78, '01_78', '', '', '', '', '', '', '', 99, 6, 'catalog/hall_of_fame/cart-front-1451329451.png', 0, 1, '15.0000', 0, 0, '2015-10-10', '500.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 120, '2015-10-10 07:21:12', '2015-12-09 07:02:40', '3', 'Custom Product::http://custom.maxstarweb.com/tshirtecommerce//uploaded/design/dg-designer-25daeb9b144448685917368461010164946.png', 'y', 8, 112);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_attribute`
--

CREATE TABLE IF NOT EXISTS `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_description`
--

CREATE TABLE IF NOT EXISTS `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(52, 1, 'Men Tshirt1', '&lt;p&gt;Men Tshirt1&lt;br&gt;&lt;/p&gt;', '', 'Men Tshirt1', '', ''),
(53, 1, 'Men Tshirt2', '&lt;p&gt;Men Tshirt2&lt;/p&gt;', '', 'Men Tshirt2', '', ''),
(54, 1, 'Men Tshirt3', '&lt;p&gt;Men Tshirt3&lt;br&gt;&lt;/p&gt;', '', 'Men Tshirt3', '', ''),
(55, 1, 'Men Tshirt4', '&lt;p&gt;Men Tshirt4&lt;br&gt;&lt;/p&gt;', '', 'Men Tshirt4', '', ''),
(56, 1, 'Men Tshirt5', '&lt;p&gt;Men Tshirt5&lt;br&gt;&lt;/p&gt;', '', 'Men Tshirt5', '', ''),
(59, 1, 'Sticker', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'Sticker', '', ''),
(60, 1, 'Kids shirt', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'Kids shirt', '', ''),
(61, 1, 'Pins', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'Pins', '', ''),
(50, 1, 'Sample', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'sample', '', ''),
(51, 1, 'Sample Testing', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'sample testing', '', ''),
(63, 1, 'Mug', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Mug', 'Mug', '', ''),
(82, 1, 'Men Tshirt1__82', '&lt;p&gt;Men Tshirt1&lt;br&gt;&lt;/p&gt;', '', 'Men Tshirt1__82', '__82', '__82'),
(81, 1, 'Men Tshirt1__81', '&lt;p&gt;Men Tshirt1&lt;br&gt;&lt;/p&gt;', '', 'Men Tshirt1__81', '__81', '__81'),
(80, 1, 'Men Tshirt1__80', '&lt;p&gt;Men Tshirt1&lt;br&gt;&lt;/p&gt;', '', 'Men Tshirt1__80', '__80', '__80'),
(79, 1, 'Men Tshirt1__79', '&lt;p&gt;Men Tshirt1&lt;br&gt;&lt;/p&gt;', '', 'Men Tshirt1__79', '__79', '__79'),
(78, 1, 'Men Tshirt1__78', '&lt;p&gt;Men Tshirt1&lt;br&gt;&lt;/p&gt;', '', 'Men Tshirt1__78', '__78', '__78');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_discount`
--

CREATE TABLE IF NOT EXISTS `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=481 ;

--
-- Dumping data for table `oc_product_discount`
--

INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(480, 63, 1, 0, 0, '0.0000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_filter`
--

CREATE TABLE IF NOT EXISTS `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_image`
--

CREATE TABLE IF NOT EXISTS `oc_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2805 ;

--
-- Dumping data for table `oc_product_image`
--

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2773, 61, 'catalog/f47f5ffbc878e1d9ee3aaeb3d6508113.jpg', 0),
(2785, 60, 'catalog/kids11.jpg', 0),
(2770, 50, 'catalog/designcolor.jpg', 0),
(2769, 59, 'catalog/mug-template.jpg', 0),
(2786, 63, 'catalog/mug.jpg', 0),
(2804, 82, 'catalog/hall_of_fame/cart-back-1452594035.png', 2),
(2803, 81, 'catalog/hall_of_fame/cart-back-1452590365.png', 2),
(2802, 80, 'catalog/hall_of_fame/cart-back-1451398356.png', 2),
(2801, 79, 'catalog/hall_of_fame/cart-back-1451376452.png', 2),
(2800, 78, 'catalog/hall_of_fame/cart-back-1451329451.png', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option`
--

CREATE TABLE IF NOT EXISTS `oc_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=245 ;

--
-- Dumping data for table `oc_product_option`
--

INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(244, 82, 11, '', 1),
(243, 81, 11, '', 1),
(242, 80, 11, '', 1),
(241, 79, 11, '', 1),
(240, 78, 11, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option_value`
--

CREATE TABLE IF NOT EXISTS `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=89 ;

--
-- Dumping data for table `oc_product_option_value`
--

INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(88, 244, 82, 11, 49, 10000000, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(87, 244, 82, 11, 48, 10000000, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(86, 244, 82, 11, 47, 10000000, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(85, 244, 82, 11, 46, 10000000, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(84, 243, 81, 11, 49, 10000000, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(83, 243, 81, 11, 48, 10000000, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(82, 243, 81, 11, 47, 10000000, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(81, 243, 81, 11, 46, 10000000, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(80, 242, 80, 11, 49, 10000000, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(79, 242, 80, 11, 48, 10000000, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(78, 242, 80, 11, 47, 10000000, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(77, 242, 80, 11, 46, 10000000, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(76, 241, 79, 11, 49, 10000000, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(75, 241, 79, 11, 48, 10000000, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(74, 241, 79, 11, 47, 10000000, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(73, 241, 79, 11, 46, 10000000, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(72, 240, 78, 11, 49, 10000000, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(71, 240, 78, 11, 48, 10000000, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(70, 240, 78, 11, 47, 10000000, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(69, 240, 78, 11, 46, 10000000, 1, '0.0000', '+', 0, '+', '0.00000000', '+');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_related`
--

CREATE TABLE IF NOT EXISTS `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_reward`
--

CREATE TABLE IF NOT EXISTS `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `points` int(8) NOT NULL,
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=677 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_special`
--

CREATE TABLE IF NOT EXISTS `oc_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=477 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_category`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES
(50, 25),
(52, 57),
(53, 57),
(54, 57),
(55, 57),
(56, 57),
(59, 67),
(60, 60),
(61, 66),
(63, 63),
(78, 69),
(79, 69),
(80, 69),
(81, 69),
(82, 69);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_download`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_layout`
--

INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(56, 0, 0),
(59, 0, 0),
(52, 0, 0),
(55, 0, 0),
(61, 0, 0),
(60, 0, 0),
(54, 0, 0),
(53, 0, 0),
(50, 0, 0),
(51, 0, 0),
(63, 0, 0),
(82, 0, 0),
(81, 0, 0),
(80, 0, 0),
(79, 0, 0),
(78, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(59, 0),
(60, 0),
(61, 0),
(63, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_recurring` (
  `recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) NOT NULL,
  `cycle` int(10) NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) NOT NULL,
  `trial_cycle` int(10) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_recurring_description`
--

CREATE TABLE IF NOT EXISTS `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`recurring_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return`
--

CREATE TABLE IF NOT EXISTS `oc_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_action`
--

CREATE TABLE IF NOT EXISTS `oc_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_history`
--

CREATE TABLE IF NOT EXISTS `oc_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_reason`
--

CREATE TABLE IF NOT EXISTS `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_status`
--

CREATE TABLE IF NOT EXISTS `oc_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(2, 1, 'Awaiting Products'),
(3, 1, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `oc_review`
--

CREATE TABLE IF NOT EXISTS `oc_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_setting`
--

CREATE TABLE IF NOT EXISTS `oc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  `group` varchar(32) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8639 ;

--
-- Dumping data for table `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`, `group`) VALUES
(1, 0, '', 'shipping_sort_order', '3', 0, 'shipping'),
(2, 0, '', 'sub_total_sort_order', '1', 0, 'sub_total'),
(3, 0, '', 'sub_total_status', '1', 0, 'sub_total'),
(4, 0, '', 'tax_status', '1', 0, 'tax'),
(5, 0, '', 'total_sort_order', '9', 0, 'total'),
(6, 0, '', 'total_status', '1', 0, 'total'),
(7, 0, '', 'tax_sort_order', '5', 0, 'tax'),
(8, 0, '', 'free_checkout_sort_order', '1', 0, 'free_checkout'),
(9, 0, '', 'cod_sort_order', '5', 0, 'cod'),
(10, 0, '', 'cod_total', '0.01', 0, 'cod'),
(11, 0, '', 'cod_order_status_id', '1', 0, 'cod'),
(12, 0, '', 'cod_geo_zone_id', '0', 0, 'cod'),
(13, 0, '', 'cod_status', '1', 0, 'cod'),
(14, 0, '', 'shipping_status', '1', 0, 'shipping'),
(15, 0, '', 'shipping_estimator', '1', 0, 'shipping'),
(27, 0, '', 'coupon_sort_order', '4', 0, 'coupon'),
(28, 0, '', 'coupon_status', '1', 0, 'coupon'),
(34, 0, '', 'flat_sort_order', '1', 0, 'flat'),
(35, 0, '', 'flat_status', '1', 0, 'flat'),
(36, 0, '', 'flat_geo_zone_id', '0', 0, 'flat'),
(37, 0, '', 'flat_tax_class_id', '9', 0, 'flat'),
(41, 0, '', 'flat_cost', '5.00', 0, 'flat'),
(42, 0, '', 'credit_sort_order', '7', 0, 'credit'),
(43, 0, '', 'credit_status', '1', 0, 'credit'),
(53, 0, '', 'reward_sort_order', '2', 0, 'reward'),
(54, 0, '', 'reward_status', '1', 0, 'reward'),
(94, 0, '', 'voucher_sort_order', '8', 0, 'voucher'),
(95, 0, '', 'voucher_status', '1', 0, 'voucher'),
(103, 0, '', 'free_checkout_status', '1', 0, 'free_checkout'),
(104, 0, '', 'free_checkout_order_status_id', '1', 0, 'free_checkout'),
(3140, 0, '', 'config_name', 'Framework Opencart Parallax By BossThemes', 0, 'config'),
(3141, 0, '', 'config_owner', 'Your NameYour Name', 0, 'config'),
(3142, 0, '', 'config_address', 'Address 1', 0, 'config'),
(3143, 0, '', 'config_geocode', '', 0, 'config'),
(3144, 0, '', 'config_email', 'admin@demo.com', 0, 'config'),
(3145, 0, '', 'config_telephone', '123456789', 0, 'config'),
(3146, 0, '', 'config_fax', '', 0, 'config'),
(3147, 0, '', 'config_image', '', 0, 'config'),
(3148, 0, '', 'config_open', '', 0, 'config'),
(3149, 0, '', 'config_comment', '', 0, 'config'),
(3150, 0, '', 'config_meta_title', 'Framework Opencart Parallax By BossThemes', 0, 'config'),
(3151, 0, '', 'config_meta_description', 'My Store', 0, 'config'),
(3152, 0, '', 'config_meta_keyword', '', 0, 'config'),
(3153, 0, '', 'config_template', 'bt_parallax', 0, 'config'),
(3154, 0, '', 'config_layout_id', '4', 0, 'config'),
(3155, 0, '', 'config_country_id', '222', 0, 'config'),
(3156, 0, '', 'config_zone_id', '3563', 0, 'config'),
(3157, 0, '', 'config_language', 'en', 0, 'config'),
(3158, 0, '', 'config_admin_language', 'en', 0, 'config'),
(3159, 0, '', 'config_currency', 'USD', 0, 'config'),
(3160, 0, '', 'config_currency_auto', '1', 0, 'config'),
(3161, 0, '', 'config_length_class_id', '1', 0, 'config'),
(3162, 0, '', 'config_weight_class_id', '1', 0, 'config'),
(3163, 0, '', 'config_product_count', '1', 0, 'config'),
(3164, 0, '', 'config_product_limit', '15', 0, 'config'),
(3165, 0, '', 'config_product_description_length', '200', 0, 'config'),
(3166, 0, '', 'config_limit_admin', '20', 0, 'config'),
(3167, 0, '', 'config_review_status', '1', 0, 'config'),
(3168, 0, '', 'config_review_guest', '1', 0, 'config'),
(3169, 0, '', 'config_review_mail', '0', 0, 'config'),
(3170, 0, '', 'config_voucher_min', '1', 0, 'config'),
(3171, 0, '', 'config_voucher_max', '1000', 0, 'config'),
(3172, 0, '', 'config_tax', '1', 0, 'config'),
(3173, 0, '', 'config_tax_default', 'shipping', 0, 'config'),
(3174, 0, '', 'config_tax_customer', 'shipping', 0, 'config'),
(3175, 0, '', 'config_customer_online', '0', 0, 'config'),
(3176, 0, '', 'config_customer_group_id', '1', 0, 'config'),
(3177, 0, '', 'config_customer_group_display', 'a:1:{i:0;s:1:"1";}', 1, 'config'),
(3178, 0, '', 'config_customer_price', '0', 0, 'config'),
(3179, 0, '', 'config_account_id', '3', 0, 'config'),
(3180, 0, '', 'config_account_mail', '0', 0, 'config'),
(3181, 0, '', 'config_invoice_prefix', 'INV-2013-00', 0, 'config'),
(3182, 0, '', 'config_api_id', '2', 0, 'config'),
(3183, 0, '', 'config_cart_weight', '1', 0, 'config'),
(3184, 0, '', 'config_checkout_guest', '1', 0, 'config'),
(3185, 0, '', 'config_checkout_id', '5', 0, 'config'),
(3186, 0, '', 'config_order_status_id', '1', 0, 'config'),
(3187, 0, '', 'config_processing_status', 'a:1:{i:0;s:1:"2";}', 1, 'config'),
(3188, 0, '', 'config_complete_status', 'a:1:{i:0;s:1:"5";}', 1, 'config'),
(3189, 0, '', 'config_order_mail', '0', 0, 'config'),
(3190, 0, '', 'config_stock_display', '0', 0, 'config'),
(3191, 0, '', 'config_stock_warning', '0', 0, 'config'),
(3192, 0, '', 'config_stock_checkout', '0', 0, 'config'),
(3193, 0, '', 'config_affiliate_approval', '0', 0, 'config'),
(3194, 0, '', 'config_affiliate_auto', '0', 0, 'config'),
(3195, 0, '', 'config_affiliate_commission', '5', 0, 'config'),
(3196, 0, '', 'config_affiliate_id', '4', 0, 'config'),
(3197, 0, '', 'config_affiliate_mail', '0', 0, 'config'),
(3198, 0, '', 'config_return_id', '0', 0, 'config'),
(3199, 0, '', 'config_return_status_id', '2', 0, 'config'),
(3200, 0, '', 'config_logo', 'catalog/bt_parallax/logo.png', 0, 'config'),
(3201, 0, '', 'config_icon', 'catalog/cart.png', 0, 'config'),
(3202, 0, '', 'config_image_category_width', '120', 0, 'config'),
(3203, 0, '', 'config_image_category_height', '120', 0, 'config'),
(3204, 0, '', 'config_image_thumb_width', '500', 0, 'config'),
(3205, 0, '', 'config_image_thumb_height', '500', 0, 'config'),
(3206, 0, '', 'config_image_popup_width', '500', 0, 'config'),
(3207, 0, '', 'config_image_popup_height', '500', 0, 'config'),
(3208, 0, '', 'config_image_product_width', '280', 0, 'config'),
(3209, 0, '', 'config_image_product_height', '280', 0, 'config'),
(3210, 0, '', 'config_image_additional_width', '74', 0, 'config'),
(3211, 0, '', 'config_image_additional_height', '74', 0, 'config'),
(3212, 0, '', 'config_image_related_width', '300', 0, 'config'),
(3213, 0, '', 'config_image_related_height', '300', 0, 'config'),
(3214, 0, '', 'config_image_compare_width', '250', 0, 'config'),
(3215, 0, '', 'config_image_compare_height', '250', 0, 'config'),
(3216, 0, '', 'config_image_wishlist_width', '90', 0, 'config'),
(3217, 0, '', 'config_image_wishlist_height', '90', 0, 'config'),
(3218, 0, '', 'config_image_cart_width', '90', 0, 'config'),
(3219, 0, '', 'config_image_cart_height', '90', 0, 'config'),
(3220, 0, '', 'config_image_location_width', '268', 0, 'config'),
(3221, 0, '', 'config_image_location_height', '50', 0, 'config'),
(3222, 0, '', 'config_ftp_hostname', 'opencart.opencartdemo.com', 0, 'config'),
(3223, 0, '', 'config_ftp_port', '21', 0, 'config'),
(3224, 0, '', 'config_ftp_username', '', 0, 'config'),
(3225, 0, '', 'config_ftp_password', '', 0, 'config'),
(3226, 0, '', 'config_ftp_root', '', 0, 'config'),
(3227, 0, '', 'config_ftp_status', '0', 0, 'config'),
(3228, 0, '', 'config_mail', 'a:7:{s:8:"protocol";s:4:"mail";s:9:"parameter";s:0:"";s:13:"smtp_hostname";s:0:"";s:13:"smtp_username";s:0:"";s:13:"smtp_password";s:0:"";s:9:"smtp_port";s:0:"";s:12:"smtp_timeout";s:0:"";}', 1, 'config'),
(3229, 0, '', 'config_mail_alert', '', 0, 'config'),
(3230, 0, '', 'config_fraud_detection', '0', 0, 'config'),
(3231, 0, '', 'config_fraud_key', '', 0, 'config'),
(3232, 0, '', 'config_fraud_score', '', 0, 'config'),
(3233, 0, '', 'config_fraud_status_id', '7', 0, 'config'),
(3234, 0, '', 'config_secure', '0', 0, 'config'),
(3235, 0, '', 'config_shared', '0', 0, 'config'),
(3236, 0, '', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0, 'config'),
(3237, 0, '', 'config_seo_url', '0', 0, 'config'),
(3238, 0, '', 'config_file_max_size', '300000', 0, 'config'),
(3239, 0, '', 'config_file_ext_allowed', 'txt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc\r\nrtf\r\nxls\r\nppt\r\nodt\r\nods', 0, 'config'),
(3240, 0, '', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/vnd.microsoft.icon\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-rar-compressed\r\napplication/x-msdownload\r\napplication/vnd.ms-cab-compressed\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf\r\nimage/vnd.adobe.photoshop\r\napplication/postscript\r\napplication/msword\r\napplication/rtf\r\napplication/vnd.ms-excel\r\napplication/vnd.ms-powerpoint\r\napplication/vnd.oasis.opendocument.text\r\napplication/vnd.oasis.opendocument.spreadsheet', 0, 'config'),
(3241, 0, '', 'config_maintenance', '0', 0, 'config'),
(3242, 0, '', 'config_password', '1', 0, 'config'),
(3243, 0, '', 'config_encryption', '129cb448add27b4df1ddfe5991ecb3f9', 0, 'config'),
(3244, 0, '', 'config_compression', '0', 0, 'config'),
(3245, 0, '', 'config_error_display', '1', 0, 'config'),
(3246, 0, '', 'config_error_log', '1', 0, 'config'),
(3247, 0, '', 'config_error_filename', 'error.log', 0, 'config'),
(3248, 0, '', 'config_google_analytics', '', 0, 'config'),
(3310, 0, 'config_bossblog', 'config_bossblog_name', 'Blog', 0, ''),
(3311, 0, 'config_bossblog', 'config_bossblog_limit', '5', 0, ''),
(3312, 0, 'config_bossblog', 'config_bossblog_admin_limit', '5', 0, ''),
(3313, 0, 'config_bossblog', 'config_bossblog_comment_status', '1', 0, ''),
(3314, 0, 'config_bossblog', 'config_bossblog_approval_status', '0', 0, ''),
(3315, 0, 'config_bossblog', 'config_bossblog_image_category_width', '880', 0, ''),
(3316, 0, 'config_bossblog', 'config_bossblog_image_category_height', '295', 0, ''),
(3317, 0, 'config_bossblog', 'config_bossblog_image_article_width', '205', 0, ''),
(3318, 0, 'config_bossblog', 'config_bossblog_image_article_height', '205', 0, ''),
(3319, 0, 'config_bossblog', 'config_bossblog_image_related_width', '195', 0, ''),
(3320, 0, 'config_bossblog', 'config_bossblog_image_related_height', '195', 0, ''),
(3321, 0, 'boss_tagcloud', 'boss_tagcloud_module', 'a:3:{i:0;a:5:{s:5:"limit";i:20;s:5:"title";a:2:{i:1;s:9:"Tag Cloud";i:2;s:9:"Tag Cloud";}s:11:"font_weight";s:6:"normal";s:13:"min_font_size";i:9;s:13:"max_font_size";i:25;}i:1;a:5:{s:5:"limit";i:20;s:5:"title";a:2:{i:1;s:9:"Tag Cloud";i:2;s:9:"Tag Cloud";}s:11:"font_weight";s:6:"normal";s:13:"min_font_size";i:9;s:13:"max_font_size";i:25;}i:2;a:5:{s:5:"limit";i:20;s:5:"title";a:2:{i:1;s:9:"Tag Cloud";i:2;s:9:"Tag Cloud";}s:11:"font_weight";s:6:"normal";s:13:"min_font_size";i:9;s:13:"max_font_size";i:25;}}', 1, ''),
(3322, 0, 'boss_tagcloud', 'boss_tagcloud_status', '1', 0, ''),
(4160, 0, 'filter', 'filter_status', '1', 0, ''),
(6489, 0, 'zlclite', 'zlclite_status', '1', 0, ''),
(6912, 0, 'flat', 'flat_sort_order', '1', 0, ''),
(6911, 0, 'flat', 'flat_status', '0', 0, ''),
(6849, 0, 'free', 'free_status', '0', 0, ''),
(6848, 0, 'free', 'free_geo_zone_id', '0', 0, ''),
(6847, 0, 'free', 'free_total', '', 0, ''),
(6251, 0, 'boss_manager', 'boss_manager_footer_contact', 'a:3:{s:13:"contact_title";a:1:{i:1;s:10:"Contact us";}s:6:"status";s:1:"1";s:15:"contact_content";a:1:{i:1;s:795:"&lt;div class=&quot;contact-us not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;300&quot;&gt;\r\n&lt;div class=&quot;address&quot;&gt;\r\n&lt;div class=&quot;image&quot;&gt;&lt;span&gt;test&lt;/span&gt;&lt;/div&gt;\r\n\r\n\r\n\r\n&lt;p&gt;&lt;span&gt;123 Fake Street Name, Fake City, Fake Country.&lt;/span&gt;&lt;/p&gt;\r\n\r\n\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n&lt;div class=&quot;email&quot;&gt;\r\n&lt;div class=&quot;image&quot;&gt;&lt;span&gt;test&lt;/span&gt;&lt;/div&gt;\r\n\r\n\r\n\r\n&lt;p&gt;&lt;span&gt;support@ninelives.com&lt;/span&gt;&lt;/p&gt;\r\n\r\n\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;email&quot;&gt;\r\n&lt;div class=&quot;image&quot;&gt;&lt;span&gt;test&lt;/span&gt;&lt;/div&gt;\r\n\r\n\r\n\r\n&lt;p&gt;&lt;span&gt;complaint@ninelives.com&lt;/span&gt;&lt;/p&gt;\r\n\r\n\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;/div&gt;";}}', 1, ''),
(6252, 0, 'boss_manager', 'boss_manager_footer_about', 'a:6:{s:6:"status";s:1:"1";s:12:"image_status";s:1:"1";s:10:"image_link";s:22:"catalog/logofooter.png";s:9:"image_url";s:1:"#";s:11:"about_title";a:1:{i:1;s:8:"About Us";}s:13:"about_content";a:1:{i:1;s:154:"&lt;div class=&quot;about-store not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;300&quot;&gt;\r\n&lt;p&gt;&lt;/p&gt;\r\n\r\n\r\n&lt;/div&gt;";}}', 1, ''),
(6253, 0, 'boss_manager', 'boss_manager_footer_social', 'a:8:{s:6:"status";s:1:"1";s:5:"title";a:1:{i:1;s:9:"Follow us";}s:8:"face_url";s:1:"#";s:13:"pinterest_url";s:1:"#";s:11:"twitter_url";s:1:"#";s:14:"googleplus_url";s:1:"#";s:7:"rss_url";s:1:"#";s:11:"youtube_url";s:1:"#";}', 1, ''),
(6254, 0, 'boss_manager', 'boss_manager_footer_payment', 'a:11:{s:6:"status";s:1:"1";s:11:"visa_status";s:2:"on";s:9:"visa_link";s:1:"#";s:13:"master_status";s:2:"on";s:11:"master_link";s:1:"#";s:14:"merican_status";s:2:"on";s:12:"merican_link";s:1:"#";s:13:"paypal_status";s:2:"on";s:11:"paypal_link";s:1:"#";s:13:"skrill_status";s:2:"on";s:11:"skrill_link";s:1:"#";}', 1, ''),
(6255, 0, 'boss_manager', 'boss_manager_footer_powered', 'a:1:{i:1;s:145:"&lt;div id=&quot;powered&quot;&gt;\r\n&lt;p&gt;Copyright © 2015 Ninelives. All rights Reserved.&lt;span&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;/div&gt;";}', 1, ''),
(6249, 0, 'boss_manager', 'boss_manager', 'a:7:{s:6:"status";s:1:"1";s:6:"option";a:5:{s:13:"bt_scroll_top";s:1:"1";s:11:"sticky_menu";s:1:"1";s:8:"use_menu";s:8:"megamenu";s:9:"animation";s:1:"1";s:7:"loading";s:1:"0";}s:6:"layout";a:6:{s:8:"mode_css";s:4:"wide";s:9:"box_width";s:4:"1200";s:10:"h_mode_css";s:7:"inherit";s:11:"h_box_width";s:4:"1200";s:10:"f_mode_css";s:7:"inherit";s:11:"f_box_width";s:4:"1200";}s:11:"header_link";a:10:{s:8:"language";s:1:"1";s:8:"currency";s:1:"1";s:5:"phone";s:1:"0";s:10:"my_account";s:1:"1";s:8:"wishlist";s:1:"1";s:13:"shopping_cart";s:1:"1";s:8:"checkout";s:1:"1";s:4:"logo";s:1:"1";s:6:"search";s:1:"1";s:9:"cart_mini";s:1:"1";}s:11:"footer_link";a:12:{s:11:"information";s:1:"1";s:10:"contact_us";s:1:"0";s:6:"return";s:1:"1";s:8:"site_map";s:1:"0";s:6:"brands";s:1:"0";s:13:"gift_vouchers";s:1:"1";s:10:"affiliates";s:1:"0";s:8:"specials";s:1:"0";s:10:"my_account";s:1:"1";s:13:"order_history";s:1:"1";s:8:"wishlist";s:1:"0";s:10:"newsletter";s:1:"0";}s:5:"other";a:7:{s:7:"pro_tab";s:7:"use_tab";s:13:"category_info";s:1:"1";s:13:"refine_search";s:1:"1";s:8:"view_pro";s:9:"both_grid";s:6:"perrow";s:1:"3";s:10:"stylesheet";s:1:"1";s:10:"class_home";s:12:"home_default";}s:5:"color";s:1:"1";}', 1, ''),
(6250, 0, 'boss_manager', 'boss_manager_footer_shipping', 'a:2:{s:6:"status";s:1:"1";s:15:"contact_content";a:1:{i:1;s:1468:"&lt;div class=&quot;container&quot;&gt;\r\n&lt;div class=&quot;footer-block-shipping not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;300&quot;&gt;\r\n\r\n&lt;div class=&quot;row&quot;&gt;\r\n&lt;div class=&quot;block block-1 col-lg-4 col-md-4 col-sm-12 col-xs-12&quot;&gt;\r\n&lt;div class=&quot;icon&quot;&gt;&lt;i class=&quot;fa fa-truck&quot;&gt;&lt;b&gt;test&lt;/b&gt;&lt;/i&gt;&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;div class=&quot;text&quot;&gt;\r\n&lt;h3&gt;free shipping&lt;/h3&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;div class=&quot;block block-2 col-lg-4 col-md-4 col-sm-12 col-xs-12&quot;&gt;\r\n&lt;div class=&quot;icon&quot;&gt;&lt;i class=&quot;fa fa-repeat&quot;&gt;&lt;b&gt;test&lt;/b&gt;&lt;/i&gt;&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;div class=&quot;text&quot;&gt;\r\n&lt;h3&gt;free return&lt;/h3&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;span&gt;In case of return sticker is on&lt;/span&gt;&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;div class=&quot;block block-3 col-lg-4 col-md-4 col-sm-12 col-xs-12&quot;&gt;\r\n&lt;div class=&quot;icon&quot;&gt;&lt;i class=&quot;fa fa-phone&quot;&gt;&lt;b&gt;test&lt;/b&gt;&lt;/i&gt;&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;div class=&quot;text&quot;&gt;\r\n&lt;h3&gt;call&lt;/h3&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;span&gt;call (01) 123 456&lt;/span&gt;&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n&lt;/div&gt;";}}', 1, ''),
(6910, 0, 'flat', 'flat_geo_zone_id', '0', 0, ''),
(6909, 0, 'flat', 'flat_tax_class_id', '0', 0, ''),
(6488, 0, 'zlclite', 'zlclite_code', '&lt;script type=&quot;text/javascript&quot;&gt;\r\nwindow.$zopim||(function(d,s){var z=$zopim=function(c){\r\nz._.push(c)},$=z.s=\r\nd.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.\r\n_.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute(''charset'',''utf-8'');\r\n$.src=''//v2.zopim.com/?3NyRdxsJoEhCEAXLyBLDOCgjpn3qA3qz'';z.t=+new Date;$.\r\ntype=''text/javascript'';e.parentNode.insertBefore($,e)})(document,''script'');\r\n&lt;/script&gt;', 0, ''),
(8630, 0, 'config', 'config_compression', '0', 0, ''),
(8631, 0, 'config', 'config_error_display', '1', 0, ''),
(8632, 0, 'config', 'config_error_log', '1', 0, ''),
(8633, 0, 'config', 'config_error_filename', 'error.log', 0, ''),
(8634, 0, 'config', 'config_google_analytics', '', 0, ''),
(8635, 0, 'config', 'config_google_analytics_status', '0', 0, ''),
(8636, 0, 'config', 'config_google_captcha_public', '', 0, ''),
(8637, 0, 'config', 'config_google_captcha_secret', '', 0, ''),
(8638, 0, 'config', 'config_google_captcha_status', '0', 0, ''),
(8627, 0, 'config', 'config_maintenance', '0', 0, ''),
(8628, 0, 'config', 'config_password', '1', 0, ''),
(8629, 0, 'config', 'config_encryption', '129cb448add27b4df1ddfe5991ecb3f9', 0, ''),
(8598, 0, 'config', 'config_image_compare_width', '210', 0, ''),
(8599, 0, 'config', 'config_image_compare_height', '210', 0, ''),
(8600, 0, 'config', 'config_image_wishlist_width', '90', 0, ''),
(8601, 0, 'config', 'config_image_wishlist_height', '90', 0, ''),
(8602, 0, 'config', 'config_image_cart_width', '90', 0, ''),
(8603, 0, 'config', 'config_image_cart_height', '90', 0, ''),
(8604, 0, 'config', 'config_image_location_width', '268', 0, ''),
(8605, 0, 'config', 'config_image_location_height', '50', 0, ''),
(8606, 0, 'config', 'config_ftp_hostname', 'opencart.opencartdemo.com', 0, ''),
(8607, 0, 'config', 'config_ftp_port', '21', 0, ''),
(8608, 0, 'config', 'config_ftp_username', '', 0, ''),
(8609, 0, 'config', 'config_ftp_password', '', 0, ''),
(8610, 0, 'config', 'config_ftp_root', '', 0, ''),
(8611, 0, 'config', 'config_ftp_status', '0', 0, ''),
(8612, 0, 'config', 'config_mail_protocol', 'smtp', 0, ''),
(8613, 0, 'config', 'config_mail_parameter', '', 0, ''),
(8614, 0, 'config', 'config_mail_smtp_hostname', 'ecbiz182.inmotionhosting.com', 0, ''),
(8615, 0, 'config', 'config_mail_smtp_username', 'info@9livesprints.com', 0, ''),
(8616, 0, 'config', 'config_mail_smtp_password', 'Password_00', 0, ''),
(8617, 0, 'config', 'config_mail_smtp_port', '25', 0, ''),
(8618, 0, 'config', 'config_mail_smtp_timeout', '5', 0, ''),
(8619, 0, 'config', 'config_mail_alert', '', 0, ''),
(8620, 0, 'config', 'config_secure', '0', 0, ''),
(8621, 0, 'config', 'config_shared', '0', 0, ''),
(8622, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0, ''),
(8623, 0, 'config', 'config_seo_url', '1', 0, ''),
(8624, 0, 'config', 'config_file_max_size', '300000', 0, ''),
(8625, 0, 'config', 'config_file_ext_allowed', 'txt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc\r\nrtf\r\nxls\r\nppt\r\nodt\r\nods', 0, ''),
(8626, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/vnd.microsoft.icon\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-rar-compressed\r\napplication/x-msdownload\r\napplication/vnd.ms-cab-compressed\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf\r\nimage/vnd.adobe.photoshop\r\napplication/postscript\r\napplication/msword\r\napplication/rtf\r\napplication/vnd.ms-excel\r\napplication/vnd.ms-powerpoint\r\napplication/vnd.oasis.opendocument.text\r\napplication/vnd.oasis.opendocument.spreadsheet', 0, ''),
(8597, 0, 'config', 'config_image_related_height', '300', 0, ''),
(8596, 0, 'config', 'config_image_related_width', '300', 0, ''),
(8595, 0, 'config', 'config_image_additional_height', '90', 0, ''),
(8594, 0, 'config', 'config_image_additional_width', '90', 0, ''),
(8593, 0, 'config', 'config_image_product_height', '280', 0, ''),
(8592, 0, 'config', 'config_image_product_width', '280', 0, ''),
(8591, 0, 'config', 'config_image_popup_height', '500', 0, ''),
(8590, 0, 'config', 'config_image_popup_width', '500', 0, ''),
(8589, 0, 'config', 'config_image_thumb_height', '500', 0, ''),
(8588, 0, 'config', 'config_image_thumb_width', '500', 0, ''),
(8587, 0, 'config', 'config_image_category_height', '100', 0, ''),
(8586, 0, 'config', 'config_image_category_width', '120', 0, ''),
(8585, 0, 'config', 'config_icon', 'catalog/logoninelives.png', 0, ''),
(8584, 0, 'config', 'config_logo', 'catalog/logo01.png', 0, ''),
(8583, 0, 'config', 'config_return_status_id', '2', 0, ''),
(8582, 0, 'config', 'config_return_id', '0', 0, ''),
(8581, 0, 'config', 'config_affiliate_mail', '0', 0, ''),
(8580, 0, 'config', 'config_affiliate_id', '4', 0, ''),
(8579, 0, 'config', 'config_affiliate_commission', '5', 0, ''),
(8578, 0, 'config', 'config_affiliate_auto', '0', 0, ''),
(8577, 0, 'config', 'config_affiliate_approval', '0', 0, ''),
(8576, 0, 'config', 'config_stock_checkout', '0', 0, ''),
(8575, 0, 'config', 'config_stock_warning', '0', 0, ''),
(8574, 0, 'config', 'config_stock_display', '0', 0, ''),
(8573, 0, 'config', 'config_order_mail', '1', 0, ''),
(8572, 0, 'config', 'config_complete_status', 'a:1:{i:0;s:1:"5";}', 1, ''),
(8571, 0, 'config', 'config_processing_status', 'a:1:{i:0;s:1:"2";}', 1, ''),
(8570, 0, 'config', 'config_order_status_id', '1', 0, ''),
(8569, 0, 'config', 'config_checkout_id', '5', 0, ''),
(8568, 0, 'config', 'config_checkout_guest', '0', 0, ''),
(8567, 0, 'config', 'config_cart_weight', '1', 0, ''),
(8566, 0, 'config', 'config_api_id', '2', 0, ''),
(8565, 0, 'config', 'config_invoice_prefix', 'INV-2016-00', 0, ''),
(6850, 0, 'free', 'free_sort_order', '', 0, ''),
(6859, 0, 'item', 'item_status', '0', 0, ''),
(6858, 0, 'item', 'item_geo_zone_id', '0', 0, ''),
(6857, 0, 'item', 'item_tax_class_id', '0', 0, ''),
(6856, 0, 'item', 'item_cost', '1', 0, ''),
(6860, 0, 'item', 'item_sort_order', '', 0, ''),
(6908, 0, 'flat', 'flat_cost', '5.00', 0, ''),
(6904, 0, 'social_media_login', 'social_media_login_twt_button_name_1', 'Login with Twitter', 0, ''),
(6903, 0, 'social_media_login', 'social_media_login_twt_consumer_secret', '', 0, ''),
(6902, 0, 'social_media_login', 'social_media_login_twt_consumer_key', '', 0, ''),
(6901, 0, 'social_media_login', 'social_media_login_yao_redirect_url', 'http://dev.9livesprints.com/index.php?route=account%2Fsocial_media_login%2Foauth2&amp;oa2_action=connecting&amp;oa2_adapter=yahoo&amp;oa2_state=oc_sml_0', 0, ''),
(6900, 0, 'social_media_login', 'social_media_login_yao_button_name_1', 'Login with Yahoo', 0, ''),
(6899, 0, 'social_media_login', 'social_media_login_yao_consumer_secret', '', 0, ''),
(6898, 0, 'social_media_login', 'social_media_login_yao_consumer_key', '', 0, ''),
(6897, 0, 'social_media_login', 'social_media_login_ggl_redirect_url', 'http://dev.9livesprints.com/index.php?route=account%2Fsocial_media_login%2Foauth2&amp;oa2_action=connecting&amp;oa2_adapter=google&amp;oa2_state=oc_sml_0', 0, ''),
(6896, 0, 'social_media_login', 'social_media_login_ggl_status', '1', 0, ''),
(6893, 0, 'social_media_login', 'social_media_login_ggl_client_id', '#', 0, ''),
(6894, 0, 'social_media_login', 'social_media_login_ggl_client_secret', '#', 0, ''),
(6895, 0, 'social_media_login', 'social_media_login_ggl_button_name_1', 'Login with Google', 0, ''),
(6890, 0, 'social_media_login', 'social_media_login_fb_button_name_1', 'Login with Facebook', 0, ''),
(6891, 0, 'social_media_login', 'social_media_login_fb_status', '1', 0, ''),
(6892, 0, 'social_media_login', 'social_media_login_fb_redirect_url', 'http://dev.9livesprints.com/index.php?route=account%2Fsocial_media_login%2Foauth2&amp;oa2_action=connecting&amp;oa2_adapter=facebook&amp;oa2_state=oc_sml_0', 0, ''),
(6889, 0, 'social_media_login', 'social_media_login_fb_app_secret', '#', 0, ''),
(6888, 0, 'social_media_login', 'social_media_login_fb_app_id', '#', 0, ''),
(6887, 0, 'social_media_login', 'social_media_login_status', '1', 0, ''),
(6905, 0, 'social_media_login', 'social_media_login_twt_redirect_url', 'http://dev.9livesprints.com/index.php?route=account%2Fsocial_media_login%2Foauth2&amp;oa2_action=connecting&amp;oa2_adapter=twitter&amp;oa2_state=oc_sml_0', 0, ''),
(6906, 0, 'social_media_login', 'social_media_login_twt_status', '0', 0, ''),
(6907, 0, 'social_media_login', 'social_media_login_yao_status', '0', 0, ''),
(7242, 0, 'weight', 'weight_9_status', '1', 0, ''),
(7243, 0, 'weight', 'weight_4_rate', '0:0,100:5.00,500:10,1:20,5:50', 0, ''),
(7241, 0, 'weight', 'weight_9_rate', '1000:25', 0, ''),
(7240, 0, 'weight', 'weight_5_status', '1', 0, ''),
(7239, 0, 'weight', 'weight_5_rate', '500:5,1000:10,1500:15', 0, ''),
(7238, 0, 'weight', 'weight_7_status', '0', 0, ''),
(7237, 0, 'weight', 'weight_7_rate', '', 0, ''),
(7235, 0, 'weight', 'weight_8_rate', '', 0, ''),
(7236, 0, 'weight', 'weight_8_status', '0', 0, ''),
(7234, 0, 'weight', 'weight_sort_order', '0', 0, ''),
(8564, 0, 'config', 'config_account_mail', '1', 0, ''),
(8562, 0, 'config', 'config_login_attempts', '5', 0, ''),
(8563, 0, 'config', 'config_account_id', '3', 0, ''),
(8561, 0, 'config', 'config_customer_price', '0', 0, ''),
(8560, 0, 'config', 'config_customer_group_display', 'a:1:{i:0;s:1:"1";}', 1, ''),
(8559, 0, 'config', 'config_customer_group_id', '1', 0, ''),
(8558, 0, 'config', 'config_customer_online', '0', 0, ''),
(8557, 0, 'config', 'config_tax_customer', 'shipping', 0, ''),
(8556, 0, 'config', 'config_tax_default', 'shipping', 0, ''),
(8555, 0, 'config', 'config_tax', '1', 0, ''),
(8554, 0, 'config', 'config_voucher_max', '1000', 0, ''),
(8553, 0, 'config', 'config_voucher_min', '1', 0, ''),
(8552, 0, 'config', 'config_review_mail', '0', 0, ''),
(8551, 0, 'config', 'config_review_guest', '0', 0, ''),
(8550, 0, 'config', 'config_review_status', '1', 0, ''),
(8549, 0, 'config', 'config_limit_admin', '20', 0, ''),
(8548, 0, 'config', 'config_product_description_length', '200', 0, ''),
(8547, 0, 'config', 'config_product_limit', '15', 0, ''),
(8546, 0, 'config', 'config_product_count', '1', 0, ''),
(8545, 0, 'config', 'config_weight_class_id', '2', 0, ''),
(8544, 0, 'config', 'config_length_class_id', '1', 0, ''),
(8542, 0, 'config', 'config_currency', 'EGP', 0, ''),
(8543, 0, 'config', 'config_currency_auto', '1', 0, ''),
(8541, 0, 'config', 'config_admin_language', 'en', 0, ''),
(8540, 0, 'config', 'config_language', 'en', 0, ''),
(8539, 0, 'config', 'config_zone_id', '1008', 0, ''),
(8538, 0, 'config', 'config_country_id', '63', 0, ''),
(8537, 0, 'config', 'config_layout_id', '4', 0, ''),
(8536, 0, 'config', 'config_template', 'bt_parallax', 0, ''),
(8534, 0, 'config', 'config_meta_description', 'My Store', 0, ''),
(8535, 0, 'config', 'config_meta_keyword', '', 0, ''),
(8533, 0, 'config', 'config_meta_title', 'NineLives', 0, ''),
(8532, 0, 'config', 'config_comment', '', 0, ''),
(8531, 0, 'config', 'config_open', '', 0, ''),
(7233, 0, 'weight', 'weight_status', '1', 0, ''),
(7232, 0, 'weight', 'weight_tax_class_id', '0', 0, ''),
(7244, 0, 'weight', 'weight_4_status', '1', 0, ''),
(7245, 0, 'weight', 'weight_6_rate', '0:0,100:5.00,500:10,1:20,5:50', 0, ''),
(7246, 0, 'weight', 'weight_6_status', '1', 0, ''),
(8530, 0, 'config', 'config_image', '', 0, ''),
(8526, 0, 'config', 'config_geocode', '', 0, ''),
(8527, 0, 'config', 'config_email', 'info@9livesprints.com', 0, ''),
(8528, 0, 'config', 'config_telephone', '123456789', 0, ''),
(8529, 0, 'config', 'config_fax', '', 0, ''),
(8525, 0, 'config', 'config_address', 'Address 1', 0, ''),
(8524, 0, 'config', 'config_owner', 'Your NameYour Name', 0, ''),
(8523, 0, 'config', 'config_name', 'NineLives', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_slider`
--

CREATE TABLE IF NOT EXISTS `oc_slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setting` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Dumping data for table `oc_slider`
--

INSERT INTO `oc_slider` (`id`, `setting`) VALUES
(21, '{"slider_type":"fullscreen","slider_width":"1600","slider_height":"790","delay":"5000","startWithSlide":"0","stopslider":"on","stopafterloops":"-1","stopatslide":"-1","touchenabled":"on","onhoverstop":"on","timeline":"0","timerlineposition":"top","shadow":"0","navigationtype":"bullet","navigationarrow":"nexttobullets","navigationstyle":"preview1","navigationhalign":"center","navigationvalign":"bottom","navigationhoffset":"0","navigationvoffset":"0","soloarrowlefthalign":"left","soloarrowleftvalign":"top","soloarrowlefthoffset":"0","soloarrowleftvoffset":"0","soloarrowrighthalign":"left","soloarrowrightvalign":"top","soloarrowrighthoffset":"0","soloarrowrightvoffset":"0","timehidethumbnail":"0","thumbnailwidth":"0","thumbnailheight":"0","thumbamount":"0","hidecapptionatlimit":"0","hideallcapptionatlimit":"0","hideslideratlimit":"0"}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_slider_slide`
--

CREATE TABLE IF NOT EXISTS `oc_slider_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slider_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `slideset` text COLLATE utf8_unicode_ci,
  `caption` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

--
-- Dumping data for table `oc_slider_slide`
--

INSERT INTO `oc_slider_slide` (`id`, `slider_id`, `status`, `sort_order`, `slideset`, `caption`) VALUES
(16, 18, 1, 1, '{"url":"#","enablelink":"0","type_background":"image_bg","background":"catalog/bt_parallax/fullslide6-320x200.jpg","transitions":"slideup","slotamount":"7","masterspeed":"500","delay":"5000","target":"_self","kenburns":"on","enablefullvideo":"0"}', 'null'),
(17, 19, 1, 1, '{"url":"#","enablelink":"1","type_background":"image_bg","background":"catalog/bt_parallax/fullslide6.jpg","transitions":"slideup","slotamount":"7","masterspeed":"500","delay":"5000","target":"_self","kenburns":"on","enablefullvideo":"0"}', 'null'),
(18, 20, 1, 0, '{"url":"#","enablelink":"0","type_background":"image_bg","background":"catalog/bt_parallax/slide1.jpg","transitions":"slideup","slotamount":"7","masterspeed":"500","delay":"5000","target":"_self","kenburns":"on","enablefullvideo":"0"}', 'null'),
(19, 21, 1, 0, '{"url":"#","enablelink":"1","type_background":"image_bg","background":"catalog/bt_parallax/slide1.jpg","transitions":"slideup","slotamount":"7","masterspeed":"500","delay":"5000","target":"_self","kenburns":"on","enablefullvideo":"0"}', 'null'),
(20, 22, 1, 2, '{"url":"#","enablelink":"1","type_background":"image_bg","background":"catalog/bt_parallax/slide2.jpg","transitions":"slideup","slotamount":"7","masterspeed":"500","delay":"5000","target":"_self","kenburns":"on","enablefullvideo":"0"}', 'null'),
(21, 21, 1, 0, '{"url":"#","enablelink":"1","type_background":"image_bg","background":"catalog/bt_parallax/slide2.jpg","transitions":"slideup","slotamount":"7","masterspeed":"500","delay":"5000","target":"_self","kenburns":"on","enablefullvideo":"0"}', 'null'),
(22, 21, 1, 0, '{"url":"#","enablelink":"0","type_background":"image_bg","background":"catalog/bt_parallax/slide3.jpg","transitions":"slideup","slotamount":"7","masterspeed":"500","delay":"5000","target":"_self","kenburns":"on","enablefullvideo":"0"}', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `oc_stock_status`
--

CREATE TABLE IF NOT EXISTS `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(5, 1, 'Out Of Stock'),
(6, 1, '2-3 Days'),
(7, 1, 'In Stock'),
(8, 1, 'Pre-Order');

-- --------------------------------------------------------

--
-- Table structure for table `oc_store`
--

CREATE TABLE IF NOT EXISTS `oc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_subscribe`
--

CREATE TABLE IF NOT EXISTS `oc_subscribe` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_id` varchar(225) NOT NULL,
  `name` varchar(225) NOT NULL,
  `option1` varchar(225) NOT NULL,
  `option2` varchar(225) NOT NULL,
  `option3` varchar(225) NOT NULL,
  `option4` varchar(225) NOT NULL,
  `option5` varchar(225) NOT NULL,
  `option6` varchar(225) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_2` (`email_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_subscribe`
--

INSERT INTO `oc_subscribe` (`id`, `email_id`, `name`, `option1`, `option2`, `option3`, `option4`, `option5`, `option6`) VALUES
(1, 'test@yahoo.com', 'Put your email address here', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_class`
--

CREATE TABLE IF NOT EXISTS `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rule`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_tshirtdesign_order`
--

CREATE TABLE IF NOT EXISTS `oc_tshirtdesign_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_product_id` int(11) NOT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=89 ;

--
-- Dumping data for table `oc_tshirtdesign_order`
--

INSERT INTO `oc_tshirtdesign_order` (`id`, `order_product_id`, `options`) VALUES
(1, 38, '{"rowid":"8205af10baefc180b9cd7bd8bf42aac0","price":"1","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/10\\\\\\/\\\\\\/cart-front-1444223704.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/10\\\\\\/\\\\\\/cart-back-1444223704.png&quot;,&quot;left&quot;:&quot;uploaded\\\\\\/2015\\\\\\/10\\\\\\/\\\\\\/cart-left-1444223704.png&quot;,&quot;right&quot;:&quot;uploaded\\\\\\/2015\\\\\\/10\\\\\\/\\\\\\/cart-right-1444223704.png&quot;}","product_id":"50"}'),
(2, 39, '{"rowid":"9ce74e84425ecdf67060cdc259117802","price":"1","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/10\\\\\\/\\\\\\/cart-front-1444226267.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/10\\\\\\/\\\\\\/cart-back-1444226267.png&quot;,&quot;left&quot;:&quot;uploaded\\\\\\/2015\\\\\\/10\\\\\\/\\\\\\/cart-left-1444226267.png&quot;,&quot;right&quot;:&quot;uploaded\\\\\\/2015\\\\\\/10\\\\\\/\\\\\\/cart-right-1444226267.png&quot;}","product_id":"50"}'),
(3, 40, '{"rowid":"0bc6378212566a07bb95f15889dfc071","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/10\\\\\\/\\\\\\/cart-front-1444910693.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/10\\\\\\/\\\\\\/cart-back-1444910693.png&quot;}","product_id":"52"}'),
(4, 41, '{"rowid":"ac3e699bac59497d77b47feb7c2259c4","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/10\\\\\\/\\\\\\/cart-front-1446034697.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/10\\\\\\/\\\\\\/cart-back-1446034697.png&quot;}","options":[{"name":"Choose Size","type":"textlist","value":{"XL":"1"}}],"product_id":"52"}'),
(5, 42, '{"rowid":"e69add805a8a7bd8457fb59b519d8dbc","price":"2","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/10\\\\\\/\\\\\\/cart-front-1446200028.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/10\\\\\\/\\\\\\/cart-back-1446200028.png&quot;}","options":[{"name":"Choose Size","type":"textlist","value":{"XL":"1"}}],"product_id":"52"}'),
(6, 43, '{"rowid":"9cfa687688215cfdd9ec275636f06022","price":"2","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/10\\\\\\/\\\\\\/cart-front-1446200967.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/10\\\\\\/\\\\\\/cart-back-1446200967.png&quot;}","options":[{"name":"Choose Size","type":"textlist","value":{"XL":"1"}}],"product_id":"53"}'),
(7, 44, '{"rowid":"870013d860fd33f46e66ed060320cfb8","price":"1","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/10\\\\\\/\\\\\\/cart-front-1446201493.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/10\\\\\\/\\\\\\/cart-back-1446201493.png&quot;}","options":[{"name":"Choose Size","type":"textlist","value":{"XL":"1"}}],"product_id":"53"}'),
(8, 45, '{"rowid":"ee7e21c22d34e2b3c8a711f33fe0a341","price":"3","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/11\\\\\\/\\\\\\/cart-front-1446724022.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/11\\\\\\/\\\\\\/cart-back-1446724022.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"M":"1"}}],"product_id":"52"}'),
(9, 46, '{"rowid":"14ff3a1273ebfee97385f845405c79fb","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/11\\\\\\/\\\\\\/cart-front-1446715675.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/11\\\\\\/\\\\\\/cart-back-1446715675.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(10, 47, '{"rowid":"ab9985ad38046bdac2264408beee1650","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/11\\\\\\/\\\\\\/cart-front-1446628844.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/11\\\\\\/\\\\\\/cart-back-1446628844.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(11, 48, '{"rowid":"2a2637bd5583add31be9844519e6e0e4","price":"5","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/11\\\\\\/\\\\\\/cart-front-1447083873.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/11\\\\\\/\\\\\\/cart-back-1447083873.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(12, 49, '{"rowid":"cbd7dca604cc34e4d93d58fa250c92f3","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/11\\\\\\/\\\\\\/cart-front-1447117084.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/11\\\\\\/\\\\\\/cart-back-1447117084.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(13, 50, '{"rowid":"0b87fe0c7f09575fd04645bd4ac11787","price":"4","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/11\\\\\\/\\\\\\/cart-front-1447175652.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/11\\\\\\/\\\\\\/cart-back-1447175652.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"M":"1"}}],"product_id":"52"}'),
(14, 51, '{"rowid":"06bc1d31fe5acb94a489edcfa152e6e9","price":"0","quantity":"2","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/11\\\\\\/\\\\\\/cart-front-1448106118.png&quot;}","product_id":"60"}'),
(15, 52, '{"rowid":"76ec9fe9970ab4925e1ece024ddcd773","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/11\\\\\\/\\\\\\/cart-front-1448099775.png&quot;}","product_id":"60"}'),
(16, 53, '{"rowid":"82d80197bc5bf1aa99b9a17105f82781","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1448999004.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1448999004.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(17, 54, '{"rowid":"9d8a576488c5241a56ea57a18e135539","price":"3","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449505339.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449505339.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(18, 55, '{"rowid":"389b82a7c1ffe1985dfd37d5109d2166","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449511679.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449511679.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(19, 56, '{"rowid":"389b82a7c1ffe1985dfd37d5109d2166","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449511679.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449511679.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(20, 57, '{"rowid":"389b82a7c1ffe1985dfd37d5109d2166","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449511679.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449511679.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(21, 58, '{"rowid":"389b82a7c1ffe1985dfd37d5109d2166","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449511679.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449511679.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(22, 59, '{"rowid":"389b82a7c1ffe1985dfd37d5109d2166","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449511679.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449511679.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(23, 60, '{"rowid":"389b82a7c1ffe1985dfd37d5109d2166","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449511679.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449511679.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(24, 61, '{"rowid":"358705b0fdba4ca78bcb279f0491f22f","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449514362.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449514362.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(25, 62, '{"rowid":"358705b0fdba4ca78bcb279f0491f22f","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449514362.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449514362.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(26, 63, '{"rowid":"b0e9c901ba6db22bca6826fb5343c0d5","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449514961.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449514961.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(27, 64, '{"rowid":"be32c02071a293e825b4eac023471466","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449564772.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449564772.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(28, 65, '{"rowid":"17406f7b64a1d06b35c729c384365c0c","price":"4","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449585161.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449585161.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(29, 66, '{"rowid":"c89ab0b3fc80c37b0fdf99c2576bf04a","price":"4","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449593857.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449593857.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(30, 67, '{"rowid":"e824ef402db6c6d5517b7d8408269c6e","price":"4","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449594491.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449594491.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(31, 68, '{"rowid":"cb8883d6b63a6803e7b9207be9558555","price":"4","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449594741.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449594741.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(32, 69, '{"rowid":"b0e9c901ba6db22bca6826fb5343c0d5","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449514961.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449514961.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(33, 70, '{"rowid":"b0e9c901ba6db22bca6826fb5343c0d5","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449514961.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449514961.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(34, 71, '{"rowid":"b0e9c901ba6db22bca6826fb5343c0d5","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449514961.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449514961.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(35, 72, '{"rowid":"52b467049f25667fc002f8b751e6d0ab","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449662418.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449662418.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(36, 73, '{"rowid":"b0e9c901ba6db22bca6826fb5343c0d5","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449514961.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449514961.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(37, 74, '{"rowid":"1c014acdfbef0557e049221be65da47e","price":"4","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449664359.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449664359.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(38, 75, '{"rowid":"4d0a11027ace075bde7654864f6aec36","price":"3","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449686029.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449686029.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(39, 76, '{"rowid":"89e444642e86e87dbe9b095894353036","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449687169.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449687169.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(40, 77, '{"rowid":"51468b49ab2b5271a192c3003157f711","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449687298.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449687298.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(41, 78, '{"rowid":"51468b49ab2b5271a192c3003157f711","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449687298.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449687298.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(42, 79, '{"rowid":"05568aef12b5ea53ebc7f20dbb8d7a28","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449947728.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449947728.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(43, 80, '{"rowid":"51468b49ab2b5271a192c3003157f711","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449687298.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449687298.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(44, 81, '{"rowid":"51468b49ab2b5271a192c3003157f711","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449687298.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449687298.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(45, 82, '{"rowid":"f26d7ac607ae304b89cb4afadd025dd7","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449948712.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449948712.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(46, 83, '{"rowid":"f26d7ac607ae304b89cb4afadd025dd7","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449948712.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449948712.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(47, 84, '{"rowid":"b5b95c19085f7effc4cf0717f7071a60","price":"4","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449952646.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449952646.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(48, 85, '{"rowid":"e208a9bdc3e85fcf283135c959925383","price":"3","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449982534.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449982534.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(49, 86, '{"rowid":"e208a9bdc3e85fcf283135c959925383","price":"3","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1449982534.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1449982534.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(50, 87, '{"rowid":"5a353d0a4b31fcb0af26f56b52124c30","price":"3","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1450416376.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1450416376.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(51, 88, 'false'),
(52, 89, 'false'),
(53, 90, 'false'),
(54, 91, 'false'),
(55, 92, 'false'),
(56, 93, '{"rowid":"3c38a482b5dab7ddb9bbd114a2c06b44","price":"3","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1450791926.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1450791926.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(57, 94, 'false'),
(58, 95, '{"rowid":"52546faf5ca76943b95222459bac3b92","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1451111245.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1451111245.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(59, 96, '{"rowid":"c04d7051d41b01ac8acdb06dafeaf587","price":"3","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1451163461.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1451163461.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(60, 97, '{"rowid":"fb2dfca215f22eb578b678a57d378e61","price":"4","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1451163777.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1451163777.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(61, 98, 'false'),
(62, 99, 'false'),
(63, 100, 'false'),
(64, 101, 'false'),
(65, 102, 'false'),
(66, 103, 'false'),
(67, 104, 'false'),
(68, 105, '{"rowid":"cc4e4a89b53541f06f21d01750449f40","price":"3","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1451296416.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1451296416.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(69, 106, 'false'),
(70, 107, '{"rowid":"e35e9b44ac7f065ae59b964fb94dd1a2","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1451301538.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1451301538.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(71, 108, '{"rowid":"67975a68b619056fafdd8df86ad2a1dd","price":"0","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1451323971.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1451323971.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(72, 109, '{"rowid":"fb2dfca215f22eb578b678a57d378e61","price":"4","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1451163777.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1451163777.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(73, 110, 'false'),
(74, 111, 'false'),
(75, 112, '{"rowid":"1a1508f94f9395d1cf9d3af92d1b7253","price":"4","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1451329451.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1451329451.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(76, 113, 'false'),
(77, 114, '{"rowid":"f24758f77259e2ac5025c31b6f754b8e","price":"4","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1451376452.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1451376452.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(78, 115, 'false'),
(79, 116, 'false'),
(80, 117, 'false'),
(81, 118, 'false'),
(82, 119, 'false'),
(83, 120, 'false'),
(84, 121, '{"rowid":"3dcd67f046a4d5e1f975369c0d86b06e","price":"3","quantity":"30","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-front-1451398356.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2015\\\\\\/12\\\\\\/\\\\\\/cart-back-1451398356.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"10","M":"10","L":"10"}}],"product_id":"52"}'),
(85, 122, 'false'),
(86, 123, 'false'),
(87, 124, '{"rowid":"7895ebcf79ca21fdc125c875593c8eef","price":"4","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2016\\\\\\/01\\\\\\/\\\\\\/cart-front-1452590365.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2016\\\\\\/01\\\\\\/\\\\\\/cart-back-1452590365.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}'),
(88, 125, '{"rowid":"823e351f54008d30416ec8c78f4d89eb","price":"4","quantity":"1","color_hex":"FFFFFF","color_title":"White","images":"{&quot;front&quot;:&quot;uploaded\\\\\\/2016\\\\\\/01\\\\\\/\\\\\\/cart-front-1452594035.png&quot;,&quot;back&quot;:&quot;uploaded\\\\\\/2016\\\\\\/01\\\\\\/\\\\\\/cart-back-1452594035.png&quot;}","options":[{"name":"Size","type":"textlist","value":{"S":"1"}}],"product_id":"52"}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tshirtecommerce_clipart_use`
--

CREATE TABLE IF NOT EXISTS `oc_tshirtecommerce_clipart_use` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `clipart_id` bigint(20) NOT NULL,
  `clipart_title` varchar(255) NOT NULL,
  `clipart_thumb` varchar(500) NOT NULL,
  `order_key` varchar(500) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_upload`
--

CREATE TABLE IF NOT EXISTS `oc_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_upload`
--

INSERT INTO `oc_upload` (`upload_id`, `name`, `filename`, `code`, `date_added`) VALUES
(1, 'aichau-2-4219-1416022934.jpg', 'aichau-2-4219-1416022934.jpg.903f56f95a59b94cce635fb3d061856b', 'de5f0c32a905b735365f08fd2c70aefb389e32fc', '2014-11-19 14:40:17'),
(2, 'new.png', 'new.png.9065beffa600c83f19292b5e27ce09e9', '7ee0fd303db9af3a244c33b30f5325a964536d1f', '2014-11-19 14:40:29'),
(3, 'new  2.txt', 'new  2.txt.1403152e67f9fb938c811ea2b6c11eea', '570d933ddb07c4a7f7c97e0d4d7aa8c4e0d43c8f', '2014-11-19 14:40:47'),
(4, 'aichau-2-4219-1416022934.jpg', 'aichau-2-4219-1416022934.jpg.acff6fb6dff53999125267076cbd19dc', '87015ba57808460b0884da748bfd7e4a488124f6', '2014-11-20 13:53:01'),
(5, 'compare.png', 'compare.png.f60208b31d560a1ab9799f2cafbf366b', 'ca42b1049b5cbde9a399764e5ce2b511c24fc6d7', '2014-12-11 16:45:58'),
(6, 'compare.png', 'compare.png.227694112324e15545f7a812c961ef8c', '5e120a6250045fa7e7d24d74437f9520e28df91f', '2014-12-11 17:02:30');

-- --------------------------------------------------------

--
-- Table structure for table `oc_url_alias`
--

CREATE TABLE IF NOT EXISTS `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`),
  KEY `query` (`query`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1103 ;

--
-- Dumping data for table `oc_url_alias`
--

INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(1079, 'category_id=57', 'men'),
(786, 'category_id=17', 'software'),
(787, 'category_id=24', 'smartphone'),
(1086, 'information_id=6', 'delivery'),
(1087, 'information_id=3', 'privacy'),
(1088, 'information_id=5', 'terms'),
(1052, 'information_id=4', 'about_us'),
(1084, 'product_id=61', ''),
(1100, 'product_id=52', 'tshirt1'),
(1064, 'category_id=71', 'special-orders'),
(1060, 'category_id=64', 'mobilecases'),
(1062, 'category_id=63', 'mugs'),
(1065, 'category_id=67', 'stickers'),
(1061, 'category_id=70', 'most-popular'),
(1056, 'category_id=69', 'halloffame'),
(1054, 'category_id=66', 'buttons'),
(995, 'manufacturer_id=6', 'pres'),
(997, 'manufacturer_id=9', 'codespot'),
(998, 'manufacturer_id=8', 'bossthemes'),
(999, 'manufacturer_id=7', 'extreme'),
(1000, 'manufacturer_id=5', 'gala'),
(1001, 'manufacturer_id=10', 'design'),
(1002, 'manufacturer_id=11', 'wpdance'),
(1003, 'manufacturer_id=12', 'eggthemes'),
(1089, 'category_id=25', 'women'),
(1063, 'category_id=73', 'others'),
(1053, 'category_id=65', 'businesscard'),
(1070, 'category_id=72', 'design-color'),
(1057, 'category_id=68', 'keychains'),
(1069, 'category_id=60', 'kids'),
(1024, 'product_id=51', ''),
(1085, 'information_id=7', 'special-order'),
(1098, 'product_id=63', ''),
(1101, 'popular/clipart', 'popular-clipart'),
(1102, 'design_color/design_color', 'design_color');

-- --------------------------------------------------------

--
-- Table structure for table `oc_user`
--

CREATE TABLE IF NOT EXISTS `oc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `oc_user`
--

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'demo', '5d1fbc809caef7bc5c5e47c056a8d389b71e1b60', 'd1668e80a', 'Nine', 'Lives', 'gehad_hashim@hotmail.com', '', '', '41.187.32.38', 1, '2014-10-22 11:04:47'),
(2, 11, 'adminC', '9cb3557fd3a26b9abc2e0107c3cf0da6f435b2fd', '1df1edefe', 'Gihad ', 'Hashim', 'gehad_hashim@hotmail.com', '', '', '45.113.88.2', 1, '2015-12-31 04:51:56');

-- --------------------------------------------------------

--
-- Table structure for table `oc_user_group`
--

CREATE TABLE IF NOT EXISTS `oc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Top Administrator', 'a:2:{s:6:"access";a:221:{i:0;s:17:"bossblog/articles";i:1;s:17:"bossblog/category";i:2;s:16:"bossblog/comment";i:3;s:16:"bossblog/setting";i:4;s:21:"bossthemes/bossthemes";i:5;s:17:"catalog/attribute";i:6;s:23:"catalog/attribute_group";i:7;s:16:"catalog/category";i:8;s:16:"catalog/download";i:9;s:14:"catalog/filter";i:10;s:19:"catalog/information";i:11;s:20:"catalog/manufacturer";i:12;s:14:"catalog/option";i:13;s:15:"catalog/product";i:14;s:17:"catalog/recurring";i:15;s:14:"catalog/review";i:16;s:23:"catalog/tshirtecommerce";i:17;s:18:"common/column_left";i:18;s:18:"common/filemanager";i:19;s:11:"common/menu";i:20;s:14:"common/profile";i:21;s:12:"common/stats";i:22;s:13:"design/banner";i:23;s:13:"design/layout";i:24;s:14:"extension/feed";i:25;s:15:"extension/fraud";i:26;s:19:"extension/installer";i:27;s:22:"extension/modification";i:28;s:16:"extension/module";i:29;s:17:"extension/openbay";i:30;s:17:"extension/payment";i:31;s:18:"extension/shipping";i:32;s:15:"extension/total";i:33;s:16:"feed/google_base";i:34;s:19:"feed/google_sitemap";i:35;s:15:"feed/openbaypro";i:36;s:18:"fraud/fraudlabspro";i:37;s:13:"fraud/maxmind";i:38;s:20:"localisation/country";i:39;s:21:"localisation/currency";i:40;s:21:"localisation/geo_zone";i:41;s:21:"localisation/language";i:42;s:25:"localisation/length_class";i:43;s:21:"localisation/location";i:44;s:25:"localisation/order_status";i:45;s:26:"localisation/return_action";i:46;s:26:"localisation/return_reason";i:47;s:26:"localisation/return_status";i:48;s:25:"localisation/stock_status";i:49;s:22:"localisation/tax_class";i:50;s:21:"localisation/tax_rate";i:51;s:25:"localisation/weight_class";i:52;s:17:"localisation/zone";i:53;s:19:"marketing/affiliate";i:54;s:17:"marketing/contact";i:55;s:16:"marketing/coupon";i:56;s:19:"marketing/marketing";i:57;s:14:"module/account";i:58;s:16:"module/affiliate";i:59;s:20:"module/amazon_button";i:60;s:19:"module/amazon_login";i:61;s:17:"module/amazon_pay";i:62;s:13:"module/banner";i:63;s:17:"module/bestseller";i:64;s:19:"module/blogcategory";i:65;s:24:"module/blogrecentcomment";i:66;s:21:"module/blogrecentpost";i:67;s:17:"module/blogsearch";i:68;s:19:"module/blogtagcloud";i:69;s:20:"module/boss_alphabet";i:70;s:24:"module/boss_blogfeatured";i:71;s:20:"module/boss_carousel";i:72;s:20:"module/boss_category";i:73;s:20:"module/boss_featured";i:74;s:25:"module/boss_filterproduct";i:75;s:19:"module/boss_gallery";i:76;s:19:"module/boss_manager";i:77;s:24:"module/boss_manufacturer";i:78;s:23:"module/boss_newmegamenu";i:79;s:21:"module/boss_quickshop";i:80;s:28:"module/boss_revolutionslider";i:81;s:20:"module/boss_tagcloud";i:82;s:23:"module/boss_topcategory";i:83;s:16:"module/boss_zoom";i:84;s:15:"module/bossblog";i:85;s:15:"module/carousel";i:86;s:15:"module/category";i:87;s:19:"module/ebay_listing";i:88;s:18:"module/ebaydisplay";i:89;s:15:"module/featured";i:90;s:13:"module/filter";i:91;s:22:"module/google_hangouts";i:92;s:11:"module/html";i:93;s:18:"module/information";i:94;s:13:"module/latest";i:95;s:26:"module/newslettersubscribe";i:96;s:16:"module/pp_button";i:97;s:15:"module/pp_login";i:98;s:16:"module/slideshow";i:99;s:25:"module/social_media_login";i:100;s:14:"module/special";i:101;s:12:"module/store";i:102;s:22:"module/tshirtecommerce";i:103;s:18:"module/v2pagecache";i:104;s:14:"module/zlclite";i:105;s:14:"openbay/amazon";i:106;s:22:"openbay/amazon_listing";i:107;s:22:"openbay/amazon_product";i:108;s:16:"openbay/amazonus";i:109;s:24:"openbay/amazonus_listing";i:110;s:24:"openbay/amazonus_product";i:111;s:12:"openbay/ebay";i:112;s:20:"openbay/ebay_profile";i:113;s:21:"openbay/ebay_template";i:114;s:12:"openbay/etsy";i:115;s:20:"openbay/etsy_product";i:116;s:21:"openbay/etsy_shipping";i:117;s:17:"openbay/etsy_shop";i:118;s:23:"payment/amazon_checkout";i:119;s:24:"payment/amazon_login_pay";i:120;s:24:"payment/authorizenet_aim";i:121;s:24:"payment/authorizenet_sim";i:122;s:21:"payment/bank_transfer";i:123;s:22:"payment/bluepay_hosted";i:124;s:27:"payment/bluepay_hosted_form";i:125;s:24:"payment/bluepay_redirect";i:126;s:14:"payment/cheque";i:127;s:11:"payment/cod";i:128;s:17:"payment/firstdata";i:129;s:24:"payment/firstdata_remote";i:130;s:21:"payment/free_checkout";i:131;s:14:"payment/g2apay";i:132;s:17:"payment/globalpay";i:133;s:24:"payment/globalpay_remote";i:134;s:22:"payment/klarna_account";i:135;s:22:"payment/klarna_invoice";i:136;s:14:"payment/liqpay";i:137;s:20:"payment/moneybookers";i:138;s:14:"payment/nochex";i:139;s:15:"payment/paymate";i:140;s:16:"payment/paypoint";i:141;s:13:"payment/payza";i:142;s:26:"payment/perpetual_payments";i:143;s:18:"payment/pp_express";i:144;s:18:"payment/pp_payflow";i:145;s:25:"payment/pp_payflow_iframe";i:146;s:14:"payment/pp_pro";i:147;s:21:"payment/pp_pro_iframe";i:148;s:19:"payment/pp_standard";i:149;s:14:"payment/realex";i:150;s:21:"payment/realex_remote";i:151;s:22:"payment/sagepay_direct";i:152;s:22:"payment/sagepay_server";i:153;s:18:"payment/sagepay_us";i:154;s:24:"payment/securetrading_pp";i:155;s:24:"payment/securetrading_ws";i:156;s:14:"payment/skrill";i:157;s:19:"payment/twocheckout";i:158;s:28:"payment/web_payment_software";i:159;s:16:"payment/worldpay";i:160;s:16:"report/affiliate";i:161;s:25:"report/affiliate_activity";i:162;s:22:"report/affiliate_login";i:163;s:24:"report/customer_activity";i:164;s:22:"report/customer_credit";i:165;s:21:"report/customer_login";i:166;s:22:"report/customer_online";i:167;s:21:"report/customer_order";i:168;s:22:"report/customer_reward";i:169;s:16:"report/marketing";i:170;s:24:"report/product_purchased";i:171;s:21:"report/product_viewed";i:172;s:18:"report/sale_coupon";i:173;s:17:"report/sale_order";i:174;s:18:"report/sale_return";i:175;s:20:"report/sale_shipping";i:176;s:15:"report/sale_tax";i:177;s:17:"sale/custom_field";i:178;s:13:"sale/customer";i:179;s:20:"sale/customer_ban_ip";i:180;s:19:"sale/customer_group";i:181;s:22:"sale/halloffame_coupon";i:182;s:20:"sale/newssubscribers";i:183;s:10:"sale/order";i:184;s:20:"sale/popular_clipart";i:185;s:14:"sale/recurring";i:186;s:11:"sale/return";i:187;s:12:"sale/voucher";i:188;s:18:"sale/voucher_theme";i:189;s:15:"setting/setting";i:190;s:13:"setting/store";i:191;s:16:"shipping/auspost";i:192;s:17:"shipping/citylink";i:193;s:14:"shipping/fedex";i:194;s:13:"shipping/flat";i:195;s:13:"shipping/free";i:196;s:27:"shipping/individualshipping";i:197;s:13:"shipping/item";i:198;s:23:"shipping/parcelforce_48";i:199;s:15:"shipping/pickup";i:200;s:19:"shipping/royal_mail";i:201;s:12:"shipping/ups";i:202;s:13:"shipping/usps";i:203;s:15:"shipping/weight";i:204;s:11:"tool/backup";i:205;s:14:"tool/error_log";i:206;s:11:"tool/upload";i:207;s:12:"total/coupon";i:208;s:12:"total/credit";i:209;s:14:"total/handling";i:210;s:16:"total/klarna_fee";i:211;s:19:"total/low_order_fee";i:212;s:12:"total/reward";i:213;s:14:"total/shipping";i:214;s:15:"total/sub_total";i:215;s:9:"total/tax";i:216;s:11:"total/total";i:217;s:13:"total/voucher";i:218;s:8:"user/api";i:219;s:9:"user/user";i:220;s:20:"user/user_permission";}s:6:"modify";a:221:{i:0;s:17:"bossblog/articles";i:1;s:17:"bossblog/category";i:2;s:16:"bossblog/comment";i:3;s:16:"bossblog/setting";i:4;s:21:"bossthemes/bossthemes";i:5;s:17:"catalog/attribute";i:6;s:23:"catalog/attribute_group";i:7;s:16:"catalog/category";i:8;s:16:"catalog/download";i:9;s:14:"catalog/filter";i:10;s:19:"catalog/information";i:11;s:20:"catalog/manufacturer";i:12;s:14:"catalog/option";i:13;s:15:"catalog/product";i:14;s:17:"catalog/recurring";i:15;s:14:"catalog/review";i:16;s:23:"catalog/tshirtecommerce";i:17;s:18:"common/column_left";i:18;s:18:"common/filemanager";i:19;s:11:"common/menu";i:20;s:14:"common/profile";i:21;s:12:"common/stats";i:22;s:13:"design/banner";i:23;s:13:"design/layout";i:24;s:14:"extension/feed";i:25;s:15:"extension/fraud";i:26;s:19:"extension/installer";i:27;s:22:"extension/modification";i:28;s:16:"extension/module";i:29;s:17:"extension/openbay";i:30;s:17:"extension/payment";i:31;s:18:"extension/shipping";i:32;s:15:"extension/total";i:33;s:16:"feed/google_base";i:34;s:19:"feed/google_sitemap";i:35;s:15:"feed/openbaypro";i:36;s:18:"fraud/fraudlabspro";i:37;s:13:"fraud/maxmind";i:38;s:20:"localisation/country";i:39;s:21:"localisation/currency";i:40;s:21:"localisation/geo_zone";i:41;s:21:"localisation/language";i:42;s:25:"localisation/length_class";i:43;s:21:"localisation/location";i:44;s:25:"localisation/order_status";i:45;s:26:"localisation/return_action";i:46;s:26:"localisation/return_reason";i:47;s:26:"localisation/return_status";i:48;s:25:"localisation/stock_status";i:49;s:22:"localisation/tax_class";i:50;s:21:"localisation/tax_rate";i:51;s:25:"localisation/weight_class";i:52;s:17:"localisation/zone";i:53;s:19:"marketing/affiliate";i:54;s:17:"marketing/contact";i:55;s:16:"marketing/coupon";i:56;s:19:"marketing/marketing";i:57;s:14:"module/account";i:58;s:16:"module/affiliate";i:59;s:20:"module/amazon_button";i:60;s:19:"module/amazon_login";i:61;s:17:"module/amazon_pay";i:62;s:13:"module/banner";i:63;s:17:"module/bestseller";i:64;s:19:"module/blogcategory";i:65;s:24:"module/blogrecentcomment";i:66;s:21:"module/blogrecentpost";i:67;s:17:"module/blogsearch";i:68;s:19:"module/blogtagcloud";i:69;s:20:"module/boss_alphabet";i:70;s:24:"module/boss_blogfeatured";i:71;s:20:"module/boss_carousel";i:72;s:20:"module/boss_category";i:73;s:20:"module/boss_featured";i:74;s:25:"module/boss_filterproduct";i:75;s:19:"module/boss_gallery";i:76;s:19:"module/boss_manager";i:77;s:24:"module/boss_manufacturer";i:78;s:23:"module/boss_newmegamenu";i:79;s:21:"module/boss_quickshop";i:80;s:28:"module/boss_revolutionslider";i:81;s:20:"module/boss_tagcloud";i:82;s:23:"module/boss_topcategory";i:83;s:16:"module/boss_zoom";i:84;s:15:"module/bossblog";i:85;s:15:"module/carousel";i:86;s:15:"module/category";i:87;s:19:"module/ebay_listing";i:88;s:18:"module/ebaydisplay";i:89;s:15:"module/featured";i:90;s:13:"module/filter";i:91;s:22:"module/google_hangouts";i:92;s:11:"module/html";i:93;s:18:"module/information";i:94;s:13:"module/latest";i:95;s:26:"module/newslettersubscribe";i:96;s:16:"module/pp_button";i:97;s:15:"module/pp_login";i:98;s:16:"module/slideshow";i:99;s:25:"module/social_media_login";i:100;s:14:"module/special";i:101;s:12:"module/store";i:102;s:22:"module/tshirtecommerce";i:103;s:18:"module/v2pagecache";i:104;s:14:"module/zlclite";i:105;s:14:"openbay/amazon";i:106;s:22:"openbay/amazon_listing";i:107;s:22:"openbay/amazon_product";i:108;s:16:"openbay/amazonus";i:109;s:24:"openbay/amazonus_listing";i:110;s:24:"openbay/amazonus_product";i:111;s:12:"openbay/ebay";i:112;s:20:"openbay/ebay_profile";i:113;s:21:"openbay/ebay_template";i:114;s:12:"openbay/etsy";i:115;s:20:"openbay/etsy_product";i:116;s:21:"openbay/etsy_shipping";i:117;s:17:"openbay/etsy_shop";i:118;s:23:"payment/amazon_checkout";i:119;s:24:"payment/amazon_login_pay";i:120;s:24:"payment/authorizenet_aim";i:121;s:24:"payment/authorizenet_sim";i:122;s:21:"payment/bank_transfer";i:123;s:22:"payment/bluepay_hosted";i:124;s:27:"payment/bluepay_hosted_form";i:125;s:24:"payment/bluepay_redirect";i:126;s:14:"payment/cheque";i:127;s:11:"payment/cod";i:128;s:17:"payment/firstdata";i:129;s:24:"payment/firstdata_remote";i:130;s:21:"payment/free_checkout";i:131;s:14:"payment/g2apay";i:132;s:17:"payment/globalpay";i:133;s:24:"payment/globalpay_remote";i:134;s:22:"payment/klarna_account";i:135;s:22:"payment/klarna_invoice";i:136;s:14:"payment/liqpay";i:137;s:20:"payment/moneybookers";i:138;s:14:"payment/nochex";i:139;s:15:"payment/paymate";i:140;s:16:"payment/paypoint";i:141;s:13:"payment/payza";i:142;s:26:"payment/perpetual_payments";i:143;s:18:"payment/pp_express";i:144;s:18:"payment/pp_payflow";i:145;s:25:"payment/pp_payflow_iframe";i:146;s:14:"payment/pp_pro";i:147;s:21:"payment/pp_pro_iframe";i:148;s:19:"payment/pp_standard";i:149;s:14:"payment/realex";i:150;s:21:"payment/realex_remote";i:151;s:22:"payment/sagepay_direct";i:152;s:22:"payment/sagepay_server";i:153;s:18:"payment/sagepay_us";i:154;s:24:"payment/securetrading_pp";i:155;s:24:"payment/securetrading_ws";i:156;s:14:"payment/skrill";i:157;s:19:"payment/twocheckout";i:158;s:28:"payment/web_payment_software";i:159;s:16:"payment/worldpay";i:160;s:16:"report/affiliate";i:161;s:25:"report/affiliate_activity";i:162;s:22:"report/affiliate_login";i:163;s:24:"report/customer_activity";i:164;s:22:"report/customer_credit";i:165;s:21:"report/customer_login";i:166;s:22:"report/customer_online";i:167;s:21:"report/customer_order";i:168;s:22:"report/customer_reward";i:169;s:16:"report/marketing";i:170;s:24:"report/product_purchased";i:171;s:21:"report/product_viewed";i:172;s:18:"report/sale_coupon";i:173;s:17:"report/sale_order";i:174;s:18:"report/sale_return";i:175;s:20:"report/sale_shipping";i:176;s:15:"report/sale_tax";i:177;s:17:"sale/custom_field";i:178;s:13:"sale/customer";i:179;s:20:"sale/customer_ban_ip";i:180;s:19:"sale/customer_group";i:181;s:22:"sale/halloffame_coupon";i:182;s:20:"sale/newssubscribers";i:183;s:10:"sale/order";i:184;s:20:"sale/popular_clipart";i:185;s:14:"sale/recurring";i:186;s:11:"sale/return";i:187;s:12:"sale/voucher";i:188;s:18:"sale/voucher_theme";i:189;s:15:"setting/setting";i:190;s:13:"setting/store";i:191;s:16:"shipping/auspost";i:192;s:17:"shipping/citylink";i:193;s:14:"shipping/fedex";i:194;s:13:"shipping/flat";i:195;s:13:"shipping/free";i:196;s:27:"shipping/individualshipping";i:197;s:13:"shipping/item";i:198;s:23:"shipping/parcelforce_48";i:199;s:15:"shipping/pickup";i:200;s:19:"shipping/royal_mail";i:201;s:12:"shipping/ups";i:202;s:13:"shipping/usps";i:203;s:15:"shipping/weight";i:204;s:11:"tool/backup";i:205;s:14:"tool/error_log";i:206;s:11:"tool/upload";i:207;s:12:"total/coupon";i:208;s:12:"total/credit";i:209;s:14:"total/handling";i:210;s:16:"total/klarna_fee";i:211;s:19:"total/low_order_fee";i:212;s:12:"total/reward";i:213;s:14:"total/shipping";i:214;s:15:"total/sub_total";i:215;s:9:"total/tax";i:216;s:11:"total/total";i:217;s:13:"total/voucher";i:218;s:8:"user/api";i:219;s:9:"user/user";i:220;s:20:"user/user_permission";}}'),
(10, 'Demonstration', 'a:2:{s:6:"access";a:217:{i:0;s:17:"bossblog/articles";i:1;s:17:"bossblog/category";i:2;s:16:"bossblog/comment";i:3;s:16:"bossblog/setting";i:4;s:21:"bossthemes/bossthemes";i:5;s:17:"catalog/attribute";i:6;s:23:"catalog/attribute_group";i:7;s:16:"catalog/category";i:8;s:16:"catalog/download";i:9;s:14:"catalog/filter";i:10;s:19:"catalog/information";i:11;s:20:"catalog/manufacturer";i:12;s:14:"catalog/option";i:13;s:15:"catalog/product";i:14;s:17:"catalog/recurring";i:15;s:14:"catalog/review";i:16;s:23:"catalog/tshirtecommerce";i:17;s:18:"common/column_left";i:18;s:18:"common/filemanager";i:19;s:11:"common/menu";i:20;s:14:"common/profile";i:21;s:12:"common/stats";i:22;s:13:"design/banner";i:23;s:13:"design/layout";i:24;s:14:"extension/feed";i:25;s:15:"extension/fraud";i:26;s:19:"extension/installer";i:27;s:22:"extension/modification";i:28;s:16:"extension/module";i:29;s:17:"extension/openbay";i:30;s:17:"extension/payment";i:31;s:18:"extension/shipping";i:32;s:15:"extension/total";i:33;s:16:"feed/google_base";i:34;s:19:"feed/google_sitemap";i:35;s:15:"feed/openbaypro";i:36;s:18:"fraud/fraudlabspro";i:37;s:13:"fraud/maxmind";i:38;s:20:"localisation/country";i:39;s:21:"localisation/currency";i:40;s:21:"localisation/geo_zone";i:41;s:21:"localisation/language";i:42;s:25:"localisation/length_class";i:43;s:21:"localisation/location";i:44;s:25:"localisation/order_status";i:45;s:26:"localisation/return_action";i:46;s:26:"localisation/return_reason";i:47;s:26:"localisation/return_status";i:48;s:25:"localisation/stock_status";i:49;s:22:"localisation/tax_class";i:50;s:21:"localisation/tax_rate";i:51;s:25:"localisation/weight_class";i:52;s:17:"localisation/zone";i:53;s:19:"marketing/affiliate";i:54;s:17:"marketing/contact";i:55;s:16:"marketing/coupon";i:56;s:19:"marketing/marketing";i:57;s:14:"module/account";i:58;s:16:"module/affiliate";i:59;s:20:"module/amazon_button";i:60;s:19:"module/amazon_login";i:61;s:17:"module/amazon_pay";i:62;s:13:"module/banner";i:63;s:17:"module/bestseller";i:64;s:19:"module/blogcategory";i:65;s:24:"module/blogrecentcomment";i:66;s:21:"module/blogrecentpost";i:67;s:17:"module/blogsearch";i:68;s:19:"module/blogtagcloud";i:69;s:20:"module/boss_alphabet";i:70;s:24:"module/boss_blogfeatured";i:71;s:20:"module/boss_carousel";i:72;s:20:"module/boss_category";i:73;s:20:"module/boss_featured";i:74;s:25:"module/boss_filterproduct";i:75;s:19:"module/boss_gallery";i:76;s:19:"module/boss_manager";i:77;s:24:"module/boss_manufacturer";i:78;s:23:"module/boss_newmegamenu";i:79;s:21:"module/boss_quickshop";i:80;s:28:"module/boss_revolutionslider";i:81;s:20:"module/boss_tagcloud";i:82;s:23:"module/boss_topcategory";i:83;s:16:"module/boss_zoom";i:84;s:15:"module/bossblog";i:85;s:15:"module/carousel";i:86;s:15:"module/category";i:87;s:19:"module/ebay_listing";i:88;s:18:"module/ebaydisplay";i:89;s:15:"module/featured";i:90;s:13:"module/filter";i:91;s:22:"module/google_hangouts";i:92;s:11:"module/html";i:93;s:18:"module/information";i:94;s:13:"module/latest";i:95;s:26:"module/newslettersubscribe";i:96;s:16:"module/pp_button";i:97;s:15:"module/pp_login";i:98;s:16:"module/slideshow";i:99;s:14:"module/special";i:100;s:12:"module/store";i:101;s:22:"module/tshirtecommerce";i:102;s:18:"module/v2pagecache";i:103;s:14:"module/zlclite";i:104;s:14:"openbay/amazon";i:105;s:22:"openbay/amazon_listing";i:106;s:22:"openbay/amazon_product";i:107;s:16:"openbay/amazonus";i:108;s:24:"openbay/amazonus_listing";i:109;s:24:"openbay/amazonus_product";i:110;s:12:"openbay/ebay";i:111;s:20:"openbay/ebay_profile";i:112;s:21:"openbay/ebay_template";i:113;s:12:"openbay/etsy";i:114;s:20:"openbay/etsy_product";i:115;s:21:"openbay/etsy_shipping";i:116;s:17:"openbay/etsy_shop";i:117;s:23:"payment/amazon_checkout";i:118;s:24:"payment/amazon_login_pay";i:119;s:24:"payment/authorizenet_aim";i:120;s:24:"payment/authorizenet_sim";i:121;s:21:"payment/bank_transfer";i:122;s:22:"payment/bluepay_hosted";i:123;s:27:"payment/bluepay_hosted_form";i:124;s:24:"payment/bluepay_redirect";i:125;s:14:"payment/cheque";i:126;s:11:"payment/cod";i:127;s:17:"payment/firstdata";i:128;s:24:"payment/firstdata_remote";i:129;s:21:"payment/free_checkout";i:130;s:14:"payment/g2apay";i:131;s:17:"payment/globalpay";i:132;s:24:"payment/globalpay_remote";i:133;s:22:"payment/klarna_account";i:134;s:22:"payment/klarna_invoice";i:135;s:14:"payment/liqpay";i:136;s:20:"payment/moneybookers";i:137;s:14:"payment/nochex";i:138;s:15:"payment/paymate";i:139;s:16:"payment/paypoint";i:140;s:13:"payment/payza";i:141;s:26:"payment/perpetual_payments";i:142;s:18:"payment/pp_express";i:143;s:18:"payment/pp_payflow";i:144;s:25:"payment/pp_payflow_iframe";i:145;s:14:"payment/pp_pro";i:146;s:21:"payment/pp_pro_iframe";i:147;s:19:"payment/pp_standard";i:148;s:14:"payment/realex";i:149;s:21:"payment/realex_remote";i:150;s:22:"payment/sagepay_direct";i:151;s:22:"payment/sagepay_server";i:152;s:18:"payment/sagepay_us";i:153;s:24:"payment/securetrading_pp";i:154;s:24:"payment/securetrading_ws";i:155;s:14:"payment/skrill";i:156;s:19:"payment/twocheckout";i:157;s:28:"payment/web_payment_software";i:158;s:16:"payment/worldpay";i:159;s:16:"report/affiliate";i:160;s:25:"report/affiliate_activity";i:161;s:22:"report/affiliate_login";i:162;s:24:"report/customer_activity";i:163;s:22:"report/customer_credit";i:164;s:21:"report/customer_login";i:165;s:22:"report/customer_online";i:166;s:21:"report/customer_order";i:167;s:22:"report/customer_reward";i:168;s:16:"report/marketing";i:169;s:24:"report/product_purchased";i:170;s:21:"report/product_viewed";i:171;s:18:"report/sale_coupon";i:172;s:17:"report/sale_order";i:173;s:18:"report/sale_return";i:174;s:20:"report/sale_shipping";i:175;s:15:"report/sale_tax";i:176;s:17:"sale/custom_field";i:177;s:13:"sale/customer";i:178;s:20:"sale/customer_ban_ip";i:179;s:19:"sale/customer_group";i:180;s:20:"sale/newssubscribers";i:181;s:10:"sale/order";i:182;s:14:"sale/recurring";i:183;s:11:"sale/return";i:184;s:12:"sale/voucher";i:185;s:18:"sale/voucher_theme";i:186;s:15:"setting/setting";i:187;s:13:"setting/store";i:188;s:16:"shipping/auspost";i:189;s:17:"shipping/citylink";i:190;s:14:"shipping/fedex";i:191;s:13:"shipping/flat";i:192;s:13:"shipping/free";i:193;s:13:"shipping/item";i:194;s:23:"shipping/parcelforce_48";i:195;s:15:"shipping/pickup";i:196;s:19:"shipping/royal_mail";i:197;s:12:"shipping/ups";i:198;s:13:"shipping/usps";i:199;s:15:"shipping/weight";i:200;s:11:"tool/backup";i:201;s:14:"tool/error_log";i:202;s:11:"tool/upload";i:203;s:12:"total/coupon";i:204;s:12:"total/credit";i:205;s:14:"total/handling";i:206;s:16:"total/klarna_fee";i:207;s:19:"total/low_order_fee";i:208;s:12:"total/reward";i:209;s:14:"total/shipping";i:210;s:15:"total/sub_total";i:211;s:9:"total/tax";i:212;s:11:"total/total";i:213;s:13:"total/voucher";i:214;s:8:"user/api";i:215;s:9:"user/user";i:216;s:20:"user/user_permission";}s:6:"modify";a:217:{i:0;s:17:"bossblog/articles";i:1;s:17:"bossblog/category";i:2;s:16:"bossblog/comment";i:3;s:16:"bossblog/setting";i:4;s:21:"bossthemes/bossthemes";i:5;s:17:"catalog/attribute";i:6;s:23:"catalog/attribute_group";i:7;s:16:"catalog/category";i:8;s:16:"catalog/download";i:9;s:14:"catalog/filter";i:10;s:19:"catalog/information";i:11;s:20:"catalog/manufacturer";i:12;s:14:"catalog/option";i:13;s:15:"catalog/product";i:14;s:17:"catalog/recurring";i:15;s:14:"catalog/review";i:16;s:23:"catalog/tshirtecommerce";i:17;s:18:"common/column_left";i:18;s:18:"common/filemanager";i:19;s:11:"common/menu";i:20;s:14:"common/profile";i:21;s:12:"common/stats";i:22;s:13:"design/banner";i:23;s:13:"design/layout";i:24;s:14:"extension/feed";i:25;s:15:"extension/fraud";i:26;s:19:"extension/installer";i:27;s:22:"extension/modification";i:28;s:16:"extension/module";i:29;s:17:"extension/openbay";i:30;s:17:"extension/payment";i:31;s:18:"extension/shipping";i:32;s:15:"extension/total";i:33;s:16:"feed/google_base";i:34;s:19:"feed/google_sitemap";i:35;s:15:"feed/openbaypro";i:36;s:18:"fraud/fraudlabspro";i:37;s:13:"fraud/maxmind";i:38;s:20:"localisation/country";i:39;s:21:"localisation/currency";i:40;s:21:"localisation/geo_zone";i:41;s:21:"localisation/language";i:42;s:25:"localisation/length_class";i:43;s:21:"localisation/location";i:44;s:25:"localisation/order_status";i:45;s:26:"localisation/return_action";i:46;s:26:"localisation/return_reason";i:47;s:26:"localisation/return_status";i:48;s:25:"localisation/stock_status";i:49;s:22:"localisation/tax_class";i:50;s:21:"localisation/tax_rate";i:51;s:25:"localisation/weight_class";i:52;s:17:"localisation/zone";i:53;s:19:"marketing/affiliate";i:54;s:17:"marketing/contact";i:55;s:16:"marketing/coupon";i:56;s:19:"marketing/marketing";i:57;s:14:"module/account";i:58;s:16:"module/affiliate";i:59;s:20:"module/amazon_button";i:60;s:19:"module/amazon_login";i:61;s:17:"module/amazon_pay";i:62;s:13:"module/banner";i:63;s:17:"module/bestseller";i:64;s:19:"module/blogcategory";i:65;s:24:"module/blogrecentcomment";i:66;s:21:"module/blogrecentpost";i:67;s:17:"module/blogsearch";i:68;s:19:"module/blogtagcloud";i:69;s:20:"module/boss_alphabet";i:70;s:24:"module/boss_blogfeatured";i:71;s:20:"module/boss_carousel";i:72;s:20:"module/boss_category";i:73;s:20:"module/boss_featured";i:74;s:25:"module/boss_filterproduct";i:75;s:19:"module/boss_gallery";i:76;s:19:"module/boss_manager";i:77;s:24:"module/boss_manufacturer";i:78;s:23:"module/boss_newmegamenu";i:79;s:21:"module/boss_quickshop";i:80;s:28:"module/boss_revolutionslider";i:81;s:20:"module/boss_tagcloud";i:82;s:23:"module/boss_topcategory";i:83;s:16:"module/boss_zoom";i:84;s:15:"module/bossblog";i:85;s:15:"module/carousel";i:86;s:15:"module/category";i:87;s:19:"module/ebay_listing";i:88;s:18:"module/ebaydisplay";i:89;s:15:"module/featured";i:90;s:13:"module/filter";i:91;s:22:"module/google_hangouts";i:92;s:11:"module/html";i:93;s:18:"module/information";i:94;s:13:"module/latest";i:95;s:26:"module/newslettersubscribe";i:96;s:16:"module/pp_button";i:97;s:15:"module/pp_login";i:98;s:16:"module/slideshow";i:99;s:14:"module/special";i:100;s:12:"module/store";i:101;s:22:"module/tshirtecommerce";i:102;s:18:"module/v2pagecache";i:103;s:14:"module/zlclite";i:104;s:14:"openbay/amazon";i:105;s:22:"openbay/amazon_listing";i:106;s:22:"openbay/amazon_product";i:107;s:16:"openbay/amazonus";i:108;s:24:"openbay/amazonus_listing";i:109;s:24:"openbay/amazonus_product";i:110;s:12:"openbay/ebay";i:111;s:20:"openbay/ebay_profile";i:112;s:21:"openbay/ebay_template";i:113;s:12:"openbay/etsy";i:114;s:20:"openbay/etsy_product";i:115;s:21:"openbay/etsy_shipping";i:116;s:17:"openbay/etsy_shop";i:117;s:23:"payment/amazon_checkout";i:118;s:24:"payment/amazon_login_pay";i:119;s:24:"payment/authorizenet_aim";i:120;s:24:"payment/authorizenet_sim";i:121;s:21:"payment/bank_transfer";i:122;s:22:"payment/bluepay_hosted";i:123;s:27:"payment/bluepay_hosted_form";i:124;s:24:"payment/bluepay_redirect";i:125;s:14:"payment/cheque";i:126;s:11:"payment/cod";i:127;s:17:"payment/firstdata";i:128;s:24:"payment/firstdata_remote";i:129;s:21:"payment/free_checkout";i:130;s:14:"payment/g2apay";i:131;s:17:"payment/globalpay";i:132;s:24:"payment/globalpay_remote";i:133;s:22:"payment/klarna_account";i:134;s:22:"payment/klarna_invoice";i:135;s:14:"payment/liqpay";i:136;s:20:"payment/moneybookers";i:137;s:14:"payment/nochex";i:138;s:15:"payment/paymate";i:139;s:16:"payment/paypoint";i:140;s:13:"payment/payza";i:141;s:26:"payment/perpetual_payments";i:142;s:18:"payment/pp_express";i:143;s:18:"payment/pp_payflow";i:144;s:25:"payment/pp_payflow_iframe";i:145;s:14:"payment/pp_pro";i:146;s:21:"payment/pp_pro_iframe";i:147;s:19:"payment/pp_standard";i:148;s:14:"payment/realex";i:149;s:21:"payment/realex_remote";i:150;s:22:"payment/sagepay_direct";i:151;s:22:"payment/sagepay_server";i:152;s:18:"payment/sagepay_us";i:153;s:24:"payment/securetrading_pp";i:154;s:24:"payment/securetrading_ws";i:155;s:14:"payment/skrill";i:156;s:19:"payment/twocheckout";i:157;s:28:"payment/web_payment_software";i:158;s:16:"payment/worldpay";i:159;s:16:"report/affiliate";i:160;s:25:"report/affiliate_activity";i:161;s:22:"report/affiliate_login";i:162;s:24:"report/customer_activity";i:163;s:22:"report/customer_credit";i:164;s:21:"report/customer_login";i:165;s:22:"report/customer_online";i:166;s:21:"report/customer_order";i:167;s:22:"report/customer_reward";i:168;s:16:"report/marketing";i:169;s:24:"report/product_purchased";i:170;s:21:"report/product_viewed";i:171;s:18:"report/sale_coupon";i:172;s:17:"report/sale_order";i:173;s:18:"report/sale_return";i:174;s:20:"report/sale_shipping";i:175;s:15:"report/sale_tax";i:176;s:17:"sale/custom_field";i:177;s:13:"sale/customer";i:178;s:20:"sale/customer_ban_ip";i:179;s:19:"sale/customer_group";i:180;s:20:"sale/newssubscribers";i:181;s:10:"sale/order";i:182;s:14:"sale/recurring";i:183;s:11:"sale/return";i:184;s:12:"sale/voucher";i:185;s:18:"sale/voucher_theme";i:186;s:15:"setting/setting";i:187;s:13:"setting/store";i:188;s:16:"shipping/auspost";i:189;s:17:"shipping/citylink";i:190;s:14:"shipping/fedex";i:191;s:13:"shipping/flat";i:192;s:13:"shipping/free";i:193;s:13:"shipping/item";i:194;s:23:"shipping/parcelforce_48";i:195;s:15:"shipping/pickup";i:196;s:19:"shipping/royal_mail";i:197;s:12:"shipping/ups";i:198;s:13:"shipping/usps";i:199;s:15:"shipping/weight";i:200;s:11:"tool/backup";i:201;s:14:"tool/error_log";i:202;s:11:"tool/upload";i:203;s:12:"total/coupon";i:204;s:12:"total/credit";i:205;s:14:"total/handling";i:206;s:16:"total/klarna_fee";i:207;s:19:"total/low_order_fee";i:208;s:12:"total/reward";i:209;s:14:"total/shipping";i:210;s:15:"total/sub_total";i:211;s:9:"total/tax";i:212;s:11:"total/total";i:213;s:13:"total/voucher";i:214;s:8:"user/api";i:215;s:9:"user/user";i:216;s:20:"user/user_permission";}}'),
(11, 'Admin', 'a:2:{s:6:"access";a:218:{i:0;s:17:"bossblog/articles";i:1;s:17:"bossblog/category";i:2;s:16:"bossblog/comment";i:3;s:16:"bossblog/setting";i:4;s:21:"bossthemes/bossthemes";i:5;s:17:"catalog/attribute";i:6;s:23:"catalog/attribute_group";i:7;s:16:"catalog/category";i:8;s:16:"catalog/download";i:9;s:14:"catalog/filter";i:10;s:19:"catalog/information";i:11;s:20:"catalog/manufacturer";i:12;s:14:"catalog/option";i:13;s:15:"catalog/product";i:14;s:17:"catalog/recurring";i:15;s:14:"catalog/review";i:16;s:23:"catalog/tshirtecommerce";i:17;s:18:"common/column_left";i:18;s:18:"common/filemanager";i:19;s:11:"common/menu";i:20;s:14:"common/profile";i:21;s:12:"common/stats";i:22;s:13:"design/banner";i:23;s:13:"design/layout";i:24;s:14:"extension/feed";i:25;s:15:"extension/fraud";i:26;s:19:"extension/installer";i:27;s:22:"extension/modification";i:28;s:16:"extension/module";i:29;s:17:"extension/openbay";i:30;s:17:"extension/payment";i:31;s:18:"extension/shipping";i:32;s:15:"extension/total";i:33;s:16:"feed/google_base";i:34;s:19:"feed/google_sitemap";i:35;s:15:"feed/openbaypro";i:36;s:18:"fraud/fraudlabspro";i:37;s:13:"fraud/maxmind";i:38;s:20:"localisation/country";i:39;s:21:"localisation/currency";i:40;s:21:"localisation/geo_zone";i:41;s:21:"localisation/language";i:42;s:25:"localisation/length_class";i:43;s:21:"localisation/location";i:44;s:25:"localisation/order_status";i:45;s:26:"localisation/return_action";i:46;s:26:"localisation/return_reason";i:47;s:26:"localisation/return_status";i:48;s:25:"localisation/stock_status";i:49;s:22:"localisation/tax_class";i:50;s:21:"localisation/tax_rate";i:51;s:25:"localisation/weight_class";i:52;s:17:"localisation/zone";i:53;s:19:"marketing/affiliate";i:54;s:17:"marketing/contact";i:55;s:19:"marketing/marketing";i:56;s:14:"module/account";i:57;s:16:"module/affiliate";i:58;s:20:"module/amazon_button";i:59;s:19:"module/amazon_login";i:60;s:17:"module/amazon_pay";i:61;s:13:"module/banner";i:62;s:17:"module/bestseller";i:63;s:19:"module/blogcategory";i:64;s:24:"module/blogrecentcomment";i:65;s:21:"module/blogrecentpost";i:66;s:17:"module/blogsearch";i:67;s:19:"module/blogtagcloud";i:68;s:20:"module/boss_alphabet";i:69;s:24:"module/boss_blogfeatured";i:70;s:20:"module/boss_carousel";i:71;s:20:"module/boss_category";i:72;s:20:"module/boss_featured";i:73;s:25:"module/boss_filterproduct";i:74;s:19:"module/boss_gallery";i:75;s:19:"module/boss_manager";i:76;s:24:"module/boss_manufacturer";i:77;s:23:"module/boss_newmegamenu";i:78;s:21:"module/boss_quickshop";i:79;s:28:"module/boss_revolutionslider";i:80;s:20:"module/boss_tagcloud";i:81;s:23:"module/boss_topcategory";i:82;s:16:"module/boss_zoom";i:83;s:15:"module/bossblog";i:84;s:15:"module/carousel";i:85;s:15:"module/category";i:86;s:19:"module/ebay_listing";i:87;s:18:"module/ebaydisplay";i:88;s:15:"module/featured";i:89;s:13:"module/filter";i:90;s:22:"module/google_hangouts";i:91;s:11:"module/html";i:92;s:18:"module/information";i:93;s:13:"module/latest";i:94;s:26:"module/newslettersubscribe";i:95;s:16:"module/pp_button";i:96;s:15:"module/pp_login";i:97;s:16:"module/slideshow";i:98;s:25:"module/social_media_login";i:99;s:14:"module/special";i:100;s:12:"module/store";i:101;s:22:"module/tshirtecommerce";i:102;s:18:"module/v2pagecache";i:103;s:14:"module/zlclite";i:104;s:14:"openbay/amazon";i:105;s:22:"openbay/amazon_listing";i:106;s:22:"openbay/amazon_product";i:107;s:16:"openbay/amazonus";i:108;s:24:"openbay/amazonus_listing";i:109;s:24:"openbay/amazonus_product";i:110;s:12:"openbay/ebay";i:111;s:20:"openbay/ebay_profile";i:112;s:21:"openbay/ebay_template";i:113;s:12:"openbay/etsy";i:114;s:20:"openbay/etsy_product";i:115;s:21:"openbay/etsy_shipping";i:116;s:17:"openbay/etsy_shop";i:117;s:23:"payment/amazon_checkout";i:118;s:24:"payment/amazon_login_pay";i:119;s:24:"payment/authorizenet_aim";i:120;s:24:"payment/authorizenet_sim";i:121;s:21:"payment/bank_transfer";i:122;s:22:"payment/bluepay_hosted";i:123;s:27:"payment/bluepay_hosted_form";i:124;s:24:"payment/bluepay_redirect";i:125;s:14:"payment/cheque";i:126;s:11:"payment/cod";i:127;s:17:"payment/firstdata";i:128;s:24:"payment/firstdata_remote";i:129;s:21:"payment/free_checkout";i:130;s:14:"payment/g2apay";i:131;s:17:"payment/globalpay";i:132;s:24:"payment/globalpay_remote";i:133;s:22:"payment/klarna_account";i:134;s:22:"payment/klarna_invoice";i:135;s:14:"payment/liqpay";i:136;s:20:"payment/moneybookers";i:137;s:14:"payment/nochex";i:138;s:15:"payment/paymate";i:139;s:16:"payment/paypoint";i:140;s:13:"payment/payza";i:141;s:26:"payment/perpetual_payments";i:142;s:18:"payment/pp_express";i:143;s:18:"payment/pp_payflow";i:144;s:25:"payment/pp_payflow_iframe";i:145;s:14:"payment/pp_pro";i:146;s:21:"payment/pp_pro_iframe";i:147;s:19:"payment/pp_standard";i:148;s:14:"payment/realex";i:149;s:21:"payment/realex_remote";i:150;s:22:"payment/sagepay_direct";i:151;s:22:"payment/sagepay_server";i:152;s:18:"payment/sagepay_us";i:153;s:24:"payment/securetrading_pp";i:154;s:24:"payment/securetrading_ws";i:155;s:14:"payment/skrill";i:156;s:19:"payment/twocheckout";i:157;s:28:"payment/web_payment_software";i:158;s:16:"payment/worldpay";i:159;s:16:"report/affiliate";i:160;s:25:"report/affiliate_activity";i:161;s:22:"report/affiliate_login";i:162;s:24:"report/customer_activity";i:163;s:22:"report/customer_credit";i:164;s:21:"report/customer_login";i:165;s:22:"report/customer_online";i:166;s:21:"report/customer_order";i:167;s:22:"report/customer_reward";i:168;s:16:"report/marketing";i:169;s:24:"report/product_purchased";i:170;s:21:"report/product_viewed";i:171;s:18:"report/sale_coupon";i:172;s:17:"report/sale_order";i:173;s:18:"report/sale_return";i:174;s:20:"report/sale_shipping";i:175;s:15:"report/sale_tax";i:176;s:17:"sale/custom_field";i:177;s:13:"sale/customer";i:178;s:20:"sale/customer_ban_ip";i:179;s:19:"sale/customer_group";i:180;s:22:"sale/halloffame_coupon";i:181;s:20:"sale/newssubscribers";i:182;s:10:"sale/order";i:183;s:20:"sale/popular_clipart";i:184;s:14:"sale/recurring";i:185;s:11:"sale/return";i:186;s:12:"sale/voucher";i:187;s:18:"sale/voucher_theme";i:188;s:15:"setting/setting";i:189;s:13:"setting/store";i:190;s:16:"shipping/auspost";i:191;s:17:"shipping/citylink";i:192;s:14:"shipping/fedex";i:193;s:13:"shipping/flat";i:194;s:13:"shipping/free";i:195;s:27:"shipping/individualshipping";i:196;s:13:"shipping/item";i:197;s:23:"shipping/parcelforce_48";i:198;s:15:"shipping/pickup";i:199;s:19:"shipping/royal_mail";i:200;s:12:"shipping/ups";i:201;s:13:"shipping/usps";i:202;s:15:"shipping/weight";i:203;s:11:"tool/backup";i:204;s:14:"tool/error_log";i:205;s:11:"tool/upload";i:206;s:12:"total/coupon";i:207;s:12:"total/credit";i:208;s:14:"total/handling";i:209;s:16:"total/klarna_fee";i:210;s:19:"total/low_order_fee";i:211;s:12:"total/reward";i:212;s:14:"total/shipping";i:213;s:15:"total/sub_total";i:214;s:9:"total/tax";i:215;s:11:"total/total";i:216;s:13:"total/voucher";i:217;s:8:"user/api";}s:6:"modify";a:221:{i:0;s:17:"bossblog/articles";i:1;s:17:"bossblog/category";i:2;s:16:"bossblog/comment";i:3;s:16:"bossblog/setting";i:4;s:21:"bossthemes/bossthemes";i:5;s:17:"catalog/attribute";i:6;s:23:"catalog/attribute_group";i:7;s:16:"catalog/category";i:8;s:16:"catalog/download";i:9;s:14:"catalog/filter";i:10;s:19:"catalog/information";i:11;s:20:"catalog/manufacturer";i:12;s:14:"catalog/option";i:13;s:15:"catalog/product";i:14;s:17:"catalog/recurring";i:15;s:14:"catalog/review";i:16;s:23:"catalog/tshirtecommerce";i:17;s:18:"common/column_left";i:18;s:18:"common/filemanager";i:19;s:11:"common/menu";i:20;s:14:"common/profile";i:21;s:12:"common/stats";i:22;s:13:"design/banner";i:23;s:13:"design/layout";i:24;s:14:"extension/feed";i:25;s:15:"extension/fraud";i:26;s:19:"extension/installer";i:27;s:22:"extension/modification";i:28;s:16:"extension/module";i:29;s:17:"extension/openbay";i:30;s:17:"extension/payment";i:31;s:18:"extension/shipping";i:32;s:15:"extension/total";i:33;s:16:"feed/google_base";i:34;s:19:"feed/google_sitemap";i:35;s:15:"feed/openbaypro";i:36;s:18:"fraud/fraudlabspro";i:37;s:13:"fraud/maxmind";i:38;s:20:"localisation/country";i:39;s:21:"localisation/currency";i:40;s:21:"localisation/geo_zone";i:41;s:21:"localisation/language";i:42;s:25:"localisation/length_class";i:43;s:21:"localisation/location";i:44;s:25:"localisation/order_status";i:45;s:26:"localisation/return_action";i:46;s:26:"localisation/return_reason";i:47;s:26:"localisation/return_status";i:48;s:25:"localisation/stock_status";i:49;s:22:"localisation/tax_class";i:50;s:21:"localisation/tax_rate";i:51;s:25:"localisation/weight_class";i:52;s:17:"localisation/zone";i:53;s:19:"marketing/affiliate";i:54;s:17:"marketing/contact";i:55;s:16:"marketing/coupon";i:56;s:19:"marketing/marketing";i:57;s:14:"module/account";i:58;s:16:"module/affiliate";i:59;s:20:"module/amazon_button";i:60;s:19:"module/amazon_login";i:61;s:17:"module/amazon_pay";i:62;s:13:"module/banner";i:63;s:17:"module/bestseller";i:64;s:19:"module/blogcategory";i:65;s:24:"module/blogrecentcomment";i:66;s:21:"module/blogrecentpost";i:67;s:17:"module/blogsearch";i:68;s:19:"module/blogtagcloud";i:69;s:20:"module/boss_alphabet";i:70;s:24:"module/boss_blogfeatured";i:71;s:20:"module/boss_carousel";i:72;s:20:"module/boss_category";i:73;s:20:"module/boss_featured";i:74;s:25:"module/boss_filterproduct";i:75;s:19:"module/boss_gallery";i:76;s:19:"module/boss_manager";i:77;s:24:"module/boss_manufacturer";i:78;s:23:"module/boss_newmegamenu";i:79;s:21:"module/boss_quickshop";i:80;s:28:"module/boss_revolutionslider";i:81;s:20:"module/boss_tagcloud";i:82;s:23:"module/boss_topcategory";i:83;s:16:"module/boss_zoom";i:84;s:15:"module/bossblog";i:85;s:15:"module/carousel";i:86;s:15:"module/category";i:87;s:19:"module/ebay_listing";i:88;s:18:"module/ebaydisplay";i:89;s:15:"module/featured";i:90;s:13:"module/filter";i:91;s:22:"module/google_hangouts";i:92;s:11:"module/html";i:93;s:18:"module/information";i:94;s:13:"module/latest";i:95;s:26:"module/newslettersubscribe";i:96;s:16:"module/pp_button";i:97;s:15:"module/pp_login";i:98;s:16:"module/slideshow";i:99;s:25:"module/social_media_login";i:100;s:14:"module/special";i:101;s:12:"module/store";i:102;s:22:"module/tshirtecommerce";i:103;s:18:"module/v2pagecache";i:104;s:14:"module/zlclite";i:105;s:14:"openbay/amazon";i:106;s:22:"openbay/amazon_listing";i:107;s:22:"openbay/amazon_product";i:108;s:16:"openbay/amazonus";i:109;s:24:"openbay/amazonus_listing";i:110;s:24:"openbay/amazonus_product";i:111;s:12:"openbay/ebay";i:112;s:20:"openbay/ebay_profile";i:113;s:21:"openbay/ebay_template";i:114;s:12:"openbay/etsy";i:115;s:20:"openbay/etsy_product";i:116;s:21:"openbay/etsy_shipping";i:117;s:17:"openbay/etsy_shop";i:118;s:23:"payment/amazon_checkout";i:119;s:24:"payment/amazon_login_pay";i:120;s:24:"payment/authorizenet_aim";i:121;s:24:"payment/authorizenet_sim";i:122;s:21:"payment/bank_transfer";i:123;s:22:"payment/bluepay_hosted";i:124;s:27:"payment/bluepay_hosted_form";i:125;s:24:"payment/bluepay_redirect";i:126;s:14:"payment/cheque";i:127;s:11:"payment/cod";i:128;s:17:"payment/firstdata";i:129;s:24:"payment/firstdata_remote";i:130;s:21:"payment/free_checkout";i:131;s:14:"payment/g2apay";i:132;s:17:"payment/globalpay";i:133;s:24:"payment/globalpay_remote";i:134;s:22:"payment/klarna_account";i:135;s:22:"payment/klarna_invoice";i:136;s:14:"payment/liqpay";i:137;s:20:"payment/moneybookers";i:138;s:14:"payment/nochex";i:139;s:15:"payment/paymate";i:140;s:16:"payment/paypoint";i:141;s:13:"payment/payza";i:142;s:26:"payment/perpetual_payments";i:143;s:18:"payment/pp_express";i:144;s:18:"payment/pp_payflow";i:145;s:25:"payment/pp_payflow_iframe";i:146;s:14:"payment/pp_pro";i:147;s:21:"payment/pp_pro_iframe";i:148;s:19:"payment/pp_standard";i:149;s:14:"payment/realex";i:150;s:21:"payment/realex_remote";i:151;s:22:"payment/sagepay_direct";i:152;s:22:"payment/sagepay_server";i:153;s:18:"payment/sagepay_us";i:154;s:24:"payment/securetrading_pp";i:155;s:24:"payment/securetrading_ws";i:156;s:14:"payment/skrill";i:157;s:19:"payment/twocheckout";i:158;s:28:"payment/web_payment_software";i:159;s:16:"payment/worldpay";i:160;s:16:"report/affiliate";i:161;s:25:"report/affiliate_activity";i:162;s:22:"report/affiliate_login";i:163;s:24:"report/customer_activity";i:164;s:22:"report/customer_credit";i:165;s:21:"report/customer_login";i:166;s:22:"report/customer_online";i:167;s:21:"report/customer_order";i:168;s:22:"report/customer_reward";i:169;s:16:"report/marketing";i:170;s:24:"report/product_purchased";i:171;s:21:"report/product_viewed";i:172;s:18:"report/sale_coupon";i:173;s:17:"report/sale_order";i:174;s:18:"report/sale_return";i:175;s:20:"report/sale_shipping";i:176;s:15:"report/sale_tax";i:177;s:17:"sale/custom_field";i:178;s:13:"sale/customer";i:179;s:20:"sale/customer_ban_ip";i:180;s:19:"sale/customer_group";i:181;s:22:"sale/halloffame_coupon";i:182;s:20:"sale/newssubscribers";i:183;s:10:"sale/order";i:184;s:20:"sale/popular_clipart";i:185;s:14:"sale/recurring";i:186;s:11:"sale/return";i:187;s:12:"sale/voucher";i:188;s:18:"sale/voucher_theme";i:189;s:15:"setting/setting";i:190;s:13:"setting/store";i:191;s:16:"shipping/auspost";i:192;s:17:"shipping/citylink";i:193;s:14:"shipping/fedex";i:194;s:13:"shipping/flat";i:195;s:13:"shipping/free";i:196;s:27:"shipping/individualshipping";i:197;s:13:"shipping/item";i:198;s:23:"shipping/parcelforce_48";i:199;s:15:"shipping/pickup";i:200;s:19:"shipping/royal_mail";i:201;s:12:"shipping/ups";i:202;s:13:"shipping/usps";i:203;s:15:"shipping/weight";i:204;s:11:"tool/backup";i:205;s:14:"tool/error_log";i:206;s:11:"tool/upload";i:207;s:12:"total/coupon";i:208;s:12:"total/credit";i:209;s:14:"total/handling";i:210;s:16:"total/klarna_fee";i:211;s:19:"total/low_order_fee";i:212;s:12:"total/reward";i:213;s:14:"total/shipping";i:214;s:15:"total/sub_total";i:215;s:9:"total/tax";i:216;s:11:"total/total";i:217;s:13:"total/voucher";i:218;s:8:"user/api";i:219;s:9:"user/user";i:220;s:20:"user/user_permission";}}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher`
--

CREATE TABLE IF NOT EXISTS `oc_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_history`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(6, 'catalog/demo/apple_logo.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(8, 'catalog/demo/canon_eos_5d_2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme_description`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class`
--

CREATE TABLE IF NOT EXISTS `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class_description`
--

CREATE TABLE IF NOT EXISTS `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz');

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone`
--

CREATE TABLE IF NOT EXISTS `oc_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4222 ;

--
-- Dumping data for table `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Baghlan', 'BGL', 1),
(4, 1, 'Balkh', 'BAL', 1),
(5, 1, 'Bamian', 'BAM', 1),
(6, 1, 'Farah', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Ghazni', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Helmand', 'HEL', 1),
(11, 1, 'Herat', 'HER', 1),
(12, 1, 'Jowzjan', 'JOW', 1),
(13, 1, 'Kabul', 'KAB', 1),
(14, 1, 'Kandahar', 'KAN', 1),
(15, 1, 'Kapisa', 'KAP', 1),
(16, 1, 'Khost', 'KHO', 1),
(17, 1, 'Konar', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Laghman', 'LAG', 1),
(20, 1, 'Lowgar', 'LOW', 1),
(21, 1, 'Nangrahar', 'NAN', 1),
(22, 1, 'Nimruz', 'NIM', 1),
(23, 1, 'Nurestan', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Paktia', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Sar-e Pol', 'SAR', 1),
(30, 1, 'Takhar', 'TAK', 1),
(31, 1, 'Wardak', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Berat', 'BR', 1),
(34, 2, 'Bulqize', 'BU', 1),
(35, 2, 'Delvine', 'DL', 1),
(36, 2, 'Devoll', 'DV', 1),
(37, 2, 'Diber', 'DI', 1),
(38, 2, 'Durres', 'DR', 1),
(39, 2, 'Elbasan', 'EL', 1),
(40, 2, 'Kolonje', 'ER', 1),
(41, 2, 'Fier', 'FR', 1),
(42, 2, 'Gjirokaster', 'GJ', 1),
(43, 2, 'Gramsh', 'GR', 1),
(44, 2, 'Has', 'HA', 1),
(45, 2, 'Kavaje', 'KA', 1),
(46, 2, 'Kurbin', 'KB', 1),
(47, 2, 'Kucove', 'KC', 1),
(48, 2, 'Korce', 'KO', 1),
(49, 2, 'Kruje', 'KR', 1),
(50, 2, 'Kukes', 'KU', 1),
(51, 2, 'Librazhd', 'LB', 1),
(52, 2, 'Lezhe', 'LE', 1),
(53, 2, 'Lushnje', 'LU', 1),
(54, 2, 'Malesi e Madhe', 'MM', 1),
(55, 2, 'Mallakaster', 'MK', 1),
(56, 2, 'Mat', 'MT', 1),
(57, 2, 'Mirdite', 'MR', 1),
(58, 2, 'Peqin', 'PQ', 1),
(59, 2, 'Permet', 'PR', 1),
(60, 2, 'Pogradec', 'PG', 1),
(61, 2, 'Puke', 'PU', 1),
(62, 2, 'Shkoder', 'SH', 1),
(63, 2, 'Skrapar', 'SK', 1),
(64, 2, 'Sarande', 'SR', 1),
(65, 2, 'Tepelene', 'TE', 1),
(66, 2, 'Tropoje', 'TP', 1),
(67, 2, 'Tirane', 'TR', 1),
(68, 2, 'Vlore', 'VL', 1),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Ain Defla', 'ADE', 1),
(71, 3, 'Ain Temouchent', 'ATE', 1),
(72, 3, 'Alger', 'ALG', 1),
(73, 3, 'Annaba', 'ANN', 1),
(74, 3, 'Batna', 'BAT', 1),
(75, 3, 'Bechar', 'BEC', 1),
(76, 3, 'Bejaia', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Boumerdes', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Constantine', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'El Bayadh', 'EBA', 1),
(86, 3, 'El Oued', 'EOU', 1),
(87, 3, 'El Tarf', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Guelma', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Medea', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'M''Sila', 'MSI', 1),
(99, 3, 'Naama', 'NAA', 1),
(100, 3, 'Oran', 'ORA', 1),
(101, 3, 'Ouargla', 'OUA', 1),
(102, 3, 'Oum el-Bouaghi', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Saida', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Sidi Bel Abbes', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Souk Ahras', 'SAH', 1),
(109, 3, 'Tamanghasset', 'TAM', 1),
(110, 3, 'Tebessa', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Tissemsilt', 'TIS', 1),
(115, 3, 'Tizi Ouzou', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'Eastern', 'E', 1),
(118, 4, 'Manu''a', 'M', 1),
(119, 4, 'Rose Island', 'R', 1),
(120, 4, 'Swains Island', 'S', 1),
(121, 4, 'Western', 'W', 1),
(122, 5, 'Andorra la Vella', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'Encamp', 'ENC', 1),
(125, 5, 'Escaldes-Engordany', 'ESE', 1),
(126, 5, 'La Massana', 'LMA', 1),
(127, 5, 'Ordino', 'ORD', 1),
(128, 5, 'Sant Julia de Loria', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Benguela', 'BGU', 1),
(131, 6, 'Bie', 'BIE', 1),
(132, 6, 'Cabinda', 'CAB', 1),
(133, 6, 'Cuando-Cubango', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Cuanza Sul', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Huila', 'HUI', 1),
(139, 6, 'Luanda', 'LUA', 1),
(140, 6, 'Lunda Norte', 'LNO', 1),
(141, 6, 'Lunda Sul', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Namibe', 'NAM', 1),
(145, 6, 'Uige', 'UIG', 1),
(146, 6, 'Zaire', 'ZAI', 1),
(147, 9, 'Saint George', 'ASG', 1),
(148, 9, 'Saint John', 'ASJ', 1),
(149, 9, 'Saint Mary', 'ASM', 1),
(150, 9, 'Saint Paul', 'ASL', 1),
(151, 9, 'Saint Peter', 'ASR', 1),
(152, 9, 'Saint Philip', 'ASH', 1),
(153, 9, 'Barbuda', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 1),
(156, 10, 'Buenos Aires', 'BA', 1),
(157, 10, 'Catamarca', 'CA', 1),
(158, 10, 'Chaco', 'CH', 1),
(159, 10, 'Chubut', 'CU', 1),
(160, 10, 'Cordoba', 'CO', 1),
(161, 10, 'Corrientes', 'CR', 1),
(162, 10, 'Distrito Federal', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Formosa', 'FO', 1),
(165, 10, 'Jujuy', 'JU', 1),
(166, 10, 'La Pampa', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Mendoza', 'ME', 1),
(169, 10, 'Misiones', 'MI', 1),
(170, 10, 'Neuquen', 'NE', 1),
(171, 10, 'Rio Negro', 'RN', 1),
(172, 10, 'Salta', 'SA', 1),
(173, 10, 'San Juan', 'SJ', 1),
(174, 10, 'San Luis', 'SL', 1),
(175, 10, 'Santa Cruz', 'SC', 1),
(176, 10, 'Santa Fe', 'SF', 1),
(177, 10, 'Santiago del Estero', 'SD', 1),
(178, 10, 'Tierra del Fuego', 'TF', 1),
(179, 10, 'Tucuman', 'TU', 1),
(180, 11, 'Aragatsotn', 'AGT', 1),
(181, 11, 'Ararat', 'ARR', 1),
(182, 11, 'Armavir', 'ARM', 1),
(183, 11, 'Geghark''unik''', 'GEG', 1),
(184, 11, 'Kotayk''', 'KOT', 1),
(185, 11, 'Lorri', 'LOR', 1),
(186, 11, 'Shirak', 'SHI', 1),
(187, 11, 'Syunik''', 'SYU', 1),
(188, 11, 'Tavush', 'TAV', 1),
(189, 11, 'Vayots'' Dzor', 'VAY', 1),
(190, 11, 'Yerevan', 'YER', 1),
(191, 13, 'Australian Capital Territory', 'ACT', 1),
(192, 13, 'New South Wales', 'NSW', 1),
(193, 13, 'Northern Territory', 'NT', 1),
(194, 13, 'Queensland', 'QLD', 1),
(195, 13, 'South Australia', 'SA', 1),
(196, 13, 'Tasmania', 'TAS', 1),
(197, 13, 'Victoria', 'VIC', 1),
(198, 13, 'Western Australia', 'WA', 1),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Nieder&ouml;sterreich', 'NOS', 1),
(202, 14, 'Ober&ouml;sterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Berry Islands', 'BER', 1),
(286, 16, 'Bimini', 'BIM', 1),
(287, 16, 'Black Point', 'BLK', 1),
(288, 16, 'Cat Island', 'CAT', 1),
(289, 16, 'Central Abaco', 'CAB', 1),
(290, 16, 'Central Andros', 'CAN', 1),
(291, 16, 'Central Eleuthera', 'CEL', 1),
(292, 16, 'City of Freeport', 'FRE', 1),
(293, 16, 'Crooked Island', 'CRO', 1),
(294, 16, 'East Grand Bahama', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Grand Cay', 'GRD', 1),
(297, 16, 'Harbour Island', 'HAR', 1),
(298, 16, 'Hope Town', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Long Island', 'LNG', 1),
(301, 16, 'Mangrove Cay', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Moore''s Island', 'MOO', 1),
(304, 16, 'North Abaco', 'NAB', 1),
(305, 16, 'North Andros', 'NAN', 1),
(306, 16, 'North Eleuthera', 'NEL', 1),
(307, 16, 'Ragged Island', 'RAG', 1),
(308, 16, 'Rum Cay', 'RUM', 1),
(309, 16, 'San Salvador', 'SAL', 1),
(310, 16, 'South Abaco', 'SAB', 1),
(311, 16, 'South Andros', 'SAN', 1),
(312, 16, 'South Eleuthera', 'SEL', 1),
(313, 16, 'Spanish Wells', 'SWE', 1),
(314, 16, 'West Grand Bahama', 'WGB', 1),
(315, 17, 'Capital', 'CAP', 1),
(316, 17, 'Central', 'CEN', 1),
(317, 17, 'Muharraq', 'MUH', 1),
(318, 17, 'Northern', 'NOR', 1),
(319, 17, 'Southern', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Chittagong', 'CHI', 1),
(322, 18, 'Dhaka', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Christ Church', 'CC', 1),
(327, 19, 'Saint Andrew', 'AND', 1),
(328, 19, 'Saint George', 'GEO', 1),
(329, 19, 'Saint James', 'JAM', 1),
(330, 19, 'Saint John', 'JOH', 1),
(331, 19, 'Saint Joseph', 'JOS', 1),
(332, 19, 'Saint Lucy', 'LUC', 1),
(333, 19, 'Saint Michael', 'MIC', 1),
(334, 19, 'Saint Peter', 'PET', 1),
(335, 19, 'Saint Philip', 'PHI', 1),
(336, 19, 'Saint Thomas', 'THO', 1),
(337, 20, 'Brestskaya (Brest)', 'BR', 1),
(338, 20, 'Homyel''skaya (Homyel'')', 'HO', 1),
(339, 20, 'Horad Minsk', 'HM', 1),
(340, 20, 'Hrodzyenskaya (Hrodna)', 'HR', 1),
(341, 20, 'Mahilyowskaya (Mahilyow)', 'MA', 1),
(342, 20, 'Minskaya', 'MI', 1),
(343, 20, 'Vitsyebskaya (Vitsyebsk)', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Brabant Wallon', 'WBR', 1),
(346, 21, 'Hainaut', 'WHT', 1),
(347, 21, 'Liège', 'WLG', 1),
(348, 21, 'Limburg', 'VLI', 1),
(349, 21, 'Luxembourg', 'WLX', 1),
(350, 21, 'Namur', 'WNA', 1),
(351, 21, 'Oost-Vlaanderen', 'VOV', 1),
(352, 21, 'Vlaams Brabant', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Belize', 'BZ', 1),
(355, 22, 'Cayo', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Orange Walk', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Toledo', 'TO', 1),
(360, 23, 'Alibori', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Atlantique', 'AQ', 1),
(363, 23, 'Borgou', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'Donga', 'DO', 1),
(366, 23, 'Kouffo', 'KO', 1),
(367, 23, 'Littoral', 'LI', 1),
(368, 23, 'Mono', 'MO', 1),
(369, 23, 'Oueme', 'OU', 1),
(370, 23, 'Plateau', 'PL', 1),
(371, 23, 'Zou', 'ZO', 1),
(372, 24, 'Devonshire', 'DS', 1),
(373, 24, 'Hamilton City', 'HC', 1),
(374, 24, 'Hamilton', 'HA', 1),
(375, 24, 'Paget', 'PG', 1),
(376, 24, 'Pembroke', 'PB', 1),
(377, 24, 'Saint George City', 'GC', 1),
(378, 24, 'Saint George''s', 'SG', 1),
(379, 24, 'Sandys', 'SA', 1),
(380, 24, 'Smith''s', 'SM', 1),
(381, 24, 'Southampton', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Bumthang', 'BUM', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Zhemgang', 'ZHE', 1),
(403, 26, 'Beni', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Cochabamba', 'COC', 1),
(406, 26, 'La Paz', 'LPZ', 1),
(407, 26, 'Oruro', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Potosi', 'POT', 1),
(410, 26, 'Santa Cruz', 'SCZ', 1),
(411, 26, 'Tarija', 'TAR', 1),
(412, 27, 'Brcko district', 'BRO', 1),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 1),
(414, 27, 'Posavski Kanton', 'FPO', 1),
(415, 27, 'Tuzlanski Kanton', 'FTU', 1),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 1),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 1),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 1),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 1),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 1),
(421, 27, 'Kanton Sarajevo', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Banja Luka', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Bijeljina', 'SBI', 1),
(426, 27, 'Vlasenica', 'SVL', 1),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 1),
(428, 27, 'Foca', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'Central', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'North East', 'NE', 1),
(437, 28, 'North West', 'NW', 1),
(438, 28, 'South East', 'SE', 1),
(439, 28, 'Southern', 'SO', 1),
(440, 30, 'Acre', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapá', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Ceará', 'CE', 1),
(446, 30, 'Distrito Federal', 'DF', 1),
(447, 30, 'Espírito Santo', 'ES', 1),
(448, 30, 'Goiás', 'GO', 1),
(449, 30, 'Maranhão', 'MA', 1),
(450, 30, 'Mato Grosso', 'MT', 1),
(451, 30, 'Mato Grosso do Sul', 'MS', 1),
(452, 30, 'Minas Gerais', 'MG', 1),
(453, 30, 'Pará', 'PA', 1),
(454, 30, 'Paraíba', 'PB', 1),
(455, 30, 'Paraná', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piauí', 'PI', 1),
(458, 30, 'Rio de Janeiro', 'RJ', 1),
(459, 30, 'Rio Grande do Norte', 'RN', 1),
(460, 30, 'Rio Grande do Sul', 'RS', 1),
(461, 30, 'Rondônia', 'RO', 1),
(462, 30, 'Roraima', 'RR', 1),
(463, 30, 'Santa Catarina', 'SC', 1),
(464, 30, 'São Paulo', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Peros Banhos', 'PB', 1),
(468, 31, 'Salomon Islands', 'SI', 1),
(469, 31, 'Nelsons Island', 'NI', 1),
(470, 31, 'Three Brothers', 'TB', 1),
(471, 31, 'Eagle Islands', 'EA', 1),
(472, 31, 'Danger Island', 'DI', 1),
(473, 31, 'Egmont Islands', 'EG', 1),
(474, 31, 'Diego Garcia', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Brunei and Muara', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Tutong', 'TUT', 1),
(479, 33, 'Blagoevgrad', '', 1),
(480, 33, 'Burgas', '', 1),
(481, 33, 'Dobrich', '', 1),
(482, 33, 'Gabrovo', '', 1),
(483, 33, 'Haskovo', '', 1),
(484, 33, 'Kardjali', '', 1),
(485, 33, 'Kyustendil', '', 1),
(486, 33, 'Lovech', '', 1),
(487, 33, 'Montana', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Pernik', '', 1),
(490, 33, 'Pleven', '', 1),
(491, 33, 'Plovdiv', '', 1),
(492, 33, 'Razgrad', '', 1),
(493, 33, 'Shumen', '', 1),
(494, 33, 'Silistra', '', 1),
(495, 33, 'Sliven', '', 1),
(496, 33, 'Smolyan', '', 1),
(497, 33, 'Sofia', '', 1),
(498, 33, 'Sofia - town', '', 1),
(499, 33, 'Stara Zagora', '', 1),
(500, 33, 'Targovishte', '', 1),
(501, 33, 'Varna', '', 1),
(502, 33, 'Veliko Tarnovo', '', 1),
(503, 33, 'Vidin', '', 1),
(504, 33, 'Vratza', '', 1),
(505, 33, 'Yambol', '', 1),
(506, 34, 'Bale', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Banwa', 'BAN', 1),
(509, 34, 'Bazega', 'BAZ', 1),
(510, 34, 'Bougouriba', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Boulkiemde', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ganzourgou', 'GAN', 1),
(515, 34, 'Gnagna', 'GNA', 1),
(516, 34, 'Gourma', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Ioba', 'IOA', 1),
(519, 34, 'Kadiogo', 'KAD', 1),
(520, 34, 'Kenedougou', 'KEN', 1),
(521, 34, 'Komondjari', 'KOD', 1),
(522, 34, 'Kompienga', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Koulpelogo', 'KOL', 1),
(525, 34, 'Kouritenga', 'KOT', 1),
(526, 34, 'Kourweogo', 'KOW', 1),
(527, 34, 'Leraba', 'LER', 1),
(528, 34, 'Loroum', 'LOR', 1),
(529, 34, 'Mouhoun', 'MOU', 1),
(530, 34, 'Nahouri', 'NAH', 1),
(531, 34, 'Namentenga', 'NAM', 1),
(532, 34, 'Nayala', 'NAY', 1),
(533, 34, 'Noumbiel', 'NOU', 1),
(534, 34, 'Oubritenga', 'OUB', 1),
(535, 34, 'Oudalan', 'OUD', 1),
(536, 34, 'Passore', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Sanguie', 'SAG', 1),
(539, 34, 'Sanmatenga', 'SAM', 1),
(540, 34, 'Seno', 'SEN', 1),
(541, 34, 'Sissili', 'SIS', 1),
(542, 34, 'Soum', 'SOM', 1),
(543, 34, 'Sourou', 'SOR', 1),
(544, 34, 'Tapoa', 'TAP', 1),
(545, 34, 'Tuy', 'TUY', 1),
(546, 34, 'Yagha', 'YAG', 1),
(547, 34, 'Yatenga', 'YAT', 1),
(548, 34, 'Ziro', 'ZIR', 1),
(549, 34, 'Zondoma', 'ZOD', 1),
(550, 34, 'Zoundweogo', 'ZOW', 1),
(551, 35, 'Bubanza', 'BB', 1),
(552, 35, 'Bujumbura', 'BJ', 1),
(553, 35, 'Bururi', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Kayanza', 'KY', 1),
(559, 35, 'Kirundo', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Muramvya', 'MU', 1),
(562, 35, 'Muyinga', 'MY', 1),
(563, 35, 'Mwaro', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Ruyigi', 'RY', 1),
(567, 36, 'Phnom Penh', 'PP', 1),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Banteay Meanchey', 'BM', 1),
(572, 36, 'Battambang', 'BA', 1),
(573, 36, 'Kampong Cham', 'KM', 1),
(574, 36, 'Kampong Chhnang', 'KN', 1),
(575, 36, 'Kampong Speu', 'KU', 1),
(576, 36, 'Kampong Som', 'KO', 1),
(577, 36, 'Kampong Thom', 'KT', 1),
(578, 36, 'Kampot', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Kaoh Kong', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Mondul Kiri', 'MK', 1),
(583, 36, 'Oddar Meancheay', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Prey Veng', 'PG', 1),
(587, 36, 'Ratanak Kiri', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Stung Treng', 'ST', 1),
(590, 36, 'Svay Rieng', 'SR', 1),
(591, 36, 'Takeo', 'TK', 1),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 1),
(593, 37, 'Centre', 'CEN', 1),
(594, 37, 'East (Est)', 'EST', 1),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 1),
(596, 37, 'Littoral', 'LIT', 1),
(597, 37, 'North (Nord)', 'NOR', 1),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 1),
(599, 37, 'West (Ouest)', 'OUE', 1),
(600, 37, 'South (Sud)', 'SUD', 1),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 1),
(602, 38, 'Alberta', 'AB', 1),
(603, 38, 'British Columbia', 'BC', 1),
(604, 38, 'Manitoba', 'MB', 1),
(605, 38, 'New Brunswick', 'NB', 1),
(606, 38, 'Newfoundland and Labrador', 'NL', 1),
(607, 38, 'Northwest Territories', 'NT', 1),
(608, 38, 'Nova Scotia', 'NS', 1),
(609, 38, 'Nunavut', 'NU', 1),
(610, 38, 'Ontario', 'ON', 1),
(611, 38, 'Prince Edward Island', 'PE', 1),
(612, 38, 'Qu&eacute;bec', 'QC', 1),
(613, 38, 'Saskatchewan', 'SK', 1),
(614, 38, 'Yukon Territory', 'YT', 1),
(615, 39, 'Boa Vista', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Calheta de Sao Miguel', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Paul', 'PA', 1),
(621, 39, 'Porto Novo', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Ribeira Grande', 'RG', 1),
(624, 39, 'Sal', 'SL', 1),
(625, 39, 'Santa Catarina', 'CA', 1),
(626, 39, 'Santa Cruz', 'CR', 1),
(627, 39, 'Sao Domingos', 'SD', 1),
(628, 39, 'Sao Filipe', 'SF', 1),
(629, 39, 'Sao Nicolau', 'SN', 1),
(630, 39, 'Sao Vicente', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'Creek', 'CR', 1),
(633, 40, 'Eastern', 'EA', 1),
(634, 40, 'Midland', 'ML', 1),
(635, 40, 'South Town', 'ST', 1),
(636, 40, 'Spot Bay', 'SP', 1),
(637, 40, 'Stake Bay', 'SK', 1),
(638, 40, 'West End', 'WD', 1),
(639, 40, 'Western', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Basse-Kotto', 'BKO', 1),
(642, 41, 'Haute-Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Nana-Mambere', 'NMM', 1),
(649, 41, 'Ombella-M''Poko', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Vakaga', 'VAK', 1),
(654, 41, 'Nana-Grebizi', 'NGR', 1),
(655, 41, 'Sangha-Mbaere', 'SMB', 1),
(656, 41, 'Bangui', 'BAN', 1),
(657, 42, 'Batha', 'BA', 1),
(658, 42, 'Biltine', 'BI', 1),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 1),
(660, 42, 'Chari-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'Lac', 'LA', 1),
(664, 42, 'Logone Occidental', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Chari', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Salamat', 'SA', 1),
(670, 42, 'Tandjile', 'TA', 1),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 1),
(672, 43, 'Antofagasta', 'AN', 1),
(673, 43, 'Araucania', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Coquimbo', 'CO', 1),
(677, 43, 'Libertador General Bernardo O''Hi', 'LI', 1),
(678, 43, 'Los Lagos', 'LL', 1),
(679, 43, 'Magallanes y de la Antartica Chi', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Region Metropolitana', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Valparaiso', 'VS', 1),
(684, 44, 'Anhui', 'AN', 1),
(685, 44, 'Beijing', 'BE', 1),
(686, 44, 'Chongqing', 'CH', 1),
(687, 44, 'Fujian', 'FU', 1),
(688, 44, 'Gansu', 'GA', 1),
(689, 44, 'Guangdong', 'GU', 1),
(690, 44, 'Guangxi', 'GX', 1),
(691, 44, 'Guizhou', 'GZ', 1),
(692, 44, 'Hainan', 'HA', 1),
(693, 44, 'Hebei', 'HB', 1),
(694, 44, 'Heilongjiang', 'HL', 1),
(695, 44, 'Henan', 'HE', 1),
(696, 44, 'Hong Kong', 'HK', 1),
(697, 44, 'Hubei', 'HU', 1),
(698, 44, 'Hunan', 'HN', 1),
(699, 44, 'Inner Mongolia', 'IM', 1),
(700, 44, 'Jiangsu', 'JI', 1),
(701, 44, 'Jiangxi', 'JX', 1),
(702, 44, 'Jilin', 'JL', 1),
(703, 44, 'Liaoning', 'LI', 1),
(704, 44, 'Macau', 'MA', 1),
(705, 44, 'Ningxia', 'NI', 1),
(706, 44, 'Shaanxi', 'SH', 1),
(707, 44, 'Shandong', 'SA', 1),
(708, 44, 'Shanghai', 'SG', 1),
(709, 44, 'Shanxi', 'SX', 1),
(710, 44, 'Sichuan', 'SI', 1),
(711, 44, 'Tianjin', 'TI', 1),
(712, 44, 'Xinjiang', 'XI', 1),
(713, 44, 'Yunnan', 'YU', 1),
(714, 44, 'Zhejiang', 'ZH', 1),
(715, 46, 'Direction Island', 'D', 1),
(716, 46, 'Home Island', 'H', 1),
(717, 46, 'Horsburgh Island', 'O', 1),
(718, 46, 'South Island', 'S', 1),
(719, 46, 'West Island', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Bogota D.C.', 'BDC', 1),
(725, 47, 'Bolivar', 'BOL', 1),
(726, 47, 'Boyaca', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Cauca', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Cordoba', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Guajira', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Huila', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Meta', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'San Andres y Providencia', 'SAP', 1),
(747, 47, 'Santander', 'SAN', 1),
(748, 47, 'Sucre', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Vaupes', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Grande Comore', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Moheli', 'M', 1),
(756, 49, 'Bouenza', 'BO', 1),
(757, 49, 'Brazzaville', 'BR', 1),
(758, 49, 'Cuvette', 'CU', 1),
(759, 49, 'Cuvette-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Lekoumou', 'LE', 1),
(762, 49, 'Likouala', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Pool', 'PO', 1),
(766, 49, 'Sangha', 'SA', 1),
(767, 50, 'Pukapuka', 'PU', 1),
(768, 50, 'Rakahanga', 'RK', 1),
(769, 50, 'Manihiki', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Nassau Island', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Palmerston', 'PA', 1),
(774, 50, 'Aitutaki', 'AI', 1),
(775, 50, 'Manuae', 'MA', 1),
(776, 50, 'Takutea', 'TA', 1),
(777, 50, 'Mitiaro', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Mauke', 'MU', 1),
(780, 50, 'Rarotonga', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Alajuela', 'AL', 1),
(783, 51, 'Cartago', 'CA', 1),
(784, 51, 'Guanacaste', 'GU', 1),
(785, 51, 'Heredia', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'San Jose', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Abidjan', 'ABI', 1),
(791, 52, 'Aboisso', 'ABO', 1),
(792, 52, 'Adiake', 'ADI', 1),
(793, 52, 'Adzope', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Agnibilekrou', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Bangolo', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Bondoukou', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Bouafle', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Bouna', 'BNA', 1),
(806, 52, 'Boundiali', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Dabou', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Danane', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Duekoue', 'DUE', 1),
(815, 52, 'Ferkessedougou', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Grand-Bassam', 'GBA', 1),
(818, 52, 'Grand-Lahou', 'GLA', 1),
(819, 52, 'Guiglo', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Katiola', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Lakota', 'LAK', 1),
(825, 52, 'Man', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'San-Pedro', 'SPE', 1),
(832, 52, 'Sassandra', 'SAS', 1),
(833, 52, 'Seguela', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Soubre', 'SOU', 1),
(836, 52, 'Tabou', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Toulepleu', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Vavoua', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Bjelovarsko-bilogorska', 'BB', 1),
(848, 53, 'Grad Zagreb', 'GZ', 1),
(849, 53, 'Dubrovačko-neretvanska', 'DN', 1),
(850, 53, 'Istarska', 'IS', 1),
(851, 53, 'Karlovačka', 'KA', 1),
(852, 53, 'Koprivničko-križevačka', 'KK', 1),
(853, 53, 'Krapinsko-zagorska', 'KZ', 1),
(854, 53, 'Ličko-senjska', 'LS', 1),
(855, 53, 'Međimurska', 'ME', 1),
(856, 53, 'Osječko-baranjska', 'OB', 1),
(857, 53, 'Požeško-slavonska', 'PS', 1),
(858, 53, 'Primorsko-goranska', 'PG', 1),
(859, 53, 'Šibensko-kninska', 'SK', 1),
(860, 53, 'Sisačko-moslavačka', 'SM', 1),
(861, 53, 'Brodsko-posavska', 'BP', 1),
(862, 53, 'Splitsko-dalmatinska', 'SD', 1),
(863, 53, 'Varaždinska', 'VA', 1),
(864, 53, 'Virovitičko-podravska', 'VP', 1),
(865, 53, 'Vukovarsko-srijemska', 'VS', 1),
(866, 53, 'Zadarska', 'ZA', 1),
(867, 53, 'Zagrebačka', 'ZG', 1),
(868, 54, 'Camaguey', 'CA', 1),
(869, 54, 'Ciego de Avila', 'CD', 1),
(870, 54, 'Cienfuegos', 'CI', 1),
(871, 54, 'Ciudad de La Habana', 'CH', 1),
(872, 54, 'Granma', 'GR', 1),
(873, 54, 'Guantanamo', 'GU', 1),
(874, 54, 'Holguin', 'HO', 1),
(875, 54, 'Isla de la Juventud', 'IJ', 1),
(876, 54, 'La Habana', 'LH', 1),
(877, 54, 'Las Tunas', 'LT', 1),
(878, 54, 'Matanzas', 'MA', 1),
(879, 54, 'Pinar del Rio', 'PR', 1),
(880, 54, 'Sancti Spiritus', 'SS', 1),
(881, 54, 'Santiago de Cuba', 'SC', 1),
(882, 54, 'Villa Clara', 'VC', 1),
(883, 55, 'Famagusta', 'F', 1),
(884, 55, 'Kyrenia', 'K', 1),
(885, 55, 'Larnaca', 'A', 1),
(886, 55, 'Limassol', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Paphos', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královehradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Plzeňský', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Vysočina', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '''Ali Sabih', 'S', 1),
(920, 58, 'Dikhil', 'K', 1),
(921, 58, 'Djibouti', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Tadjoura', 'T', 1),
(924, 59, 'Saint Andrew Parish', 'AND', 1),
(925, 59, 'Saint David Parish', 'DAV', 1),
(926, 59, 'Saint George Parish', 'GEO', 1),
(927, 59, 'Saint John Parish', 'JOH', 1),
(928, 59, 'Saint Joseph Parish', 'JOS', 1),
(929, 59, 'Saint Luke Parish', 'LUK', 1),
(930, 59, 'Saint Mark Parish', 'MAR', 1),
(931, 59, 'Saint Patrick Parish', 'PAT', 1),
(932, 59, 'Saint Paul Parish', 'PAU', 1),
(933, 59, 'Saint Peter Parish', 'PET', 1),
(934, 60, 'Distrito Nacional', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Barahona', 'BH', 1),
(938, 60, 'Dajabon', 'DJ', 1),
(939, 60, 'Duarte', 'DU', 1),
(940, 60, 'Elias Pina', 'EL', 1),
(941, 60, 'El Seybo', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Hato Mayor', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'La Vega', 'VE', 1),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Monte Cristi', 'MC', 1),
(951, 60, 'Monte Plata', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Peravia (Bani)', 'PR', 1),
(954, 60, 'Puerto Plata', 'PP', 1),
(955, 60, 'Salcedo', 'SL', 1),
(956, 60, 'Samana', 'SM', 1),
(957, 60, 'Sanchez Ramirez', 'SH', 1),
(958, 60, 'San Cristobal', 'SC', 1),
(959, 60, 'San Jose de Ocoa', 'JO', 1),
(960, 60, 'San Juan', 'SJ', 1),
(961, 60, 'San Pedro de Macoris', 'PM', 1),
(962, 60, 'Santiago', 'SA', 1),
(963, 60, 'Santiago Rodriguez', 'ST', 1),
(964, 60, 'Santo Domingo', 'SD', 1),
(965, 60, 'Valverde', 'VA', 1),
(966, 61, 'Aileu', 'AL', 1),
(967, 61, 'Ainaro', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Bobonaro', 'BO', 1),
(970, 61, 'Cova Lima', 'CO', 1),
(971, 61, 'Dili', 'DI', 1),
(972, 61, 'Ermera', 'ER', 1),
(973, 61, 'Lautem', 'LA', 1),
(974, 61, 'Liquica', 'LI', 1),
(975, 61, 'Manatuto', 'MT', 1),
(976, 61, 'Manufahi', 'MF', 1),
(977, 61, 'Oecussi', 'OE', 1),
(978, 61, 'Viqueque', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'Bolivar', 'BOL', 1),
(981, 62, 'Ca&ntilde;ar', 'CAN', 1),
(982, 62, 'Carchi', 'CAR', 1),
(983, 62, 'Chimborazo', 'CHI', 1),
(984, 62, 'Cotopaxi', 'COT', 1),
(985, 62, 'El Oro', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Gal&aacute;pagos', 'GPS', 1),
(988, 62, 'Guayas', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Loja', 'LOJ', 1),
(991, 62, 'Los Rios', 'LRO', 1),
(992, 62, 'Manab&iacute;', 'MAN', 1),
(993, 62, 'Morona Santiago', 'MSA', 1),
(994, 62, 'Napo', 'NAP', 1),
(995, 62, 'Orellana', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Sucumb&iacute;os', 'SUC', 1),
(999, 62, 'Tungurahua', 'TUN', 1),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 1),
(1003, 63, 'Al Buhayrah', 'BHY', 1),
(1004, 63, 'Al Fayyum', 'FYM', 1),
(1005, 63, 'Al Gharbiyah', 'GBY', 1),
(1006, 63, 'Al Iskandariyah', 'IDR', 1),
(1007, 63, 'Al Isma''iliyah', 'IML', 1),
(1008, 63, 'Al Jizah', 'JZH', 1),
(1009, 63, 'Al Minufiyah', 'MFY', 1),
(1010, 63, 'Al Minya', 'MNY', 1),
(1011, 63, 'Al Qahirah', 'QHR', 1),
(1012, 63, 'Al Qalyubiyah', 'QLY', 1),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 1),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Aswan', 'ASW', 1),
(1017, 63, 'Asyut', 'ASY', 1),
(1018, 63, 'Bani Suwayf', 'BSW', 1),
(1019, 63, 'Bur Sa''id', 'BSD', 1),
(1020, 63, 'Dumyat', 'DMY', 1),
(1021, 63, 'Janub Sina''', 'JNS', 1),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 1),
(1023, 63, 'Matruh', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina''', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Cabanas', 'CA', 1),
(1029, 64, 'Chalatenango', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'La Paz', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'San Miguel', 'SM', 1),
(1036, 64, 'San Salvador', 'SS', 1),
(1037, 64, 'San Vicente', 'SV', 1),
(1038, 64, 'Santa Ana', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Usulutan', 'US', 1),
(1041, 65, 'Provincia Annobon', 'AN', 1),
(1042, 65, 'Provincia Bioko Norte', 'BN', 1),
(1043, 65, 'Provincia Bioko Sur', 'BS', 1),
(1044, 65, 'Provincia Centro Sur', 'CS', 1),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 1),
(1046, 65, 'Provincia Litoral', 'LI', 1),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 1),
(1048, 66, 'Central (Maekel)', 'MA', 1),
(1049, 66, 'Anseba (Keren)', 'KE', 1),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 1),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 1),
(1052, 66, 'Southern (Debub)', 'DE', 1),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 1),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 1),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 1),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 1),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 1),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 1),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 1),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 1),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 1),
(1062, 67, 'Polvamaa (Polva)', 'PO', 1),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 1),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 1),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 1),
(1066, 67, 'Valgamaa (Valga)', 'VA', 1),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 1),
(1068, 67, 'Vorumaa (Voru)', 'VO', 1),
(1069, 68, 'Afar', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Benishangul-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Oromia', 'OR', 1),
(1075, 68, 'Somali', 'SM', 1),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 1),
(1077, 68, 'Tigray', 'TG', 1),
(1078, 68, 'Addis Ababa', 'AA', 1),
(1079, 68, 'Dire Dawa', 'DD', 1),
(1080, 71, 'Central Division', 'C', 1),
(1081, 71, 'Northern Division', 'N', 1),
(1082, 71, 'Eastern Division', 'E', 1),
(1083, 71, 'Western Division', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan lääni', 'AL', 1),
(1086, 72, 'Etelä-Suomen lääni', 'ES', 1),
(1087, 72, 'Itä-Suomen lääni', 'IS', 1),
(1088, 72, 'Länsi-Suomen lääni', 'LS', 1),
(1089, 72, 'Lapin lääni', 'LA', 1),
(1090, 72, 'Oulun lääni', 'OU', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Aisne', '02', 1),
(1116, 74, 'Allier', '03', 1),
(1117, 74, 'Alpes de Haute Provence', '04', 1),
(1118, 74, 'Hautes-Alpes', '05', 1),
(1119, 74, 'Alpes Maritimes', '06', 1),
(1120, 74, 'Ard&egrave;che', '07', 1),
(1121, 74, 'Ardennes', '08', 1),
(1122, 74, 'Ari&egrave;ge', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Aude', '11', 1),
(1125, 74, 'Aveyron', '12', 1),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 1),
(1127, 74, 'Calvados', '14', 1),
(1128, 74, 'Cantal', '15', 1),
(1129, 74, 'Charente', '16', 1),
(1130, 74, 'Charente Maritime', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corr&egrave;ze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Haute Corse', '2B', 1),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 1),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 1),
(1137, 74, 'Creuse', '23', 1),
(1138, 74, 'Dordogne', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Dr&ocirc;me', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Eure et Loir', '28', 1),
(1143, 74, 'Finist&egrave;re', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Haute Garonne', '31', 1),
(1146, 74, 'Gers', '32', 1),
(1147, 74, 'Gironde', '33', 1),
(1148, 74, 'H&eacute;rault', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Indre', '36', 1),
(1151, 74, 'Indre et Loire', '37', 1),
(1152, 74, 'Is&eacute;re', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Landes', '40', 1),
(1155, 74, 'Loir et Cher', '41', 1),
(1156, 74, 'Loire', '42', 1),
(1157, 74, 'Haute Loire', '43', 1),
(1158, 74, 'Loire Atlantique', '44', 1),
(1159, 74, 'Loiret', '45', 1),
(1160, 74, 'Lot', '46', 1),
(1161, 74, 'Lot et Garonne', '47', 1),
(1162, 74, 'Loz&egrave;re', '48', 1),
(1163, 74, 'Maine et Loire', '49', 1),
(1164, 74, 'Manche', '50', 1),
(1165, 74, 'Marne', '51', 1),
(1166, 74, 'Haute Marne', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Meurthe et Moselle', '54', 1),
(1169, 74, 'Meuse', '55', 1),
(1170, 74, 'Morbihan', '56', 1),
(1171, 74, 'Moselle', '57', 1),
(1172, 74, 'Ni&egrave;vre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Oise', '60', 1),
(1175, 74, 'Orne', '61', 1),
(1176, 74, 'Pas de Calais', '62', 1),
(1177, 74, 'Puy de D&ocirc;me', '63', 1),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 1),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 1),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 1),
(1181, 74, 'Bas Rhin', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Rh&ocirc;ne', '69', 1),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 1),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Savoie', '73', 1),
(1188, 74, 'Haute Savoie', '74', 1),
(1189, 74, 'Paris', '75', 1),
(1190, 74, 'Seine Maritime', '76', 1),
(1191, 74, 'Seine et Marne', '77', 1),
(1192, 74, 'Yvelines', '78', 1),
(1193, 74, 'Deux S&egrave;vres', '79', 1),
(1194, 74, 'Somme', '80', 1),
(1195, 74, 'Tarn', '81', 1),
(1196, 74, 'Tarn et Garonne', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Vaucluse', '84', 1),
(1199, 74, 'Vend&eacute;e', '85', 1),
(1200, 74, 'Vienne', '86', 1),
(1201, 74, 'Haute Vienne', '87', 1),
(1202, 74, 'Vosges', '88', 1),
(1203, 74, 'Yonne', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Essonne', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Seine St-Denis', '93', 1),
(1208, 74, 'Val de Marne', '94', 1),
(1209, 74, 'Val d''Oise', '95', 1),
(1210, 76, 'Archipel des Marquises', 'M', 1),
(1211, 76, 'Archipel des Tuamotu', 'T', 1),
(1212, 76, 'Archipel des Tubuai', 'I', 1),
(1213, 76, 'Iles du Vent', 'V', 1),
(1214, 76, 'Iles Sous-le-Vent', 'S', 1),
(1215, 77, 'Iles Crozet', 'C', 1),
(1216, 77, 'Iles Kerguelen', 'K', 1),
(1217, 77, 'Ile Amsterdam', 'A', 1),
(1218, 77, 'Ile Saint-Paul', 'P', 1),
(1219, 77, 'Adelie Land', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Ngounie', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue-Ivindo', 'OI', 1),
(1226, 78, 'Ogooue-Lolo', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Woleu-Ntem', 'WN', 1),
(1229, 79, 'Banjul', 'BJ', 1),
(1230, 79, 'Basse', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Lower River', 'LR', 1),
(1238, 79, 'Central River', 'CR', 1),
(1239, 79, 'North Bank', 'NB', 1),
(1240, 79, 'Upper River', 'UR', 1),
(1241, 79, 'Western', 'WE', 1),
(1242, 80, 'Abkhazia', 'AB', 1),
(1243, 80, 'Ajaria', 'AJ', 1),
(1244, 80, 'Tbilisi', 'TB', 1),
(1245, 80, 'Guria', 'GU', 1),
(1246, 80, 'Imereti', 'IM', 1),
(1247, 80, 'Kakheti', 'KA', 1),
(1248, 80, 'Kvemo Kartli', 'KK', 1),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(1253, 80, 'Shida Kartli', 'SK', 1),
(1254, 81, 'Baden-W&uuml;rttemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Th&uuml;ringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 1),
(1271, 82, 'Brong-Ahafo Region', 'BA', 1),
(1272, 82, 'Central Region', 'CE', 1),
(1273, 82, 'Eastern Region', 'EA', 1),
(1274, 82, 'Greater Accra Region', 'GA', 1),
(1275, 82, 'Northern Region', 'NO', 1),
(1276, 82, 'Upper East Region', 'UE', 1),
(1277, 82, 'Upper West Region', 'UW', 1),
(1278, 82, 'Volta Region', 'VO', 1),
(1279, 82, 'Western Region', 'WE', 1),
(1280, 84, 'Attica', 'AT', 1),
(1281, 84, 'Central Greece', 'CN', 1),
(1282, 84, 'Central Macedonia', 'CM', 1),
(1283, 84, 'Crete', 'CR', 1),
(1284, 84, 'East Macedonia and Thrace', 'EM', 1),
(1285, 84, 'Epirus', 'EP', 1),
(1286, 84, 'Ionian Islands', 'II', 1),
(1287, 84, 'North Aegean', 'NA', 1),
(1288, 84, 'Peloponnesos', 'PP', 1),
(1289, 84, 'South Aegean', 'SA', 1),
(1290, 84, 'Thessaly', 'TH', 1),
(1291, 84, 'West Greece', 'WG', 1),
(1292, 84, 'West Macedonia', 'WM', 1),
(1293, 85, 'Avannaa', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Kitaa', 'K', 1),
(1296, 86, 'Saint Andrew', 'A', 1),
(1297, 86, 'Saint David', 'D', 1),
(1298, 86, 'Saint George', 'G', 1),
(1299, 86, 'Saint John', 'J', 1),
(1300, 86, 'Saint Mark', 'M', 1),
(1301, 86, 'Saint Patrick', 'P', 1),
(1302, 86, 'Carriacou', 'C', 1),
(1303, 86, 'Petit Martinique', 'Q', 1),
(1304, 89, 'Alta Verapaz', 'AV', 1),
(1305, 89, 'Baja Verapaz', 'BV', 1),
(1306, 89, 'Chimaltenango', 'CM', 1),
(1307, 89, 'Chiquimula', 'CQ', 1),
(1308, 89, 'El Peten', 'PE', 1),
(1309, 89, 'El Progreso', 'PR', 1),
(1310, 89, 'El Quiche', 'QC', 1),
(1311, 89, 'Escuintla', 'ES', 1),
(1312, 89, 'Guatemala', 'GU', 1),
(1313, 89, 'Huehuetenango', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Jalapa', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Retalhuleu', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'San Marcos', 'SM', 1),
(1321, 89, 'Santa Rosa', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Totonicapan', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Conakry', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Boffa', 'BFA', 1),
(1329, 90, 'Boke', 'BOK', 1),
(1330, 90, 'Coyah', 'COY', 1),
(1331, 90, 'Dabola', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Dubreka', 'DBR', 1),
(1335, 90, 'Faranah', 'FRN', 1),
(1336, 90, 'Forecariah', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Kankan', 'KNK', 1),
(1341, 90, 'Kerouane', 'KRN', 1),
(1342, 90, 'Kindia', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Koubia', 'KBA', 1),
(1345, 90, 'Koundara', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Labe', 'LAB', 1),
(1348, 90, 'Lelouma', 'LLM', 1),
(1349, 90, 'Lola', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Mali', 'MAL', 1),
(1352, 90, 'Mamou', 'MAM', 1),
(1353, 90, 'Mandiana', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'Pita', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Telimele', 'TLM', 1),
(1358, 90, 'Tougue', 'TOG', 1),
(1359, 90, 'Yomou', 'YOM', 1),
(1360, 91, 'Bafata Region', 'BF', 1),
(1361, 91, 'Biombo Region', 'BB', 1),
(1362, 91, 'Bissau Region', 'BS', 1),
(1363, 91, 'Bolama Region', 'BL', 1),
(1364, 91, 'Cacheu Region', 'CA', 1),
(1365, 91, 'Gabu Region', 'GA', 1),
(1366, 91, 'Oio Region', 'OI', 1),
(1367, 91, 'Quinara Region', 'QU', 1),
(1368, 91, 'Tombali Region', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'East Berbice-Corentyne', 'EC', 1),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 1),
(1376, 92, 'Potaro-Siparuni', 'PI', 1),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 1),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Centre', 'CE', 1),
(1381, 93, 'Grand''Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Flat Island', 'F', 1),
(1389, 94, 'McDonald Island', 'M', 1),
(1390, 94, 'Shag Island', 'S', 1),
(1391, 94, 'Heard Island', 'H', 1),
(1392, 95, 'Atlantida', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Colon', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Copan', 'CP', 1),
(1397, 95, 'Cortes', 'CR', 1),
(1398, 95, 'El Paraiso', 'PA', 1),
(1399, 95, 'Francisco Morazan', 'FM', 1),
(1400, 95, 'Gracias a Dios', 'GD', 1),
(1401, 95, 'Intibuca', 'IN', 1),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 1),
(1403, 95, 'La Paz', 'PZ', 1),
(1404, 95, 'Lempira', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Olancho', 'OL', 1),
(1407, 95, 'Santa Barbara', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 1),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 1),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 1),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 1),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 1),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 1),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 1),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 1),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 1),
(1419, 96, 'Islands New Territories', 'NIS', 1),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 1),
(1421, 96, 'North New Territories', 'NNO', 1),
(1422, 96, 'Sai Kung New Territories', 'NSK', 1),
(1423, 96, 'Sha Tin New Territories', 'NST', 1),
(1424, 96, 'Tai Po New Territories', 'NTP', 1),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 1),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 1),
(1427, 96, 'Yuen Long New Territories', 'NYL', 1),
(1428, 97, 'Bacs-Kiskun', 'BK', 1),
(1429, 97, 'Baranya', 'BA', 1),
(1430, 97, 'Bekes', 'BE', 1),
(1431, 97, 'Bekescsaba', 'BS', 1),
(1432, 97, 'Borsod-Abauj-Zemplen', 'BZ', 1),
(1433, 97, 'Budapest', 'BU', 1),
(1434, 97, 'Csongrad', 'CS', 1),
(1435, 97, 'Debrecen', 'DE', 1),
(1436, 97, 'Dunaujvaros', 'DU', 1),
(1437, 97, 'Eger', 'EG', 1),
(1438, 97, 'Fejer', 'FE', 1),
(1439, 97, 'Gyor', 'GY', 1),
(1440, 97, 'Gyor-Moson-Sopron', 'GM', 1),
(1441, 97, 'Hajdu-Bihar', 'HB', 1),
(1442, 97, 'Heves', 'HE', 1),
(1443, 97, 'Hodmezovasarhely', 'HO', 1),
(1444, 97, 'Jasz-Nagykun-Szolnok', 'JN', 1),
(1445, 97, 'Kaposvar', 'KA', 1),
(1446, 97, 'Kecskemet', 'KE', 1),
(1447, 97, 'Komarom-Esztergom', 'KO', 1),
(1448, 97, 'Miskolc', 'MI', 1),
(1449, 97, 'Nagykanizsa', 'NA', 1),
(1450, 97, 'Nograd', 'NO', 1),
(1451, 97, 'Nyiregyhaza', 'NY', 1),
(1452, 97, 'Pecs', 'PE', 1),
(1453, 97, 'Pest', 'PS', 1),
(1454, 97, 'Somogy', 'SO', 1),
(1455, 97, 'Sopron', 'SP', 1),
(1456, 97, 'Szabolcs-Szatmar-Bereg', 'SS', 1),
(1457, 97, 'Szeged', 'SZ', 1),
(1458, 97, 'Szekesfehervar', 'SE', 1),
(1459, 97, 'Szolnok', 'SL', 1),
(1460, 97, 'Szombathely', 'SM', 1),
(1461, 97, 'Tatabanya', 'TA', 1),
(1462, 97, 'Tolna', 'TO', 1),
(1463, 97, 'Vas', 'VA', 1),
(1464, 97, 'Veszprem', 'VE', 1),
(1465, 97, 'Zala', 'ZA', 1),
(1466, 97, 'Zalaegerszeg', 'ZZ', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Norourland eystra', 'NE', 1),
(1470, 98, 'Norourland vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 1),
(1476, 99, 'Andhra Pradesh', 'AP', 1),
(1477, 99, 'Arunachal Pradesh', 'AR', 1),
(1478, 99, 'Assam', 'AS', 1),
(1479, 99, 'Bihar', 'BI', 1),
(1480, 99, 'Chandigarh', 'CH', 1),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 1),
(1482, 99, 'Daman and Diu', 'DM', 1),
(1483, 99, 'Delhi', 'DE', 1),
(1484, 99, 'Goa', 'GO', 1),
(1485, 99, 'Gujarat', 'GU', 1),
(1486, 99, 'Haryana', 'HA', 1),
(1487, 99, 'Himachal Pradesh', 'HP', 1),
(1488, 99, 'Jammu and Kashmir', 'JA', 1),
(1489, 99, 'Karnataka', 'KA', 1),
(1490, 99, 'Kerala', 'KE', 1),
(1491, 99, 'Lakshadweep Islands', 'LI', 1),
(1492, 99, 'Madhya Pradesh', 'MP', 1),
(1493, 99, 'Maharashtra', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Nagaland', 'NA', 1),
(1498, 99, 'Orissa', 'OR', 1),
(1499, 99, 'Pondicherry', 'PO', 1),
(1500, 99, 'Punjab', 'PU', 1),
(1501, 99, 'Rajasthan', 'RA', 1),
(1502, 99, 'Sikkim', 'SI', 1),
(1503, 99, 'Tamil Nadu', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Uttar Pradesh', 'UP', 1),
(1506, 99, 'West Bengal', 'WB', 1),
(1507, 100, 'Aceh', 'AC', 1),
(1508, 100, 'Bali', 'BA', 1),
(1509, 100, 'Banten', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'BoDeTaBek', 'BD', 1),
(1512, 100, 'Gorontalo', 'GO', 1),
(1513, 100, 'Jakarta Raya', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Jawa Barat', 'JB', 1),
(1516, 100, 'Jawa Tengah', 'JT', 1),
(1517, 100, 'Jawa Timur', 'JI', 1),
(1518, 100, 'Kalimantan Barat', 'KB', 1),
(1519, 100, 'Kalimantan Selatan', 'KS', 1),
(1520, 100, 'Kalimantan Tengah', 'KT', 1),
(1521, 100, 'Kalimantan Timur', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Lampung', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Maluku Utara', 'MU', 1),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 1),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 1),
(1528, 100, 'Papua', 'PA', 1),
(1529, 100, 'Riau', 'RI', 1),
(1530, 100, 'Sulawesi Selatan', 'SN', 1),
(1531, 100, 'Sulawesi Tengah', 'ST', 1),
(1532, 100, 'Sulawesi Tenggara', 'SG', 1),
(1533, 100, 'Sulawesi Utara', 'SA', 1),
(1534, 100, 'Sumatera Barat', 'SB', 1),
(1535, 100, 'Sumatera Selatan', 'SS', 1),
(1536, 100, 'Sumatera Utara', 'SU', 1),
(1537, 100, 'Yogyakarta', 'YO', 1),
(1538, 101, 'Tehran', 'TEH', 1),
(1539, 101, 'Qom', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Qazvin', 'QAZ', 1),
(1542, 101, 'Gilan', 'GIL', 1),
(1543, 101, 'Ardabil', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'East Azarbaijan', 'EAZ', 1),
(1546, 101, 'West Azarbaijan', 'WEZ', 1),
(1547, 101, 'Kurdistan', 'KRD', 1),
(1548, 101, 'Hamadan', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Ilam', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 1),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 1),
(1555, 101, 'Bushehr', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 1),
(1559, 101, 'Kerman', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Esfahan', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Mazandaran', 'MZD', 1),
(1564, 101, 'Golestan', 'GLS', 1),
(1565, 101, 'North Khorasan', 'NKH', 1),
(1566, 101, 'Razavi Khorasan', 'RKH', 1),
(1567, 101, 'South Khorasan', 'SKH', 1),
(1568, 102, 'Baghdad', 'BD', 1),
(1569, 102, 'Salah ad Din', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Al Basrah', 'BA', 1),
(1574, 102, 'Dhi Qar', 'DQ', 1),
(1575, 102, 'Al Muthanna', 'MU', 1),
(1576, 102, 'Al Qadisyah', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Al Karbala', 'KB', 1),
(1579, 102, 'An Najaf', 'NJ', 1),
(1580, 102, 'Al Anbar', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Dahuk', 'DH', 1),
(1583, 102, 'Arbil', 'AL', 1),
(1584, 102, 'At Ta''mim', 'TM', 1),
(1585, 102, 'As Sulaymaniyah', 'SL', 1),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1),
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1),
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1),
(1597, 103, 'Leitrim', 'LE', 1),
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1),
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be''er Sheva', 'BS', 1),
(1613, 104, 'Bika''at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '''Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al ''Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa''', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa''', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma''an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Almaty', 'AL', 1),
(1717, 109, 'Almaty City', 'AC', 1),
(1718, 109, 'Aqmola', 'AM', 1),
(1719, 109, 'Aqtobe', 'AQ', 1),
(1720, 109, 'Astana City', 'AS', 1),
(1721, 109, 'Atyrau', 'AT', 1),
(1722, 109, 'Batys Qazaqstan', 'BA', 1),
(1723, 109, 'Bayqongyr City', 'BY', 1),
(1724, 109, 'Mangghystau', 'MA', 1),
(1725, 109, 'Ongtustik Qazaqstan', 'ON', 1),
(1726, 109, 'Pavlodar', 'PA', 1),
(1727, 109, 'Qaraghandy', 'QA', 1),
(1728, 109, 'Qostanay', 'QO', 1),
(1729, 109, 'Qyzylorda', 'QY', 1),
(1730, 109, 'Shyghys Qazaqstan', 'SH', 1),
(1731, 109, 'Soltustik Qazaqstan', 'SO', 1),
(1732, 109, 'Zhambyl', 'ZH', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P''yongan-bukto', 'PYB', 1),
(1769, 112, 'P''yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P''yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch''ungch''ong-bukto', 'CO', 1),
(1774, 113, 'Ch''ungch''ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch''on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t''ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al ''Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra''', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale''s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha''s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al ''Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati''', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'MY-01', 1),
(1972, 129, 'Kedah', 'MY-02', 1),
(1973, 129, 'Kelantan', 'MY-03', 1),
(1974, 129, 'Labuan', 'MY-15', 1),
(1975, 129, 'Melaka', 'MY-04', 1),
(1976, 129, 'Negeri Sembilan', 'MY-05', 1),
(1977, 129, 'Pahang', 'MY-06', 1),
(1978, 129, 'Perak', 'MY-08', 1),
(1979, 129, 'Perlis', 'MY-09', 1),
(1980, 129, 'Pulau Pinang', 'MY-07', 1),
(1981, 129, 'Sabah', 'MY-12', 1),
(1982, 129, 'Sarawak', 'MY-13', 1),
(1983, 129, 'Selangor', 'MY-10', 1),
(1984, 129, 'Terengganu', 'MY-11', 1),
(1985, 129, 'Kuala Lumpur', 'MY-14', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord Brabant', 'NB', 1),
(2336, 150, 'Noord Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke''s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa''id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Abakan', 'AB', 1),
(2722, 176, 'Aginskoye', 'AG', 1),
(2723, 176, 'Anadyr', 'AN', 1),
(2724, 176, 'Arkahangelsk', 'AR', 1),
(2725, 176, 'Astrakhan', 'AS', 1),
(2726, 176, 'Barnaul', 'BA', 1),
(2727, 176, 'Belgorod', 'BE', 1),
(2728, 176, 'Birobidzhan', 'BI', 1),
(2729, 176, 'Blagoveshchensk', 'BL', 1),
(2730, 176, 'Bryansk', 'BR', 1),
(2731, 176, 'Cheboksary', 'CH', 1),
(2732, 176, 'Chelyabinsk', 'CL', 1),
(2733, 176, 'Cherkessk', 'CR', 1),
(2734, 176, 'Chita', 'CI', 1),
(2735, 176, 'Dudinka', 'DU', 1),
(2736, 176, 'Elista', 'EL', 1),
(2737, 176, 'Gomo-Altaysk', 'GO', 1),
(2738, 176, 'Gorno-Altaysk', 'GA', 1),
(2739, 176, 'Groznyy', 'GR', 1),
(2740, 176, 'Irkutsk', 'IR', 1),
(2741, 176, 'Ivanovo', 'IV', 1),
(2742, 176, 'Izhevsk', 'IZ', 1),
(2743, 176, 'Kalinigrad', 'KA', 1),
(2744, 176, 'Kaluga', 'KL', 1),
(2745, 176, 'Kasnodar', 'KS', 1),
(2746, 176, 'Kazan', 'KZ', 1),
(2747, 176, 'Kemerovo', 'KE', 1),
(2748, 176, 'Khabarovsk', 'KH', 1),
(2749, 176, 'Khanty-Mansiysk', 'KM', 1),
(2750, 176, 'Kostroma', 'KO', 1),
(2751, 176, 'Krasnodar', 'KR', 1),
(2752, 176, 'Krasnoyarsk', 'KN', 1),
(2753, 176, 'Kudymkar', 'KU', 1),
(2754, 176, 'Kurgan', 'KG', 1),
(2755, 176, 'Kursk', 'KK', 1),
(2756, 176, 'Kyzyl', 'KY', 1),
(2757, 176, 'Lipetsk', 'LI', 1),
(2758, 176, 'Magadan', 'MA', 1),
(2759, 176, 'Makhachkala', 'MK', 1),
(2760, 176, 'Maykop', 'MY', 1),
(2761, 176, 'Moscow', 'MO', 1),
(2762, 176, 'Murmansk', 'MU', 1),
(2763, 176, 'Nalchik', 'NA', 1),
(2764, 176, 'Naryan Mar', 'NR', 1),
(2765, 176, 'Nazran', 'NZ', 1),
(2766, 176, 'Nizhniy Novgorod', 'NI', 1),
(2767, 176, 'Novgorod', 'NO', 1),
(2768, 176, 'Novosibirsk', 'NV', 1),
(2769, 176, 'Omsk', 'OM', 1),
(2770, 176, 'Orel', 'OR', 1),
(2771, 176, 'Orenburg', 'OE', 1),
(2772, 176, 'Palana', 'PA', 1),
(2773, 176, 'Penza', 'PE', 1),
(2774, 176, 'Perm', 'PR', 1),
(2775, 176, 'Petropavlovsk-Kamchatskiy', 'PK', 1),
(2776, 176, 'Petrozavodsk', 'PT', 1),
(2777, 176, 'Pskov', 'PS', 1),
(2778, 176, 'Rostov-na-Donu', 'RO', 1),
(2779, 176, 'Ryazan', 'RY', 1),
(2780, 176, 'Salekhard', 'SL', 1),
(2781, 176, 'Samara', 'SA', 1),
(2782, 176, 'Saransk', 'SR', 1),
(2783, 176, 'Saratov', 'SV', 1),
(2784, 176, 'Smolensk', 'SM', 1),
(2785, 176, 'St. Petersburg', 'SP', 1),
(2786, 176, 'Stavropol', 'ST', 1),
(2787, 176, 'Syktyvkar', 'SY', 1),
(2788, 176, 'Tambov', 'TA', 1),
(2789, 176, 'Tomsk', 'TO', 1),
(2790, 176, 'Tula', 'TU', 1),
(2791, 176, 'Tura', 'TR', 1),
(2792, 176, 'Tver', 'TV', 1),
(2793, 176, 'Tyumen', 'TY', 1),
(2794, 176, 'Ufa', 'UF', 1),
(2795, 176, 'Ul''yanovsk', 'UL', 1),
(2796, 176, 'Ulan-Ude', 'UU', 1),
(2797, 176, 'Ust''-Ordynskiy', 'US', 1),
(2798, 176, 'Vladikavkaz', 'VL', 1),
(2799, 176, 'Vladimir', 'VA', 1),
(2800, 176, 'Vladivostok', 'VV', 1),
(2801, 176, 'Volgograd', 'VG', 1),
(2802, 176, 'Vologda', 'VD', 1),
(2803, 176, 'Voronezh', 'VO', 1),
(2804, 176, 'Vyatka', 'VY', 1),
(2805, 176, 'Yakutsk', 'YA', 1),
(2806, 176, 'Yaroslavl', 'YR', 1),
(2807, 176, 'Yekaterinburg', 'YE', 1),
(2808, 176, 'Yoshkar-Ola', 'YO', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A''ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa''asaleleaga', 'FA', 1),
(2856, 181, 'Gaga''emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa''itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va''a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '''Asir', 'AS', 1),
(2882, 184, 'Ha''il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand'' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand'' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3034, 199, 'A''ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1),
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa''iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1),
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa''iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1),
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'G&auml;vleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'J&auml;mtland', 'Z', 1),
(3080, 203, 'J&ouml;nk&ouml;ping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, '&Ouml;rebro', 'T', 1),
(3085, 203, '&Ouml;sterg&ouml;tland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'S&ouml;dermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'V&auml;rmland', 'S', 1),
(3091, 203, 'V&auml;sterbotten', 'AC', 1),
(3092, 203, 'V&auml;sternorrland', 'Y', 1),
(3093, 203, 'V&auml;stmanland', 'U', 1),
(3094, 203, 'V&auml;stra G&ouml;taland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graub&uuml;nden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1),
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Z&uuml;rich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1),
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1),
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1),
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1),
(3133, 205, 'Rif Dimashq', 'RD', 1),
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1),
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t''ou', 'NT', 1),
(3145, 206, 'P''eng-hu', 'PH', 1),
(3146, 206, 'P''ing-tung', 'PT', 1),
(3147, 206, 'T''ai-chung', 'TG', 1),
(3148, 206, 'T''ai-nan', 'TA', 1),
(3149, 206, 'T''ai-pei county', 'TP', 1),
(3150, 206, 'T''ai-tung', 'TT', 1),
(3151, 206, 'T''ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T''ai-chung', 'TH', 1),
(3157, 206, 'T''ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T''ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha''apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava''u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakır', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Kırklareli', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Cherkasy', 'CK', 1),
(3481, 220, 'Chernihiv', 'CH', 1),
(3482, 220, 'Chernivtsi', 'CV', 1),
(3483, 220, 'Crimea', 'CR', 1),
(3484, 220, 'Dnipropetrovs''k', 'DN', 1),
(3485, 220, 'Donets''k', 'DO', 1),
(3486, 220, 'Ivano-Frankivs''k', 'IV', 1),
(3487, 220, 'Kharkiv Kherson', 'KL', 1),
(3488, 220, 'Khmel''nyts''kyy', 'KM', 1),
(3489, 220, 'Kirovohrad', 'KR', 1),
(3490, 220, 'Kiev', 'KV', 1),
(3491, 220, 'Kyyiv', 'KY', 1),
(3492, 220, 'Luhans''k', 'LU', 1),
(3493, 220, 'L''viv', 'LV', 1),
(3494, 220, 'Mykolayiv', 'MY', 1),
(3495, 220, 'Odesa', 'OD', 1),
(3496, 220, 'Poltava', 'PO', 1),
(3497, 220, 'Rivne', 'RI', 1),
(3498, 220, 'Sevastopol', 'SE', 1),
(3499, 220, 'Sumy', 'SU', 1),
(3500, 220, 'Ternopil''', 'TE', 1),
(3501, 220, 'Vinnytsya', 'VI', 1),
(3502, 220, 'Volyn''', 'VO', 1),
(3503, 220, 'Zakarpattya', 'ZK', 1),
(3504, 220, 'Zaporizhzhya', 'ZA', 1),
(3505, 220, 'Zhytomyr', 'ZH', 1),
(3506, 221, 'Abu Zaby', 'AZ', 1),
(3507, 221, '''Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubayy', 'DU', 1),
(3511, 221, 'R''as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg''ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog''iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma''rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa''dah', 'SD', 1),
(3805, 235, 'San''a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta''izz', 'TA', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3862, 105, 'Carbonia-Iglesias', 'CI', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3895, 105, 'Medio Campidano', 'VS', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3902, 105, 'Ogliastra', 'OG', 1),
(3903, 105, 'Olbia-Tempio', 'OT', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Brussels-Capital Region', 'BRU', 1),
(3971, 138, 'Aguascalientes', 'AG', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Bar', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Bijelo Polje', '04', 1),
(3977, 242, 'Budva', '05', 1),
(3978, 242, 'Cetinje', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Herceg-Novi', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Kotor', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Plav', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Plužine', '15', 1),
(3988, 242, 'Podgorica', '16', 1),
(3989, 242, 'Rožaje', '17', 1),
(3990, 242, 'Šavnik', '18', 1),
(3991, 242, 'Tivat', '19', 1),
(3992, 242, 'Ulcinj', '20', 1),
(3993, 242, 'Žabljak', '21', 1),
(3994, 243, 'Belgrade', '00', 1),
(3995, 243, 'North Bačka', '01', 1),
(3996, 243, 'Central Banat', '02', 1),
(3997, 243, 'North Banat', '03', 1),
(3998, 243, 'South Banat', '04', 1),
(3999, 243, 'West Bačka', '05', 1),
(4000, 243, 'South Bačka', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Mačva', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Podunavlje', '10', 1),
(4005, 243, 'Braničevo', '11', 1),
(4006, 243, 'Šumadija', '12', 1),
(4007, 243, 'Pomoravlje', '13', 1),
(4008, 243, 'Bor', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Zlatibor', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Raška', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Nišava', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Pirot', '22', 1),
(4017, 243, 'Jablanica', '23', 1),
(4018, 243, 'Pčinja', '24', 1),
(4020, 245, 'Bonaire', 'BO', 1),
(4021, 245, 'Saba', 'SA', 1),
(4022, 245, 'Sint Eustatius', 'SE', 1),
(4023, 248, 'Central Equatoria', 'EC', 1),
(4024, 248, 'Eastern Equatoria', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Lakes', 'LK', 1),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 1),
(4028, 248, 'Unity', 'UY', 1),
(4029, 248, 'Upper Nile', 'NU', 1),
(4030, 248, 'Warrap', 'WR', 1),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 1),
(4032, 248, 'Western Equatoria', 'EW', 1),
(4035, 129, 'Putrajaya', 'MY-16', 1),
(4036, 117, 'Ainaži, Salacgrīvas novads', '0661405', 1),
(4037, 117, 'Aizkraukle, Aizkraukles novads', '0320201', 1),
(4038, 117, 'Aizkraukles novads', '0320200', 1),
(4039, 117, 'Aizpute, Aizputes novads', '0640605', 1),
(4040, 117, 'Aizputes novads', '0640600', 1),
(4041, 117, 'Aknīste, Aknīstes novads', '0560805', 1),
(4042, 117, 'Aknīstes novads', '0560800', 1),
(4043, 117, 'Aloja, Alojas novads', '0661007', 1),
(4044, 117, 'Alojas novads', '0661000', 1),
(4045, 117, 'Alsungas novads', '0624200', 1),
(4046, 117, 'Alūksne, Alūksnes novads', '0360201', 1),
(4047, 117, 'Alūksnes novads', '0360200', 1),
(4048, 117, 'Amatas novads', '0424701', 1),
(4049, 117, 'Ape, Apes novads', '0360805', 1),
(4050, 117, 'Apes novads', '0360800', 1),
(4051, 117, 'Auce, Auces novads', '0460805', 1),
(4052, 117, 'Auces novads', '0460800', 1),
(4053, 117, 'Ādažu novads', '0804400', 1),
(4054, 117, 'Babītes novads', '0804900', 1),
(4055, 117, 'Baldone, Baldones novads', '0800605', 1),
(4056, 117, 'Baldones novads', '0800600', 1),
(4057, 117, 'Baloži, Ķekavas novads', '0800807', 1),
(4058, 117, 'Baltinavas novads', '0384400', 1),
(4059, 117, 'Balvi, Balvu novads', '0380201', 1),
(4060, 117, 'Balvu novads', '0380200', 1),
(4061, 117, 'Bauska, Bauskas novads', '0400201', 1),
(4062, 117, 'Bauskas novads', '0400200', 1),
(4063, 117, 'Beverīnas novads', '0964700', 1),
(4064, 117, 'Brocēni, Brocēnu novads', '0840605', 1),
(4065, 117, 'Brocēnu novads', '0840601', 1),
(4066, 117, 'Burtnieku novads', '0967101', 1),
(4067, 117, 'Carnikavas novads', '0805200', 1),
(4068, 117, 'Cesvaine, Cesvaines novads', '0700807', 1),
(4069, 117, 'Cesvaines novads', '0700800', 1),
(4070, 117, 'Cēsis, Cēsu novads', '0420201', 1),
(4071, 117, 'Cēsu novads', '0420200', 1),
(4072, 117, 'Ciblas novads', '0684901', 1),
(4073, 117, 'Dagda, Dagdas novads', '0601009', 1),
(4074, 117, 'Dagdas novads', '0601000', 1),
(4075, 117, 'Daugavpils', '0050000', 1),
(4076, 117, 'Daugavpils novads', '0440200', 1),
(4077, 117, 'Dobele, Dobeles novads', '0460201', 1),
(4078, 117, 'Dobeles novads', '0460200', 1),
(4079, 117, 'Dundagas novads', '0885100', 1),
(4080, 117, 'Durbe, Durbes novads', '0640807', 1),
(4081, 117, 'Durbes novads', '0640801', 1),
(4082, 117, 'Engures novads', '0905100', 1),
(4083, 117, 'Ērgļu novads', '0705500', 1),
(4084, 117, 'Garkalnes novads', '0806000', 1),
(4085, 117, 'Grobiņa, Grobiņas novads', '0641009', 1),
(4086, 117, 'Grobiņas novads', '0641000', 1),
(4087, 117, 'Gulbene, Gulbenes novads', '0500201', 1),
(4088, 117, 'Gulbenes novads', '0500200', 1),
(4089, 117, 'Iecavas novads', '0406400', 1),
(4090, 117, 'Ikšķile, Ikšķiles novads', '0740605', 1),
(4091, 117, 'Ikšķiles novads', '0740600', 1),
(4092, 117, 'Ilūkste, Ilūkstes novads', '0440807', 1),
(4093, 117, 'Ilūkstes novads', '0440801', 1),
(4094, 117, 'Inčukalna novads', '0801800', 1),
(4095, 117, 'Jaunjelgava, Jaunjelgavas novads', '0321007', 1),
(4096, 117, 'Jaunjelgavas novads', '0321000', 1),
(4097, 117, 'Jaunpiebalgas novads', '0425700', 1),
(4098, 117, 'Jaunpils novads', '0905700', 1),
(4099, 117, 'Jelgava', '0090000', 1),
(4100, 117, 'Jelgavas novads', '0540200', 1),
(4101, 117, 'Jēkabpils', '0110000', 1),
(4102, 117, 'Jēkabpils novads', '0560200', 1),
(4103, 117, 'Jūrmala', '0130000', 1),
(4104, 117, 'Kalnciems, Jelgavas novads', '0540211', 1),
(4105, 117, 'Kandava, Kandavas novads', '0901211', 1),
(4106, 117, 'Kandavas novads', '0901201', 1),
(4107, 117, 'Kārsava, Kārsavas novads', '0681009', 1),
(4108, 117, 'Kārsavas novads', '0681000', 1),
(4109, 117, 'Kocēnu novads ,bij. Valmieras)', '0960200', 1),
(4110, 117, 'Kokneses novads', '0326100', 1),
(4111, 117, 'Krāslava, Krāslavas novads', '0600201', 1),
(4112, 117, 'Krāslavas novads', '0600202', 1),
(4113, 117, 'Krimuldas novads', '0806900', 1),
(4114, 117, 'Krustpils novads', '0566900', 1),
(4115, 117, 'Kuldīga, Kuldīgas novads', '0620201', 1),
(4116, 117, 'Kuldīgas novads', '0620200', 1),
(4117, 117, 'Ķeguma novads', '0741001', 1),
(4118, 117, 'Ķegums, Ķeguma novads', '0741009', 1),
(4119, 117, 'Ķekavas novads', '0800800', 1),
(4120, 117, 'Lielvārde, Lielvārdes novads', '0741413', 1),
(4121, 117, 'Lielvārdes novads', '0741401', 1),
(4122, 117, 'Liepāja', '0170000', 1),
(4123, 117, 'Limbaži, Limbažu novads', '0660201', 1),
(4124, 117, 'Limbažu novads', '0660200', 1),
(4125, 117, 'Līgatne, Līgatnes novads', '0421211', 1),
(4126, 117, 'Līgatnes novads', '0421200', 1),
(4127, 117, 'Līvāni, Līvānu novads', '0761211', 1),
(4128, 117, 'Līvānu novads', '0761201', 1),
(4129, 117, 'Lubāna, Lubānas novads', '0701413', 1),
(4130, 117, 'Lubānas novads', '0701400', 1),
(4131, 117, 'Ludza, Ludzas novads', '0680201', 1),
(4132, 117, 'Ludzas novads', '0680200', 1),
(4133, 117, 'Madona, Madonas novads', '0700201', 1),
(4134, 117, 'Madonas novads', '0700200', 1),
(4135, 117, 'Mazsalaca, Mazsalacas novads', '0961011', 1),
(4136, 117, 'Mazsalacas novads', '0961000', 1),
(4137, 117, 'Mālpils novads', '0807400', 1),
(4138, 117, 'Mārupes novads', '0807600', 1),
(4139, 117, 'Mērsraga novads', '0887600', 1),
(4140, 117, 'Naukšēnu novads', '0967300', 1),
(4141, 117, 'Neretas novads', '0327100', 1),
(4142, 117, 'Nīcas novads', '0647900', 1),
(4143, 117, 'Ogre, Ogres novads', '0740201', 1),
(4144, 117, 'Ogres novads', '0740202', 1),
(4145, 117, 'Olaine, Olaines novads', '0801009', 1),
(4146, 117, 'Olaines novads', '0801000', 1),
(4147, 117, 'Ozolnieku novads', '0546701', 1),
(4148, 117, 'Pārgaujas novads', '0427500', 1),
(4149, 117, 'Pāvilosta, Pāvilostas novads', '0641413', 1),
(4150, 117, 'Pāvilostas novads', '0641401', 1),
(4151, 117, 'Piltene, Ventspils novads', '0980213', 1),
(4152, 117, 'Pļaviņas, Pļaviņu novads', '0321413', 1),
(4153, 117, 'Pļaviņu novads', '0321400', 1),
(4154, 117, 'Preiļi, Preiļu novads', '0760201', 1),
(4155, 117, 'Preiļu novads', '0760202', 1),
(4156, 117, 'Priekule, Priekules novads', '0641615', 1),
(4157, 117, 'Priekules novads', '0641600', 1),
(4158, 117, 'Priekuļu novads', '0427300', 1),
(4159, 117, 'Raunas novads', '0427700', 1),
(4160, 117, 'Rēzekne', '0210000', 1),
(4161, 117, 'Rēzeknes novads', '0780200', 1),
(4162, 117, 'Riebiņu novads', '0766300', 1),
(4163, 117, 'Rīga', '0010000', 1),
(4164, 117, 'Rojas novads', '0888300', 1),
(4165, 117, 'Ropažu novads', '0808400', 1),
(4166, 117, 'Rucavas novads', '0648500', 1),
(4167, 117, 'Rugāju novads', '0387500', 1),
(4168, 117, 'Rundāles novads', '0407700', 1),
(4169, 117, 'Rūjiena, Rūjienas novads', '0961615', 1),
(4170, 117, 'Rūjienas novads', '0961600', 1),
(4171, 117, 'Sabile, Talsu novads', '0880213', 1),
(4172, 117, 'Salacgrīva, Salacgrīvas novads', '0661415', 1),
(4173, 117, 'Salacgrīvas novads', '0661400', 1),
(4174, 117, 'Salas novads', '0568700', 1),
(4175, 117, 'Salaspils novads', '0801200', 1),
(4176, 117, 'Salaspils, Salaspils novads', '0801211', 1),
(4177, 117, 'Saldus novads', '0840200', 1),
(4178, 117, 'Saldus, Saldus novads', '0840201', 1),
(4179, 117, 'Saulkrasti, Saulkrastu novads', '0801413', 1),
(4180, 117, 'Saulkrastu novads', '0801400', 1),
(4181, 117, 'Seda, Strenču novads', '0941813', 1),
(4182, 117, 'Sējas novads', '0809200', 1),
(4183, 117, 'Sigulda, Siguldas novads', '0801615', 1),
(4184, 117, 'Siguldas novads', '0801601', 1),
(4185, 117, 'Skrīveru novads', '0328200', 1),
(4186, 117, 'Skrunda, Skrundas novads', '0621209', 1),
(4187, 117, 'Skrundas novads', '0621200', 1),
(4188, 117, 'Smiltene, Smiltenes novads', '0941615', 1),
(4189, 117, 'Smiltenes novads', '0941600', 1),
(4190, 117, 'Staicele, Alojas novads', '0661017', 1),
(4191, 117, 'Stende, Talsu novads', '0880215', 1),
(4192, 117, 'Stopiņu novads', '0809600', 1),
(4193, 117, 'Strenči, Strenču novads', '0941817', 1),
(4194, 117, 'Strenču novads', '0941800', 1),
(4195, 117, 'Subate, Ilūkstes novads', '0440815', 1),
(4196, 117, 'Talsi, Talsu novads', '0880201', 1),
(4197, 117, 'Talsu novads', '0880200', 1),
(4198, 117, 'Tērvetes novads', '0468900', 1),
(4199, 117, 'Tukuma novads', '0900200', 1),
(4200, 117, 'Tukums, Tukuma novads', '0900201', 1),
(4201, 117, 'Vaiņodes novads', '0649300', 1),
(4202, 117, 'Valdemārpils, Talsu novads', '0880217', 1),
(4203, 117, 'Valka, Valkas novads', '0940201', 1),
(4204, 117, 'Valkas novads', '0940200', 1),
(4205, 117, 'Valmiera', '0250000', 1),
(4206, 117, 'Vangaži, Inčukalna novads', '0801817', 1),
(4207, 117, 'Varakļāni, Varakļānu novads', '0701817', 1),
(4208, 117, 'Varakļānu novads', '0701800', 1),
(4209, 117, 'Vārkavas novads', '0769101', 1),
(4210, 117, 'Vecpiebalgas novads', '0429300', 1),
(4211, 117, 'Vecumnieku novads', '0409500', 1),
(4212, 117, 'Ventspils', '0270000', 1),
(4213, 117, 'Ventspils novads', '0980200', 1),
(4214, 117, 'Viesīte, Viesītes novads', '0561815', 1),
(4215, 117, 'Viesītes novads', '0561800', 1),
(4216, 117, 'Viļaka, Viļakas novads', '0381615', 1),
(4217, 117, 'Viļakas novads', '0381600', 1),
(4218, 117, 'Viļāni, Viļānu novads', '0781817', 1),
(4219, 117, 'Viļānu novads', '0781800', 1),
(4220, 117, 'Zilupe, Zilupes novads', '0681817', 1),
(4221, 117, 'Zilupes novads', '0681801', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone_to_geo_zone`
--

CREATE TABLE IF NOT EXISTS `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=119 ;

--
-- Dumping data for table `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(112, 222, 0, 4, '2015-11-25 06:54:54', '0000-00-00 00:00:00'),
(117, 63, 1008, 9, '2015-12-28 07:37:49', '0000-00-00 00:00:00'),
(116, 63, 1006, 8, '2015-12-28 06:16:17', '0000-00-00 00:00:00'),
(115, 63, 1011, 7, '2015-12-28 06:15:14', '0000-00-00 00:00:00'),
(111, 223, 0, 6, '2015-11-25 06:54:29', '0000-00-00 00:00:00'),
(118, 63, 0, 5, '2015-12-29 04:04:27', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
