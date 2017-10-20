-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2017 at 05:36 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edbms`
--

-- --------------------------------------------------------

--
-- Table structure for table `charge`
--

CREATE TABLE `charge` (
  `BASE_CHARGE` int(20) NOT NULL,
  `SERVICE_CHARGE` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `charge`
--

INSERT INTO `charge` (`BASE_CHARGE`, `SERVICE_CHARGE`) VALUES
(400, 40),
(500, 50),
(600, 60),
(650, 65);

-- --------------------------------------------------------

--
-- Table structure for table `company_branch`
--

CREATE TABLE `company_branch` (
  `Company_ID` int(20) NOT NULL,
  `Branch_num` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_branch`
--

INSERT INTO `company_branch` (`Company_ID`, `Branch_num`) VALUES
(100001, 10000101),
(100001, 10000102),
(100001, 10000103),
(100001, 10000104),
(100001, 10000105);

-- --------------------------------------------------------

--
-- Table structure for table `consumes`
--

CREATE TABLE `consumes` (
  `REGION_ID` int(20) NOT NULL,
  `BILL_ID` int(20) NOT NULL,
  `C_AADHAR_NUM` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consumes`
--

INSERT INTO `consumes` (`REGION_ID`, `BILL_ID`, `C_AADHAR_NUM`) VALUES
(1, 101, 111101),
(2, 102, 111102),
(3, 103, 111103),
(4, 104, 111104),
(5, 105, 111105);

-- --------------------------------------------------------

--
-- Table structure for table `consumption_record`
--

CREATE TABLE `consumption_record` (
  `BILL_ID` int(20) NOT NULL,
  `UNIT` int(20) NOT NULL,
  `MONTH` varchar(10) NOT NULL,
  `NON_PAID` varchar(5) NOT NULL,
  `PAID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consumption_record`
--

INSERT INTO `consumption_record` (`BILL_ID`, `UNIT`, `MONTH`, `NON_PAID`, `PAID`) VALUES
(101, 3000, 'oct', '', 'paid'),
(102, 5000, 'oct', 'npaid', ''),
(103, 3600, 'oct', 'npaid', ''),
(104, 6000, 'oct', '', 'paid'),
(105, 8000, 'oct', 'npaid', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_bill`
--

CREATE TABLE `customer_bill` (
  `CUST_AADHAR_NUMBER` int(20) NOT NULL,
  `B_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_bill`
--

INSERT INTO `customer_bill` (`CUST_AADHAR_NUMBER`, `B_id`) VALUES
(111101, 101),
(111102, 102),
(111103, 103),
(111104, 104),
(111105, 105);

-- --------------------------------------------------------

--
-- Table structure for table `customer_region`
--

CREATE TABLE `customer_region` (
  `C_AADHAR_NUMBER` int(20) NOT NULL,
  `REGION_ID` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_region`
--

INSERT INTO `customer_region` (`C_AADHAR_NUMBER`, `REGION_ID`) VALUES
(111101, 1),
(111102, 2),
(111103, 3),
(111104, 4),
(111105, 5);

-- --------------------------------------------------------

--
-- Table structure for table `electricity_consumer`
--

CREATE TABLE `electricity_consumer` (
  `Cp_id` int(10) NOT NULL,
  `Consumer_Fname` varchar(10) NOT NULL,
  `Consumer_Mname` varchar(10) NOT NULL,
  `Consumer_Lname` varchar(10) NOT NULL,
  `Aadhar_Number` int(10) NOT NULL,
  `Address` varchar(20) NOT NULL,
  `Age` int(5) NOT NULL,
  `meter_number` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `electricity_consumer`
--

INSERT INTO `electricity_consumer` (`Cp_id`, `Consumer_Fname`, `Consumer_Mname`, `Consumer_Lname`, `Aadhar_Number`, `Address`, `Age`, `meter_number`) VALUES
(100001, 'Ekansh', '', 'Gayakwad', 111101, 'cust_address1', 20, 11101),
(100001, 'prateek', 'singh', 'ranjan', 111102, 'cust_address2', 20, 11102),
(100002, 'saurav', 'kumar', 'bhagat', 111103, 'cust_address3', 19, 11103),
(100003, 'srishti', '', 'gupta', 111104, 'cust_address4', 19, 11104),
(100004, 'swetabh', '', 'dixit', 111105, 'cust_adress5', 20, 11105);

-- --------------------------------------------------------

--
-- Table structure for table `electricity_consumer_type`
--

CREATE TABLE `electricity_consumer_type` (
  `TYPE` varchar(10) NOT NULL,
  `METER_NUMBER` int(20) NOT NULL,
  `SANCTIONED_LOAD` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `electricity_consumer_type`
--

INSERT INTO `electricity_consumer_type` (`TYPE`, `METER_NUMBER`, `SANCTIONED_LOAD`) VALUES
('type1', 11101, 10000),
('type2', 11102, 20000),
('type1', 11103, 10000),
('type3', 11104, 30000),
('type2', 11105, 20000);

-- --------------------------------------------------------

--
-- Table structure for table `electricity_supply_branches`
--

CREATE TABLE `electricity_supply_branches` (
  `BRANCH_NUM` int(20) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `ADDRESS` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `electricity_supply_branches`
--

INSERT INTO `electricity_supply_branches` (`BRANCH_NUM`, `NAME`, `ADDRESS`) VALUES
(10000101, 'com1br1', 'address11'),
(10000102, 'com1br2', 'address12'),
(10000103, 'com1br3', 'address13'),
(10000104, 'com1br4', 'address14'),
(10000105, 'com1br5', 'address15');

-- --------------------------------------------------------

--
-- Table structure for table `electricity_supply_company`
--

CREATE TABLE `electricity_supply_company` (
  `COMPANY_ID` int(10) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `ADDRESS` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `electricity_supply_company`
--

INSERT INTO `electricity_supply_company` (`COMPANY_ID`, `NAME`, `ADDRESS`) VALUES
(100001, 'company1', 'address 1'),
(100002, 'company2', 'address2'),
(100003, 'company3', 'address3'),
(100004, 'company4', 'address4'),
(100005, 'company5', 'address5');

-- --------------------------------------------------------

--
-- Table structure for table `rate`
--

CREATE TABLE `rate` (
  `BILL_ID` int(20) NOT NULL,
  `BASE_CHARGE` int(20) NOT NULL,
  `ADDITIONAL_CHARGES` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rate`
--

INSERT INTO `rate` (`BILL_ID`, `BASE_CHARGE`, `ADDITIONAL_CHARGES`) VALUES
(101, 500, 30),
(102, 600, 20),
(103, 400, 90),
(104, 650, 45),
(105, 750, 65);

-- --------------------------------------------------------

--
-- Table structure for table `region_located`
--

CREATE TABLE `region_located` (
  `REGION_ID` int(20) NOT NULL,
  `REGION_NAME` varchar(20) NOT NULL,
  `POSTAL_CODE` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `region_located`
--

INSERT INTO `region_located` (`REGION_ID`, `REGION_NAME`, `POSTAL_CODE`) VALUES
(1, 'region1', 1101),
(2, 'region2', 1102),
(3, 'region3', 1103),
(4, 'region4', 1104),
(5, 'region5', 1105);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `charge`
--
ALTER TABLE `charge`
  ADD PRIMARY KEY (`BASE_CHARGE`);

--
-- Indexes for table `company_branch`
--
ALTER TABLE `company_branch`
  ADD PRIMARY KEY (`Company_ID`,`Branch_num`),
  ADD UNIQUE KEY `Branch_num` (`Branch_num`);

--
-- Indexes for table `consumes`
--
ALTER TABLE `consumes`
  ADD PRIMARY KEY (`REGION_ID`,`BILL_ID`,`C_AADHAR_NUM`),
  ADD KEY `BILL_ID` (`BILL_ID`),
  ADD KEY `C_AADHAR_NUM` (`C_AADHAR_NUM`);

--
-- Indexes for table `consumption_record`
--
ALTER TABLE `consumption_record`
  ADD PRIMARY KEY (`BILL_ID`);

--
-- Indexes for table `customer_bill`
--
ALTER TABLE `customer_bill`
  ADD PRIMARY KEY (`CUST_AADHAR_NUMBER`,`B_id`),
  ADD UNIQUE KEY `B_id` (`B_id`);

--
-- Indexes for table `customer_region`
--
ALTER TABLE `customer_region`
  ADD PRIMARY KEY (`REGION_ID`,`C_AADHAR_NUMBER`),
  ADD UNIQUE KEY `REGION_ID` (`REGION_ID`),
  ADD KEY `C_AADHAR_NUMBER` (`C_AADHAR_NUMBER`);

--
-- Indexes for table `electricity_consumer`
--
ALTER TABLE `electricity_consumer`
  ADD PRIMARY KEY (`Aadhar_Number`),
  ADD UNIQUE KEY `meter_number` (`meter_number`),
  ADD KEY `Cp_id` (`Cp_id`);

--
-- Indexes for table `electricity_consumer_type`
--
ALTER TABLE `electricity_consumer_type`
  ADD PRIMARY KEY (`METER_NUMBER`);

--
-- Indexes for table `electricity_supply_branches`
--
ALTER TABLE `electricity_supply_branches`
  ADD PRIMARY KEY (`BRANCH_NUM`);

--
-- Indexes for table `electricity_supply_company`
--
ALTER TABLE `electricity_supply_company`
  ADD PRIMARY KEY (`COMPANY_ID`);

--
-- Indexes for table `rate`
--
ALTER TABLE `rate`
  ADD PRIMARY KEY (`BILL_ID`),
  ADD UNIQUE KEY `BASE_CHARGE` (`BASE_CHARGE`);

--
-- Indexes for table `region_located`
--
ALTER TABLE `region_located`
  ADD PRIMARY KEY (`REGION_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `charge`
--
ALTER TABLE `charge`
  ADD CONSTRAINT `Fk_charge` FOREIGN KEY (`BASE_CHARGE`) REFERENCES `rate` (`BASE_CHARGE`);

--
-- Constraints for table `company_branch`
--
ALTER TABLE `company_branch`
  ADD CONSTRAINT `Fkbranch` FOREIGN KEY (`Company_ID`) REFERENCES `electricity_supply_company` (`COMPANY_ID`);

--
-- Constraints for table `consumes`
--
ALTER TABLE `consumes`
  ADD CONSTRAINT `fk_consumes` FOREIGN KEY (`C_AADHAR_NUM`) REFERENCES `electricity_consumer` (`Aadhar_Number`);

--
-- Constraints for table `consumption_record`
--
ALTER TABLE `consumption_record`
  ADD CONSTRAINT `FK_bill` FOREIGN KEY (`BILL_ID`) REFERENCES `customer_bill` (`B_id`);

--
-- Constraints for table `customer_bill`
--
ALTER TABLE `customer_bill`
  ADD CONSTRAINT `FK_rate` FOREIGN KEY (`B_id`) REFERENCES `rate` (`BILL_ID`);

--
-- Constraints for table `customer_region`
--
ALTER TABLE `customer_region`
  ADD CONSTRAINT `Fk_customer` FOREIGN KEY (`C_AADHAR_NUMBER`) REFERENCES `electricity_consumer` (`Aadhar_Number`);

--
-- Constraints for table `electricity_consumer`
--
ALTER TABLE `electricity_consumer`
  ADD CONSTRAINT `FK_cp` FOREIGN KEY (`Cp_id`) REFERENCES `electricity_supply_company` (`COMPANY_ID`);

--
-- Constraints for table `electricity_consumer_type`
--
ALTER TABLE `electricity_consumer_type`
  ADD CONSTRAINT `FK_consumer` FOREIGN KEY (`METER_NUMBER`) REFERENCES `electricity_consumer` (`meter_number`);

--
-- Constraints for table `electricity_supply_branches`
--
ALTER TABLE `electricity_supply_branches`
  ADD CONSTRAINT `Fk_branch` FOREIGN KEY (`BRANCH_NUM`) REFERENCES `company_branch` (`Branch_num`);

--
-- Constraints for table `region_located`
--
ALTER TABLE `region_located`
  ADD CONSTRAINT `Fk_region` FOREIGN KEY (`REGION_ID`) REFERENCES `customer_region` (`REGION_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
