-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2019 at 06:32 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.1.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Database: `userauth`
CREATE DATABASE IF NOT EXISTS `userauth`;
USE `userauth`;

-- Table structure for table `app`
CREATE TABLE IF NOT EXISTS `app` (
                                     `id` int(11) NOT NULL,
    `name` text NOT NULL,
    `email` text NOT NULL,
    `date` text NOT NULL,
    `time` varchar(100) NOT NULL,
    `description` text NOT NULL,
    `regtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table `app`
truncate table app;
select * from app;
INSERT INTO `app` (`name`, `email`, `date`, `time`, `description`, `regtime`)
VALUES ('Nikesh Saini', 'testUser@gmail.com', '6/20/2019', '10:00pm', 'Fever', '2019-06-08 12:22:26'),
       ('Nikesh Saini', 'testUser@gmail.com', '6/19/2019', '11:00pm', 'Fever', '2019-06-08 12:22:08'),
       ('Nikesh Saini', 'hello@gmail.com', '6/4/2019', '12:30am', 'Cold', '2019-06-08 13:04:17'),
       ('Nikesh Saini', 'abc@teamcg.com', '6/5/2019', '12:30am', 'Fever', '2019-06-14 11:40:45'),
       ('Nikesh Saini', 'testUser@gmail.com', '7/3/2019', '3:30am', 'Fever', '2019-07-03 08:36:17');


-- Table structure for table `hibernate_sequence`
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
                                                    `next_val` bigint(20) DEFAULT NULL
    ) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table `hibernate_sequence`
INSERT INTO `hibernate_sequence` (`next_val`) VALUES
                                                  (22),
                                                  (22);

-- Table structure for table `user`
CREATE TABLE IF NOT EXISTS `user` (
                                      `id` int(11) NOT NULL,
    `confirmation_token` varchar(255) DEFAULT NULL,
    `username` varchar(255) NOT NULL,
    `enabled` bit(1) DEFAULT NULL,
    `first_name` varchar(255) DEFAULT NULL,
    `gender` varchar(255) DEFAULT NULL,
    `last_name` varchar(255) DEFAULT NULL,
    `password` varchar(255) DEFAULT NULL,
    `authority` varchar(255) DEFAULT NULL,
    `lastseen` varchar(200) DEFAULT NULL
    ) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table `user`
truncate table user;
select * from user;
INSERT INTO `user` (`id`, `confirmation_token`, `username`, `enabled`, `first_name`, `gender`, `last_name`, `password`, `authority`, `lastseen`) VALUES
                                                                                                                                                     (1, '36983cce-975b-4a92-bf73-a4f41978e01c', 'nikesh.yoyo11@gmail.com', b'1', 'Nikesh', 'MALE', 'Saini', 'abc', 'ROLE_ADMIN', 'Thu Aug 22 00:00:56 IST 2024'),
                                                                                                                                                     (2, 'ByAdmin-Panel', 'nikeshsaini@gmail.com', b'1', 'Nikesh', 'Male', 'saini', 'abc', 'ROLE_DOCTOR', 'Fri Jun 14 17:11:47 IST 2024'),
                                                                                                                                                     (4, 'ByAdmin-Panel', 'a.yoyo@gmail.com', b'1', 'Nikesh', 'MALE', 'saini', 'abc', 'ROLE_DOCTOR', 'Wed Jul 03 14:06:52 IST 2024'),
                                                                                                                                                     (6, 'ByAdmin-Panel', 'nikesh.yoyo@gmail.com', b'1', 'Nikesh', 'MALE', 'saini', 'abc', 'ROLE_DOCTOR', 'Wed Aug 21 23:59:07 IST 2024'),
                                                                                                                                                     (7, 'ByAdmin-Panel', 'nikesh.cmp@gmail.com', b'1', 'Mr. Nikesh', 'MALE', 'saini', 'abc', 'ROLE_ADMIN', 'Sat Jun 08 18:25:03 IST 2024'),
                                                                                                                                                     (12, 'a6866ee4-f568-47a9-9a23-2297ec37c293', 'testUser@gmail.com', b'1', 'Nikesh', 'Male', 'Saini', 'abc', 'ROLE_USER', 'Wed Aug 21 23:57:20 IST 2024'),
                                                                                                                                                     (20, 'ByAdmin-Panel', 's@teamcg.com', b'1', 'Sanket', 'Male', 'Sarkar', 'default', 'ROLE_DOCTOR', 'Fri Jun 14 17:14:51 IST 2019');



-- Indexes for dumped tables
-- Indexes for table `app`
ALTER TABLE `app`
    ADD PRIMARY KEY (`id`);

-- Indexes for table `user`
ALTER TABLE `user`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`);

-- AUTO_INCREMENT for dumped tables
-- AUTO_INCREMENT for table `app`
ALTER TABLE `app`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


