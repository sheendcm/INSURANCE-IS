-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2018 at 06:53 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

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
(1, '', '', ''),
(2, '', '', ''),
(3, '', '', ''),
(4, '', '', '');

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
(1, '12345', '', '08/14/2018'),
(2, '12346', '', '08/15/2018'),
(3, '12347', '', '08/16/2018'),
(4, '12348', '', '08/13/2018');

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

--
-- Dumping data for table `r_application_requirements_details`
--

INSERT INTO `r_application_requirements_details` (`ar_id`, `ar_req1`, `ar_req2`, `ar_req3`, `ar_req4`, `ar_req5`, `ar_ref_c_id`) VALUES
(1, b'1', b'1', b'1', b'1', b'1', 1),
(2, b'1', b'1', b'1', b'1', b'1', 2),
(3, b'1', b'1', b'1', b'1', b'1', 3),
(4, b'1', b'1', b'1', b'1', b'1', 4);

-- --------------------------------------------------------

--
-- Table structure for table `r_application_status_details`
--

CREATE TABLE `r_application_status_details` (
  `as_id` int(10) UNSIGNED NOT NULL,
  `as_ref_c_id` int(10) UNSIGNED NOT NULL,
  `as_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_application_status_details`
--

INSERT INTO `r_application_status_details` (`as_id`, `as_ref_c_id`, `as_status`) VALUES
(1, 1, 'Issued'),
(2, 2, 'Declined'),
(3, 3, 'Medical Completed'),
(4, 4, 'Pending');

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
(1, '', ''),
(2, '', ''),
(3, '', ''),
(4, '', '');

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

--
-- Dumping data for table `r_client_details`
--

INSERT INTO `r_client_details` (`c_id`, `c_ref_af_id`, `c_ref_ai_id`, `c_ref_li_id`, `c_ref_p_id`, `c_ref_bo_id`, `c_ref_pb_id`, `c_ref_sb_id`, `c_ref_pi_id`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 1),
(2, 2, 2, 2, 2, 2, 2, 2, 2),
(3, 3, 3, 3, 3, 3, 3, 3, 3),
(4, 4, 4, 4, 4, 4, 4, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `r_file_details`
--

CREATE TABLE `r_file_details` (
  `f_id` int(10) UNSIGNED NOT NULL,
  `f_file` blob,
  `f_name` varchar(200) DEFAULT NULL,
  `f_ref_c_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_file_details`
--

INSERT INTO `r_file_details` (`f_id`, `f_file`, `f_name`, `f_ref_c_id`) VALUES
(1, 0x53455420464f524549474e5f4b45595f434845434b53203d20303b202d2d2044697361626c6520666f726569676e206b657920636865636b696e672e0d0a5452554e43415445205441424c4520725f7365636f6e646172795f62656e65666963696172795f64657461696c733b0d0a5452554e43415445205441424c4520725f7072696d6172795f62656e65666963696172795f64657461696c733b0d0a5452554e43415445205441424c4520725f706f6c6963795f696e666f726d6174696f6e5f64657461696c733b0d0a5452554e43415445205441424c4520725f706f6c6963796f776e65725f64657461696c733b0d0a5452554e43415445205441424c4520725f6d65646963616c5f7374617475735f64657461696c733b0d0a5452554e43415445205441424c4520725f6c6966655f696e73757265645f64657461696c733b0d0a5452554e43415445205441424c4520725f636c69656e745f64657461696c733b0d0a5452554e43415445205441424c4520725f62656e6566696369616c5f6f776e65725f64657461696c733b0d0a5452554e43415445205441424c4520725f6170706c69636174696f6e5f7374617475735f64657461696c733b0d0a5452554e43415445205441424c4520725f6170706c69636174696f6e5f726571756972656d656e74735f64657461696c733b0d0a5452554e43415445205441424c4520725f6170706c69636174696f6e5f666f726d5f64657461696c733b0d0a5452554e43415445205441424c4520725f6167656e745f696e666f726d6174696f6e5f64657461696c733b0d0a53455420464f524549474e5f4b45595f434845434b53203d20313b202d2d20456e61626c6520666f726569676e206b657920636865636b696e672e, 'needss.txt', 1),
(2, 0x3c25407061676520696d706f72743d226a6176612e73716c2e2a22253e0d0a3c25407061676520696d706f72743d2264622e436f6e6e2220253e0d0a3c25407061676520696d706f72743d226a6176612e73716c2e4472697665724d616e616765722220253e0d0a0d0a3c25402070616765206c616e67756167653d226a6176612220636f6e74656e74547970653d22746578742f68746d6c3b20636861727365743d49534f2d383835392d31220d0a2020202070616765456e636f64696e673d2249534f2d383835392d3122253e0d0a3c21444f43545950452068746d6c3e0d0a3c68746d6c3e0d0a3c686561643e0d0a3c6d65746120636861727365743d2249534f2d383835392d31223e0d0a3c7469746c653e496e73657274207469746c6520686572653c2f7469746c653e0d0a3c2f686561643e0d0a3c626f64793e0d0a3c25200d0a090d0a09436f6e6e206462203d206e657720436f6e6e28293b0d0a09436f6e6e656374696f6e20636f6e6e203d2064622e676574436f6e6e656374696f6e28293b0d0a09696628636f6e6e203d3d206e756c6c290d0a09096f75742e7072696e7428226661696c617364656422293b0d0a09656c73650d0a09096f75742e7072696e7428227375636365737322293b0d0a253e0d0a0d0a093c73637269707420747970653d22746578742f6a617661736372697074223e0d0a09092428646f63756d656e74292e72656164792866756e6374696f6e2028297b0d0a0909092428272362746e5375626d697427292e636c69636b2866756e6374696f6e28297b0d0a0909090d0a090909097661722054787444657363203d20242827235478744465736327292e76616c28293b0d0a09090909242e616a6178287b0d0a0909090909747970653a27504f5354272c0d0a0909090909646174613a7b547874446573633a20547874446573637d2c0d0a090909090975726c3a276b656d652f696e73657274272c0d0a0909090909737563636573733a2066756e6374696f6e28726573756c74297b0d0a090909090909616c65727428726573756c74293b0d0a0909090909090d0a09090909097d0d0a090909097d293b0d0a0909097d293b0d0a09097d293b0d0a093c2f7363726970743e0d0a093c696e70757420747970653d2274657874222069643d22547874446573632220706c616365686f6c6465723d22496e70757420796f7572204465736372697074696f6e223e0d0a093c696e70757420747970653d22627574746f6e222069643d2262746e5375626d6974222076616c75653d225375626d697422203e0d0a3c2f626f64793e0d0a3c2f68746d6c3e, 'index.jsp', 1),
(3, 0x0001890930820485308202eda003020102021100ff3663642f2b4ac1767b1c8942d302b8300d06092a864886f70d01010b0500307d310b30090603550406130255533113301106035504080c0a57617368696e67746f6e3111300f06035504070c084b69726b6c616e64310f300d060355040a0c06476f6f676c653111300f060355040b0c085769646576696e653122302006035504030c197769646576696e652d636f64657369676e2d726f6f742d6361301e170d3137313031333137333930395a170d3237313031313137333930395a3079310b30090603550406130255533113301106035504080c0a57617368696e67746f6e3111300f06035504070c084b69726b6c616e64310f300d060355040a0c06476f6f676c653111300f060355040b0c085769646576696e65311e301c06035504030c157769646576696e652d766d702d636f64657369676e30820122300d06092a864886f70d01010105000382010f003082010a0282010100bb3246bf9a389565e7042db993a9dc24728ab1ec7b5eedadf8fa02d492f711ef301a25d748411adc1973412244c871fa3d3697c8ec85a423af4ac04e0f998d0ba117d526fc006b3b042bbc0a1f3c78469398b17fc7eb2e42380f2953ff1ebcd96f16b37c4369d646ed41361b8c12c14a910011cde2101859efc73496017bca357585394effe0dd3df39dc4e123ed4d82cd73ed46216ac36625266c648e52c313bd3f214f744086181700b7cf23dc85661dc2ac4f138d5bf556af7030790e0b90c3a12bd0ddf3b68953cea35d941603faac4dc93dd939b2a4063eca0e20ba1799871bfad7f33ec2933a8f0da1bf31746c841b96f7efa6a860442f63d7116afd1b0203010001a38183308180301d0603551d0e041604144cb2d71a6343eebb45a0d852e86eef8300ef24b0301f0603551d23041830168014ca3dd88e0f74577fd09ad9e121bf42fb2355298630090603551d1304023000300b0603551d0f04040302078030130603551d25040c300a06082b060105050703033011060a2b06010401d67904010304030101ff300d06092a864886f70d01010b0500038201810067ebd422cd860f5bf7a0747b9f347ee62c8547eef509e3344ba585abc9f5287824b92ead7d20092ace1fe94efae5627c648cbfd0c9cff29c68b00775363fdb4ce42826154f7570c701992421ded10f34528a2035bf2df68ba5731fe189bea44b2f8eda555bef1e5bb82b157341582aa27ee514bd5e30e2f762613e3b9823988d90c578afb0ad62ba2d3180fceb45e3ec6ca0e28d1adf8e53c46eea610115bfdb295520e071b88f433e643a0ca5a53c5b02e94635eeff1d37d009175bf82dea6c7d8054204c63af58071751662e189d7a8fca3ad051fdf065da9f6d7ac57305eb1a00752ea521494be7f35c3566205baf9d4bd16454556599ba3775c328ccddf2f599d9326693718496eb3f79b6b6c8536d33747421ae987110f9ab0b99b28dc3edb33925fb2cde8bc122374d7851c9ddab4e9f175a6b0faae12e6a6e22f055f0c197e226494ddf69f8ec8dc3495ba502d4a3ac691b0c9722649d8f0d06e8135efc4d69a12fcccb5c28997d2758a5022a2cf0f88d97a4e5fe55f568125d69dced0280028a05fb2b4b4506175c79ed0a575521be25cdd9fd574f4aaebc2284a78f05babb5b08a8b367e8246de14ae4415d4fe94698e4a97362fd5a45eaa4ab9ed4bf0dba78beed966402c724c6a715ae2f9a8ad051860c9e0dbd6d4d28fb7847c372e8683c75b28ed1002d1968cf58258c0b1f9cb80cbadeeaea47b59e982855143943ebbc4a383e12638f3b6978245fff049437e0833395986b6246438c3b6b90d2166cb3b7009700554b677ff33b8f4a4d8fd36ee70aa40f35faf2653b0858df22c26c3c6c50467b22b6c49f0f07ddae6ea60e3310a3427c5d1ca83f41b3e20d87d41d54f407c2e507ae3779903b87b99216e7e44a673642c73615ee3a5d2aa377eed2030100, 'chrome.dll.sig', 3);

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
(1, '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null'),
(2, '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null'),
(3, '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null'),
(4, '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `r_medical_status_details`
--

CREATE TABLE `r_medical_status_details` (
  `ms_id` int(10) UNSIGNED NOT NULL,
  `ms_status` varchar(100) NOT NULL,
  `ms_ref_c_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r_medical_status_details`
--

INSERT INTO `r_medical_status_details` (`ms_id`, `ms_status`, `ms_ref_c_id`) VALUES
(1, 'Healthy', 1),
(2, 'Unhealthy', 2),
(3, 'Healthy', 3);

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
(1, 'Mape', 'Sheena Mae', 'DC', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null', '', ''),
(2, 'Dizon', 'Malene', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null', '', ''),
(3, 'Labayen', 'Raven Joyce', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null', '', ''),
(4, 'Paler', 'Jade', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', 'null', 'null', '', '');

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
(1, 'Try', '', 'null', '', '', '', '', '', '', b'0'),
(2, 'Try Lang', '', 'null', '', '', '', '', '', '', b'0'),
(3, 'Qwerty', '', 'null', '', '', '', '', '', '', b'0'),
(4, 'Qwe', '', 'null', '', '', '', '', '', '', b'0');

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
(1, 'Try', '', 'null', '', '', '', '', '', '', '', '', ''),
(2, '', '', 'null', '', '', '', '', '', '', '', '', ''),
(3, '', '', 'null', '', '', '', '', '', '', '', '', ''),
(4, '', '', 'null', '', '', '', '', '', '', '', '', '');

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
(1, '', '', 'null', '', '', '', '', '', '', '', '', ''),
(2, '', '', 'null', '', '', '', '', '', '', '', '', ''),
(3, '', '', 'null', '', '', '', '', '', '', '', '', ''),
(4, '', '', 'null', '', '', '', '', '', '', '', '', '');

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
-- Indexes for table `r_file_details`
--
ALTER TABLE `r_file_details`
  ADD PRIMARY KEY (`f_id`),
  ADD KEY `f_ref_c_id` (`f_ref_c_id`);

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
  MODIFY `ai_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `r_application_form_details`
--
ALTER TABLE `r_application_form_details`
  MODIFY `af_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `r_application_requirements_details`
--
ALTER TABLE `r_application_requirements_details`
  MODIFY `ar_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `r_application_status_details`
--
ALTER TABLE `r_application_status_details`
  MODIFY `as_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `r_beneficial_owner_details`
--
ALTER TABLE `r_beneficial_owner_details`
  MODIFY `bo_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `r_client_details`
--
ALTER TABLE `r_client_details`
  MODIFY `c_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `r_file_details`
--
ALTER TABLE `r_file_details`
  MODIFY `f_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `r_life_insured_details`
--
ALTER TABLE `r_life_insured_details`
  MODIFY `li_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `r_medical_status_details`
--
ALTER TABLE `r_medical_status_details`
  MODIFY `ms_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `r_policyowner_details`
--
ALTER TABLE `r_policyowner_details`
  MODIFY `p_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `r_policy_information_details`
--
ALTER TABLE `r_policy_information_details`
  MODIFY `pi_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `r_primary_beneficiary_details`
--
ALTER TABLE `r_primary_beneficiary_details`
  MODIFY `pb_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `r_secondary_beneficiary_details`
--
ALTER TABLE `r_secondary_beneficiary_details`
  MODIFY `sb_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `r_file_details`
--
ALTER TABLE `r_file_details`
  ADD CONSTRAINT `r_file_details_ibfk_1` FOREIGN KEY (`f_ref_c_id`) REFERENCES `r_client_details` (`c_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
