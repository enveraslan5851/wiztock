-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 06 May 2021, 13:35:28
-- Sunucu sürümü: 5.7.31
-- PHP Sürümü: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `wiztock`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `short_name` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `phone` varchar(11) COLLATE utf8_turkish_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `postal_code` varchar(5) COLLATE utf8_turkish_ci DEFAULT NULL,
  `tax_office` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `tax_number` varchar(11) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `company`
--

INSERT INTO `company` (`company_id`, `title`, `short_name`, `phone`, `email`, `address`, `postal_code`, `tax_office`, `tax_number`) VALUES
(1, 'Ankara Mobilya Ltd Şti', 'Ankara Mobilya Ltd Şti', '12345678912', 'enver@enver.com', 'asdfad', '34160', 'asdfa', '12345678912');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `corporate`
--

DROP TABLE IF EXISTS `corporate`;
CREATE TABLE IF NOT EXISTS `corporate` (
  `corporate_id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `short_name` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `tax_office` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `tax_number` varchar(11) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`corporate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `corporate_person`
--

DROP TABLE IF EXISTS `corporate_person`;
CREATE TABLE IF NOT EXISTS `corporate_person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `corporate_id` int(11) NOT NULL,
  `name_surname` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `phone` varchar(11) COLLATE utf8_turkish_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `description` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  KEY `corporate_id` (`corporate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `phone` varchar(11) COLLATE utf8_turkish_ci DEFAULT NULL,
  `adress` varchar(150) COLLATE utf8_turkish_ci DEFAULT NULL,
  `town` varchar(30) COLLATE utf8_turkish_ci DEFAULT NULL,
  `city` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `postal_code` varchar(5) COLLATE utf8_turkish_ci NOT NULL,
  `is_corporate` tinyint(1) NOT NULL DEFAULT '1',
  `is_customer` tinyint(1) NOT NULL DEFAULT '1',
  `is_supplier` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name_surname` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `is_main_user` tinyint(1) NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `email_employee_index` (`email`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `employee`
--

INSERT INTO `employee` (`employee_id`, `company_id`, `name_surname`, `email`, `password`, `is_main_user`) VALUES
(1, 1, 'Enver ASLAN', 'enver@enver.com', '12345', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `individual`
--

DROP TABLE IF EXISTS `individual`;
CREATE TABLE IF NOT EXISTS `individual` (
  `individual_id` int(11) NOT NULL,
  `name_surname` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `ssn` varchar(11) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`individual_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category_id` int(11) NOT NULL,
  `product_name` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `uom_id` int(11) NOT NULL,
  `code` varchar(50) COLLATE utf8_turkish_ci DEFAULT NULL,
  `barcode` varchar(150) COLLATE utf8_turkish_ci DEFAULT NULL,
  `img_url` varchar(250) COLLATE utf8_turkish_ci DEFAULT NULL,
  `is_inventroy_tracking` tinyint(1) NOT NULL DEFAULT '0',
  `inital_stock_amount` double NOT NULL DEFAULT '0',
  `is_notifiying` tinyint(1) NOT NULL DEFAULT '0',
  `nofitication_amount` double NOT NULL DEFAULT '0',
  `purchasing_price` double NOT NULL DEFAULT '0',
  `selling_price` double NOT NULL DEFAULT '0',
  `tax_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `product_category_id` (`product_category_id`),
  KEY `uom_id` (`uom_id`),
  KEY `tax_id` (`tax_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_category`
--

DROP TABLE IF EXISTS `product_category`;
CREATE TABLE IF NOT EXISTS `product_category` (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`product_category_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_warehouse`
--

DROP TABLE IF EXISTS `product_warehouse`;
CREATE TABLE IF NOT EXISTS `product_warehouse` (
  `product_warehouse_id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity_in_stock` double NOT NULL,
  PRIMARY KEY (`product_warehouse_id`),
  KEY `warehouse_id` (`warehouse_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `shipment`
--

DROP TABLE IF EXISTS `shipment`;
CREATE TABLE IF NOT EXISTS `shipment` (
  `shipment_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `shipment_type_id` int(11) NOT NULL,
  `freight_bill_number` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `source_warehouse_id` int(11) NOT NULL,
  `destination_warehouse_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `issue_date` datetime NOT NULL,
  `shipment_date` datetime NOT NULL,
  PRIMARY KEY (`shipment_id`),
  KEY `shipment_type_id` (`shipment_type_id`),
  KEY `company_id` (`company_id`),
  KEY `destination_warehouse_id` (`destination_warehouse_id`),
  KEY `source_warehouse_id` (`source_warehouse_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `shipment_detail`
--

DROP TABLE IF EXISTS `shipment_detail`;
CREATE TABLE IF NOT EXISTS `shipment_detail` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `shipment_id` int(11) NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`),
  KEY `shipment_id` (`shipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `shipment_type`
--

DROP TABLE IF EXISTS `shipment_type`;
CREATE TABLE IF NOT EXISTS `shipment_type` (
  `shipment_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`shipment_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tax`
--

DROP TABLE IF EXISTS `tax`;
CREATE TABLE IF NOT EXISTS `tax` (
  `tax_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `rate` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`tax_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `unit_of_measurement`
--

DROP TABLE IF EXISTS `unit_of_measurement`;
CREATE TABLE IF NOT EXISTS `unit_of_measurement` (
  `uom_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`uom_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`) VALUES
(1, 'Paul', 'Doelle', 'paul@test.com'),
(2, 'John', 'Doe', 'john@test.com'),
(3, 'Enver', 'Smith', 'adrian@test.com'),
(4, 'Enver', 'Smith', 'adrian@test.com');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE IF NOT EXISTS `warehouse` (
  `warehouse_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `address` varchar(150) COLLATE utf8_turkish_ci NOT NULL,
  `town` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `city` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `postal_code` varchar(5) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`warehouse_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `corporate`
--
ALTER TABLE `corporate`
  ADD CONSTRAINT `corporate_ibfk_1` FOREIGN KEY (`corporate_id`) REFERENCES `customer` (`customer_id`);

--
-- Tablo kısıtlamaları `corporate_person`
--
ALTER TABLE `corporate_person`
  ADD CONSTRAINT `corporate_person_ibfk_1` FOREIGN KEY (`corporate_id`) REFERENCES `corporate` (`corporate_id`);

--
-- Tablo kısıtlamaları `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`);

--
-- Tablo kısıtlamaları `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`);

--
-- Tablo kısıtlamaları `individual`
--
ALTER TABLE `individual`
  ADD CONSTRAINT `individual_ibfk_1` FOREIGN KEY (`individual_id`) REFERENCES `customer` (`customer_id`);

--
-- Tablo kısıtlamaları `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`product_category_id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`uom_id`) REFERENCES `unit_of_measurement` (`uom_id`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`tax_id`) REFERENCES `tax` (`tax_id`);

--
-- Tablo kısıtlamaları `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `product_category_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`);

--
-- Tablo kısıtlamaları `product_warehouse`
--
ALTER TABLE `product_warehouse`
  ADD CONSTRAINT `product_warehouse_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`warehouse_id`),
  ADD CONSTRAINT `product_warehouse_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Tablo kısıtlamaları `shipment`
--
ALTER TABLE `shipment`
  ADD CONSTRAINT `shipment_ibfk_1` FOREIGN KEY (`shipment_type_id`) REFERENCES `shipment_type` (`shipment_type_id`),
  ADD CONSTRAINT `shipment_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  ADD CONSTRAINT `shipment_ibfk_3` FOREIGN KEY (`destination_warehouse_id`) REFERENCES `warehouse` (`warehouse_id`),
  ADD CONSTRAINT `shipment_ibfk_4` FOREIGN KEY (`source_warehouse_id`) REFERENCES `warehouse` (`warehouse_id`),
  ADD CONSTRAINT `shipment_ibfk_5` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Tablo kısıtlamaları `shipment_detail`
--
ALTER TABLE `shipment_detail`
  ADD CONSTRAINT `shipment_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `shipment_detail_ibfk_2` FOREIGN KEY (`shipment_id`) REFERENCES `shipment` (`shipment_id`);

--
-- Tablo kısıtlamaları `tax`
--
ALTER TABLE `tax`
  ADD CONSTRAINT `tax_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`);

--
-- Tablo kısıtlamaları `unit_of_measurement`
--
ALTER TABLE `unit_of_measurement`
  ADD CONSTRAINT `unit_of_measurement_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`);

--
-- Tablo kısıtlamaları `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `warehouse_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
