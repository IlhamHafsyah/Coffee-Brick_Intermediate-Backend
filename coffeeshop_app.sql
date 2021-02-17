-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Feb 2021 pada 07.30
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coffeeshop_app`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `category_id` int(20) NOT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `category_created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `category_updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `category_status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_created_at`, `category_updated_at`, `category_status`) VALUES
(1, 'Coffee', '2020-12-10 04:52:37', '2020-12-10 04:52:37', 1),
(2, 'Non Coffee', '2020-12-10 04:52:37', '2020-12-10 04:52:37', 1),
(3, 'Foods', '2020-12-10 14:52:53', '2020-12-10 14:52:53', 1),
(4, 'Add-on', '2020-12-10 14:52:53', '2020-12-10 14:52:53', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL,
  `coupon_name` varchar(10) NOT NULL,
  `coupon_created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `coupon_updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `coupon_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `coupon_name`, `coupon_created_at`, `coupon_updated_at`, `coupon_status`) VALUES
(0, 'FNPR15RG', '2020-12-11 13:25:28', '2020-12-11 13:25:28', 0),
(0, 'DITRAKTIRD', '2020-12-11 13:25:28', '2020-12-11 13:25:28', 0),
(0, 'ARK15FOOD', '2020-12-11 13:25:28', '2020-12-11 13:25:28', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detailhistory`
--

CREATE TABLE `detailhistory` (
  `detailhistory_id` int(20) NOT NULL,
  `product_id` int(20) DEFAULT NULL,
  `qty` int(4) DEFAULT NULL,
  `payment_method` varchar(20) DEFAULT NULL,
  `delivery_method` varchar(20) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `tax` int(10) DEFAULT NULL,
  `shipping` int(11) DEFAULT NULL,
  `subtotal` int(10) DEFAULT NULL,
  `history_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detailhistory`
--

INSERT INTO `detailhistory` (`detailhistory_id`, `product_id`, `qty`, `payment_method`, `delivery_method`, `size`, `tax`, `shipping`, `subtotal`, `history_id`) VALUES
(1, 2, 2, 'cash', 'Dine In', 'Large', 4000, 5000, 40000, 0),
(2, 3, 21, 'cash', 'Dine In', 'Large', 4000, 5000, 24000, 0),
(3, 2, 2, 'cash', 'Dine In', 'Large', 4000, 5000, 40000, 1),
(4, 3, 21, 'cash', 'Dine In', 'Large', 4000, 5000, 24000, 1),
(5, 2, 2, 'cash', 'Dine In', 'Large', 4000, 5000, 40000, 2),
(6, 3, 1, 'cash', 'Dine In', 'Large', 4000, 5000, 24000, 2),
(7, 17, 1, 'cash on delivery', 'Dine in', '500 gr', 2500, 5000, 25000, 3),
(8, 18, 1, 'bank account', 'Dine in', '500 gr', 5700, 5000, 25000, 4),
(9, 1, 1, 'Card', 'Dine in', '500 gr', 6600, 5000, 34000, 5),
(10, 1, 1, 'Card', 'Dine in', '500 gr', 6600, 5000, 34000, 5),
(11, 3, 1, 'Card', 'Dine in', '500 gr', 6600, 5000, 32000, 5),
(12, 1, 1, 'Card', 'Dine in', '500 gr', 6600, 5000, 34000, 6),
(13, 3, 1, 'Card', 'Dine in', '500 gr', 6600, 5000, 32000, 6),
(14, 1, 1, 'bank account', 'Dine in', '500 gr', 6600, 5000, 34000, 7),
(15, 3, 1, 'bank account', 'Dine in', '500 gr', 6600, 5000, 32000, 7),
(16, 9, 1, 'bank account', 'Dine in', 'X Large', 2700, 5000, 27000, 8),
(17, 2, 1, '', 'Dine in', 'X Large', 2800, 5000, 28000, 9),
(18, 3, 1, 'Card', 'Dine in', '500 gr', 3200, 5000, 32000, 10),
(19, 7, 2, 'Card', 'Dine in', 'X Large', 6000, 5000, 30000, 11),
(20, 7, 2, 'bank account', 'Dine in', 'X Large', 6000, 5000, 30000, 12),
(21, 3, 1, 'Card', 'Dine in', '500 gr', 3200, 5000, 32000, 13),
(22, 3, 2, 'Card', 'Dine in', '500 gr', 12400, 5000, 32000, 14),
(23, 4, 1, 'Card', 'Dine in', 'X Large', 12400, 5000, 30000, 14),
(24, 7, 1, 'Card', 'Dine in', 'Large', 12400, 5000, 30000, 14),
(25, 2, 1, 'cash on delivery', 'Dine in', 'X Large', 2800, 5000, 28000, 15),
(26, 3, 1, 'bank account', 'Dine in', '500 gr', 3200, 5000, 32000, 16),
(27, 1, 1, 'Card', 'Dine in', '500 gr', 9600, 5000, 34000, 17),
(28, 3, 1, 'Card', 'Dine in', '500 gr', 9600, 5000, 32000, 17),
(29, 8, 1, 'Card', 'Dine in', '500 gr', 9600, 5000, 30000, 17);

-- --------------------------------------------------------

--
-- Struktur dari tabel `history`
--

CREATE TABLE `history` (
  `history_id` int(10) DEFAULT NULL,
  `invoice` int(10) DEFAULT NULL,
  `payment_method` varchar(20) DEFAULT NULL,
  `history_created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `subtotal` int(8) DEFAULT NULL,
  `user_id` int(4) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `history`
--

INSERT INTO `history` (`history_id`, `invoice`, `payment_method`, `history_created_at`, `subtotal`, `user_id`, `status`) VALUES
(2, 2, 'cash', '2021-02-15 01:12:25', 10000, 10, 0),
(2, 3, 'cash', '2021-02-15 01:16:21', 10000, 10, 0),
(2, 4, 'cash', '2021-02-15 01:16:22', 10000, 10, 0),
(2, 5, 'cash', '2021-02-15 01:16:23', 10000, 10, 0),
(2, 6, 'cash', '2021-02-15 01:16:24', 10000, 10, 0),
(1, 7, 'bank account', '2021-02-15 01:37:05', 71000, 22, 0),
(13, 8, 'Card', '2021-02-15 01:40:17', 40200, 22, 0),
(1, 9, 'Card', '2021-02-16 03:17:20', 141400, 22, 0),
(1, 10, 'cash on delivery', '2021-02-16 03:30:19', 35800, 22, 0),
(16, 11, 'bank account', '2021-02-16 03:32:22', 40200, 22, 0),
(1, 12, 'Card', '2021-02-16 09:03:42', 110600, 22, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment`
--

CREATE TABLE `payment` (
  `payment_id` varchar(5) DEFAULT NULL,
  `payment_name` varchar(20) DEFAULT NULL,
  `payment_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `product_id` int(20) NOT NULL,
  `category_id` int(20) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `product_price` int(10) DEFAULT NULL,
  `product_stock` int(3) DEFAULT NULL,
  `product_desc` varchar(200) DEFAULT NULL,
  `size_r` int(10) DEFAULT NULL,
  `size_l` int(10) DEFAULT NULL,
  `size_xl` int(10) DEFAULT NULL,
  `size_250` int(10) DEFAULT NULL,
  `size_300` int(10) DEFAULT NULL,
  `size_500` int(10) DEFAULT NULL,
  `home_delivery` int(1) DEFAULT NULL,
  `dine_in` int(1) DEFAULT NULL,
  `take_away` int(1) DEFAULT NULL,
  `start_hour` time(6) DEFAULT NULL,
  `end_hour` time(6) DEFAULT NULL,
  `product_created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `product_updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `product_status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `product_name`, `product_image`, `product_price`, `product_stock`, `product_desc`, `size_r`, `size_l`, `size_xl`, `size_250`, `size_300`, `size_500`, `home_delivery`, `dine_in`, `take_away`, `start_hour`, `end_hour`, `product_created_at`, `product_updated_at`, `product_status`) VALUES
(1, 3, 'Veggie Tomato Mix', '2021-02-10T03-04-52.890Zvtm-t.png', 34000, 100, 'Its just a simple tomato sauce but because it’s packed full of hidden veggies it makes a really fantastic addition to your children’s meals and a great way to sneak in some extra nutrients. ', 0, 0, 0, 1, 1, 1, 1, 1, 1, '00:00:00.000000', '00:00:00.000000', '2021-02-10 03:04:52', '2020-12-10 05:11:10', 1),
(2, 2, 'Hazzlenuts Latte', '2021-01-12T00-20-55.562Zcil.png', 28000, 100, 'Hazelnut and silky steamed frothy layer accentuate impressive Hazelnut notes in this latte. Espresso mingles with Hazelnut lightly topped with foam.', 1, 1, 1, 0, 0, 0, 0, 1, 0, '00:00:00.000000', '00:00:00.000000', '2021-01-12 00:20:55', '2021-01-09 00:38:56', 1),
(3, 3, 'Summer Fried Rice', '2021-01-12T00-22-59.025Zbeef-spag.png', 32000, 100, 'A dish of cooked rice that has been stir-fried in a wok or a frying pan and is usually mixed with other ingredients such as eggs, vegetables, seafood, or meat. It is often eaten by itself or as an acc', 0, 0, 0, 1, 1, 1, 1, 1, 1, '00:00:00.000000', '00:00:00.000000', '2021-01-12 00:22:59', '2020-12-10 05:11:10', 1),
(4, 2, 'Creamy Ice Lattes', '2021-02-10T03-03-13.683Zice-latte.jpg', 30000, 100, 'Creamy Italian latte Iced, nothing better than a cold iced in the summer time heat.', 1, 1, 1, 0, 0, 0, 0, 1, 1, '00:00:00.000000', '00:00:00.000000', '2021-02-10 03:03:13', '2020-12-10 05:11:10', 1),
(5, 3, 'Drum Sticks', '2021-01-12T02-33-22.892Zds.png', 30000, 100, 'Drum Sticks tossed in a crispy coating made with crushed tortilla chips before deep frying.', 0, 0, 0, 1, 1, 1, 1, 1, 1, '00:00:00.000000', '00:00:00.000000', '2021-01-12 02:33:22', '2020-12-10 05:11:10', 1),
(6, 3, 'Salty Rice', '2021-02-10T03-05-38.119Zsr.jpg', 21000, 100, 'A popular Fujian rice casserole dish and is something I grew up eating with different versions from different families.', 0, 0, 0, 1, 1, 1, 1, 1, 1, '00:00:00.000000', '00:00:00.000000', '2021-02-10 03:05:38', '2020-12-10 05:11:10', 1),
(7, 1, 'Cold Brew', '2021-02-16T13-08-55.529Zcb.png', 25000, 100, 'Combines ground coffee and cool water and uses time instead of heat to extract the flavor. It is brewed in small batches and steeped for as long as 48 hours.', 1, 1, 1, 0, 0, 0, 0, 1, 1, '08:00:00.000000', '20:00:00.000000', '2021-02-16 13:08:55', '2020-12-10 05:11:10', 1),
(8, 3, 'Chicken Fire Wings', '2021-02-10T03-04-25.965Zcfw.jpg', 30000, 100, 'Fire Wings has over 20 wing sauces that will blow your mind. Everything from BBQ Sauce to Rubs.', 0, 0, 0, 1, 1, 1, 1, 1, 1, '00:00:00.000000', '00:00:00.000000', '2021-02-10 03:04:26', '2020-12-10 05:11:10', 1),
(9, 1, 'Americano', '2021-02-10T03-06-31.443Zame.jpeg', 27000, 100, 'An espresso-based drink designed to resemble coffee brewed in a drip filter, considered popular in the United States of America. This drink consists of a single or double-shot of espresso combined wit', 1, 1, 1, 0, 0, 0, 0, 1, 1, '00:00:00.000000', '00:00:00.000000', '2021-02-10 03:06:31', '2020-12-10 19:13:44', 1),
(10, 1, 'Mocha Latte', '2021-02-10T03-07-29.044Zml.jpg', 33000, 100, 'Based on espresso and hot milk but with added chocolate flavouring and sweetener, typically in the form of cocoa powder and sugar.', 1, 1, 1, 0, 0, 0, 0, 1, 1, '00:00:00.000000', '00:00:00.000000', '2021-02-10 03:07:29', '2020-12-10 19:13:44', 1),
(11, 1, 'Mocha Rum', '2021-02-10T03-08-31.326Zmc.jpg', 35000, 100, 'Mocha Rum Aromas There\'s coffee, caramel, and chocolate, for a really rich aroma. It has the sweetness of vanilla and honey.', 1, 1, 1, 0, 0, 0, 0, 1, 1, '00:00:00.000000', '00:00:00.000000', '2021-02-10 03:08:31', '2020-12-10 19:13:44', 1),
(12, 1, 'Honey Latte', '2021-02-10T03-09-26.854Zhl.jpg', 37000, 100, 'Honey latte is a coffee drink that combines honey and milk.', 0, 0, 0, 0, 0, 0, 0, 1, 1, '00:00:00.000000', '00:00:00.000000', '2021-02-10 03:09:27', '2020-12-10 19:13:44', 1),
(13, 1, 'Creeme Brulee', '2021-02-10T03-14-34.310Zcbr.jpg', 37000, 100, 'A dessert consisting of a rich custard base topped with a texturally contrasting layer of hardened caramelized sugar.', 0, 0, 0, 0, 0, 0, 0, 1, 1, '00:00:00.000000', '00:00:00.000000', '2021-02-10 03:14:34', '2020-12-10 19:13:44', 1),
(14, 2, 'Red Velvet Latte', '2021-02-10T03-15-21.361Zrv.jpg', 37000, 100, 'Red Velvet Latte is a decadent mocha latte with an extra touch of vanilla and made beautifully red velvet naturally with beet juice.', 0, 0, 0, 0, 0, 0, 0, 1, 1, '00:00:00.000000', '00:00:00.000000', '2021-02-10 03:15:21', '2020-12-10 19:13:44', 1),
(15, 2, 'Matcha Latte', '2021-02-10T03-15-54.754Zmlatte.jpg', 35000, 100, 'Matcha gives you an energy boost without the crash you often experience after a strong cup of coffee.', 0, 0, 0, 0, 0, 0, 0, 1, 1, '00:00:00.000000', '00:00:00.000000', '2021-02-10 03:15:54', '2020-12-10 19:13:44', 1),
(16, 2, 'Taro Latte', '2021-02-10T03-17-15.971Ztlatte.png', 35000, 100, 'This purple latte is made with Taro. Taro is a type of root vegetable, similar to a sweet potato.', 0, 0, 0, 0, 0, 0, 0, 1, 1, '00:00:00.000000', '00:00:00.000000', '2021-02-10 03:17:16', '2020-12-10 19:13:44', 1),
(17, 4, 'Potato Jacket', '2021-02-10T03-17-58.896Zpj.jpeg', 25000, 100, 'A jacket potato is a large potato that has been baked with its skin on.', 0, 0, 0, 0, 0, 0, 0, 1, 0, '00:00:00.000000', '00:00:00.000000', '2021-02-10 03:17:58', '2020-12-10 19:13:44', 1),
(18, 4, 'French Fries', '2021-02-10T03-18-31.220Zff.jpeg', 25000, 100, 'French fries are pieces of potato that have been deep-fried.', 0, 0, 0, 0, 0, 0, 0, 1, 0, '00:00:00.000000', '00:00:00.000000', '2021-02-10 03:18:31', '2020-12-10 19:13:44', 1),
(19, 3, 'Grilled Beef Burger', '2021-02-10T03-22-36.917Zgbb.jpg', 45000, 100, 'Flavorful burger, skip the extra-lean ground beef patty blends and use ground beef with a higher fat content. Ground beef with an 80/20 mix is the best for grilled burgers—this means a mix 80 percent ', 0, 0, 0, 0, 0, 0, 1, 1, 0, '00:00:00.000000', '00:00:00.000000', '2021-02-10 03:22:36', '2020-12-10 19:13:44', 1),
(20, 1, 'Macchiato', '2021-02-10T03-26-43.819Zmach.png', 28000, 100, 'An espresso coffee drink with a small amount of milk, usually foamed.', 0, 0, 0, 0, 0, 0, 0, 1, 0, '00:00:00.000000', '00:00:00.000000', '2021-02-10 03:26:43', '2020-12-23 07:33:35', 1),
(22, 2, 'Iced Tea', '2021-02-10T03-28-39.878Zit.jpg', 2000, 100, 'Iced tea is a form of cold tea. Served in a glass with ice, it can refer to any tea that has been chilled or cooled.', 0, 0, 0, 0, 0, 0, 0, 1, 1, '00:00:00.000000', '00:00:00.000000', '2021-02-10 03:28:39', '2020-12-12 07:00:46', 1),
(24, 2, 'Orange Juice', '2021-02-10T03-31-43.272Zoju.jpg', 10000, 100, 'Iced tea is a form of cold tea. Served in a glass with ice, it can refer to any tea that has been chilled or cooled.', 0, 0, 0, 0, 0, 0, 0, 1, 1, '00:00:00.000000', '00:00:00.000000', '2021-02-10 03:31:43', '2020-12-14 03:26:32', 1),
(26, 2, 'Vanilla Latte', '2021-02-10T03-34-18.000Zvla.jpg', 25000, 100, 'Vanilla Latte is blabla', 0, 0, 0, 0, 0, 0, 1, 1, 1, '00:00:00.000000', '00:00:00.000000', '2021-02-10 03:34:18', '2020-12-16 11:27:25', 1),
(37, 2, 'Jus Alpukat', '2021-02-10T03-13-37.524Zavj.jpg', 20000, 100, 'Alpukat Juice', 0, 0, 0, 0, 0, 0, 1, 1, 1, '00:00:00.000000', '00:00:00.000000', '2021-02-10 03:13:37', '2020-12-30 11:52:52', 1),
(38, 2, 'Mango Juice', '2021-02-10T03-12-37.413Zmju.jpg', 18000, 100, 'Mango Juice Jasjus', 0, 0, 0, 0, 0, 0, 1, 1, 1, '00:00:00.000000', '00:00:00.000000', '2021-02-10 03:12:37', '2020-12-30 04:54:52', 1),
(43, 3, 'Pork', '2021-02-10T03-10-45.415Zpork.jpeg', 100000, 100, 'Pork', 0, 0, 0, 1, 1, 1, 1, 1, 1, '08:00:00.000000', '12:00:00.000000', '2021-02-10 03:10:45', '2021-01-11 18:30:18', 1),
(44, 2, 'Fresh Milk', '2021-02-10T03-11-31.689Zfm.jpg', 20000, 100, 'Freshhh', 1, 1, 1, 0, 0, 0, 1, 1, 1, '08:00:00.000000', '12:00:00.000000', '2021-02-10 03:11:31', '2021-01-12 07:50:56', 1),
(48, 3, 'Chicken Katsu', '2021-02-10T03-38-52.255Zckat.jpg', 40000, 100, 'Chicken katsu is generally served with tonkatsu sauce (とんかつソース), a thick Japanese vegetarian pureed fruit-based brown sauce, or a well-seasoned ketchup, as a Hawaiian mixed plate lunch meal.', 0, 0, 0, 1, 1, 1, 1, 1, 0, '08:00:00.000000', '16:00:00.000000', '2021-02-10 03:38:52', '2021-02-10 10:38:52', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `promocode`
--

CREATE TABLE `promocode` (
  `promocode_id` int(2) NOT NULL,
  `promocode_name` varchar(15) DEFAULT NULL,
  `promocode_image` varchar(255) DEFAULT NULL,
  `promocode_discount` int(2) DEFAULT NULL,
  `minimum_purchase` int(7) DEFAULT NULL,
  `valid_until` date DEFAULT NULL,
  `promocode_created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `promocode_updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `promocode_status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `promocode`
--

INSERT INTO `promocode` (`promocode_id`, `promocode_name`, `promocode_image`, `promocode_discount`, `minimum_purchase`, `valid_until`, `promocode_created_at`, `promocode_updated_at`, `promocode_status`) VALUES
(1, 'FNPR15RG', '2021-01-12T02-31-43.004Zbeef-spag.png', 20, 60000, '2021-01-01', '2021-01-12 02:31:43', '2020-12-11 14:46:52', 1),
(25, 'CAFEBRR', '2021-02-16T13-09-45.735Zame.jpeg', 20, 60000, '2021-02-23', '2021-02-16 20:09:45', '2021-02-16 13:09:45', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `size`
--

CREATE TABLE `size` (
  `size_id` int(1) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `size`
--

INSERT INTO `size` (`size_id`, `type`) VALUES
(0, 'size'),
(1, 'gram');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` int(10) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_display_name` varchar(50) DEFAULT NULL,
  `user_first_name` varchar(20) DEFAULT NULL,
  `user_last_name` varchar(20) DEFAULT NULL,
  `user_birthday` datetime DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_phone_number` int(15) DEFAULT NULL,
  `user_address` varchar(100) DEFAULT NULL,
  `user_created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `user_updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `user_status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` int(11) NOT NULL,
  `user_email` int(11) NOT NULL,
  `user_password` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users1`
--

CREATE TABLE `users1` (
  `users_id` int(20) NOT NULL,
  `users_name` varchar(100) DEFAULT NULL,
  `users_email` varchar(100) DEFAULT NULL,
  `users_password` varchar(150) DEFAULT NULL,
  `profile_picture` varchar(500) DEFAULT NULL,
  `users_phone` varchar(20) DEFAULT NULL,
  `delivery_address` varchar(500) DEFAULT NULL,
  `display_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `users_gender` int(1) DEFAULT NULL,
  `users_role` int(1) NOT NULL DEFAULT 0,
  `status` int(1) DEFAULT NULL,
  `users_created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `users_updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users1`
--

INSERT INTO `users1` (`users_id`, `users_name`, `users_email`, `users_password`, `profile_picture`, `users_phone`, `delivery_address`, `display_name`, `first_name`, `last_name`, `date_of_birth`, `users_gender`, `users_role`, `status`, `users_created_at`, `users_updated_at`) VALUES
(19, 'Ilham Hafsyah', 'ilham@gmail.com', '$2b$10$l8yjx3z/whTAgncj.ZXjXuEdD04b25zoi2l/cR6pbr3JGpdLE9tke', '2021-02-12T00-12-34.326Z2020-07-30 03.58.05 1.jpg', '081228282833', 'Jakarta', 'Display Name', 'Ilham', 'Hafsyah', '2021-02-11', 1, 1, 1, '2021-02-08 06:47:42', '2021-02-12 00:12:34'),
(22, 'Ilham Hafsyah', 'customer@gmail.com', '$2b$10$EgqTLhMViWzpevk/6tsS1.RCzx5jKuyKL3ueKelP2.AVq6T4pUJcm', '2021-02-15T08-07-16.217Zprofile.jpg', '0323423214', 'Jl. Senopati No. 9\nJakarta Selatan, DKI Jakarta', 'Display Name', 'Ilham', 'Hafsyah', '2021-02-04', 1, 0, 1, '2021-02-12 01:59:04', '2021-02-15 08:07:16');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeks untuk tabel `detailhistory`
--
ALTER TABLE `detailhistory`
  ADD PRIMARY KEY (`detailhistory_id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indeks untuk tabel `promocode`
--
ALTER TABLE `promocode`
  ADD PRIMARY KEY (`promocode_id`);

--
-- Indeks untuk tabel `users1`
--
ALTER TABLE `users1`
  ADD PRIMARY KEY (`users_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detailhistory`
--
ALTER TABLE `detailhistory`
  MODIFY `detailhistory_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT untuk tabel `promocode`
--
ALTER TABLE `promocode`
  MODIFY `promocode_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `users1`
--
ALTER TABLE `users1`
  MODIFY `users_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
