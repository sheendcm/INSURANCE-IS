-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2018 at 07:13 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `insurance_is_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `r_agent_information_details`
--

CREATE TABLE `r_agent_information_details` (
  `ai_id` int(10) UNSIGNED NOT NULL,
  `ai_name` varchar(100) DEFAULT NULL,
  `ai_code` varchar(100) DEFAULT NULL,
  `ai_branch` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_agent_information_details`
--

INSERT INTO `r_agent_information_details` (`ai_id`, `ai_name`, `ai_code`, `ai_branch`) VALUES
(1, 'Sheen', 'Sheen Mae', 'QC'),
(2, 'daa', '', ''),
(3, 'dssd', '', ''),
(4, '', '', ''),
(5, '', '', ''),
(6, '', '', ''),
(7, '', '', ''),
(8, '', '', ''),
(9, '', '', ''),
(10, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `r_application_form_details`
--

CREATE TABLE `r_application_form_details` (
  `af_id` int(10) UNSIGNED NOT NULL,
  `af_applicationnumber` varchar(20) DEFAULT NULL,
  `af_clientnumber` varchar(20) DEFAULT NULL,
  `af_dateapplied` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_application_form_details`
--

INSERT INTO `r_application_form_details` (`af_id`, `af_applicationnumber`, `af_clientnumber`, `af_dateapplied`) VALUES
(1, 'null', '123456', ''),
(2, '123456', '123456', '08/07/2018'),
(3, 'ad', 'ad', '08/07/2018'),
(4, 'ad', 'ad', '08/07/2018'),
(5, 'sdsd', 'sdsd', ''),
(6, 'sfs', 'sffs', ''),
(7, '', '', ''),
(8, '', '', ''),
(9, '', '', ''),
(10, '', '', ''),
(11, '', '', ''),
(12, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `r_application_requirements_details`
--

CREATE TABLE `r_application_requirements_details` (
  `ar_id` int(10) UNSIGNED NOT NULL,
  `ar_req1` bit(1) DEFAULT b'0',
  `ar_req2` bit(1) DEFAULT b'0',
  `ar_req3` bit(1) DEFAULT b'0',
  `ar_req4` bit(1) DEFAULT b'0',
  `ar_req5` bit(1) DEFAULT b'0',
  `ar_ref_c_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `r_application_status_details`
--

CREATE TABLE `r_application_status_details` (
  `as_id` int(10) UNSIGNED NOT NULL,
  `as_ref_c_id` int(10) UNSIGNED NOT NULL,
  `as_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `r_beneficial_owner_details`
--

CREATE TABLE `r_beneficial_owner_details` (
  `bo_id` int(10) UNSIGNED NOT NULL,
  `bo_name` varchar(100) DEFAULT NULL,
  `bo_contactnumber` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_beneficial_owner_details`
--

INSERT INTO `r_beneficial_owner_details` (`bo_id`, `bo_name`, `bo_contactnumber`) VALUES
(1, 'Edna', '01923'),
(2, '', ''),
(3, '', ''),
(4, '', ''),
(5, '', ''),
(6, '', ''),
(7, '', ''),
(8, '', ''),
(9, '', ''),
(10, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `r_client_details`
--

CREATE TABLE `r_client_details` (
  `c_id` int(10) UNSIGNED NOT NULL,
  `c_ref_af_id` int(10) UNSIGNED NOT NULL,
  `c_ref_ai_id` int(10) UNSIGNED NOT NULL,
  `c_ref_li_id` int(10) UNSIGNED NOT NULL,
  `c_ref_p_id` int(10) UNSIGNED NOT NULL,
  `c_ref_bo_id` int(10) UNSIGNED NOT NULL,
  `c_ref_pb_id` int(10) UNSIGNED NOT NULL,
  `c_ref_sb_id` int(10) UNSIGNED NOT NULL,
  `c_ref_pi_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `r_life_insured_details`
--

CREATE TABLE `r_life_insured_details` (
  `li_id` int(10) UNSIGNED NOT NULL,
  `li_surname` varchar(100) DEFAULT NULL,
  `li_givenname` varchar(100) DEFAULT NULL,
  `li_middlename` varchar(100) DEFAULT NULL,
  `li_alias` varchar(100) DEFAULT NULL,
  `li_gender` varchar(10) DEFAULT NULL,
  `li_civilstatus` varchar(10) DEFAULT NULL,
  `li_civilstatusother` varchar(100) DEFAULT NULL,
  `li_salutation` varchar(100) DEFAULT NULL,
  `li_birthdate` varchar(100) DEFAULT NULL,
  `li_age` varchar(10) DEFAULT NULL,
  `li_nationality` varchar(100) DEFAULT NULL,
  `li_placeofbirth` varchar(100) DEFAULT NULL,
  `li_tinsssgsis` varchar(100) DEFAULT NULL,
  `li_occupation` varchar(100) DEFAULT NULL,
  `li_natureofwork` varchar(100) DEFAULT NULL,
  `li_employer` varchar(100) DEFAULT NULL,
  `li_natureofemployer` varchar(100) DEFAULT NULL,
  `li_annualincome` varchar(20) DEFAULT NULL,
  `li_networth` varchar(20) DEFAULT NULL,
  `li_sourceoffunds` varchar(10) DEFAULT NULL,
  `li_sourceoffundsother` varchar(100) DEFAULT NULL,
  `li_taxreturnfiling` varchar(10) DEFAULT NULL,
  `li_mobilenumber` varchar(100) DEFAULT NULL,
  `li_telephonenumber` varchar(100) DEFAULT NULL,
  `li_emailaddress` varchar(100) DEFAULT NULL,
  `li_presentaddress` varchar(100) DEFAULT NULL,
  `li_presentcountry` varchar(100) DEFAULT NULL,
  `li_presentzipcode` varchar(100) DEFAULT NULL,
  `li_permanentaddress` varchar(100) DEFAULT NULL,
  `li_permanentcountry` varchar(100) DEFAULT NULL,
  `li_permanentzipcode` varchar(100) DEFAULT NULL,
  `li_businessaddress` varchar(100) DEFAULT NULL,
  `li_businesscountry` varchar(100) DEFAULT NULL,
  `li_businesszipcode` varchar(100) DEFAULT NULL,
  `li_occupationchange` varchar(10) DEFAULT NULL,
  `li_addresschange` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_life_insured_details`
--

INSERT INTO `r_life_insured_details` (`li_id`, `li_surname`, `li_givenname`, `li_middlename`, `li_alias`, `li_gender`, `li_civilstatus`, `li_civilstatusother`, `li_salutation`, `li_birthdate`, `li_age`, `li_nationality`, `li_placeofbirth`, `li_tinsssgsis`, `li_occupation`, `li_natureofwork`, `li_employer`, `li_natureofemployer`, `li_annualincome`, `li_networth`, `li_sourceoffunds`, `li_sourceoffundsother`, `li_taxreturnfiling`, `li_mobilenumber`, `li_telephonenumber`, `li_emailaddress`, `li_presentaddress`, `li_presentcountry`, `li_presentzipcode`, `li_permanentaddress`, `li_permanentcountry`, `li_permanentzipcode`, `li_businessaddress`, `li_businesscountry`, `li_businesszipcode`, `li_occupationchange`, `li_addresschange`) VALUES
(1, '\"+li_surname+\"', '\"+li_givenname+\"', '\"+li_middlename+\"', '\"+li_alias+\"', '\"+li_gende', '\"+li_civil', '\"+li_civilstatusothe', '\"+li_salutation+\"', '0000-00-00', '\"+li_age+\"', '\"+li_nationality+\"', '\"+li_placeofbirth+\"', '\"+li_tinsssgsis+\"', '\"+li_occupation+\"', '\"+li_natureofwork+\"', '\"+li_employer+\"', '\"+li_natureofemployer+\"', '\"+li_annualincome+\"', '\"+li_networth+\"', '\"+li_sourc', '\"+li_sourceoffundsot', '\"+li_taxre', '\"+li_mobilenumber+\"', '\"+li_telephonenumber+\"', '\"+li_emailaddress+\"', '\"+li_presentaddress+\"', '\"+li_presentcountry+\"', '\"+li_presentzipcode+\"', '\"+li_permanentaddress+\"', '\"+li_permanentcountry+\"', '\"+li_permanentzipcode+\"', '\"+li_businessaddress+\"', '\"+li_businesscountry+\"', '\"+li_businesszipcode+\"', '\"+li_occup', '\"+li_addre'),
(2, 'Mape', 'Sheena Mae', 'Del Castillo', 'Sheen', 'Female', 'Others', 'Bakla', 'Ms', '05/09/2018', '19', 'Filipino', 'Quezon City', '09876', 'Encoder', 'Good', 'null', 'null', '100000', '230000', 'Others', 'Tindahan', 'Yes', '0912345678', '0212345', 'sheen@gmail.com', 'null', 'null', 'null', 'New York City', 'USA', '1245', 'Seoul', 'Korea', '0011', 'Yes', 'No'),
(3, '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', 'Dian', 'Bad', '', '', '', '', 'null', '', '', '', 'QC', 'Philippines', '1121', '', '', '', '', '', '', 'null', 'null'),
(4, 'ad', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null'),
(5, 'sdsd', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null'),
(6, '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null'),
(7, '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null'),
(8, '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null'),
(9, '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null'),
(10, '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null'),
(11, '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null'),
(12, '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `r_medical_status_details`
--

CREATE TABLE `r_medical_status_details` (
  `ms_id` int(10) UNSIGNED NOT NULL,
  `ms_status` varchar(100) NOT NULL,
  `ms_ref_c_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `r_policyowner_details`
--

CREATE TABLE `r_policyowner_details` (
  `p_id` int(10) UNSIGNED NOT NULL,
  `p_surname` varchar(100) DEFAULT NULL,
  `p_givenname` varchar(100) DEFAULT NULL,
  `p_middlename` varchar(100) DEFAULT NULL,
  `p_alias` varchar(100) DEFAULT NULL,
  `p_gender` varchar(10) DEFAULT NULL,
  `p_civilstatus` varchar(10) DEFAULT NULL,
  `p_civilstatusother` varchar(100) DEFAULT NULL,
  `p_salutation` varchar(100) DEFAULT NULL,
  `p_birthdate` varchar(100) DEFAULT NULL,
  `p_age` varchar(10) DEFAULT NULL,
  `p_nationality` varchar(100) DEFAULT NULL,
  `p_placeofbirth` varchar(100) DEFAULT NULL,
  `p_tinsssgsis` varchar(100) DEFAULT NULL,
  `p_occupation` varchar(100) DEFAULT NULL,
  `p_natureofwork` varchar(100) DEFAULT NULL,
  `p_employer` varchar(100) DEFAULT NULL,
  `p_natureofemployer` varchar(100) DEFAULT NULL,
  `p_annualincome` varchar(20) DEFAULT NULL,
  `p_networth` varchar(20) DEFAULT NULL,
  `p_sourceoffunds` varchar(10) DEFAULT NULL,
  `p_sourceoffundsother` varchar(100) DEFAULT NULL,
  `p_taxreturnfiling` varchar(10) DEFAULT NULL,
  `p_mobilenumber` varchar(100) DEFAULT NULL,
  `p_telephonenumber` varchar(100) DEFAULT NULL,
  `p_emailaddress` varchar(100) DEFAULT NULL,
  `p_presentaddress` varchar(100) DEFAULT NULL,
  `p_presentcountry` varchar(100) DEFAULT NULL,
  `p_presentzipcode` varchar(100) DEFAULT NULL,
  `p_permanentaddress` varchar(100) DEFAULT NULL,
  `p_permanentcountry` varchar(100) DEFAULT NULL,
  `p_permanentzipcode` varchar(100) DEFAULT NULL,
  `p_businessaddress` varchar(100) DEFAULT NULL,
  `p_businesscountry` varchar(100) DEFAULT NULL,
  `p_businesszipcode` varchar(100) DEFAULT NULL,
  `p_occupationchange` varchar(10) DEFAULT NULL,
  `p_addresschange` varchar(10) DEFAULT NULL,
  `p_preferredaddress` varchar(100) DEFAULT NULL,
  `p_reltolifeinsured` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_policyowner_details`
--

INSERT INTO `r_policyowner_details` (`p_id`, `p_surname`, `p_givenname`, `p_middlename`, `p_alias`, `p_gender`, `p_civilstatus`, `p_civilstatusother`, `p_salutation`, `p_birthdate`, `p_age`, `p_nationality`, `p_placeofbirth`, `p_tinsssgsis`, `p_occupation`, `p_natureofwork`, `p_employer`, `p_natureofemployer`, `p_annualincome`, `p_networth`, `p_sourceoffunds`, `p_sourceoffundsother`, `p_taxreturnfiling`, `p_mobilenumber`, `p_telephonenumber`, `p_emailaddress`, `p_presentaddress`, `p_presentcountry`, `p_presentzipcode`, `p_permanentaddress`, `p_permanentcountry`, `p_permanentzipcode`, `p_businessaddress`, `p_businesscountry`, `p_businesszipcode`, `p_occupationchange`, `p_addresschange`, `p_preferredaddress`, `p_reltolifeinsured`) VALUES
(1, '\"+P_surname+\"', '\"+P_givenname+\"', '\"+P_middlename+\"', '\"+P_alias+\"', '\"+P_gender', '\"+P_civils', '\"+P_civilstatusother', '\"+P_salutation+\"', '0000-00-00', '\"+P_age+\"', '\"+P_nationality+\"', '\"+P_placeofbirth+\"', '\"+P_tinsssgsis+\"', '\"+P_occupation+\"', '\"+P_natureofwork+\"', '\"+P_employer+\"', '\"+P_natureofemployer+\"', '\"+P_annualincome+\"', '\"+P_networth+\"', '\"+P_source', '\"+P_sourceoffundsoth', '\"+P_taxret', '\"+P_mobilenumber+\"', '\"+P_telephonenumber+\"', '\"+P_emailaddress+\"', '\"+P_presentaddress+\"', '\"+P_presentcountry+\"', '\"+P_presentzipcode+\"', '\"+P_permanentaddress+\"', '\"+P_permanentcountry+\"', '\"+P_permanentzipcode+\"', '\"+P_businessaddress+\"', '\"+P_businesscountry+\"', '\"+P_businesszipcode+\"', '\"+P_occupa', '\"+P_addres', '\"+P_preferredaddress+\"', '\"+P_reltolifeinsured+\"'),
(2, 'fssf', 'sfsf', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null', '', ''),
(3, 'a', 'b', 'c', 'd', 'Female', 'Married', '', 'e', '08/01/2018', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'p', 'Salary', '', 'Yes', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '1', '2', 'Yes', 'No', 'Present', '3'),
(4, 'ad', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null', '', ''),
(5, 'sdsd', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null', '', ''),
(6, '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null', '', ''),
(7, '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null', '', ''),
(8, '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null', '', ''),
(9, '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null', '', ''),
(10, '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null', '', ''),
(11, 'Mape', 'Sheena Mae', 'Del Catillo', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null', '', ''),
(12, 'Mape', 'Sheena', 'DC', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `r_policy_information_details`
--

CREATE TABLE `r_policy_information_details` (
  `pi_id` int(10) UNSIGNED NOT NULL,
  `pi_planname` varchar(100) DEFAULT NULL,
  `pi_sumassured` varchar(20) DEFAULT NULL,
  `pi_currency` varchar(10) DEFAULT NULL,
  `pi_annualizedpremium` varchar(50) DEFAULT NULL,
  `pi_initialpremiumpaid` varchar(50) DEFAULT NULL,
  `pi_modeofpayment` varchar(100) DEFAULT NULL,
  `pi_methodofpayment` varchar(100) DEFAULT NULL,
  `pi_nonforfeitureopt` varchar(100) DEFAULT NULL,
  `pi_dividendopt` varchar(100) DEFAULT NULL,
  `pi_agreement` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_policy_information_details`
--

INSERT INTO `r_policy_information_details` (`pi_id`, `pi_planname`, `pi_sumassured`, `pi_currency`, `pi_annualizedpremium`, `pi_initialpremiumpaid`, `pi_modeofpayment`, `pi_methodofpayment`, `pi_nonforfeitureopt`, `pi_dividendopt`, `pi_agreement`) VALUES
(1, 'Ewan Ko', '', 'null', '', '', '', '', '', '', b'0'),
(2, 'Ewan Ko Pa', '', 'null', '', '', '', '', '', '', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `r_primary_beneficiary_details`
--

CREATE TABLE `r_primary_beneficiary_details` (
  `pb_id` int(10) UNSIGNED NOT NULL,
  `pb_name` varchar(100) DEFAULT NULL,
  `pb_birthdate` varchar(100) DEFAULT NULL,
  `pb_gender` varchar(100) DEFAULT NULL,
  `pb_reltoinsured` varchar(100) DEFAULT NULL,
  `pb_share` varchar(100) DEFAULT NULL,
  `pb_typeofbeneficiary` varchar(100) DEFAULT NULL,
  `pb_beneficiarydesignation` varchar(100) DEFAULT NULL,
  `pb_placeofbirth` varchar(100) DEFAULT NULL,
  `pb_nationality` varchar(100) DEFAULT NULL,
  `pb_presentaddress` varchar(100) DEFAULT NULL,
  `pb_country` varchar(100) DEFAULT NULL,
  `pb_zipcode` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_primary_beneficiary_details`
--

INSERT INTO `r_primary_beneficiary_details` (`pb_id`, `pb_name`, `pb_birthdate`, `pb_gender`, `pb_reltoinsured`, `pb_share`, `pb_typeofbeneficiary`, `pb_beneficiarydesignation`, `pb_placeofbirth`, `pb_nationality`, `pb_presentaddress`, `pb_country`, `pb_zipcode`) VALUES
(1, 'a', '08/01/2018', 'Male', 'd', 'e', 'Primary', 'null', 'b', 'c', 'null', 'g', 'h'),
(2, 'a', '08/01/2018', 'Male', 'd', 'e', 'Primary', 'Revocable', 'b', 'c', 'f', 'g', 'h'),
(3, 'sfsf', '', 'null', '', '', '', '', '', '', '', '', ''),
(4, 'sdsd', '', 'null', '', '', '', '', '', '', '', '', ''),
(5, '', '', 'null', '', '', '', '', '', '', '', '', ''),
(6, '', '', 'null', '', '', '', '', '', '', '', '', ''),
(7, '', '', 'null', '', '', '', '', '', '', '', '', ''),
(8, '', '', 'null', '', '', '', '', '', '', '', '', ''),
(9, '', '', 'null', '', '', '', '', '', '', '', '', ''),
(10, '', '', 'null', '', '', '', '', '', '', '', '', ''),
(11, '', '', 'null', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `r_secondary_beneficiary_details`
--

CREATE TABLE `r_secondary_beneficiary_details` (
  `sb_id` int(10) UNSIGNED NOT NULL,
  `sb_name` varchar(100) DEFAULT NULL,
  `sb_birthdate` varchar(100) DEFAULT NULL,
  `sb_gender` varchar(100) DEFAULT NULL,
  `sb_reltoinsured` varchar(100) DEFAULT NULL,
  `sb_share` varchar(100) DEFAULT NULL,
  `sb_typeofbeneficiary` varchar(100) DEFAULT NULL,
  `sb_beneficiarydesignation` varchar(100) DEFAULT NULL,
  `sb_placeofbirth` varchar(100) DEFAULT NULL,
  `sb_nationality` varchar(100) DEFAULT NULL,
  `sb_presentaddress` varchar(100) DEFAULT NULL,
  `sb_country` varchar(100) DEFAULT NULL,
  `sb_zipcode` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_secondary_beneficiary_details`
--

INSERT INTO `r_secondary_beneficiary_details` (`sb_id`, `sb_name`, `sb_birthdate`, `sb_gender`, `sb_reltoinsured`, `sb_share`, `sb_typeofbeneficiary`, `sb_beneficiarydesignation`, `sb_placeofbirth`, `sb_nationality`, `sb_presentaddress`, `sb_country`, `sb_zipcode`) VALUES
(1, 'a', '08/02/2018', 'Female', 'd', 'e', 'Secondary', 'Irrevocable', 'b', 'c', 'f', 'g', 'h'),
(2, 'sfsf', '', 'null', '', '', '', '', '', '', '', '', ''),
(3, 'sdsd', '', 'null', '', '', '', '', '', '', '', '', ''),
(4, '', '', 'null', '', '', '', '', '', '', '', '', ''),
(5, '', '', 'null', '', '', '', '', '', '', '', '', ''),
(6, '', '', 'null', '', '', '', '', '', '', '', '', ''),
(7, '', '', 'null', '', '', '', '', '', '', '', '', ''),
(8, '', '', 'null', '', '', '', '', '', '', '', '', ''),
(9, '', '', 'null', '', '', '', '', '', '', '', '', ''),
(10, '', '', 'null', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `trap`
--

CREATE TABLE `trap` (
  `trap` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trap`
--

INSERT INTO `trap` (`trap`) VALUES
('1'),
('1'),
('1'),
('1'),
('1'),
('1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `r_agent_information_details`
--
ALTER TABLE `r_agent_information_details`
  ADD PRIMARY KEY (`ai_id`);

--
-- Indexes for table `r_application_form_details`
--
ALTER TABLE `r_application_form_details`
  ADD PRIMARY KEY (`af_id`);

--
-- Indexes for table `r_application_requirements_details`
--
ALTER TABLE `r_application_requirements_details`
  ADD PRIMARY KEY (`ar_id`),
  ADD KEY `ar_ref_c_id` (`ar_ref_c_id`);

--
-- Indexes for table `r_application_status_details`
--
ALTER TABLE `r_application_status_details`
  ADD PRIMARY KEY (`as_id`),
  ADD KEY `as_ref_c_id` (`as_ref_c_id`);

--
-- Indexes for table `r_beneficial_owner_details`
--
ALTER TABLE `r_beneficial_owner_details`
  ADD PRIMARY KEY (`bo_id`);

--
-- Indexes for table `r_client_details`
--
ALTER TABLE `r_client_details`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `c_ref_af_id` (`c_ref_af_id`),
  ADD KEY `c_ref_ai_id` (`c_ref_ai_id`),
  ADD KEY `c_ref_li_id` (`c_ref_li_id`),
  ADD KEY `c_ref_p_id` (`c_ref_p_id`),
  ADD KEY `c_ref_bo_id` (`c_ref_bo_id`),
  ADD KEY `c_ref_pb_id` (`c_ref_pb_id`),
  ADD KEY `c_ref_sb_id` (`c_ref_sb_id`),
  ADD KEY `c_ref_pi_id` (`c_ref_pi_id`);

--
-- Indexes for table `r_life_insured_details`
--
ALTER TABLE `r_life_insured_details`
  ADD PRIMARY KEY (`li_id`);

--
-- Indexes for table `r_medical_status_details`
--
ALTER TABLE `r_medical_status_details`
  ADD PRIMARY KEY (`ms_id`),
  ADD KEY `ms_ref_c_id` (`ms_ref_c_id`);

--
-- Indexes for table `r_policyowner_details`
--
ALTER TABLE `r_policyowner_details`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `r_policy_information_details`
--
ALTER TABLE `r_policy_information_details`
  ADD PRIMARY KEY (`pi_id`);

--
-- Indexes for table `r_primary_beneficiary_details`
--
ALTER TABLE `r_primary_beneficiary_details`
  ADD PRIMARY KEY (`pb_id`);

--
-- Indexes for table `r_secondary_beneficiary_details`
--
ALTER TABLE `r_secondary_beneficiary_details`
  ADD PRIMARY KEY (`sb_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `r_agent_information_details`
--
ALTER TABLE `r_agent_information_details`
  MODIFY `ai_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `r_application_form_details`
--
ALTER TABLE `r_application_form_details`
  MODIFY `af_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `r_application_requirements_details`
--
ALTER TABLE `r_application_requirements_details`
  MODIFY `ar_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_beneficial_owner_details`
--
ALTER TABLE `r_beneficial_owner_details`
  MODIFY `bo_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `r_client_details`
--
ALTER TABLE `r_client_details`
  MODIFY `c_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `r_life_insured_details`
--
ALTER TABLE `r_life_insured_details`
  MODIFY `li_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `r_medical_status_details`
--
ALTER TABLE `r_medical_status_details`
  MODIFY `ms_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_policyowner_details`
--
ALTER TABLE `r_policyowner_details`
  MODIFY `p_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `r_policy_information_details`
--
ALTER TABLE `r_policy_information_details`
  MODIFY `pi_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `r_primary_beneficiary_details`
--
ALTER TABLE `r_primary_beneficiary_details`
  MODIFY `pb_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `r_secondary_beneficiary_details`
--
ALTER TABLE `r_secondary_beneficiary_details`
  MODIFY `sb_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `r_application_requirements_details`
--
ALTER TABLE `r_application_requirements_details`
  ADD CONSTRAINT `r_application_requirements_details_ibfk_1` FOREIGN KEY (`ar_ref_c_id`) REFERENCES `r_client_details` (`c_id`);

--
-- Constraints for table `r_application_status_details`
--
ALTER TABLE `r_application_status_details`
  ADD CONSTRAINT `r_application_status_details_ibfk_1` FOREIGN KEY (`as_ref_c_id`) REFERENCES `r_client_details` (`c_id`);

--
-- Constraints for table `r_client_details`
--
ALTER TABLE `r_client_details`
  ADD CONSTRAINT `r_client_details_ibfk_1` FOREIGN KEY (`c_ref_af_id`) REFERENCES `r_application_form_details` (`af_id`),
  ADD CONSTRAINT `r_client_details_ibfk_2` FOREIGN KEY (`c_ref_ai_id`) REFERENCES `r_agent_information_details` (`ai_id`),
  ADD CONSTRAINT `r_client_details_ibfk_3` FOREIGN KEY (`c_ref_li_id`) REFERENCES `r_life_insured_details` (`li_id`),
  ADD CONSTRAINT `r_client_details_ibfk_4` FOREIGN KEY (`c_ref_p_id`) REFERENCES `r_policyowner_details` (`p_id`),
  ADD CONSTRAINT `r_client_details_ibfk_5` FOREIGN KEY (`c_ref_bo_id`) REFERENCES `r_beneficial_owner_details` (`bo_id`),
  ADD CONSTRAINT `r_client_details_ibfk_6` FOREIGN KEY (`c_ref_pb_id`) REFERENCES `r_primary_beneficiary_details` (`pb_id`),
  ADD CONSTRAINT `r_client_details_ibfk_7` FOREIGN KEY (`c_ref_sb_id`) REFERENCES `r_secondary_beneficiary_details` (`sb_id`),
  ADD CONSTRAINT `r_client_details_ibfk_8` FOREIGN KEY (`c_ref_pi_id`) REFERENCES `r_policy_information_details` (`pi_id`);

--
-- Constraints for table `r_medical_status_details`
--
ALTER TABLE `r_medical_status_details`
  ADD CONSTRAINT `r_medical_status_details_ibfk_1` FOREIGN KEY (`ms_ref_c_id`) REFERENCES `r_client_details` (`c_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
