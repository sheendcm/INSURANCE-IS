-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2018 at 05:56 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 5.6.33

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
-- Table structure for table `r_agent_information`
--

CREATE TABLE `r_agent_information` (
  `ai_id` int(10) UNSIGNED NOT NULL,
  `ai_name` varchar(100) DEFAULT NULL,
  `ai_code` varchar(100) DEFAULT NULL,
  `ai_branch` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Table structure for table `r_beneficial_owner_details`
--

CREATE TABLE `r_beneficial_owner_details` (
  `bo_id` int(10) UNSIGNED NOT NULL,
  `bo_name` varchar(100) DEFAULT NULL,
  `bo_contactnumber` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `r_benefit_details`
--

CREATE TABLE `r_benefit_details` (
  `b_id` int(10) UNSIGNED NOT NULL,
  `b_name` varchar(100) DEFAULT NULL,
  `b_amount` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `r_hospital_income_benefit_details`
--

CREATE TABLE `r_hospital_income_benefit_details` (
  `hib_id` int(10) UNSIGNED NOT NULL,
  `hib_name` varchar(100) DEFAULT NULL,
  `hib_amount` varchar(20) DEFAULT NULL
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
  `li_civilstatusother` varchar(20) DEFAULT NULL,
  `li_salutation` varchar(100) DEFAULT NULL,
  `li_birthdate` date DEFAULT NULL,
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
  `li_sourceoffundsother` varchar(20) DEFAULT NULL,
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
  `li_addresschange` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `r_personal_accident_benefit_details`
--

CREATE TABLE `r_personal_accident_benefit_details` (
  `pab_id` int(10) UNSIGNED NOT NULL,
  `pab_name` varchar(100) DEFAULT NULL,
  `pab_amount` varchar(20) DEFAULT NULL
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
  `p_civilstatusother` varchar(20) DEFAULT NULL,
  `p_salutation` varchar(100) DEFAULT NULL,
  `p_birthdate` date DEFAULT NULL,
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
  `p_sourceoffundsother` varchar(20) DEFAULT NULL,
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
  `p_addresschange` varchar(100) DEFAULT NULL,
  `p_preferredaddress` varchar(100) DEFAULT NULL,
  `p_reltolifeinsured` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `pi_agreement` bit(1) DEFAULT b'0',
  `pi_ref_b_id` int(10) UNSIGNED DEFAULT NULL,
  `pi_ref_vlr_id` int(10) UNSIGNED DEFAULT NULL,
  `pi_ref_hib_id` int(10) UNSIGNED DEFAULT NULL,
  `pi_ref_pab_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `r_primary_beneficiary_details`
--

CREATE TABLE `r_primary_beneficiary_details` (
  `pb_id` int(10) UNSIGNED NOT NULL,
  `pb_name` varchar(100) DEFAULT NULL,
  `pb_birthdate` date DEFAULT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `r_secondary_beneficiary_details`
--

CREATE TABLE `r_secondary_beneficiary_details` (
  `sb_id` int(10) UNSIGNED NOT NULL,
  `sb_name` varchar(100) DEFAULT NULL,
  `sb_birthdate` date DEFAULT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `r_variable_life_rider_details`
--

CREATE TABLE `r_variable_life_rider_details` (
  `vlr_id` int(10) UNSIGNED NOT NULL,
  `vlr_name` varchar(100) DEFAULT NULL,
  `vlr_amount` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `r_agent_information`
--
ALTER TABLE `r_agent_information`
  ADD PRIMARY KEY (`ai_id`);

--
-- Indexes for table `r_application_form_details`
--
ALTER TABLE `r_application_form_details`
  ADD PRIMARY KEY (`af_id`);

--
-- Indexes for table `r_beneficial_owner_details`
--
ALTER TABLE `r_beneficial_owner_details`
  ADD PRIMARY KEY (`bo_id`);

--
-- Indexes for table `r_benefit_details`
--
ALTER TABLE `r_benefit_details`
  ADD PRIMARY KEY (`b_id`);

--
-- Indexes for table `r_hospital_income_benefit_details`
--
ALTER TABLE `r_hospital_income_benefit_details`
  ADD PRIMARY KEY (`hib_id`);

--
-- Indexes for table `r_life_insured_details`
--
ALTER TABLE `r_life_insured_details`
  ADD PRIMARY KEY (`li_id`);

--
-- Indexes for table `r_personal_accident_benefit_details`
--
ALTER TABLE `r_personal_accident_benefit_details`
  ADD PRIMARY KEY (`pab_id`);

--
-- Indexes for table `r_policyowner_details`
--
ALTER TABLE `r_policyowner_details`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `r_policy_information_details`
--
ALTER TABLE `r_policy_information_details`
  ADD PRIMARY KEY (`pi_id`),
  ADD KEY `pi_ref_b_id` (`pi_ref_b_id`),
  ADD KEY `pi_ref_vlr_id` (`pi_ref_vlr_id`),
  ADD KEY `pi_ref_hib_id` (`pi_ref_hib_id`),
  ADD KEY `pi_ref_pab_id` (`pi_ref_pab_id`);

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
-- Indexes for table `r_variable_life_rider_details`
--
ALTER TABLE `r_variable_life_rider_details`
  ADD PRIMARY KEY (`vlr_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `r_agent_information`
--
ALTER TABLE `r_agent_information`
  MODIFY `ai_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_application_form_details`
--
ALTER TABLE `r_application_form_details`
  MODIFY `af_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_beneficial_owner_details`
--
ALTER TABLE `r_beneficial_owner_details`
  MODIFY `bo_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_benefit_details`
--
ALTER TABLE `r_benefit_details`
  MODIFY `b_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_hospital_income_benefit_details`
--
ALTER TABLE `r_hospital_income_benefit_details`
  MODIFY `hib_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_life_insured_details`
--
ALTER TABLE `r_life_insured_details`
  MODIFY `li_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_personal_accident_benefit_details`
--
ALTER TABLE `r_personal_accident_benefit_details`
  MODIFY `pab_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_policyowner_details`
--
ALTER TABLE `r_policyowner_details`
  MODIFY `p_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_policy_information_details`
--
ALTER TABLE `r_policy_information_details`
  MODIFY `pi_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_primary_beneficiary_details`
--
ALTER TABLE `r_primary_beneficiary_details`
  MODIFY `pb_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_secondary_beneficiary_details`
--
ALTER TABLE `r_secondary_beneficiary_details`
  MODIFY `sb_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `r_variable_life_rider_details`
--
ALTER TABLE `r_variable_life_rider_details`
  MODIFY `vlr_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `r_policy_information_details`
--
ALTER TABLE `r_policy_information_details`
  ADD CONSTRAINT `r_policy_information_details_ibfk_1` FOREIGN KEY (`pi_ref_b_id`) REFERENCES `r_benefit_details` (`b_id`),
  ADD CONSTRAINT `r_policy_information_details_ibfk_2` FOREIGN KEY (`pi_ref_vlr_id`) REFERENCES `r_variable_life_rider_details` (`vlr_id`),
  ADD CONSTRAINT `r_policy_information_details_ibfk_3` FOREIGN KEY (`pi_ref_hib_id`) REFERENCES `r_hospital_income_benefit_details` (`hib_id`),
  ADD CONSTRAINT `r_policy_information_details_ibfk_4` FOREIGN KEY (`pi_ref_pab_id`) REFERENCES `r_personal_accident_benefit_details` (`pab_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
