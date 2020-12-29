-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Des 2020 pada 10.05
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
  `category_name` varchar(50) NOT NULL,
  `category_created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `category_updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `category_status` int(1) NOT NULL
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
  `product_id` int(20) NOT NULL,
  `qty` int(4) NOT NULL,
  `size` varchar(20) NOT NULL,
  `tax` int(10) NOT NULL,
  `shipping` int(11) NOT NULL,
  `subtotal` int(10) NOT NULL,
  `history_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detailhistory`
--

INSERT INTO `detailhistory` (`detailhistory_id`, `product_id`, `qty`, `size`, `tax`, `shipping`, `subtotal`, `history_id`) VALUES
(1, 5, 1, '', 0, 0, 30000, 2),
(2, 6, 1, '', 0, 0, 30000, 2),
(3, 7, 1, '', 0, 0, 20000, 3),
(4, 9, 1, '', 0, 0, 27000, 4),
(5, 2, 1, '', 0, 0, 25000, 4),
(6, 11, 1, '', 0, 0, 35000, 0),
(7, 1, 1, '', 0, 0, 34000, 0),
(8, 3, 1, '', 0, 0, 36000, 0),
(9, 22, 2, '', 0, 0, 10000, 0),
(10, 17, 1, '', 0, 0, 25000, 0),
(11, 1, 2, '', 0, 0, 20000, 0),
(12, 1, 2, '', 0, 0, 20000, 0),
(13, 1, 2, '', 0, 0, 20000, 0),
(14, 1, 2, '', 0, 0, 20000, 0),
(15, 2, 2, 'Large', 20000, 10000, 40000, 0),
(16, 2, 2, 'Large', 0, 0, 40000, 0),
(17, 2, 2, 'Large', 0, 0, 40000, 0),
(18, 2, 2, 'Large', 0, 0, 40000, 0),
(19, 2, 2, 'Large', 0, 0, 40000, 0),
(20, 2, 2, 'Large', 0, 0, 40000, 0),
(22, 0, 0, '', 0, 0, 0, 1),
(23, 0, 0, '', 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `history`
--

CREATE TABLE `history` (
  `history_id` int(20) NOT NULL,
  `invoice` varchar(10) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `history_created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `subtotal` int(8) NOT NULL,
  `user_id` int(4) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `history`
--

INSERT INTO `history` (`history_id`, `invoice`, `payment_method`, `history_created_at`, `subtotal`, `user_id`, `status`) VALUES
(1, 'CS-01', 'cash', '2020-12-13 21:16:42', 30000, 1, 1),
(2, 'CS-01', 'cash', '2020-12-13 21:16:42', 50000, 2, 1),
(3, 'CS-03', 'cash', '2020-12-13 21:16:42', 27000, 3, 1),
(4, 'CS-04', 'bank transfer', '2020-12-13 21:16:42', 60000, 4, 1),
(5, 'CS-05', 'cash', '2020-12-13 21:16:42', 76000, 5, 1),
(6, 'CS-99', 'cash', '2020-12-14 03:23:28', 50000, 10, 1),
(7, 'CS-100', 'cash', '2020-12-14 23:44:28', 50000, 10, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment`
--

CREATE TABLE `payment` (
  `payment_id` varchar(5) NOT NULL,
  `payment_name` varchar(20) NOT NULL,
  `payment_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `product_id` int(20) NOT NULL,
  `category_id` int(20) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_price` int(10) NOT NULL,
  `product_stock` int(3) NOT NULL,
  `product_desc` varchar(200) NOT NULL,
  `home_delivery` int(1) NOT NULL,
  `dine_in` int(1) NOT NULL,
  `take_away` int(1) NOT NULL,
  `product_created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `product_updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `product_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `product_name`, `product_image`, `product_price`, `product_stock`, `product_desc`, `home_delivery`, `dine_in`, `take_away`, `product_created_at`, `product_updated_at`, `product_status`) VALUES
(1, 3, 'Veggie Tomato Mix', '', 34000, 100, 'Its just a simple tomato sauce but because it’s packed full of hidden veggies it makes a really fantastic addition to your children’s meals and a great way to sneak in some extra nutrients. ', 1, 1, 1, '2020-12-10 05:11:10', '2020-12-10 05:11:10', 1),
(2, 2, 'Hazzlenut Latte', '', 28000, 100, 'Hazelnut and silky steamed frothy layer accentuate impressive Hazelnut notes in this latte. Espresso mingles with Hazelnut lightly topped with foam.', 0, 1, 0, '2020-12-10 05:11:10', '2020-12-23 07:44:53', 1),
(3, 3, 'Summer Fried Rice', '', 32000, 100, 'A dish of cooked rice that has been stir-fried in a wok or a frying pan and is usually mixed with other ingredients such as eggs, vegetables, seafood, or meat. It is often eaten by itself or as an acc', 1, 1, 1, '2020-12-10 05:11:10', '2020-12-10 05:11:10', 1),
(4, 2, 'Creamy Ice Latte', '', 27000, 100, 'Creamy Italian latte Iced, nothing better than a cold iced in the summer time heat.', 0, 1, 1, '2020-12-10 05:11:10', '2020-12-10 05:11:10', 1),
(5, 3, 'Drum Sticks', '', 30000, 100, 'Drum Sticks tossed in a crispy coating made with crushed tortilla chips before deep frying.', 1, 1, 1, '2020-12-10 05:11:10', '2020-12-10 05:11:10', 1),
(6, 3, 'Salty Rice', '', 20000, 100, 'A popular Fujian rice casserole dish and is something I grew up eating with different versions from different families.', 1, 1, 1, '2020-12-10 05:11:10', '2020-12-10 05:11:10', 1),
(7, 1, 'Cold Brew', '', 30000, 100, 'Combines ground coffee and cool water and uses time instead of heat to extract the flavor. It is brewed in small batches and steeped for as long as 48 hours.', 0, 1, 1, '2020-12-10 05:11:10', '2020-12-10 05:11:10', 1),
(8, 3, 'Chicken Fire WIngs', '', 30000, 100, 'Fire Wings has over 20 wing sauces that will blow your mind. Everything from BBQ Sauce to Rubs.', 1, 1, 1, '2020-12-10 05:11:10', '2020-12-10 05:11:10', 1),
(9, 1, 'Americano', '', 27000, 100, 'An espresso-based drink designed to resemble coffee brewed in a drip filter, considered popular in the United States of America. This drink consists of a single or double-shot of espresso combined wit', 0, 1, 1, '2020-12-10 19:13:44', '2020-12-10 19:13:44', 1),
(10, 1, 'Mocha Latte', '', 33000, 100, 'Based on espresso and hot milk but with added chocolate flavouring and sweetener, typically in the form of cocoa powder and sugar.', 0, 1, 1, '2020-12-10 19:13:44', '2020-12-10 19:13:44', 1),
(11, 1, 'Mocha Rum', '', 35000, 100, 'Mocha Rum Aromas There\'s coffee, caramel, and chocolate, for a really rich aroma. It has the sweetness of vanilla and honey.', 0, 1, 1, '2020-12-10 19:13:44', '2020-12-10 19:13:44', 1),
(12, 1, 'Honey Latte', '', 37000, 100, 'Honey latte is a coffee drink that combines honey and milk.', 0, 1, 1, '2020-12-10 19:13:44', '2020-12-10 19:13:44', 1),
(13, 1, 'Creeme Brulee', '', 37000, 100, 'A dessert consisting of a rich custard base topped with a texturally contrasting layer of hardened caramelized sugar.', 0, 1, 1, '2020-12-10 19:13:44', '2020-12-10 19:13:44', 1),
(14, 2, 'Red Velvet Latte', '', 37000, 100, 'Red Velvet Latte is a decadent mocha latte with an extra touch of vanilla and made beautifully red velvet naturally with beet juice.', 0, 1, 1, '2020-12-10 19:13:44', '2020-12-10 19:13:44', 1),
(15, 2, 'Matcha Latte', '', 35000, 100, 'Matcha gives you an energy boost without the crash you often experience after a strong cup of coffee.', 0, 1, 1, '2020-12-10 19:13:44', '2020-12-10 19:13:44', 1),
(16, 2, 'Taro Latte', '', 35000, 100, 'This purple latte is made with Taro. Taro is a type of root vegetable, similar to a sweet potato.', 0, 1, 1, '2020-12-10 19:13:44', '2020-12-10 19:13:44', 1),
(17, 4, 'Potato Jacket', '', 25000, 100, 'A jacket potato is a large potato that has been baked with its skin on.', 0, 1, 0, '2020-12-10 19:13:44', '2020-12-10 19:13:44', 1),
(18, 4, 'French Fries', '', 25000, 100, 'French fries are pieces of potato that have been deep-fried.', 0, 1, 0, '2020-12-10 19:13:44', '2020-12-10 19:13:44', 1),
(19, 3, 'Grilled Beef Burger', '', 45000, 100, 'Flavorful burger, skip the extra-lean ground beef patty blends and use ground beef with a higher fat content. Ground beef with an 80/20 mix is the best for grilled burgers—this means a mix 80 percent ', 1, 1, 0, '2020-12-10 19:13:44', '2020-12-10 19:13:44', 1),
(20, 1, 'Macchiato', '', 28000, 100, 'An espresso coffee drink with a small amount of milk, usually foamed.', 0, 1, 0, '2020-12-11 23:50:53', '2020-12-23 07:33:35', 1),
(22, 2, 'Iced Tea', '', 5000, 100, 'Iced tea is a form of cold tea. Served in a glass with ice, it can refer to any tea that has been chilled or cooled.', 0, 1, 1, '2020-12-12 00:00:46', '2020-12-12 07:00:46', 1),
(23, 2, 'Iced Tea', '', 5000, 100, 'Iced tea is a form of cold tea. Served in a glass with ice, it can refer to any tea that has been chilled or cooled.', 0, 1, 1, '2020-12-13 20:18:22', '2020-12-14 03:18:22', 1),
(24, 2, 'Orange Juice', '', 10000, 100, 'Iced tea is a form of cold tea. Served in a glass with ice, it can refer to any tea that has been chilled or cooled.', 0, 1, 1, '2020-12-13 20:26:32', '2020-12-14 03:26:32', 1),
(26, 2, 'Vanilla Latte', '', 25000, 100, 'Vanilla Latte is blabla', 1, 1, 1, '2020-12-16 04:27:25', '2020-12-16 11:27:25', 1),
(32, 2, 'Jus', '2020-12-24T20-35-39.624Zcil.png', 20000, 100, 'ya jus', 1, 1, 1, '2020-12-24 20:35:39', '2020-12-25 03:35:39', 1),
(34, 2, 'Jus', '2020-12-25T01-06-44.144Zcil.png', 20000, 100, 'ya jus', 1, 1, 1, '2020-12-25 01:06:44', '2020-12-25 08:06:44', 1),
(35, 2, 'Mango Juice', '2020-12-28T15-09-19.623Zvtm-t.png', 18000, 100, 'Mango Juice Jasjus', 1, 1, 1, '2020-12-25 01:27:18', '2020-12-28 15:09:19', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `promocode`
--

CREATE TABLE `promocode` (
  `promocode_id` int(2) NOT NULL,
  `promocode_name` varchar(15) NOT NULL,
  `promocode_image` varchar(255) NOT NULL,
  `promocode_discount` int(2) NOT NULL,
  `minimum_purchase` int(7) NOT NULL,
  `valid_until` datetime(6) DEFAULT NULL,
  `promocode_created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `promocode_updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `promocode_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `promocode`
--

INSERT INTO `promocode` (`promocode_id`, `promocode_name`, `promocode_image`, `promocode_discount`, `minimum_purchase`, `valid_until`, `promocode_created_at`, `promocode_updated_at`, `promocode_status`) VALUES
(1, 'FNPR15RG', '', 20, 60000, '2021-01-01 22:43:43.000000', '2020-12-11 14:46:52', '2020-12-11 14:46:52', 1),
(2, 'ARK25FOOD', '', 25, 65000, '2021-01-01 22:43:58.000000', '2020-12-11 14:46:52', '2020-12-11 14:46:52', 1),
(3, 'TRAKTIR30', '', 30, 70000, '2021-01-15 22:44:03.000000', '2020-12-11 14:46:52', '2020-12-11 14:46:52', 1),
(4, 'YESOKE70', '2020-12-28T15-13-37.312Zds.png', 70, 150000, '2020-12-31 22:44:09.000000', '2020-12-28 15:13:37', '2020-12-12 13:11:24', 1),
(5, 'ARK25FOOD', '', 25, 70000, '2021-01-20 22:44:14.000000', '2020-12-12 13:11:24', '2020-12-12 13:11:24', 1),
(7, 'CHRSTMS21', '', 21, 50000, '2021-01-31 22:44:20.000000', '2020-12-12 16:26:34', '2020-12-12 16:26:34', 1),
(8, 'CORONA19', '', 19, 19000, '2021-02-25 22:44:27.000000', '2020-12-12 16:28:11', '2020-12-12 16:28:11', 1),
(9, 'LOLPROMO45', '', 45, 200000, '2021-01-29 22:44:35.000000', '2020-12-12 16:28:11', '2020-12-12 16:28:11', 1),
(10, 'LOLSILOL65', '', 65, 250000, '2021-02-05 22:44:40.000000', '2020-12-12 16:28:59', '2020-12-12 16:28:59', 1),
(11, 'ARKAOKE', '', 50, 135000, '2021-01-20 22:44:45.000000', '2020-12-14 12:55:07', '2020-12-14 05:55:07', 1),
(13, 'YESOKE', '2020-12-28T15-12-11.486Zbeef-spag.png', 70, 0, NULL, '2020-12-28 22:12:11', '2020-12-28 15:12:11', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `size`
--

CREATE TABLE `size` (
  `size_id` varchar(1) NOT NULL,
  `size_name` varchar(15) NOT NULL,
  `size-created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `size_updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `size_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` int(10) DEFAULT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_display_name` varchar(50) NOT NULL,
  `user_first_name` varchar(20) NOT NULL,
  `user_last_name` varchar(20) NOT NULL,
  `user_birthday` datetime NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_phone_number` int(15) NOT NULL,
  `user_address` varchar(100) NOT NULL,
  `user_created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `user_updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `user_status` int(1) NOT NULL
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
  `users_name` varchar(100) NOT NULL,
  `users_email` varchar(100) NOT NULL,
  `users_password` varchar(150) NOT NULL,
  `profile_picture` varchar(500) NOT NULL,
  `users_phone` int(20) NOT NULL,
  `delivery_address` varchar(500) NOT NULL,
  `display_name` varchar(50) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `users_gender` int(1) NOT NULL,
  `users_role` int(1) NOT NULL,
  `status` int(1) NOT NULL,
  `users_created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `users_updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users1`
--

INSERT INTO `users1` (`users_id`, `users_name`, `users_email`, `users_password`, `profile_picture`, `users_phone`, `delivery_address`, `display_name`, `first_name`, `last_name`, `date_of_birth`, `users_gender`, `users_role`, `status`, `users_created_at`, `users_updated_at`) VALUES
(6, 'customer', 'customer@gmail.com', '$2b$10$evW1YCF2./um6LyZFjvvF..6Yv6A76Uu8i/P7adSng0b5.cLLHgSm', '', 0, '', '', '', '', NULL, 0, 0, 1, '2020-12-23 22:56:59', '2020-12-24 05:56:59'),
(7, 'customer1', 'customer1@gmail.com', '$2b$10$haUzOfoZHrd0Wn0euWjjO.jOkSKIy7t8YTWkGdTvZYKpfnYGNAVKm', '', 2147483647, '', 'Cust', 'Cust', 'Omer', '2000-10-10', 1, 0, 1, '2020-12-23 23:01:36', '2020-12-24 06:01:36'),
(8, 'aku customer', 'customer.aku@gmail.com', '$2b$10$C3e/tcPUt9uM1/CuMNj8XuIT.j8FiLUf.LfgA/F4uREWSqu8Tlhaq', '2020-12-28T14-54-17.938Zchat-icon.png', 2147483647, 'rumahku', 'customer', 'cus', 'tomer', '0000-00-00', 0, 0, 1, '2020-12-25 14:00:34', '2020-12-28 14:54:18'),
(9, 'admin', 'admin@gmail.com', '$2b$10$TO8AVdPIQNLz6M5.D5TUhu/yezD4VsjmOqGojITlUrUUtIcj9scum', '', 2147483647, '', 'saya admin', 'saya', 'admin', '0000-00-00', 1, 1, 1, '2020-12-28 15:03:29', '2020-12-28 22:03:29'),
(10, 'admin', 'admin@gmail.com', '$2b$10$RwZspza3MrD2s5CgpG7CcettpwoufysoqktbBOlTd3cSxSJnKLXZa', '2020-12-28T15-07-04.156Zlit-profile-pic.png', 2147483647, '', 'saya admin', 'saya', 'admin', '0000-00-00', 1, 1, 1, '2020-12-28 15:07:04', '2020-12-28 22:07:04');

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
-- Indeks untuk tabel `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`history_id`);

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
  MODIFY `detailhistory_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `history`
--
ALTER TABLE `history`
  MODIFY `history_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `promocode`
--
ALTER TABLE `promocode`
  MODIFY `promocode_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `users1`
--
ALTER TABLE `users1`
  MODIFY `users_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
