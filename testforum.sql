-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2017 at 08:16 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testforum`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Web Design'),
(2, 'Web Coding'),
(3, 'Website Marketing'),
(4, 'test category');

-- --------------------------------------------------------

--
-- Table structure for table `forums`
--

CREATE TABLE `forums` (
  `id` tinyint(4) NOT NULL,
  `opener` varchar(200) DEFAULT NULL,
  `cat_id` tinyint(4) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forums`
--

INSERT INTO `forums` (`id`, `opener`, `cat_id`, `name`, `description`) VALUES
(1, NULL, 2, 'CSS, XHTML/HTML & JavaScript ', 'Discussions about stylesheets design, xhtml design'),
(2, NULL, 2, 'Server Side ASP.NET, PHP, Data', 'Server-Side development including: XML, PHP, ASP, Databases'),
(4, NULL, 1, 'Website Design and Layout', 'Structure, Layout, Design'),
(5, NULL, 1, 'Photography and Stock Images', 'Help and advice with Photography and Stock Imagery Resources'),
(6, NULL, 2, 'x', 'x'),
(8, NULL, 4, 'test forum ', 'test forum description'),
(9, NULL, 4, 'test forum 2', 'testdescription '),
(10, '17', 4, 'x', 'x'),
(11, '3', 4, 'admin adding ', 'admin adding');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` tinyint(4) NOT NULL,
  `date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `date`, `user_id`, `topic_id`, `subject`, `body`) VALUES
(1, '2015-01-22 14:50:01', 17, 30, 'test topic', 'test topic description'),
(2, '2017-03-31 02:36:20', 29, 31, 'Monkeys', 'Howsit howsit we got this on lockk hit me up and stuff'),
(3, '2017-03-31 02:37:34', 29, 31, 'test', 'Awesome ness ess just looking for the work flow dont mind me');

-- --------------------------------------------------------

--
-- Table structure for table `pm`
--

CREATE TABLE `pm` (
  `systemid` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `id2` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `user1` bigint(20) NOT NULL,
  `user2` bigint(20) NOT NULL,
  `message` text NOT NULL,
  `timestamp` int(10) NOT NULL,
  `user1read` varchar(3) NOT NULL,
  `user2read` varchar(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` int(4) NOT NULL,
  `date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `forum_id` tinyint(4) NOT NULL,
  `subject` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `date`, `user_id`, `forum_id`, `subject`) VALUES
(30, '2015-01-22 14:50:01', 17, 8, 'test topic'),
(31, '2017-03-31 02:36:20', 29, 6, 'Monkeys');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(250) NOT NULL,
  `email` varchar(100) NOT NULL,
  `registration_date` datetime NOT NULL,
  `verifystring` varchar(20) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `usertype` tinyint(4) NOT NULL,
  `img` varchar(200) DEFAULT 'default.jpg',
  `rest_code` int(200) NOT NULL,
  `ban` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `registration_date`, `verifystring`, `active`, `usertype`, `img`, `rest_code`, `ban`) VALUES
(3, 'admin', 'e6820e1fc65a8bab20aa044a4c8f40102373b7e6', '', '0000-00-00 00:00:00', '', 1, 1, 'admin.jpg', 0, 0),
(17, 'miletest', 'e6820e1fc65a8bab20aa044a4c8f40102373b7e6', 'milestojkovski@gmail.com', '2015-01-22 02:05:07', '<Yy)1NiLpU[^y]A)', 1, 0, 'miletest.jpg', 443, 0),
(28, 'test', 'e6820e1fc65a8bab20aa044a4c8f40102373b7e6', 'ms19780@seeu.edu.mk', '2015-01-22 14:04:26', '*pxCRN&GR!p&Oa^]', 1, 0, 'default.jpg', 0, 0),
(29, 'Jaeger', '5b96672ae7709eab297550cae362d5bee468c57d', 'boroma@mail.com', '2017-03-31 02:20:51', '7410', 1, 0, 'default.jpg', 0, 0),
(30, 'test_1', '5b96672ae7709eab297550cae362d5bee468c57d', 'boroma@mail2.com', '2017-03-31 02:29:13', '42853', 1, 0, 'default.jpg', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forums`
--
ALTER TABLE `forums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pm`
--
ALTER TABLE `pm`
  ADD PRIMARY KEY (`systemid`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forum_id` (`forum_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `forums`
--
ALTER TABLE `forums`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pm`
--
ALTER TABLE `pm`
  MODIFY `systemid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `forums`
--
ALTER TABLE `forums`
  ADD CONSTRAINT `forums_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userid` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `topics_ibfk_1` FOREIGN KEY (`forum_id`) REFERENCES `forums` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
