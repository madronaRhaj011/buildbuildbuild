-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2024 at 11:34 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buildvis`
--

-- --------------------------------------------------------

--
-- Table structure for table `billingdetail`
--

CREATE TABLE `billingdetail` (
  `billing_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `middleName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `totalPrice` double(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `totalPrice` double(20,2) NOT NULL,
  `orderDate` date DEFAULT current_timestamp(),
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetail`
--

INSERT INTO `orderdetail` (`order_id`, `user_id`, `product_id`, `quantity`, `totalPrice`, `orderDate`, `status`) VALUES
(1, 4, 2, 0, 0.00, '2024-11-02', 'To Pay');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `price`, `description`, `stock`, `image_url`) VALUES
(1, 'Hollow Block', 10.00, 'Used for creating walls, cheap and durable if reinforced properly with cement.', 100000, '..//hollowblock.jpg'),
(2, 'Cement', 300.00, 'Cement is the key ingredient that binds together the building blocks of modern construction. ', 1000, '..//cement.jpg'),
(3, 'Good Lumber', 362.00, 'a wood used for building a house or anything that you like as long as applicable of course', 500, '..//goodlumber.jpg'),
(4, 'Rebar steel', 200.00, 'used for reinforcing beams in construction of the houses', 500, '..//rebar.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`) VALUES
(2, 'Ivan Fababaer', 'ivanfababaer018@gmail.com', '$2a$10$xnZnHd7SmpaHqWHO7oV32OS8sY/.pXizP6Ful5FZ36Awkj2Vk45..', ''),
(3, 'Harlyn Nebreja', 'harlyn@gmail.com', '$2a$10$OW7V4RX6RPcIAI92lDwfNOO7saYTBhIbHSPq/HkVHZLRcN5gmQ4ge', ''),
(4, 'rhaj', 'rhaj@gmail.com', '$2a$10$JbCkhNEfPfB.eV/.LyI3A.RyOVQaJREESHLEA9iQWur0/IiY93eLO', ''),
(5, 'grege', 'greg@gmail.com', '$2b$10$A9/h7lU04XTqPZnWEv8KEOZJX/sCANYvQLEY6MC0nPD5WhErnSQj2', ''),
(6, 'jack', 'jack@gmail.com', '$2b$10$wH5wUWOd77/mHi.fvEqfpeX/bmq4Nq4eg.Cmz0mqwboufnTDv6RGy', ''),
(7, 'may', 'may@gmail.com', '$2b$10$532RadvwbS8Mn5oUX7FMAOyQULK61XYs/4v2eOVdxw8kZ56zSiTNu', ''),
(8, 'rhaj', 'rhaaj@gmail.com', '$2b$10$3Zp6yOc3hwM12W8JRNaYFuKwCacwZ9gvIp0TsX1h32LWe/q6Pl78K', ''),
(9, 'dako', 'dako@gmail.com', '$2b$10$yhGkx.WBQmxMcisQXOQS5.bezoj2VUr8QI6jm/rxy1zh01SuTqXEG', ''),
(13, 'patrick', 'daiskekambe.22@gmail.com', '$2b$10$Afgl7ZrgW95O1lqweFKSxecIJhpZWOL9SaXShsp4REtLHO/VPRcXW', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billingdetail`
--
ALTER TABLE `billingdetail`
  ADD PRIMARY KEY (`billing_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billingdetail`
--
ALTER TABLE `billingdetail`
  ADD CONSTRAINT `billingdetail_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
