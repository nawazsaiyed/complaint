-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2018 at 11:39 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `complaint`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `a_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(14) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`a_id`, `name`, `email`, `password`) VALUES
(1, 'Admin', 'admin@admin.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cate_id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cate_id`, `category`) VALUES
(1, 'Electrical'),
(2, 'Civil'),
(3, 'Plumbaring'),
(4, 'Carpenter'),
(5, 'Drainage');

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `co_id` int(11) NOT NULL,
  `cate_id` int(11) DEFAULT NULL,
  `c_level` int(1) DEFAULT NULL,
  `description` longtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`co_id`, `cate_id`, `c_level`, `description`) VALUES
(1, 1, 1, 'Fan Not Working'),
(2, 1, 1, 'Tube Light Not Working'),
(8, 1, 1, 'Shot circuit.'),
(7, 1, 1, 'Power Cut'),
(9, 1, 2, 'Switch Board'),
(10, 1, 2, 'Fan Regulator'),
(11, 3, 1, 'Water Leakage'),
(12, 3, 1, 'Tap Leakage'),
(13, 3, 1, 'Pipe Leakage'),
(14, 4, 2, 'Door Break'),
(15, 3, 2, 'Window Break'),
(16, 4, 2, 'Door Stopper'),
(17, 5, 1, 'Cleaning');

-- --------------------------------------------------------

--
-- Table structure for table `complaint_location`
--

CREATE TABLE `complaint_location` (
  `loc_id` int(11) NOT NULL,
  `c_id` varchar(20) NOT NULL,
  `location` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint_location`
--

INSERT INTO `complaint_location` (`loc_id`, `c_id`, `location`) VALUES
(1, '20180531-103-0001', 'Post Graduation Boys Hostel,\r\nRoom no 42.'),
(2, '20180531-103-0002', 'Social Work, Room No 3'),
(3, '20180531-101-0003', 'Computer Science Office No 3'),
(4, '20180531-101-0004', 'Computer Science Bathroom no 1'),
(5, '20180531-101-0005', 'Apartment D,\r\nBuilding No 5,\r\nRoom No 1'),
(6, '20180531-101-0006', 'Apartment D,\r\nBuilding No 5,\r\nRoom No 1'),
(7, '20180531-102-0007', 'Computer Science Office No 1'),
(8, '20180531-102-0008', 'Appartment A,\r\nBuilding No 2,\r\nRoom No 1.'),
(9, '20180531-102-0009', 'Computer Science Office No 1'),
(10, '20180531-103-0010', 'Post Graduation Boys Hostel,\r\nRoom no 42.');

-- --------------------------------------------------------

--
-- Table structure for table `complaint_register`
--

CREATE TABLE `complaint_register` (
  `c_id` varchar(20) NOT NULL,
  `cate_id` int(11) NOT NULL,
  `u_id` varchar(10) NOT NULL,
  `c_description` longtext NOT NULL,
  `c_date` date NOT NULL DEFAULT '1996-05-02',
  `s_date` date DEFAULT NULL,
  `c_status` varchar(20) DEFAULT NULL,
  `solution_duration` int(11) DEFAULT NULL,
  `w_id` int(11) DEFAULT NULL,
  `f_date` date DEFAULT NULL,
  `satisfaction_level` int(1) DEFAULT NULL,
  `f_status` tinyint(1) NOT NULL,
  `f_available` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint_register`
--

INSERT INTO `complaint_register` (`c_id`, `cate_id`, `u_id`, `c_description`, `c_date`, `s_date`, `c_status`, `solution_duration`, `w_id`, `f_date`, `satisfaction_level`, `f_status`, `f_available`) VALUES
('20180531-103-0001', 1, '11708103', 'Fan Not Working', '2018-05-12', NULL, 'Pending', NULL, 1, NULL, NULL, 0, 0),
('20180531-103-0002', 1, '11708103', 'Tube Light Not Working', '2018-05-17', NULL, 'Under Construction', NULL, 1, NULL, NULL, 0, 0),
('20180531-101-0003', 1, '101', 'Tube Light Not Working', '2018-05-31', NULL, 'Under Construction', NULL, 1, '2018-05-31', 2, 1, 0),
('20180531-101-0004', 3, '101', 'Pipe Leakage', '2018-05-31', '2018-05-31', 'Complete', NULL, 2, '2018-05-31', 3, 1, 0),
('20180531-101-0005', 1, '101', 'Fan Not Working', '2018-05-31', '2018-05-31', 'Complete', NULL, 1, '2018-05-31', 2, 1, 0),
('20180531-101-0006', 1, '101', 'Tube Light Not Working', '2018-05-31', NULL, 'Under Construction', NULL, 1, '2018-05-31', 1, 1, 0),
('20180531-102-0007', 3, '102', 'Pipe Leakage', '2018-05-31', '2018-05-31', 'Complete', NULL, 2, '2018-05-31', 1, 1, 0),
('20180531-102-0008', 1, '102', 'Fan Not Working', '2018-05-31', '2018-05-31', 'Complete', NULL, 1, '2018-05-31', 2, 1, 0),
('20180531-102-0009', 1, '102', 'Tube Light Not Working', '2018-05-31', '2018-05-31', 'Complete', NULL, 1, '2018-05-31', 3, 1, 0),
('20180531-103-0010', 1, '11708103', 'Power Cut', '2018-05-31', NULL, 'Pending', NULL, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `deptmst`
--

CREATE TABLE `deptmst` (
  `deptid` int(11) NOT NULL,
  `Dept_Name` varchar(100) NOT NULL,
  `HOD` varchar(50) NOT NULL,
  `Pho_No` varchar(20) NOT NULL,
  `Email` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deptmst`
--

INSERT INTO `deptmst` (`deptid`, `Dept_Name`, `HOD`, `Pho_No`, `Email`) VALUES
(1, 'Computer Science', 'Ajaybhai Parikh', '9874563210', 'csdept.gvp@gujaratvidyapith.org'),
(3, 'Social Work', 'xyz', '9685632142', 'sw.gvp@gujratvidyapith.org');

-- --------------------------------------------------------

--
-- Table structure for table `studmst`
--

CREATE TABLE `studmst` (
  `Stud_ID` varchar(10) NOT NULL,
  `Pwd` varchar(20) NOT NULL,
  `Stud_Name` varchar(200) NOT NULL,
  `stud_name_eng` varchar(200) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Add_Yr` varchar(40) NOT NULL,
  `Mo` varchar(15) NOT NULL,
  `bdate` date NOT NULL,
  `Dept_Name` varchar(200) NOT NULL,
  `Pro_Name` varchar(20) NOT NULL,
  `Loc_Add` varchar(200) NOT NULL,
  `Per_Add` varchar(200) NOT NULL,
  `Caste` varchar(20) NOT NULL,
  `Gender` varchar(20) NOT NULL,
  `Grad_Yr` varchar(30) NOT NULL,
  `Univ_Name` varchar(150) NOT NULL,
  `Campus` varchar(20) NOT NULL,
  `user_type` enum('student','department','','') NOT NULL,
  `curr_sem` int(2) NOT NULL,
  `Repeat_sem` varchar(15) NOT NULL,
  `activated` tinyint(1) NOT NULL,
  `studImage` blob
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studmst`
--

INSERT INTO `studmst` (`Stud_ID`, `Pwd`, `Stud_Name`, `stud_name_eng`, `Email`, `Add_Yr`, `Mo`, `bdate`, `Dept_Name`, `Pro_Name`, `Loc_Add`, `Per_Add`, `Caste`, `Gender`, `Grad_Yr`, `Univ_Name`, `Campus`, `user_type`, `curr_sem`, `Repeat_sem`, `activated`, `studImage`) VALUES
('11708118', 'abcd', 'Mehul n zala', 'Mehul n zala', 'mehul@gmail.com', '', '975258745', '0000-00-00', '', '', '', '', '', '', '', '', '', 'student', 0, '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `u_id` varchar(10) NOT NULL,
  `full_name` varchar(60) NOT NULL,
  `emp_no` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  `pho_no` varchar(13) NOT NULL,
  `address` longtext NOT NULL,
  `u_type` varchar(10) NOT NULL,
  `gender` char(1) NOT NULL,
  `password` varchar(14) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`u_id`, `full_name`, `emp_no`, `email`, `pho_no`, `address`, `u_type`, `gender`, `password`) VALUES
('101', 'Shahnavaz Saiyad', '101', 'ssaiyed173@gmail.com', '9726321433', 'Apartment D,\r\nBuilding No 5,\r\nRoom No 1', 'employee', 'M', 'Vf2fh2nt7'),
('102', 'Mehul Zala', '102', 'mehul@gmail.com', '9632587410', 'Appartment A,\r\nBuilding No 2,\r\nRoom No 1.', 'employee', 'M', 'mehulzala'),
('11708103', 'Urvesh Gayakwad', '11708103', 'uv@gmail.com', '9658745632', 'Post Graduation Boys Hostel,\r\nRoom no 42.', 'student', 'M', 'Urvesh'),
('11708120', 'parmar surbhi j', '11708120', 'parmarsurbhi@gmail.com', '9099609852', 'kanya chatralaya room no:47', 'student', 'F', 'subh123');

-- --------------------------------------------------------

--
-- Table structure for table `user_dept`
--

CREATE TABLE `user_dept` (
  `u_id` varchar(11) NOT NULL,
  `deptid` int(11) NOT NULL,
  `office_location` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_dept`
--

INSERT INTO `user_dept` (`u_id`, `deptid`, `office_location`) VALUES
('101', 1, 'Computer Science Office No 3'),
('102', 1, 'Computer Science Office No 1'),
('11708103', 3, 'Social Work'),
('11708120', 1, 'Computer Science');

-- --------------------------------------------------------

--
-- Table structure for table `worker`
--

CREATE TABLE `worker` (
  `w_id` int(11) NOT NULL,
  `w_name` varchar(60) NOT NULL,
  `ph_no` varchar(13) NOT NULL,
  `email` varchar(40) NOT NULL,
  `address` varchar(100) NOT NULL,
  `skill` int(11) NOT NULL,
  `w_status` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `worker`
--

INSERT INTO `worker` (`w_id`, `w_name`, `ph_no`, `email`, `address`, `skill`, `w_status`) VALUES
(1, 'Ramesh', '9657452365', 'ramesh@gmail.com', '110,Usmanpura Ahmedabad,\nAhmedabad- 380014', 1, 'Active'),
(2, 'Suresh', '9657452366', 'suresh@gmail.com', '92,Incometax Ahmedabad,\nAhmedabad- 380014', 3, 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`a_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cate_id`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`co_id`),
  ADD KEY `cate_id` (`cate_id`);

--
-- Indexes for table `complaint_location`
--
ALTER TABLE `complaint_location`
  ADD PRIMARY KEY (`loc_id`,`c_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `complaint_register`
--
ALTER TABLE `complaint_register`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `ct_id` (`cate_id`),
  ADD KEY `u_id` (`u_id`),
  ADD KEY `w_id` (`w_id`);

--
-- Indexes for table `deptmst`
--
ALTER TABLE `deptmst`
  ADD PRIMARY KEY (`deptid`),
  ADD UNIQUE KEY `Dept_Name` (`Dept_Name`);

--
-- Indexes for table `studmst`
--
ALTER TABLE `studmst`
  ADD PRIMARY KEY (`Stud_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_id`),
  ADD UNIQUE KEY `email` (`email`,`pho_no`);

--
-- Indexes for table `user_dept`
--
ALTER TABLE `user_dept`
  ADD PRIMARY KEY (`u_id`,`deptid`),
  ADD KEY `deptid` (`deptid`);

--
-- Indexes for table `worker`
--
ALTER TABLE `worker`
  ADD PRIMARY KEY (`w_id`),
  ADD UNIQUE KEY `ph_no` (`ph_no`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `co_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `complaint_location`
--
ALTER TABLE `complaint_location`
  MODIFY `loc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `deptmst`
--
ALTER TABLE `deptmst`
  MODIFY `deptid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `worker`
--
ALTER TABLE `worker`
  MODIFY `w_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
