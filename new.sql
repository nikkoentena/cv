-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.4-MariaDB-1:10.5.4+maria~focal - mariadb.org binary distribution
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for crater
CREATE DATABASE IF NOT EXISTS `crater` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `crater`;

-- Dumping structure for table crater.addresses
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_street_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_street_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_country_id_foreign` (`country_id`),
  KEY `addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `addresses_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.addresses: ~2 rows (approximately)
DELETE FROM `addresses`;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` (`id`, `name`, `address_street_1`, `address_street_2`, `city`, `state`, `country_id`, `zip`, `phone`, `fax`, `type`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'LG 11 Cityland Pioneer Tower, Pioneer Street, Mandaluyong, 1554 Metro Manila', NULL, 'Santa Rosa', 'Laguna', 173, NULL, '(02) 7625 6254', NULL, NULL, 1, '2020-07-28 00:04:11', '2020-07-28 00:04:11'),
	(2, 'Dio Brando', '12222 Rizal Blvd, Balibago', NULL, 'Santa Rosa', 'Laguna', 173, '4026', '09215462961', NULL, 'billing', 2, '2020-07-28 00:21:58', '2020-07-28 00:21:58');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;

-- Dumping structure for table crater.companies
CREATE TABLE IF NOT EXISTS `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unique_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.companies: ~0 rows (approximately)
DELETE FROM `companies`;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` (`id`, `name`, `logo`, `unique_hash`, `created_at`, `updated_at`) VALUES
	(1, 'Speedwagon Foundation', NULL, 'l4xjHHOLXqVPNeZcYY4gVFU6S2mdh0gdTfieW2ZJ6iHmP21eJcwn6ScVJO17', '2020-07-28 00:04:11', '2020-07-28 00:04:11');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;

-- Dumping structure for table crater.company_settings
CREATE TABLE IF NOT EXISTS `company_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_settings_company_id_foreign` (`company_id`),
  CONSTRAINT `company_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.company_settings: ~29 rows (approximately)
DELETE FROM `company_settings`;
/*!40000 ALTER TABLE `company_settings` DISABLE KEYS */;
INSERT INTO `company_settings` (`id`, `option`, `value`, `company_id`, `created_at`, `updated_at`) VALUES
	(1, 'notification_email', 'nikkoentena@gmail.com', 1, '2020-07-28 00:04:11', '2020-07-28 00:04:11'),
	(2, 'currency', '11', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(3, 'time_zone', 'Asia/Hong_Kong', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(4, 'language', 'en', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(5, 'carbon_date_format', 'd M Y', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(6, 'moment_date_format', 'DD MMM YYYY', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(7, 'fiscal_year', '1-12', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(8, 'invoice_auto_generate', 'YES', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(9, 'invoice_prefix', 'INV', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(10, 'estimate_prefix', 'EST', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(11, 'estimate_auto_generate', 'YES', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(12, 'payment_prefix', 'PAY', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(13, 'payment_auto_generate', 'YES', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(14, 'primary_text_color', '#5851D8', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(15, 'heading_text_color', '#595959', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(16, 'section_heading_text_color', '#040405', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(17, 'border_color', '#EAF1FB', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(18, 'body_text_color', '#595959', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(19, 'footer_text_color', '#595959', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(20, 'footer_total_color', '#5851D8', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(21, 'footer_bg_color', '#F9FBFF', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(22, 'date_text_color', '#A5ACC1', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(23, 'invoice_primary_color', '#5851D8', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(24, 'invoice_column_heading', '#55547A', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(25, 'invoice_field_label', '#55547A', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(26, 'invoice_field_value', '#040405', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(27, 'invoice_body_text', '#040405', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(28, 'invoice_description_text', '#595959', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38'),
	(29, 'invoice_border_color', '#EAF1FB', 1, '2020-07-28 00:04:38', '2020-07-28 00:04:38');
/*!40000 ALTER TABLE `company_settings` ENABLE KEYS */;

-- Dumping structure for table crater.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phonecode` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `countries_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.countries: ~246 rows (approximately)
DELETE FROM `countries`;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` (`id`, `code`, `name`, `phonecode`) VALUES
	(1, 'AF', 'Afghanistan', 93),
	(2, 'AL', 'Albania', 355),
	(3, 'DZ', 'Algeria', 213),
	(4, 'AS', 'American Samoa', 1684),
	(5, 'AD', 'Andorra', 376),
	(6, 'AO', 'Angola', 244),
	(7, 'AI', 'Anguilla', 1264),
	(8, 'AQ', 'Antarctica', 0),
	(9, 'AG', 'Antigua And Barbuda', 1268),
	(10, 'AR', 'Argentina', 54),
	(11, 'AM', 'Armenia', 374),
	(12, 'AW', 'Aruba', 297),
	(13, 'AU', 'Australia', 61),
	(14, 'AT', 'Austria', 43),
	(15, 'AZ', 'Azerbaijan', 994),
	(16, 'BS', 'Bahamas The', 1242),
	(17, 'BH', 'Bahrain', 973),
	(18, 'BD', 'Bangladesh', 880),
	(19, 'BB', 'Barbados', 1246),
	(20, 'BY', 'Belarus', 375),
	(21, 'BE', 'Belgium', 32),
	(22, 'BZ', 'Belize', 501),
	(23, 'BJ', 'Benin', 229),
	(24, 'BM', 'Bermuda', 1441),
	(25, 'BT', 'Bhutan', 975),
	(26, 'BO', 'Bolivia', 591),
	(27, 'BA', 'Bosnia and Herzegovina', 387),
	(28, 'BW', 'Botswana', 267),
	(29, 'BV', 'Bouvet Island', 0),
	(30, 'BR', 'Brazil', 55),
	(31, 'IO', 'British Indian Ocean Territory', 246),
	(32, 'BN', 'Brunei', 673),
	(33, 'BG', 'Bulgaria', 359),
	(34, 'BF', 'Burkina Faso', 226),
	(35, 'BI', 'Burundi', 257),
	(36, 'KH', 'Cambodia', 855),
	(37, 'CM', 'Cameroon', 237),
	(38, 'CA', 'Canada', 1),
	(39, 'CV', 'Cape Verde', 238),
	(40, 'KY', 'Cayman Islands', 1345),
	(41, 'CF', 'Central African Republic', 236),
	(42, 'TD', 'Chad', 235),
	(43, 'CL', 'Chile', 56),
	(44, 'CN', 'China', 86),
	(45, 'CX', 'Christmas Island', 61),
	(46, 'CC', 'Cocos (Keeling) Islands', 672),
	(47, 'CO', 'Colombia', 57),
	(48, 'KM', 'Comoros', 269),
	(49, 'CG', 'Congo', 242),
	(50, 'CD', 'Congo The Democratic Republic Of The', 242),
	(51, 'CK', 'Cook Islands', 682),
	(52, 'CR', 'Costa Rica', 506),
	(53, 'CI', 'Cote D Ivoire (Ivory Coast)', 225),
	(54, 'HR', 'Croatia (Hrvatska)', 385),
	(55, 'CU', 'Cuba', 53),
	(56, 'CY', 'Cyprus', 357),
	(57, 'CZ', 'Czech Republic', 420),
	(58, 'DK', 'Denmark', 45),
	(59, 'DJ', 'Djibouti', 253),
	(60, 'DM', 'Dominica', 1767),
	(61, 'DO', 'Dominican Republic', 1809),
	(62, 'TP', 'East Timor', 670),
	(63, 'EC', 'Ecuador', 593),
	(64, 'EG', 'Egypt', 20),
	(65, 'SV', 'El Salvador', 503),
	(66, 'GQ', 'Equatorial Guinea', 240),
	(67, 'ER', 'Eritrea', 291),
	(68, 'EE', 'Estonia', 372),
	(69, 'ET', 'Ethiopia', 251),
	(70, 'XA', 'External Territories of Australia', 61),
	(71, 'FK', 'Falkland Islands', 500),
	(72, 'FO', 'Faroe Islands', 298),
	(73, 'FJ', 'Fiji Islands', 679),
	(74, 'FI', 'Finland', 358),
	(75, 'FR', 'France', 33),
	(76, 'GF', 'French Guiana', 594),
	(77, 'PF', 'French Polynesia', 689),
	(78, 'TF', 'French Southern Territories', 0),
	(79, 'GA', 'Gabon', 241),
	(80, 'GM', 'Gambia The', 220),
	(81, 'GE', 'Georgia', 995),
	(82, 'DE', 'Germany', 49),
	(83, 'GH', 'Ghana', 233),
	(84, 'GI', 'Gibraltar', 350),
	(85, 'GR', 'Greece', 30),
	(86, 'GL', 'Greenland', 299),
	(87, 'GD', 'Grenada', 1473),
	(88, 'GP', 'Guadeloupe', 590),
	(89, 'GU', 'Guam', 1671),
	(90, 'GT', 'Guatemala', 502),
	(91, 'XU', 'Guernsey and Alderney', 44),
	(92, 'GN', 'Guinea', 224),
	(93, 'GW', 'Guinea-Bissau', 245),
	(94, 'GY', 'Guyana', 592),
	(95, 'HT', 'Haiti', 509),
	(96, 'HM', 'Heard and McDonald Islands', 0),
	(97, 'HN', 'Honduras', 504),
	(98, 'HK', 'Hong Kong S.A.R.', 852),
	(99, 'HU', 'Hungary', 36),
	(100, 'IS', 'Iceland', 354),
	(101, 'IN', 'India', 91),
	(102, 'ID', 'Indonesia', 62),
	(103, 'IR', 'Iran', 98),
	(104, 'IQ', 'Iraq', 964),
	(105, 'IE', 'Ireland', 353),
	(106, 'IL', 'Israel', 972),
	(107, 'IT', 'Italy', 39),
	(108, 'JM', 'Jamaica', 1876),
	(109, 'JP', 'Japan', 81),
	(110, 'XJ', 'Jersey', 44),
	(111, 'JO', 'Jordan', 962),
	(112, 'KZ', 'Kazakhstan', 7),
	(113, 'KE', 'Kenya', 254),
	(114, 'KI', 'Kiribati', 686),
	(115, 'KP', 'Korea North', 850),
	(116, 'KR', 'Korea South', 82),
	(117, 'KW', 'Kuwait', 965),
	(118, 'KG', 'Kyrgyzstan', 996),
	(119, 'LA', 'Laos', 856),
	(120, 'LV', 'Latvia', 371),
	(121, 'LB', 'Lebanon', 961),
	(122, 'LS', 'Lesotho', 266),
	(123, 'LR', 'Liberia', 231),
	(124, 'LY', 'Libya', 218),
	(125, 'LI', 'Liechtenstein', 423),
	(126, 'LT', 'Lithuania', 370),
	(127, 'LU', 'Luxembourg', 352),
	(128, 'MO', 'Macau S.A.R.', 853),
	(129, 'MK', 'Macedonia', 389),
	(130, 'MG', 'Madagascar', 261),
	(131, 'MW', 'Malawi', 265),
	(132, 'MY', 'Malaysia', 60),
	(133, 'MV', 'Maldives', 960),
	(134, 'ML', 'Mali', 223),
	(135, 'MT', 'Malta', 356),
	(136, 'XM', 'Man (Isle of)', 44),
	(137, 'MH', 'Marshall Islands', 692),
	(138, 'MQ', 'Martinique', 596),
	(139, 'MR', 'Mauritania', 222),
	(140, 'MU', 'Mauritius', 230),
	(141, 'YT', 'Mayotte', 269),
	(142, 'MX', 'Mexico', 52),
	(143, 'FM', 'Micronesia', 691),
	(144, 'MD', 'Moldova', 373),
	(145, 'MC', 'Monaco', 377),
	(146, 'MN', 'Mongolia', 976),
	(147, 'MS', 'Montserrat', 1664),
	(148, 'MA', 'Morocco', 212),
	(149, 'MZ', 'Mozambique', 258),
	(150, 'MM', 'Myanmar', 95),
	(151, 'NA', 'Namibia', 264),
	(152, 'NR', 'Nauru', 674),
	(153, 'NP', 'Nepal', 977),
	(154, 'AN', 'Netherlands Antilles', 599),
	(155, 'NL', 'Netherlands The', 31),
	(156, 'NC', 'New Caledonia', 687),
	(157, 'NZ', 'New Zealand', 64),
	(158, 'NI', 'Nicaragua', 505),
	(159, 'NE', 'Niger', 227),
	(160, 'NG', 'Nigeria', 234),
	(161, 'NU', 'Niue', 683),
	(162, 'NF', 'Norfolk Island', 672),
	(163, 'MP', 'Northern Mariana Islands', 1670),
	(164, 'NO', 'Norway', 47),
	(165, 'OM', 'Oman', 968),
	(166, 'PK', 'Pakistan', 92),
	(167, 'PW', 'Palau', 680),
	(168, 'PS', 'Palestinian Territory Occupied', 970),
	(169, 'PA', 'Panama', 507),
	(170, 'PG', 'Papua new Guinea', 675),
	(171, 'PY', 'Paraguay', 595),
	(172, 'PE', 'Peru', 51),
	(173, 'PH', 'Philippines', 63),
	(174, 'PN', 'Pitcairn Island', 0),
	(175, 'PL', 'Poland', 48),
	(176, 'PT', 'Portugal', 351),
	(177, 'PR', 'Puerto Rico', 1787),
	(178, 'QA', 'Qatar', 974),
	(179, 'RE', 'Reunion', 262),
	(180, 'RO', 'Romania', 40),
	(181, 'RU', 'Russia', 70),
	(182, 'RW', 'Rwanda', 250),
	(183, 'SH', 'Saint Helena', 290),
	(184, 'KN', 'Saint Kitts And Nevis', 1869),
	(185, 'LC', 'Saint Lucia', 1758),
	(186, 'PM', 'Saint Pierre and Miquelon', 508),
	(187, 'VC', 'Saint Vincent And The Grenadines', 1784),
	(188, 'WS', 'Samoa', 684),
	(189, 'SM', 'San Marino', 378),
	(190, 'ST', 'Sao Tome and Principe', 239),
	(191, 'SA', 'Saudi Arabia', 966),
	(192, 'SN', 'Senegal', 221),
	(193, 'RS', 'Serbia', 381),
	(194, 'SC', 'Seychelles', 248),
	(195, 'SL', 'Sierra Leone', 232),
	(196, 'SG', 'Singapore', 65),
	(197, 'SK', 'Slovakia', 421),
	(198, 'SI', 'Slovenia', 386),
	(199, 'XG', 'Smaller Territories of the UK', 44),
	(200, 'SB', 'Solomon Islands', 677),
	(201, 'SO', 'Somalia', 252),
	(202, 'ZA', 'South Africa', 27),
	(203, 'GS', 'South Georgia', 0),
	(204, 'SS', 'South Sudan', 211),
	(205, 'ES', 'Spain', 34),
	(206, 'LK', 'Sri Lanka', 94),
	(207, 'SD', 'Sudan', 249),
	(208, 'SR', 'Suriname', 597),
	(209, 'SJ', 'Svalbard And Jan Mayen Islands', 47),
	(210, 'SZ', 'Swaziland', 268),
	(211, 'SE', 'Sweden', 46),
	(212, 'CH', 'Switzerland', 41),
	(213, 'SY', 'Syria', 963),
	(214, 'TW', 'Taiwan', 886),
	(215, 'TJ', 'Tajikistan', 992),
	(216, 'TZ', 'Tanzania', 255),
	(217, 'TH', 'Thailand', 66),
	(218, 'TG', 'Togo', 228),
	(219, 'TK', 'Tokelau', 690),
	(220, 'TO', 'Tonga', 676),
	(221, 'TT', 'Trinidad And Tobago', 1868),
	(222, 'TN', 'Tunisia', 216),
	(223, 'TR', 'Turkey', 90),
	(224, 'TM', 'Turkmenistan', 7370),
	(225, 'TC', 'Turks And Caicos Islands', 1649),
	(226, 'TV', 'Tuvalu', 688),
	(227, 'UG', 'Uganda', 256),
	(228, 'UA', 'Ukraine', 380),
	(229, 'AE', 'United Arab Emirates', 971),
	(230, 'GB', 'United Kingdom', 44),
	(231, 'US', 'United States', 1),
	(232, 'UM', 'United States Minor Outlying Islands', 1),
	(233, 'UY', 'Uruguay', 598),
	(234, 'UZ', 'Uzbekistan', 998),
	(235, 'VU', 'Vanuatu', 678),
	(236, 'VA', 'Vatican City State (Holy See)', 39),
	(237, 'VE', 'Venezuela', 58),
	(238, 'VN', 'Vietnam', 84),
	(239, 'VG', 'Virgin Islands (British)', 1284),
	(240, 'VI', 'Virgin Islands (US)', 1340),
	(241, 'WF', 'Wallis And Futuna Islands', 681),
	(242, 'EH', 'Western Sahara', 212),
	(243, 'YE', 'Yemen', 967),
	(244, 'YU', 'Yugoslavia', 38),
	(245, 'ZM', 'Zambia', 260),
	(246, 'ZW', 'Zimbabwe', 263);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;

-- Dumping structure for table crater.currencies
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `precision` int(11) NOT NULL,
  `thousand_separator` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `decimal_separator` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `swap_currency_symbol` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.currencies: ~65 rows (approximately)
DELETE FROM `currencies`;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `precision`, `thousand_separator`, `decimal_separator`, `swap_currency_symbol`, `created_at`, `updated_at`) VALUES
	(1, 'US Dollar', 'USD', '$', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(2, 'British Pound', 'GBP', '£', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(3, 'Euro', 'EUR', '€', 2, '.', ',', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(4, 'South African Rand', 'ZAR', 'R', 2, '.', ',', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(5, 'Danish Krone', 'DKK', 'kr', 2, '.', ',', 1, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(6, 'Israeli Shekel', 'ILS', 'NIS ', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(7, 'Swedish Krona', 'SEK', 'kr', 2, '.', ',', 1, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(8, 'Kenyan Shilling', 'KES', 'KSh ', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(9, 'Kuwaiti Dinar', 'KWD', 'KWD ', 3, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(10, 'Canadian Dollar', 'CAD', 'C$', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(11, 'Philippine Peso', 'PHP', 'P ', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(12, 'Indian Rupee', 'INR', '₹', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(13, 'Australian Dollar', 'AUD', '$', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(14, 'Singapore Dollar', 'SGD', 'S$', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(15, 'Norske Kroner', 'NOK', 'kr', 2, '.', ',', 1, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(16, 'New Zealand Dollar', 'NZD', '$', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(17, 'Vietnamese Dong', 'VND', '₫', 0, '.', ',', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(18, 'Swiss Franc', 'CHF', 'Fr.', 2, '\'', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(19, 'Guatemalan Quetzal', 'GTQ', 'Q', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(20, 'Malaysian Ringgit', 'MYR', 'RM', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(21, 'Brazilian Real', 'BRL', 'R$', 2, '.', ',', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(22, 'Thai Baht', 'THB', '฿', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(23, 'Nigerian Naira', 'NGN', '₦', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(24, 'Argentine Peso', 'ARS', '$', 2, '.', ',', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(25, 'Bangladeshi Taka', 'BDT', 'Tk', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(26, 'United Arab Emirates Dirham', 'AED', 'DH ', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(27, 'Hong Kong Dollar', 'HKD', 'HK$', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(28, 'Indonesian Rupiah', 'IDR', 'Rp', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(29, 'Mexican Peso', 'MXN', '$', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(30, 'Egyptian Pound', 'EGP', 'E£', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(31, 'Colombian Peso', 'COP', '$', 2, '.', ',', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(32, 'West African Franc', 'XOF', 'CFA ', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(33, 'Chinese Renminbi', 'CNY', 'RMB ', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(34, 'Rwandan Franc', 'RWF', 'RF ', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(35, 'Tanzanian Shilling', 'TZS', 'TSh ', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(36, 'Netherlands Antillean Guilder', 'ANG', 'NAƒ', 2, '.', ',', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(37, 'Trinidad and Tobago Dollar', 'TTD', 'TT$', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(38, 'East Caribbean Dollar', 'XCD', 'EC$', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(39, 'Ghanaian Cedi', 'GHS', '‎GH₵', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(40, 'Bulgarian Lev', 'BGN', 'Лв.', 2, ' ', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(41, 'Aruban Florin', 'AWG', 'Afl. ', 2, ' ', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(42, 'Turkish Lira', 'TRY', 'TL ', 2, '.', ',', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(43, 'Romanian New Leu', 'RON', 'RON', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(44, 'Croatian Kuna', 'HRK', 'kn', 2, '.', ',', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(45, 'Saudi Riyal', 'SAR', '‎SِAR', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(46, 'Japanese Yen', 'JPY', '¥', 0, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(47, 'Maldivian Rufiyaa', 'MVR', 'Rf', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(48, 'Costa Rican Colón', 'CRC', '₡', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(49, 'Pakistani Rupee', 'PKR', 'Rs ', 0, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(50, 'Polish Zloty', 'PLN', 'zł', 2, ' ', ',', 1, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(51, 'Sri Lankan Rupee', 'LKR', 'LKR', 2, ',', '.', 1, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(52, 'Czech Koruna', 'CZK', 'Kč', 2, ' ', ',', 1, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(53, 'Uruguayan Peso', 'UYU', '$', 2, '.', ',', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(54, 'Namibian Dollar', 'NAD', '$', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(55, 'Tunisian Dinar', 'TND', '‎د.ت', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(56, 'Russian Ruble', 'RUB', '₽', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(57, 'Mozambican Metical', 'MZN', 'MT', 2, '.', ',', 1, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(58, 'Omani Rial', 'OMR', 'ر.ع.', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(59, 'Ukrainian Hryvnia', 'UAH', '₴', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(60, 'Macanese Pataca', 'MOP', 'MOP$', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(61, 'Taiwan New Dollar', 'TWD', 'NT$', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(62, 'Dominican Peso', 'DOP', 'RD$', 2, ',', '.', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(63, 'Chilean Peso', 'CLP', '$', 2, '.', ',', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(64, 'Serbian Dinar', 'RSD', 'RSD', 2, '.', ',', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(65, 'Kyrgyzstani som', 'KGS', 'С̲ ', 2, '.', ',', 0, '2020-07-28 00:02:28', '2020-07-28 00:02:28');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;

-- Dumping structure for table crater.estimates
CREATE TABLE IF NOT EXISTS `estimates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `estimate_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `estimate_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reference_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_per_item` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discount_per_item` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount` decimal(15,2) DEFAULT NULL,
  `discount_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount_val` bigint(20) unsigned DEFAULT NULL,
  `sub_total` bigint(20) unsigned NOT NULL,
  `total` bigint(20) unsigned NOT NULL,
  `tax` bigint(20) unsigned NOT NULL,
  `unique_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `estimate_template_id` int(10) unsigned DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estimates_user_id_foreign` (`user_id`),
  KEY `estimates_estimate_template_id_foreign` (`estimate_template_id`),
  KEY `estimates_company_id_foreign` (`company_id`),
  CONSTRAINT `estimates_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `estimates_estimate_template_id_foreign` FOREIGN KEY (`estimate_template_id`) REFERENCES `estimate_templates` (`id`),
  CONSTRAINT `estimates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.estimates: ~1 rows (approximately)
DELETE FROM `estimates`;
/*!40000 ALTER TABLE `estimates` DISABLE KEYS */;
INSERT INTO `estimates` (`id`, `estimate_date`, `expiry_date`, `estimate_number`, `status`, `reference_number`, `tax_per_item`, `discount_per_item`, `notes`, `discount`, `discount_type`, `discount_val`, `sub_total`, `total`, `tax`, `unique_hash`, `user_id`, `estimate_template_id`, `company_id`, `created_at`, `updated_at`) VALUES
	(1, '2020-07-28', '2020-08-04', 'EST-000001', 'DRAFT', 'EMAPTA\'s CABLE PULLING & TERMINATION at 7th Floor Jaka Building 6780 Ayala Ave., Makati', 'NO', 'NO', 'I. SCOPE OF WORK\n• Mobilization starts 3-5 working days upon collection of fifty percent (50%) down payment. Mobilization includes preparing of manpower, equipment, materials, proper coordination with Owner, Developer, General contractor, and other contracting parties. Issuance of permits must be coordinated and done by the owner.\n• Work Permit and Coordination with the Building Admin\n• Roughing-ins are NOT INCLUDED\n• Termination of Cat5e-4-pairs UTP Cable to Patch Panel and Keystone/Modular Jack. (End-to-End)\n• Harnessing of installed Structured Cabling System.\n• Labeling & tagging for proper identification.\n• Testing of installed Structured Cabling System.\n• CCTV Installation\n• Submission of documentations.\n\nII. PROJECT DURATION\n• 20-30 Days upon mobilization (Depending on the construction of the area)\n\n\nIII. TERMS  of PAYMENT\n• Fifty (50%) percent down payment and fifty (50%) percent upon completion.\n• Prices quoted are VAT INCLUSIVE. \n• Prices quoted are subject to change without prior notice. \n• Validity of quotation is strictly seven (15) days. \n• NON-CANCELLATION PO\n\nIV. EXCLUSIONS\n1. Rouhing-ins\n2. Chipping works\n3. Demolition works\n4. Electrical Outlets\n5. POP-UP Outlets\n6. Active devices such as routers. switches, access points.\n\nV. Product Support & Warranty\n1. Workmanship within the period of 1-Year, such as repair, re-termination, testing and tagging.\n2. All cabling hardwares components are covered of 1-Year period of replacement.', 0.00, 'fixed', 0, 900000, 900000, 0, 'A48l3XfOlddeaSUc8OCRmXAW3mRn72KM4zinU88JKcKWOjyb9bO2AUIHKdpv', 2, 4, 1, '2020-07-28 00:22:36', '2020-07-28 03:56:04');
/*!40000 ALTER TABLE `estimates` ENABLE KEYS */;

-- Dumping structure for table crater.estimate_items
CREATE TABLE IF NOT EXISTS `estimate_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `discount` decimal(15,2) DEFAULT NULL,
  `discount_val` bigint(20) unsigned DEFAULT NULL,
  `price` bigint(20) unsigned NOT NULL,
  `tax` bigint(20) unsigned NOT NULL,
  `total` bigint(20) unsigned NOT NULL,
  `item_id` int(10) unsigned DEFAULT NULL,
  `estimate_id` int(10) unsigned NOT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estimate_items_item_id_foreign` (`item_id`),
  KEY `estimate_items_estimate_id_foreign` (`estimate_id`),
  KEY `estimate_items_company_id_foreign` (`company_id`),
  CONSTRAINT `estimate_items_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `estimate_items_estimate_id_foreign` FOREIGN KEY (`estimate_id`) REFERENCES `estimates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `estimate_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.estimate_items: ~2 rows (approximately)
DELETE FROM `estimate_items`;
/*!40000 ALTER TABLE `estimate_items` DISABLE KEYS */;
INSERT INTO `estimate_items` (`id`, `name`, `description`, `discount_type`, `quantity`, `discount`, `discount_val`, `price`, `tax`, `total`, `item_id`, `estimate_id`, `company_id`, `created_at`, `updated_at`) VALUES
	(27, 'MCF-20KM-SC-S (1310mm)', '• Fast Ethernet 10/100 Base-TX to 1000Base-FX\n• Single mode, SC Connector\n• Single fiber-optic cable\n• 20 kilometer distance', 'fixed', 1.00, 0.00, 0, 400000, 0, 400000, 2, 1, 1, '2020-07-28 03:56:04', '2020-07-28 03:56:04'),
	(28, 'Grandstream GWN7600', '• 1.27Gbps wireless throughput and 2x Gigabit wireline ports\n• Dual-band 2x2:2 MU-MIMO with beam-forming technology\n• Support 802.3af Power-over-Ethernet (PoE)\n• Advanced QoS to ensure real-time performance of low-latency applications', 'fixed', 1.00, 0.00, 0, 500000, 0, 500000, 1, 1, 1, '2020-07-28 03:56:04', '2020-07-28 03:56:04');
/*!40000 ALTER TABLE `estimate_items` ENABLE KEYS */;

-- Dumping structure for table crater.estimate_templates
CREATE TABLE IF NOT EXISTS `estimate_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.estimate_templates: ~4 rows (approximately)
DELETE FROM `estimate_templates`;
/*!40000 ALTER TABLE `estimate_templates` DISABLE KEYS */;
INSERT INTO `estimate_templates` (`id`, `name`, `view`, `path`, `created_at`, `updated_at`) VALUES
	(1, 'Template 1', 'estimate1', '/assets/img/PDF/Template1.png', '2020-07-28 00:02:29', '2020-07-28 00:02:29'),
	(2, 'Template 2', 'estimate2', '/assets/img/PDF/Template2.png', '2020-07-28 00:02:29', '2020-07-28 00:02:29'),
	(3, 'Template 3', 'estimate3', '/assets/img/PDF/Template3.png', '2020-07-28 00:02:29', '2020-07-28 00:02:29'),
	(4, 'Template 4', 'estimate4', '/assets/img/PDF/Template4.png', '2020-07-28 00:02:29', '2020-07-28 00:02:29');
/*!40000 ALTER TABLE `estimate_templates` ENABLE KEYS */;

-- Dumping structure for table crater.expenses
CREATE TABLE IF NOT EXISTS `expenses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `expense_date` date NOT NULL,
  `attachment_receipt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` bigint(20) unsigned NOT NULL,
  `notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expense_category_id` int(10) unsigned NOT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expenses_expense_category_id_foreign` (`expense_category_id`),
  KEY `expenses_company_id_foreign` (`company_id`),
  KEY `expenses_user_id_foreign` (`user_id`),
  CONSTRAINT `expenses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expenses_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expenses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.expenses: ~0 rows (approximately)
DELETE FROM `expenses`;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;

-- Dumping structure for table crater.expense_categories
CREATE TABLE IF NOT EXISTS `expense_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expense_categories_company_id_foreign` (`company_id`),
  CONSTRAINT `expense_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.expense_categories: ~0 rows (approximately)
DELETE FROM `expense_categories`;
/*!40000 ALTER TABLE `expense_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `expense_categories` ENABLE KEYS */;

-- Dumping structure for table crater.invoices
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_date` date NOT NULL,
  `due_date` date NOT NULL,
  `invoice_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reference_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `paid_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tax_per_item` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discount_per_item` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount` decimal(15,2) DEFAULT NULL,
  `discount_val` bigint(20) unsigned DEFAULT NULL,
  `sub_total` bigint(20) unsigned NOT NULL,
  `total` bigint(20) unsigned NOT NULL,
  `tax` bigint(20) unsigned NOT NULL,
  `due_amount` bigint(20) unsigned NOT NULL,
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  `viewed` tinyint(1) NOT NULL DEFAULT 0,
  `unique_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_template_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_invoice_template_id_foreign` (`invoice_template_id`),
  KEY `invoices_user_id_foreign` (`user_id`),
  KEY `invoices_company_id_foreign` (`company_id`),
  CONSTRAINT `invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoices_invoice_template_id_foreign` FOREIGN KEY (`invoice_template_id`) REFERENCES `invoice_templates` (`id`),
  CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.invoices: ~0 rows (approximately)
DELETE FROM `invoices`;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;

-- Dumping structure for table crater.invoice_items
CREATE TABLE IF NOT EXISTS `invoice_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` bigint(20) unsigned NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `discount` decimal(15,2) DEFAULT NULL,
  `discount_val` bigint(20) unsigned NOT NULL,
  `tax` bigint(20) unsigned NOT NULL,
  `total` bigint(20) unsigned NOT NULL,
  `invoice_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_items_item_id_foreign` (`item_id`),
  KEY `invoice_items_company_id_foreign` (`company_id`),
  CONSTRAINT `invoice_items_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.invoice_items: ~0 rows (approximately)
DELETE FROM `invoice_items`;
/*!40000 ALTER TABLE `invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_items` ENABLE KEYS */;

-- Dumping structure for table crater.invoice_templates
CREATE TABLE IF NOT EXISTS `invoice_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.invoice_templates: ~3 rows (approximately)
DELETE FROM `invoice_templates`;
/*!40000 ALTER TABLE `invoice_templates` DISABLE KEYS */;
INSERT INTO `invoice_templates` (`id`, `name`, `view`, `path`, `created_at`, `updated_at`) VALUES
	(1, 'Template 1', 'invoice1', '/assets/img/PDF/Template1.png', '2020-07-28 00:02:29', '2020-07-28 00:02:29'),
	(2, ' Template 2', 'invoice2', '/assets/img/PDF/Template2.png', '2020-07-28 00:02:29', '2020-07-28 00:02:29'),
	(3, 'Template 3', 'invoice3', '/assets/img/PDF/Template3.png', '2020-07-28 00:02:29', '2020-07-28 00:02:29');
/*!40000 ALTER TABLE `invoice_templates` ENABLE KEYS */;

-- Dumping structure for table crater.items
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` bigint(20) unsigned NOT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `unit_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `items_company_id_foreign` (`company_id`),
  KEY `items_unit_id_foreign` (`unit_id`),
  CONSTRAINT `items_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `items_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.items: ~4 rows (approximately)
DELETE FROM `items`;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`id`, `name`, `description`, `unit`, `price`, `company_id`, `unit_id`, `created_at`, `updated_at`) VALUES
	(1, 'Grandstream GWN7600', '• 1.27Gbps wireless throughput and 2x Gigabit wireline ports\n• Dual-band 2x2:2 MU-MIMO with beam-forming technology\n• Support 802.3af Power-over-Ethernet (PoE)\n• Advanced QoS to ensure real-time performance of low-latency applications', NULL, 500000, 1, 11, '2020-07-28 00:18:44', '2020-07-28 00:18:44'),
	(2, 'MCF-20KM-SC-S (1310mm)', '• Fast Ethernet 10/100 Base-TX to 1000Base-FX\n• Single mode, SC Connector\n• Single fiber-optic cable\n• 20 kilometer distance', NULL, 400000, 1, 11, '2020-07-28 00:19:07', '2020-07-28 00:19:07'),
	(3, 'Grandstream UCM6208', '• FXO Ports: 8\n• FXS Ports: 2\n• Gigabit Ports: 2\n• Users: 800\n• Concurrent Calls: 100\n• Conference Bridges: 6\n• Attendees p/ bridge: 32', NULL, 2000000, 1, 11, '2020-07-28 00:19:35', '2020-07-28 00:19:35'),
	(4, '2321', 'maxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:gmaxLength:g', NULL, 23200, 1, NULL, '2020-07-28 02:21:48', '2020-07-28 02:21:48');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for table crater.media
CREATE TABLE IF NOT EXISTS `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  `collection_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `manipulations` text COLLATE utf8_unicode_ci NOT NULL,
  `custom_properties` text COLLATE utf8_unicode_ci NOT NULL,
  `responsive_images` text COLLATE utf8_unicode_ci NOT NULL,
  `order_column` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.media: ~2 rows (approximately)
DELETE FROM `media`;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` (`id`, `model_type`, `model_id`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
	(1, 'Crater\\User', 1, 'admin_avatar', 'medialibrary3zchRE', 'shinobu.PNG', 'image/png', 'public', 306783, '[]', '[]', '[]', 1, '2020-07-28 00:03:05', '2020-07-28 00:03:05'),
	(2, 'Crater\\Company', 1, 'logo', 'medialibrarytw6S71', 'sig.png', 'image/png', 'public', 16924, '[]', '[]', '[]', 2, '2020-07-28 00:04:12', '2020-07-28 00:04:12');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;

-- Dumping structure for table crater.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.migrations: ~31 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_11_071840_create_companies_table', 1),
	(2, '2014_10_11_125754_create_currencies_table', 1),
	(3, '2014_10_12_000000_create_users_table', 1),
	(4, '2014_10_12_100000_create_password_resets_table', 1),
	(5, '2016_05_13_060834_create_settings_table', 1),
	(6, '2017_04_11_064308_create_units_table', 1),
	(7, '2017_04_11_081227_create_items_table', 1),
	(8, '2017_04_11_140447_create_invoice_templates_table', 1),
	(9, '2017_04_12_090759_create_invoices_table', 1),
	(10, '2017_04_12_091015_create_invoice_items_table', 1),
	(11, '2017_05_04_141701_create_estimate_templates_table', 1),
	(12, '2017_05_05_055609_create_estimates_table', 1),
	(13, '2017_05_05_073927_create_notifications_table', 1),
	(14, '2017_05_06_173745_create_countries_table', 1),
	(15, '2017_10_02_123501_create_estimate_items_table', 1),
	(16, '2017_12_02_204902_create_permission_tables', 1),
	(17, '2018_11_02_133825_create_ expense_categories_table', 1),
	(18, '2018_11_02_133956_create_expenses_table', 1),
	(19, '2019_08_30_072639_create_addresses_table', 1),
	(20, '2019_09_02_053155_create_payment_methods_table', 1),
	(21, '2019_09_03_135234_create_payments_table', 1),
	(22, '2019_09_14_120124_create_media_table', 1),
	(23, '2019_09_21_052540_create_tax_types_table', 1),
	(24, '2019_09_21_052548_create_taxes_table', 1),
	(25, '2019_09_26_145012_create_company_settings_table', 1),
	(26, '2020_05_12_154129_add_user_id_to_expenses_table', 1),
	(27, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
	(28, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
	(29, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
	(30, '2016_06_01_000004_create_oauth_clients_table', 2),
	(31, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table crater.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.model_has_permissions: ~0 rows (approximately)
DELETE FROM `model_has_permissions`;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;

-- Dumping structure for table crater.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.model_has_roles: ~0 rows (approximately)
DELETE FROM `model_has_roles`;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;

-- Dumping structure for table crater.notifications
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.notifications: ~0 rows (approximately)
DELETE FROM `notifications`;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;

-- Dumping structure for table crater.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.oauth_access_tokens: ~0 rows (approximately)
DELETE FROM `oauth_access_tokens`;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

-- Dumping structure for table crater.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.oauth_auth_codes: ~0 rows (approximately)
DELETE FROM `oauth_auth_codes`;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;

-- Dumping structure for table crater.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.oauth_clients: ~2 rows (approximately)
DELETE FROM `oauth_clients`;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Crater Personal Access Client', 'X85KpsKM73c0QSLgosq5VNITqshN1gGgfbjA2bhu', 'http://sales.nikkomonogatari.pw', 1, 0, 0, '2020-07-28 00:04:40', '2020-07-28 00:04:40'),
	(2, NULL, 'Crater Password Grant Client', 'v62yW98MVYH8NDJAVKQFreAVpAXMHA12A3xeuTHq', 'http://sales.nikkomonogatari.pw', 0, 1, 0, '2020-07-28 00:04:40', '2020-07-28 00:04:40');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Dumping structure for table crater.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.oauth_personal_access_clients: ~0 rows (approximately)
DELETE FROM `oauth_personal_access_clients`;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- Dumping structure for table crater.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.oauth_refresh_tokens: ~0 rows (approximately)
DELETE FROM `oauth_refresh_tokens`;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;

-- Dumping structure for table crater.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table crater.payments
CREATE TABLE IF NOT EXISTS `payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_date` date NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` bigint(20) unsigned NOT NULL,
  `unique_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `invoice_id` int(10) unsigned DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `payment_method_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_user_id_foreign` (`user_id`),
  KEY `payments_invoice_id_foreign` (`invoice_id`),
  KEY `payments_company_id_foreign` (`company_id`),
  KEY `payments_payment_method_id_foreign` (`payment_method_id`),
  CONSTRAINT `payments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payments_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payments_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.payments: ~0 rows (approximately)
DELETE FROM `payments`;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;

-- Dumping structure for table crater.payment_methods
CREATE TABLE IF NOT EXISTS `payment_methods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_methods_company_id_foreign` (`company_id`),
  CONSTRAINT `payment_methods_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.payment_methods: ~4 rows (approximately)
DELETE FROM `payment_methods`;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` (`id`, `name`, `company_id`, `created_at`, `updated_at`) VALUES
	(1, 'Cash', 1, '2020-07-28 00:04:40', '2020-07-28 00:04:40'),
	(2, 'Check', 1, '2020-07-28 00:04:40', '2020-07-28 00:04:40'),
	(3, 'Credit Card', 1, '2020-07-28 00:04:40', '2020-07-28 00:04:40'),
	(4, 'Bank Transfer', 1, '2020-07-28 00:04:40', '2020-07-28 00:04:40');
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;

-- Dumping structure for table crater.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.permissions: ~0 rows (approximately)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table crater.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.roles: ~3 rows (approximately)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'api', '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(2, 'contact', 'api', '2020-07-28 00:02:28', '2020-07-28 00:02:28'),
	(3, 'staff', 'api', '2020-07-28 00:02:28', '2020-07-28 00:02:28');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table crater.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.role_has_permissions: ~0 rows (approximately)
DELETE FROM `role_has_permissions`;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;

-- Dumping structure for table crater.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.settings: ~2 rows (approximately)
DELETE FROM `settings`;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `option`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'profile_complete', 'COMPLETED', '2020-07-28 00:02:28', '2020-07-28 00:04:38'),
	(2, 'version', '3.1.1', '2020-07-28 00:04:38', '2020-07-28 00:04:38');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table crater.taxes
CREATE TABLE IF NOT EXISTS `taxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax_type_id` int(10) unsigned NOT NULL,
  `invoice_id` int(10) unsigned DEFAULT NULL,
  `estimate_id` int(10) unsigned DEFAULT NULL,
  `invoice_item_id` int(10) unsigned DEFAULT NULL,
  `estimate_item_id` int(10) unsigned DEFAULT NULL,
  `item_id` int(10) unsigned DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` bigint(20) unsigned NOT NULL,
  `percent` decimal(5,2) NOT NULL,
  `compound_tax` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taxes_tax_type_id_foreign` (`tax_type_id`),
  KEY `taxes_invoice_id_foreign` (`invoice_id`),
  KEY `taxes_estimate_id_foreign` (`estimate_id`),
  KEY `taxes_invoice_item_id_foreign` (`invoice_item_id`),
  KEY `taxes_estimate_item_id_foreign` (`estimate_item_id`),
  KEY `taxes_item_id_foreign` (`item_id`),
  KEY `taxes_company_id_foreign` (`company_id`),
  CONSTRAINT `taxes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `taxes_estimate_id_foreign` FOREIGN KEY (`estimate_id`) REFERENCES `estimates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `taxes_estimate_item_id_foreign` FOREIGN KEY (`estimate_item_id`) REFERENCES `estimate_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `taxes_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `taxes_invoice_item_id_foreign` FOREIGN KEY (`invoice_item_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `taxes_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `taxes_tax_type_id_foreign` FOREIGN KEY (`tax_type_id`) REFERENCES `tax_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.taxes: ~0 rows (approximately)
DELETE FROM `taxes`;
/*!40000 ALTER TABLE `taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxes` ENABLE KEYS */;

-- Dumping structure for table crater.tax_types
CREATE TABLE IF NOT EXISTS `tax_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percent` decimal(5,2) NOT NULL,
  `compound_tax` tinyint(4) NOT NULL DEFAULT 0,
  `collective_tax` tinyint(4) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tax_types_company_id_foreign` (`company_id`),
  CONSTRAINT `tax_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.tax_types: ~0 rows (approximately)
DELETE FROM `tax_types`;
/*!40000 ALTER TABLE `tax_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_types` ENABLE KEYS */;

-- Dumping structure for table crater.units
CREATE TABLE IF NOT EXISTS `units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `units_company_id_foreign` (`company_id`),
  CONSTRAINT `units_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.units: ~11 rows (approximately)
DELETE FROM `units`;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` (`id`, `name`, `company_id`, `created_at`, `updated_at`) VALUES
	(1, 'box', 1, '2020-07-28 00:04:40', '2020-07-28 00:04:40'),
	(2, 'cm', 1, '2020-07-28 00:04:40', '2020-07-28 00:04:40'),
	(3, 'dz', 1, '2020-07-28 00:04:40', '2020-07-28 00:04:40'),
	(4, 'ft', 1, '2020-07-28 00:04:40', '2020-07-28 00:04:40'),
	(5, 'g', 1, '2020-07-28 00:04:40', '2020-07-28 00:04:40'),
	(6, 'in', 1, '2020-07-28 00:04:40', '2020-07-28 00:04:40'),
	(7, 'kg', 1, '2020-07-28 00:04:40', '2020-07-28 00:04:40'),
	(8, 'km', 1, '2020-07-28 00:04:40', '2020-07-28 00:04:40'),
	(9, 'lb', 1, '2020-07-28 00:04:40', '2020-07-28 00:04:40'),
	(10, 'mg', 1, '2020-07-28 00:04:40', '2020-07-28 00:04:40'),
	(11, 'pc', 1, '2020-07-28 00:04:40', '2020-07-28 00:04:40');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;

-- Dumping structure for table crater.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `github_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enable_portal` tinyint(1) DEFAULT NULL,
  `currency_id` int(10) unsigned DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_currency_id_foreign` (`currency_id`),
  KEY `users_company_id_foreign` (`company_id`),
  CONSTRAINT `users_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table crater.users: ~2 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `role`, `remember_token`, `facebook_id`, `google_id`, `github_id`, `contact_name`, `company_name`, `website`, `enable_portal`, `currency_id`, `company_id`, `created_at`, `updated_at`) VALUES
	(1, 'Nikko Entena', 'nikkoentena@gmail.com', NULL, '$2y$10$Tr0Jb.BWFUBrG3mNVbjiv.PL2is.dxFgNcRhTKjI8w2qzzJn9lT16', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2020-07-28 00:02:28', '2020-07-28 00:04:11'),
	(2, 'Jojo Bizzare Corporation', 'speedwagon@nikkomonogatari.pw', '09215462961', '$2y$10$s/3gI.Mahvsvxk7z3nEa9.nQ7kI/v4TjGJZgibkdMba4LW4u8fi2e', 'customer', NULL, NULL, NULL, NULL, 'Dio Brando', NULL, 'http://jbc.xcom', NULL, 11, 1, '2020-07-28 00:21:58', '2020-07-28 00:21:58');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
