-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2024 at 02:25 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `drive`
--

-- --------------------------------------------------------

--
-- Table structure for table `document_tb`
--

CREATE TABLE `document_tb` (
  `doc_id` int(11) NOT NULL,
  `doc_name` varchar(50) NOT NULL,
  `document_img` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_tb`
--

INSERT INTO `document_tb` (`doc_id`, `doc_name`, `document_img`, `user_id`) VALUES
(1, 'id card', 'images (12).jpg', 13);

-- --------------------------------------------------------

--
-- Table structure for table `doc_renewal_request_tb`
--

CREATE TABLE `doc_renewal_request_tb` (
  `req_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `doc_type` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driving_school_tb`
--

CREATE TABLE `driving_school_tb` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone_no` bigint(20) NOT NULL,
  `img` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driving_school_tb`
--

INSERT INTO `driving_school_tb` (`id`, `name`, `address`, `phone_no`, `img`) VALUES
(1, 'system driving school', 'malappuram', 985848444, '212627274.jpeg'),
(2, 'Sanjaari', 'palakkad', 98754411221, '2078966438.jpg'),
(3, 'Sanjaari', 'palakkad', 98754411221, '925567465.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `learners_test_tb`
--

CREATE TABLE `learners_test_tb` (
  `l_test_id` int(11) NOT NULL,
  `totel_question` varchar(50) NOT NULL,
  `score` varchar(50) NOT NULL,
  `correct_ans` varchar(50) NOT NULL,
  `wrong_ans` varchar(50) NOT NULL,
  `completion` varchar(50) NOT NULL,
  `user_id` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `learners_test_tb`
--

INSERT INTO `learners_test_tb` (`l_test_id`, `totel_question`, `score`, `correct_ans`, `wrong_ans`, `completion`, `user_id`) VALUES
(1, '10', '5', '5', '5', '50%', '13');

-- --------------------------------------------------------

--
-- Table structure for table `package_tb`
--

CREATE TABLE `package_tb` (
  `package_id` int(11) NOT NULL,
  `package_name/type` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL,
  `duration` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package_tb`
--

INSERT INTO `package_tb` (`package_id`, `package_name/type`, `price`, `duration`) VALUES
(1, '2 wheeler', '700', '20 days'),
(2, '2_wheeler', '600', '15 days'),
(3, '2__wheeler', '500', '10 days'),
(5, '3 wheeler', '400', '20 days'),
(6, '3_wheeler', '300', '15 days'),
(7, '3__wheeler', '200', '10 days'),
(8, '4 wheeler', '400', '20 days'),
(9, '4_wheeler', '300', '15 days'),
(10, '4__wheeler', '200', '10 days');

-- --------------------------------------------------------

--
-- Table structure for table `session_request_tb`
--

CREATE TABLE `session_request_tb` (
  `session_req_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `session_tb`
--

CREATE TABLE `session_tb` (
  `session_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `tutor_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session_tb`
--

INSERT INTO `session_tb` (`session_id`, `student_id`, `tutor_id`, `date`, `time`, `status`) VALUES
(1, 4, 5, '2023-11-21', '11:40:00', 'pending'),
(2, 4, 5, '2023-11-16', '12:20:00', 'pending'),
(3, 4, 5, '2023-11-21', '12:20:00', 'pending'),
(4, 4, 5, '2023-11-21', '12:20:00', 'pending'),
(5, 4, 5, '2023-11-21', '04:25:00', 'pending'),
(6, 4, 5, '2023-11-15', '12:30:00', 'pending'),
(7, 13, 2, '2023-11-15', '12:45:00', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `student_tb`
--

CREATE TABLE `student_tb` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `license_type` varchar(50) NOT NULL,
  `package_id` int(11) NOT NULL,
  `trainer_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `package_completed` geometry NOT NULL,
  `driving_school_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_tb`
--

CREATE TABLE `user_tb` (
  `user_id` int(11) NOT NULL,
  `role` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` bigint(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `joineddate` varchar(50) NOT NULL,
  `selected_veh` varchar(50) NOT NULL,
  `img` text NOT NULL DEFAULT 'unavailable',
  `generated_id` varchar(50) NOT NULL,
  `driving_school_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_tb`
--

INSERT INTO `user_tb` (`user_id`, `role`, `name`, `age`, `sex`, `email`, `phone`, `address`, `joineddate`, `selected_veh`, `img`, `generated_id`, `driving_school_id`, `admin_id`) VALUES
(1, 'Admin', 'favas', 0, '', 'favas@gmail.com', 0, '', '', '', 'unavailable', 'Adm1234', 0, 0),
(2, 'Admin', 'ramsiya', 0, '', 'ramsiya@gmail.com', 0, '', '', '', 'unavailable', 'Adm2468', 0, 0),
(4, 'student', 'saleel', 22, 'Male', 'saleel@gmail.com', 8212434949, 'Palakkad ', '2023-11-07', '4 wheeler', 'unavailable', 'St6064', 0, 1),
(5, 'Tutor', 'shivajith ', 20, 'Male', 'shivajith@gmail.com', 8461964649, 'Malappuram ', '2023-11-06', '3 wheeler', 'IMG20231125115021.jpg', 'Tut3835', 0, 1),
(6, 'student', 'anand', 28, 'Male', 'anand@gmail.com', 9786464811, 'Bombay ', '2023-11-02', '4_wheeler', 'unavailable', 'St5069', 0, 2),
(7, 'Tutor', 'Neeraj ', 23, 'Male', 'neeraj@gamil.com', 6164948848, 'manjeri ', '2023-11-01', '3_wheeler', 'images (8).jpg', 'Tut7276', 0, 2),
(8, 'student', 'ramsi', 23, 'Female', 'ramsi@gmail.com', 9701064691, 'Kozhikode ', '2023-11-02', '2 whealer', 'IMG-20231115-WA0002.jpg', 'St5173', 0, 1),
(11, 'student', 'lulu', 25, 'Female', 'lulu@gmail.com', 9167649494, 'Malappuram ', '2023-11-14', '2 whealer', 'IMG-20231115-WA0002.jpg', 'St3672', 0, 1),
(12, 'Tutor', 'nihara krishna ', 23, 'Female', 'nihara@gmail.com', 9784654884, 'Kozhikode ', '2023-11-16', '2 whealer', 'images (9).jpg', 'Tut4196', 0, 1),
(13, 'student', 'Krishna', 22, 'Female', 'krishna@gmail.com', 6919198184, 'kakkodi', '2023-11-18', '4__wheeler', 'IMG-20231018-WA0237.jpg', 'St8505', 0, 1),
(15, 'student', 'neeraj', 24, 'Male', 'neeraj@gamil.com', 987654321, 'manjeri', '2023-11-18', '3__wheeler', 'IMG_20220406_150850.jpg', 'St3187', 0, 1),
(17, 'Tutor', 'saleel', 23, 'Male', 'salee@gmail.com', 9087645213, 'Palakkad ', '2023-11-15', '3 whealer', 'IMG-20231115-WA0002.jpg', 'Tut4662', 0, 1),
(18, 'Tutor', 'nihara', 23, 'Female', 'kakkodi@gmail.com', 9643734581, 'kakkodi ', '2023-11-23', '3 whealer', 'images (9).jpg', 'Tut3752', 0, 1),
(21, 'Admin', 'saleel', 0, '', 'mhdsaleel@gmail.com', 0, '', '', '', 'unavailable', 'Adm6663', 0, 0),
(22, 'Admin', 'krishna', 0, '', 'krishna@gmail.com', 0, '', '', '', 'unavailable', 'Adm9422', 0, 0),
(23, 'Admin', 'neeraj', 0, '', 'nj@gmail.com', 0, '', '', '', 'unavailable', 'Adm5141', 0, 0),
(24, 'Admin', 'nihara', 0, '', 'nihara@gmail.com', 0, '', '', '', 'unavailable', 'Adm9220', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_tb`
--

CREATE TABLE `vehicle_tb` (
  `vehicle_id` int(11) NOT NULL,
  `make` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `img` text NOT NULL,
  `vehicle_type` varchar(100) NOT NULL,
  `year` varchar(100) NOT NULL,
  `license_plate` varchar(100) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicle_tb`
--

INSERT INTO `vehicle_tb` (`vehicle_id`, `make`, `model`, `img`, `vehicle_type`, `year`, `license_plate`, `admin_id`) VALUES
(1, 'alto', '800', 'images (1).jpg', '4 Whealer', '2019', 'kl123345', 2),
(2, 'i20', 'asta', 'images.jpg', '4 Whealer', '2016', 'kl126262', 2),
(11, 'duke', '390', 'images (3).jpg', '2 Whealer', '2018', 'kl1233737', 1),
(12, 'jeep', '120', 'images (7).jpg', '4 Whealer', '2019', 'kl12267262', 1),
(13, 'jeeep', '1111', 'images (8).jpg', '4 Whealer', '2020', 'kl1223', 1),
(17, 'bikee', '220', 'images (4).jpg', '2__wheeler', '2022', 'kl51613', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `document_tb`
--
ALTER TABLE `document_tb`
  ADD PRIMARY KEY (`doc_id`);

--
-- Indexes for table `doc_renewal_request_tb`
--
ALTER TABLE `doc_renewal_request_tb`
  ADD PRIMARY KEY (`req_id`);

--
-- Indexes for table `driving_school_tb`
--
ALTER TABLE `driving_school_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `learners_test_tb`
--
ALTER TABLE `learners_test_tb`
  ADD PRIMARY KEY (`l_test_id`);

--
-- Indexes for table `package_tb`
--
ALTER TABLE `package_tb`
  ADD PRIMARY KEY (`package_id`);

--
-- Indexes for table `session_request_tb`
--
ALTER TABLE `session_request_tb`
  ADD PRIMARY KEY (`session_req_id`);

--
-- Indexes for table `session_tb`
--
ALTER TABLE `session_tb`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `student_tb`
--
ALTER TABLE `student_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_tb`
--
ALTER TABLE `user_tb`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `vehicle_tb`
--
ALTER TABLE `vehicle_tb`
  ADD PRIMARY KEY (`vehicle_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `document_tb`
--
ALTER TABLE `document_tb`
  MODIFY `doc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doc_renewal_request_tb`
--
ALTER TABLE `doc_renewal_request_tb`
  MODIFY `req_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driving_school_tb`
--
ALTER TABLE `driving_school_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `learners_test_tb`
--
ALTER TABLE `learners_test_tb`
  MODIFY `l_test_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `package_tb`
--
ALTER TABLE `package_tb`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `session_request_tb`
--
ALTER TABLE `session_request_tb`
  MODIFY `session_req_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `session_tb`
--
ALTER TABLE `session_tb`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `student_tb`
--
ALTER TABLE `student_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_tb`
--
ALTER TABLE `user_tb`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `vehicle_tb`
--
ALTER TABLE `vehicle_tb`
  MODIFY `vehicle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
