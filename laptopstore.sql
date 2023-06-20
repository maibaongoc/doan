-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 20, 2023 at 06:44 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laptopstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Laptops'),
(2, 'Smart phone'),
(3, 'Cameras'),
(4, 'Accessories');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `category_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `image`, `name`, `price`, `category_id`, `user_id`) VALUES
(46, '237c2a86-9c5a-4231-bb60-da9cb8714f86.png', 'Samsung 1', 4000000, 2, NULL),
(47, '864fd7fc-9a87-4327-b71f-3384e7879a67.png', 'Samsung 2', 1000000, 2, NULL),
(48, '6072b763-1121-4786-9e99-3e7dc97e0fdc.png', 'Laptop 1', 60000, 1, NULL),
(49, 'e50bf283-e0b2-460d-86b0-0c539513fa99.png', 'Laptop 2', 90000, 1, NULL),
(50, '6e819e9b-afb6-46b9-9d94-612f9a1f4811.png', 'Phụ kiện 1', 400000, 4, NULL),
(51, 'fe957b40-31bc-455b-a7a7-eca9526c2ab7.png', 'Phụ kiện 2', 100000, 4, NULL),
(52, 'bf4db843-f460-4fde-ab98-0627de6ba1eb.png', 'Camera 1', 15000000, 3, NULL),
(53, '10a73ed7-e042-40f7-88ac-931d375b37ed.png', 'Camera 2', 600000, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `description`, `name`) VALUES
(1, 'USER', 'USER'),
(2, 'ADMIN', 'ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `password`, `username`) VALUES
(1, 'mbn@gmail.com', 'Ngoc', '$2a$10$RsKXabOzWPH9IjgO9VyySeJSUeGi/ffN9TJ1TX6YUyb3JmG.X1l/2', 'maibaongoc'),
(2, 'mbn0@gmail.com', 'ngocc', '$2a$10$jJkD7BLE1surm32Tj84/u.0vtotOZTO0HaK8OuAqg1pTpnuZKllhW', 'ngoc');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(2, 1),
(2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  ADD KEY `FK979liw4xk18ncpl87u4tygx2u` (`user_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK979liw4xk18ncpl87u4tygx2u` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
