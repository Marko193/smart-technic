-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Мар 19 2020 г., 10:16
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `db_shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `buy_products`
--

CREATE TABLE IF NOT EXISTS `buy_products` (
  `buy_id` int(11) NOT NULL AUTO_INCREMENT,
  `buy_id_order` int(11) NOT NULL,
  `buy_id_product` int(11) NOT NULL,
  `buy_count_product` int(11) NOT NULL,
  PRIMARY KEY (`buy_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=122 ;

--
-- Дамп данных таблицы `buy_products`
--

INSERT INTO `buy_products` (`buy_id`, `buy_id_order`, `buy_id_product`, `buy_count_product`) VALUES
(85, 16, 117, 1),
(86, 17, 117, 1),
(87, 18, 30, 1),
(88, 19, 30, 1),
(89, 20, 30, 3),
(90, 21, 30, 1),
(91, 22, 120, 1),
(92, 23, 118, 3),
(93, 25, 118, 3),
(94, 29, 118, 2),
(95, 30, 117, 1),
(96, 30, 118, 3),
(97, 31, 118, 1),
(98, 32, 117, 1),
(99, 35, 118, 1),
(100, 36, 117, 1),
(101, 36, 118, 2),
(102, 37, 117, 0),
(103, 38, 117, 1),
(104, 39, 120, 100),
(105, 39, 117, 1),
(106, 40, 118, 1),
(107, 41, 117, 3),
(108, 42, 118, 1),
(109, 43, 118, 3),
(110, 44, 117, 1),
(111, 45, 117, 1),
(112, 46, 120, 2),
(113, 47, 120, 2),
(114, 48, 120, 2),
(115, 49, 120, 1),
(116, 50, 117, 3),
(117, 51, 118, 2),
(118, 52, 117, 3),
(119, 52, 118, 2),
(120, 53, 118, 30),
(121, 54, 118, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id_product` int(11) NOT NULL,
  `cart_price` int(11) NOT NULL,
  `cart_count` int(11) NOT NULL,
  `cart_datetime` datetime NOT NULL,
  `cart_ip` varchar(100) NOT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=117 ;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `type`, `brand`) VALUES
(1, 'mobile', 'Apple'),
(2, 'mobile', 'Sony'),
(3, 'mobile', 'Lenovo'),
(4, 'mobile', 'Xiaomi'),
(5, 'mobile', 'Huawei'),
(6, 'mobile', 'Samsung'),
(7, 'mobile', 'Nokia'),
(8, 'mobile', 'iPad'),
(9, 'mobile', 'LG'),
(10, 'mobile', 'Asus'),
(11, 'notebook', 'Apple'),
(12, 'notebook', 'Sony'),
(13, 'notebook', 'Lenovo'),
(14, 'notebook', 'Xiaomi'),
(15, 'notebook', 'Huawei'),
(16, 'notebook', 'Samsung'),
(17, 'notebook', 'Nokia'),
(18, 'notebook', 'iPad'),
(19, 'notebook', 'LG'),
(20, 'notebook', 'Asus'),
(21, 'notepad', 'Apple'),
(22, 'notepad', 'Sony'),
(23, 'notepad', 'Lenovo'),
(24, 'notepad', 'Xiaomi'),
(25, 'notepad', 'Huawei'),
(26, 'notepad', 'Samsung'),
(27, 'notepad', 'Nokia'),
(28, 'notepad', 'iPad'),
(29, 'notepad', 'LG'),
(30, 'notepad', 'Asus'),
(37, 'notebook', 'Google'),
(38, 'notebook', 'Google'),
(39, 'notebook', 'Google');

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `title`, `text`, `date`) VALUES
(1, 'Определили лучший смартфон на рынке ', 'Известная некоммерческая организация Consumer Reports опубликовала обзор нового флагманского смартфона Samsung Galaxy S10+. По итогам всех испытаний новинка южнокорейского производителя возглавила рейтинг смартфонов.', '2019-03-30'),
(2, 'Гибкий смартфон Xiaomi Mi Fold засветился на новом видео', 'Хоть в Xiaomi заявили, что не спешат с выпуском своего гибкого смартфона Mi Fold, однако, информации о потенциальной новинке появляется все больше. В частности, появилось еще одно видео, на котором хорошо виден новый Mi Fold.', '2019-03-30'),
(4, 'Новая прошивка Xiaomi MIUI 11: какие смартфоны получат обновление', 'Компания Xiaomi уже через несколько дней официально представит обновленную версию прошивку MIUI 11. Но уже сейчас стало известно, какие смартфоны получат обновление.', '2019-03-30'),
(5, 'Смартфон Vivo S1 с выдвижной камерой представили официально', 'Китайская компания Vivo представила новый смартфон S1. Интересно, что по дизайну новинка очень напоминает V15, который представили недавно.', '2019-03-30');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_datetime` datetime NOT NULL,
  `order_confirmed` varchar(10) NOT NULL,
  `order_dostavka` varchar(255) NOT NULL,
  `order_fio` text NOT NULL,
  `order_address` text NOT NULL,
  `order_phone` varchar(50) NOT NULL,
  `order_note` text NOT NULL,
  `order_email` varchar(50) NOT NULL,
  `define_session` varchar(30) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=55 ;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`order_id`, `order_datetime`, `order_confirmed`, `order_dostavka`, `order_fio`, `order_address`, `order_phone`, `order_note`, `order_email`, `define_session`) VALUES
(36, '2019-06-04 11:29:05', 'accept', 'Самовывоз', 'Panasuk Alexandr Ivanovych', 'Starobelsk', '0997854861', 'sdfsdhfd', 'panas@gmail.com', 'panas'),
(37, '2019-06-04 11:33:54', 'reject', 'Самовывоз', 'Panasuk Alexandr Ivanovych', 'Starobelsk', '0997854861', 'sdfsdhfd', 'panas@gmail.com', 'panas'),
(38, '2019-06-04 11:47:22', '', 'По почте', 'Stakhevich Anna Vladimirovna', 'Odessa', '124785960', 'Record', 'stakhevich@nure.ua', 'stakhevich'),
(39, '2019-06-04 11:49:33', 'accept', 'Курьером', 'Stakhevich Anna Vladimirovna', 'Odessa', '124785960', 'sdfsdhfd', 'stakhevich@nure.ua', 'stakhevich'),
(40, '2019-06-04 15:23:01', '', 'Курьером', 'marik8998 marik8998 marik8998', 'marik8998', 'marik8998', '', 'marik8998@gmail.com', 'marik8998'),
(41, '2019-06-04 22:35:06', '', 'Курьером', 'Mugaluk Valerii Ivanovych', 'Kharkiv', '0985467812', 'Жду связи в ближайшее время!', 'valera@gmail.com', 'valerii'),
(42, '2019-06-04 23:23:59', '', 'По почте', 'Mugaluk Valerii Ivanovych', 'Kharkiv', '0985467812', '', 'valera@gmail.com', 'valerii'),
(43, '2019-06-04 23:27:21', '', 'Курьером', 'Mugaluk Valerii Ivanovych', 'Kharkiv', '0985467812', '', 'valera@gmail.com', 'valerii'),
(44, '2019-06-04 23:29:41', '', 'Самовывоз', 'Mugaluk Valerii Ivanovych', 'Kharkiv', '0985467812', '', 'valera@gmail.com', 'valerii'),
(45, '2019-06-04 23:34:14', '', 'По почте', 'Mugaluk Valerii Ivanovych', 'Kharkiv', '0985467812', '', 'valera@gmail.com', 'valerii'),
(46, '2019-06-04 23:34:46', '', 'По почте', 'Mugaluk Valerii Ivanovych', 'Kharkiv', '0985467812', 'ььььь', 'valera@gmail.com', 'valerii'),
(47, '2019-06-04 23:36:56', 'delivery', 'Курьером', 'Mugaluk Valerii Ivanovych', 'Kharkiv', '0985467812', 'ььььь', 'valera@gmail.com', 'valerii'),
(48, '2019-06-04 23:38:02', 'accept', 'Курьером', 'Panasuk Alexandr Ivanovych', 'Starobelsk', '0997854861', 'Ожидаю', 'panas@gmail.com', 'panas'),
(49, '2019-06-04 23:42:03', 'close', 'По почте', 'Panasuk Alexandr Ivanovych', 'Starobelsk', '0997854861', '', 'panas@gmail.com', 'panas'),
(50, '2019-06-05 15:38:57', 'close', 'По почте', 'Popovych Anastasia Ivanovna', 'РҐР°СЂСЊРєРѕРІ', '0985647589', '', 'anastasia@gmail.com', 'anastasia'),
(51, '2019-06-05 17:00:05', 'reject', 'По почте', 'Pavlenko Marko Juriovych', 'Kharkiv, KNURE', '+380997098397', 'I`m waiting for an answer.', 'marik8998@gmail.com', 'marko'),
(52, '2019-06-05 17:28:17', 'delivery', 'Курьером', 'Pavlenko Marko Juriovych', 'Kharkiv, KNURE', '+380997098397', '', 'marik8998@gmail.com', 'marko'),
(53, '2019-06-06 11:02:00', 'accept', 'По почте', 'Panasuk Alexandr Ivanovych', 'Starobelsk', '0997854861', '111111', 'panas@gmail.com', 'panas'),
(54, '2019-06-09 19:52:52', '', 'По почте', 'Panasuk Alexandr Ivanovych', 'Starobelsk', '0997854822', '', 'panas@gmail.com', 'panas');

-- --------------------------------------------------------

--
-- Структура таблицы `reg_admin`
--

CREATE TABLE IF NOT EXISTS `reg_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `fio` text NOT NULL,
  `role` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `view_orders` int(11) NOT NULL DEFAULT '0',
  `accept_orders` int(11) NOT NULL DEFAULT '0',
  `delete_orders` int(11) NOT NULL DEFAULT '0',
  `add_tovar` int(11) NOT NULL DEFAULT '0',
  `edit_tovar` int(11) NOT NULL DEFAULT '0',
  `delete_tovar` int(11) NOT NULL DEFAULT '0',
  `accept_reviews` int(11) NOT NULL DEFAULT '0',
  `delete_reviews` int(11) NOT NULL DEFAULT '0',
  `view_clients` int(11) NOT NULL DEFAULT '0',
  `delete_clients` int(11) NOT NULL DEFAULT '0',
  `add_news` int(11) NOT NULL DEFAULT '0',
  `delete_news` int(11) NOT NULL DEFAULT '0',
  `add_category` int(11) NOT NULL DEFAULT '0',
  `delete_category` int(11) NOT NULL DEFAULT '0',
  `view_admin` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `reg_admin`
--

INSERT INTO `reg_admin` (`id`, `login`, `pass`, `fio`, `role`, `email`, `phone`, `view_orders`, `accept_orders`, `delete_orders`, `add_tovar`, `edit_tovar`, `delete_tovar`, `accept_reviews`, `delete_reviews`, `view_clients`, `delete_clients`, `add_news`, `delete_news`, `add_category`, `delete_category`, `view_admin`) VALUES
(2, 'admin', 'admin', 'Павленко Марк Юрьевич', 'Суперадминистратор', 'marko.pavlenko@nure.ua', '0997098397', 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1),
(3, 'simonkate', 'simonkate', 'Симон Катерина Васильевна', 'Администратор', 'simonkate@gmail.com', '0961719397', 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0),
(7, 'stakhevychanna', 'stakhevychanna', 'Стахевич Анна Витальевна', 'Менеджер', 'stakhevychanna@nure.ua', '0958702654', 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0),
(11, '1', '1', '1', '1', '1', '1', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `reg_user`
--

CREATE TABLE IF NOT EXISTS `reg_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `patronymic` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `datetime` int(11) NOT NULL,
  `ip` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`,`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `reg_user`
--

INSERT INTO `reg_user` (`id`, `login`, `password`, `surname`, `name`, `patronymic`, `email`, `phone`, `address`, `datetime`, `ip`) VALUES
(5, 'panas', 'panas', 'Panasuk', 'Alexandr', 'Ivanovych', 'panas@gmail.com', '0997854822', 'Starobelsk', 2017, '127.0.0.1'),
(10, 'marko', 'marik8998', 'Pavlenko', 'Marko', 'Juriovych', 'marik8998@gmail.com', '+380997098397', 'Kharkiv, KNURE', 2019, '127.0.0.1'),
(11, 'stakhevich', 'stakhevich', 'Stakhevich', 'Anna', 'Vladimirovna', 'stakhevich@nure.ua', '124785960', 'Odessa', 2019, '127.0.0.1'),
(13, 'valerii', 'valerii', 'Mugaluk', 'Valerii', 'Ivanovych', 'valera@gmail.com', '0985467812', 'Kharkiv', 2019, '127.0.0.1'),
(14, 'anastasia', 'anastasia', 'Popovych', 'Anastasia', 'Ivanovna', 'anastasia@gmail.com', '0985647589', 'Харьков', 2019, '127.0.0.1');

-- --------------------------------------------------------

--
-- Структура таблицы `table_products`
--

CREATE TABLE IF NOT EXISTS `table_products` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `brand` varchar(255) NOT NULL,
  `seo_words` text NOT NULL,
  `seo_description` text NOT NULL,
  `mini_description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `mini_features` text NOT NULL,
  `features` text NOT NULL,
  `datetime` datetime NOT NULL,
  `new` int(11) NOT NULL DEFAULT '0',
  `leader` int(11) NOT NULL DEFAULT '0',
  `sale` int(11) NOT NULL DEFAULT '0',
  `visible` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `product_type` varchar(255) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `yes_like` int(11) NOT NULL DEFAULT '1',
  `vote` int(11) NOT NULL,
  `votes` float NOT NULL,
  PRIMARY KEY (`products_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=121 ;

--
-- Дамп данных таблицы `table_products`
--

INSERT INTO `table_products` (`products_id`, `title`, `price`, `brand`, `seo_words`, `seo_description`, `mini_description`, `image`, `description`, `mini_features`, `features`, `datetime`, `new`, `leader`, `sale`, `visible`, `count`, `product_type`, `brand_id`, `yes_like`, `vote`, `votes`) VALUES
(118, 'LG Pad 7" V400 8Gb ', 2600, 'LG', 'LG G Pad 7" V400 8Gb White', 'Планшет LG G Pad 7" V400 8Gb White призван воплотить в себе максимум возможностей для активной жизни с полным погружением в цифровой мир. ', '<p>Планшет LG G Pad 7&quot; V400 8Gb White призван воплотить в себе максимум возможностей для активной жизни с полным погружением в цифровой мир.&nbsp;</p>\r\n', 'notepad-11845.png', '<p>Жизнь на лету диктует свои условия по части использования цифровых устройств. Планшет LG G Pad 7&quot; V400 8Gb White призван воплотить в себе максимум возможностей для активной жизни с полным погружением в цифровой мир. &laquo;Таблетка&raquo; имеет привычные очертания стандартного планшета &ndash; тонкий корпус и узкую рамку по периметру дисплея, что делает устройство ещё компактнее и аккуратнее. 7-дюймовая IPS матрица демонстрирует в таком корпусе великолепные результаты цветопередачи, а также отменные углы обзора как при горизонтальном, так и при вертикальном использовании.&nbsp;</p>\r\n', '<p>Диагональ дисплея: 7&quot;</p>\r\n\r\n<p>ОC:&nbsp;&nbsp;Android&trade; 4.4 KitKat<br />\r\n&nbsp;</p>\r\n', '<p>Диагональ дисплея: 7&quot;</p>\r\n\r\n<p>Операционная система: Android&trade; 4.4 KitKat</p>\r\n\r\n<p>Емкость аккумулятора: 4000 мАч</p>\r\n\r\n<p>Разрешение дисплея: 1280x800</p>\r\n\r\n<p>Матрица: IPS</p>\r\n\r\n<p>Оперативная память: 1 ГБ</p>\r\n\r\n<p>Количество ядер процессора: 4</p>\r\n\r\n<p>Встроенная память: 8 ГБ</p>\r\n\r\n<p>Гарантийный срок: 12 месяцев<br />\r\n&nbsp;</p>\r\n', '0000-00-00 00:00:00', 1, 0, 0, 1, 4, 'notepad', 29, 1, 0, 0),
(117, 'Lenovo A850', 1500, 'Lenovo', 'Lenovo A850', 'Недорогая модель от китайской компании Lenovo\r\nс привлекательными для массового потребителя характеристиками.\r\n\r\n\r\n', '<p>Недорогая модель от китайской компании Lenovo с привлекательными для массового потребителя характеристиками.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 'mobile-11784.jpg', '<p><a href="https://f.ua/articles/obzor-lenovo-a850.html">Lenovo A850 &ndash; типичная &laquo;рабочая лошадка&raquo;. Аппарат не производит впечатления своим дизайном. Внешне он выглядит строгим и консервативным. Радует качественная сборка корпуса, но глянцевый пластик очень маркий и к тому же скользкий. Экран у устройства не обладает высокой пиксельной плотностью, но у него широкие углы обзора и он обладает хорошей яркостью.</a><br />\r\n<br />\r\n<br />\r\n&nbsp;</p>\r\n', '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>ОC</td>\r\n			<td>Android</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Версия</td>\r\n			<td>4.2</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '<table>\r\n	<tbody>\r\n		<tr>\r\n			<th colspan="2">Особенности</th>\r\n		</tr>\r\n		<tr>\r\n			<td>Тип</td>\r\n			<td>смартфон</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Операционная система</td>\r\n			<td>Android</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Версия</td>\r\n			<td>4.2</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Процессор</td>\r\n			<td>Mediatek MT6582</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Частота</td>\r\n			<td>1300 МГц</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Оперативная память</td>\r\n			<td>1024 МБ</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Флэш-память</td>\r\n			<td>4096 МБ</td>\r\n		</tr>\r\n		<tr>\r\n			<th colspan="2">Экран</th>\r\n		</tr>\r\n		<tr>\r\n			<td>Диагональ</td>\r\n			<td>5.5 &quot;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Разрешение</td>\r\n			<td>960 x 540</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Цветопередача</td>\r\n			<td>16 млн. цветов</td>\r\n		</tr>\r\n		<tr>\r\n			<th colspan="2">Цифровая камера</th>\r\n		</tr>\r\n		<tr>\r\n			<td>Фотокамера</td>\r\n			<td>5 млн. пикс.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Максимальное разрешение</td>\r\n			<td>2592 x 1944</td>\r\n		</tr>\r\n		<tr>\r\n			<th colspan="2">Питание</th>\r\n		</tr>\r\n		<tr>\r\n			<td>Время в режиме работы</td>\r\n			<td>28 ч</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Время в режиме ожидания</td>\r\n			<td>490 ч</td>\r\n		</tr>\r\n		<tr>\r\n			<th colspan="2">Габариты и вес</th>\r\n		</tr>\r\n		<tr>\r\n			<td>Ширина</td>\r\n			<td>79.3 мм</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Высота</td>\r\n			<td>153.5 мм</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Глубина</td>\r\n			<td>9.5 мм</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Вес</td>\r\n			<td>184 гр.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '0000-00-00 00:00:00', 1, 0, 0, 1, 10, 'mobile', 3, 3, 0, 0),
(120, 'Nokia 5 Tempered Blue', 4559, 'Nokia', 'Nokia 5 Tempered Blue', 'Настоящий джентльмен. Его галантность можно увидеть при первом же знакомстве: модель отличается изящным дизайном, которым выполнен в духе минимализма. ', '<h3>Настоящий джентльмен.&nbsp;Его галантность можно увидеть при первом же знакомстве: модель отличается изящным дизайном, которым выполнен в духе минимализма.&nbsp;</h3>\r\n', 'mobile-12047.png', '<h3>Смартфон Nokia 5 Tempered Blue &ndash; это настоящий джентльмен. Его галантность можно увидеть при первом же знакомстве: модель отличается изящным дизайном, которым выполнен в духе минимализма. Мобильное устройство не демонстрирует чрезмерной напыщенности и пафоса &ndash; это телефон, который сможет найти применение как в социуме, так и за его рамками. Модель отличается высокой производительностью, которая была достигнута благодаря современной операционной системе Android Nougat и 8 ядерному процессору Snapdragon 430.<br />\r\n&nbsp;</h3>\r\n', '<p>&nbsp;Диагональ экрана: 5.2&quot;;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Камера: 13 Мп;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Количество ядер: 8;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Внутренняя память: 16 Гб;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<p>Диагональ экрана: 5.2&quot;</p>\r\n\r\n<p>Разрешение экрана: 1280x720</p>\r\n\r\n<p>Камера: 13 Мп</p>\r\n\r\n<p>Количество ядер: 8</p>\r\n\r\n<p>Оперативная память: 2 Гб</p>\r\n\r\n<p>Внутренняя память: 16 Гб</p>\r\n\r\n<p>Материал корпуса: Алюминий</p>\r\n\r\n<p>Bluetooth: 4.1</p>\r\n\r\n<p>Wi-Fi: IEEE 802.11 b/g/n</p>\r\n\r\n<p>Технология GPS: GPS</p>\r\n\r\n<p>Гарантийный срок: 12 месяцев<br />\r\n&nbsp;</p>\r\n', '0000-00-00 00:00:00', 0, 1, 0, 1, 5, 'mobile', 7, 1, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `table_reviews`
--

CREATE TABLE IF NOT EXISTS `table_reviews` (
  `reviews_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `good_reviews` text NOT NULL,
  `bad_reviews` text NOT NULL,
  `comment` text NOT NULL,
  `date` date NOT NULL,
  `moderat` int(11) NOT NULL,
  PRIMARY KEY (`reviews_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `table_reviews`
--

INSERT INTO `table_reviews` (`reviews_id`, `products_id`, `name`, `good_reviews`, `bad_reviews`, `comment`, `date`, `moderat`) VALUES
(9, 117, 'Valeria', 'Плюсы', 'Минусы', 'Комментарий', '2019-06-04', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `uploads_images`
--

CREATE TABLE IF NOT EXISTS `uploads_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Дамп данных таблицы `uploads_images`
--

INSERT INTO `uploads_images` (`id`, `products_id`, `image`) VALUES
(3, 20, 'mobile-302.jpg'),
(4, 20, 'mobile-267.jpg'),
(5, 20, 'mobile-477.jpg'),
(6, 20, 'mobile-367.jpg'),
(8, 114, 'mobile-261.jpg'),
(9, 114, 'mobile-269.jpg'),
(10, 114, 'mobile-307.jpg'),
(12, 30, 'notebook-173.jpg'),
(13, 30, 'notebook-448.jpg'),
(14, 30, 'notebook-497.jpg'),
(15, 30, 'notebook-491.jpg'),
(16, 117, 'mobile-225.jpg'),
(17, 117, 'mobile-442.jpg'),
(18, 120, 'mobile-302.jpg'),
(19, 120, 'mobile-216.jpg'),
(20, 120, 'mobile-452.jpg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
