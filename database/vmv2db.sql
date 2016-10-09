-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 09, 2016 at 09:23 AM
-- Server version: 5.7.15-0ubuntu0.16.04.1
-- PHP Version: 5.6.25-2+deb.sury.org~xenial+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vmv2db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_countNews` ()  BEGIN
	SELECT count(*) FROM news;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_countVaccines` ()  BEGIN
	SELECT count(*) FROM vaccine;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deleteDisease` (IN `p_disease_id` INT(11))  BEGIN
	DELETE FROM `disease` WHERE `disease_id`=p_disease_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deleteNews` (IN `p_news_id` INT(11))  BEGIN
	DELETE FROM `news` WHERE `news_id`=p_news_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deleteUser` (IN `p_user_id` INT(11))  BEGIN
	DELETE FROM `user` WHERE `user_id`=p_user_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deleteVaccinationRecord` (IN `p_user_id` INT(11), IN `p_vaccine_id` INT(11), IN `p_dose` INT(11))  BEGIN
	DELETE FROM `vaccination_record` WHERE `user_id`=p_user_id and`vaccine_id`=p_vaccine_id and `dose`=p_dose;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deleteVaccine` (IN `p_vaccine_id` INT(11))  BEGIN
	DELETE FROM `vaccine` WHERE `vaccine_id`=p_vaccine_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deleteVaccineDisease` (IN `p_vaccine_id` INT(11), IN `p_disease_id` INT(11))  BEGIN
	DELETE FROM `vaccine_disease` WHERE `vaccine_id`=p_vaccine_id and `disease_id`=p_disease_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deleteVaccineDiseaseByVaccineId` (IN `p_vaccine_id` INT(11))  BEGIN
	DELETE FROM `vaccine_disease` WHERE `vaccine_id`=p_vaccine_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getAllDiseases` ()  BEGIN
SELECT `disease_id`, `disease_name`, `description` FROM disease;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getAllNews` ()  BEGIN
	SELECT `news_id`, `title`, `content`, `image`, `created_date` FROM news order by `created_date` desc;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getAllUsers` ()  BEGIN
SELECT `user_id`, `full_name`, `gender`, `birthday`, `phone_number`, `address`, `username`, `password`, `role`, `avatar` FROM user;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getAllVaccinationRecordHolder` ()  BEGIN
	SELECT vaccine.vaccine_id,user.user_id,vaccination_record.dose,vaccination_record.injection_date,vaccination_record.next_dose_date,user.full_name,vaccine.vaccine_name FROM vaccination_record INNER JOIN user ON vaccination_record.user_id = user.user_id INNER JOIN vaccine ON vaccination_record.vaccine_id = vaccine.vaccine_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getAllVaccinationRecords` ()  BEGIN
SELECT `user_id`, `vaccine_id`, `dose`, `injection_date`, `next_dose_date` FROM vaccination_record;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getAllVaccineDiseases` ()  BEGIN
SELECT `vaccine_id`, `disease_id`, `note` FROM vaccine_disease;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getAllVaccines` ()  BEGIN
	SELECT `vaccine_id`, `vaccine_name`, `manufacturer`, `price`, `number_of_doses`, `side_effects`, `indication`, `contraindication`, `dosage_and_usage`, `image` FROM vaccine;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getDiseaseById` (IN `p_disease_id` INT)  BEGIN
SELECT `disease_id`, `disease_name`, `description` FROM disease WHERE `disease_id`=p_disease_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getDiseaseByVaccineId` (IN `p_vaccine_id` INT)  BEGIN
SELECT disease.`disease_id`, `disease_name`, `description` FROM `disease` INNER JOIN `vaccine_disease` ON disease.`disease_id` = vaccine_disease.`disease_id` WHERE vaccine_disease.`vaccine_id` = p_vaccine_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getNewsById` (IN `p_new_id` INT(11))  BEGIN
SELECT `news_id`, `title`, `content`, `image`, `created_date` FROM news WHERE `news_id`=p_new_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getNewsLimit` (IN `p_start` INT(11), IN `p_limit` INT(11))  BEGIN
	SELECT `news_id`, `title`, `content`, `image`, `created_date` FROM news order by `created_date` desc limit p_start, p_limit;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getUserById` (IN `p_user_id` INT)  BEGIN
SELECT `user_id`, `full_name`, `gender`, `birthday`, `phone_number`, `address`, `username`, `password`, `role`, `avatar` FROM user WHERE `user_id`=p_user_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getUserByUsername` (IN `p_username` VARCHAR(255))  BEGIN
SELECT `user_id`, `full_name`, `gender`, `birthday`, `phone_number`, `address`, `username`, `password`, `role`, `avatar` FROM user WHERE `username`=p_username COLLATE utf8_unicode_ci;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getUserByUsernamePassword` (IN `p_username` VARCHAR(255), IN `p_password` VARCHAR(255))  BEGIN
SELECT `user_id`, `full_name`, `gender`, `birthday`, `phone_number`, `address`, `username`, `password`, `role`, `avatar` FROM user WHERE `username`=p_username COLLATE utf8_unicode_ci and `password`=p_password COLLATE utf8_unicode_ci;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getVaccinationRecord` (IN `p_user_id` INT, IN `p_vaccine_id` INT, IN `p_dose` INT)  BEGIN
SELECT `user_id`, `vaccine_id`, `dose`, `injection_date`, `next_dose_date` FROM vaccination_record WHERE `user_id`=p_user_id and `vaccine_id`=p_vaccine_id and `dose`=p_dose;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getVaccinationRecordsByUser` (IN `p_user_id` INT)  BEGIN
SELECT `user_id`, `vaccine_id`, `dose`, `injection_date`, `next_dose_date` FROM vaccination_record WHERE `user_id`=p_user_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getVaccinationRecordsByVaccine` (IN `p_vaccine_id` INT)  BEGIN
SELECT `user_id`, `vaccine_id`, `dose`, `injection_date`, `next_dose_date` FROM vaccination_record WHERE `vaccine_id`=p_vaccine_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getVaccineById` (IN `p_vaccine_id` INT(11))  BEGIN
SELECT `vaccine_id`, `vaccine_name`, `manufacturer`, `price`, `number_of_doses`, `side_effects`, `indication`, `contraindication`, `dosage_and_usage`, `image` FROM vaccine WHERE `vaccine_id`=p_vaccine_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getVaccineDiseaseById` (IN `p_vaccine_id` INT, IN `p_disease_id` INT)  BEGIN
SELECT `vaccine_id`, `disease_id`, `note` FROM vaccine_disease WHERE `vaccine_id`=p_vaccine_id and `disease_id`=p_disease_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getVaccineDiseaseByVaccineId` (IN `p_vaccine_id` INT)  BEGIN
SELECT `vaccine_id`, `disease_id`, `note` FROM vaccine_disease WHERE `vaccine_id`=p_vaccine_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getVaccinesLimit` (IN `p_start` INT(11), IN `p_limit` INT(11))  BEGIN
	SELECT `vaccine_id`, `vaccine_name`, `manufacturer`, `price`, `number_of_doses`, `side_effects`, `indication`, `contraindication`, `dosage_and_usage`, `image` FROM vaccine limit p_start, p_limit;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_insertDisease` (IN `disease_name` VARCHAR(255), IN `description` TEXT)  BEGIN
INSERT INTO disease(`disease_name`, `description`) values (disease_name, description);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_insertNews` (IN `title` TEXT, IN `content` TEXT, IN `image` TEXT, IN `created_date` DATETIME)  BEGIN
INSERT INTO news(`title`, `content`, `image`, `created_date`) values (title, content, image, created_date);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_insertUser` (IN `full_name` VARCHAR(255), IN `gender` INT(11), IN `birthday` DATE, IN `phone_number` VARCHAR(20), IN `address` VARCHAR(255), IN `username` VARCHAR(255), IN `p_password` VARCHAR(255), IN `role` INT, IN `avatar` TEXT)  BEGIN
INSERT INTO user(`full_name`, `gender`, `birthday`, `phone_number`, `address`, `username`, `password`, `role`, `avatar`) VALUES(full_name, gender, birthday, phone_number, address, username, p_password, role, avatar);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_insertVaccinationRecord` (IN `user_id` INT(11), IN `vaccine_id` INT(11), IN `dose` INT(11), IN `injection_date` DATE, IN `next_dose_date` DATE)  BEGIN
INSERT INTO vaccination_record(`user_id`, `vaccine_id`, `dose`, `injection_date`, `next_dose_date`) VALUES(user_id, vaccine_id, dose, injection_date, next_dose_date);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_insertVaccine` (IN `vaccine_name` VARCHAR(255), IN `manufacturer` VARCHAR(255), IN `price` DOUBLE, IN `number_of_doses` INT(11), IN `side_effects` TEXT, IN `indication` TEXT, IN `contraindication` TEXT, IN `dosage_and_usage` TEXT, IN `image` TEXT)  BEGIN
INSERT INTO vaccine(`vaccine_name`, `manufacturer`, `price`, `number_of_doses`, `side_effects`, `indication`, `contraindication`, `dosage_and_usage`, `image`) VALUES(vaccine_name, manufacturer, price, number_of_doses, side_effects, indication, contraindication, dosage_and_usage, image);
SELECT LAST_INSERT_ID() as VACCINE_ID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_insertVaccineDisease` (IN `vaccine_id` INT(11), IN `disease_id` INT(11), IN `note` TEXT)  BEGIN
INSERT INTO vaccine_disease(`vaccine_id`, `disease_id`, `note`) VALUES(vaccine_id, disease_id, note);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_searchUser` (IN `keyword` VARCHAR(255))  BEGIN
SELECT `user_id`, `full_name`, `gender`, `birthday`, `phone_number`, `address`, `username`, `password`, `role`, `avatar` FROM user Where `full_name` LIKE CONCAT('%', keyword COLLATE utf8_unicode_ci, '%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_updateDisease` (IN `disease_name` VARCHAR(255), IN `description` TEXT, IN `p_disease_id` INT(11))  BEGIN
UPDATE `disease` SET `disease_name`=disease_name,`description`=description WHERE `disease_id`=p_disease_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_updateNews` (IN `title` TEXT, IN `content` TEXT, IN `image` TEXT, IN `created_date` DATETIME, IN `p_news_id` INT(11))  BEGIN
UPDATE `news` SET `title`=title,`content`=content,`image`=image,`created_date`=created_date WHERE `news_id`=p_news_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_updateUser` (IN `p_user_id` INT(11), IN `full_name` VARCHAR(255), IN `gender` INT(11), IN `birthday` DATE, IN `phone_number` VARCHAR(20), IN `address` VARCHAR(255), IN `username` VARCHAR(255), IN `p_password` VARCHAR(255), IN `role` INT, IN `avatar` TEXT)  BEGIN
UPDATE `user` SET `full_name`=full_name,`gender`=gender,`birthday`=birthday,`phone_number`=phone_number,`address`=address,`username`=username,`password`=p_password,`role`=role,`avatar`=avatar WHERE `user_id`=p_user_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_updateVaccinationRecord` (IN `injection_date` DATE, IN `next_dose_date` DATE, IN `p_user_id` INT(11), IN `p_vaccine_id` INT(11), IN `p_dose` INT(11))  BEGIN
UPDATE `vaccination_record` SET `injection_date`=injection_date,`next_dose_date`=next_dose_date where `user_id`=p_user_id and`vaccine_id`=p_vaccine_id and `dose`=p_dose;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_updateVaccine` (IN `vaccine_name` VARCHAR(255), IN `manufacturer` VARCHAR(255), IN `price` DOUBLE, IN `number_of_doses` INT(11), IN `side_effects` TEXT, IN `indication` TEXT, IN `contraindication` TEXT, IN `dosage_and_usage` TEXT, IN `image` TEXT, IN `p_vaccine_id` INT(11))  BEGIN
UPDATE `vaccine` SET `vaccine_name`=vaccine_name,`manufacturer`=manufacturer,`price`=price,`number_of_doses`=number_of_doses,`side_effects`=side_effects,`indication`=indication,`contraindication`=contraindication,`dosage_and_usage`=dosage_and_usage,`image`=image where `vaccine_id`=p_vaccine_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_updateVaccineDisease` (IN `note` TEXT, IN `p_vaccine_id` INT(11), IN `p_disease_id` INT(11))  BEGIN
UPDATE `vaccine_disease` SET `note`=note where `vaccine_id`=p_vaccine_id and `disease_id` = p_disease_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `disease`
--

CREATE TABLE `disease` (
  `disease_id` int(11) NOT NULL,
  `disease_name` varchar(255) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Disease''s information table';

--
-- Dumping data for table `disease`
--

INSERT INTO `disease` (`disease_id`, `disease_name`, `description`) VALUES
(1, 'soi', 'asdf');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `content` text,
  `image` text,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `birthday` date NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` bit(1) NOT NULL,
  `avatar` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User''s information table';

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `full_name`, `gender`, `birthday`, `phone_number`, `address`, `username`, `password`, `role`, `avatar`) VALUES
(1, 'kiet', 1, '2016-10-05', '123123', 'dsasd', 'dfsaf', 'asdff', b'1', 'sdfd'),
(2, 'minh', 1, '2016-10-05', '123123', 'dsasd', 'sfd', 'asdff', b'1', 'sdfd'),
(3, 'nam', 1, '2016-10-05', '123123', 'dsasd', 'sfddfd', 'asdff', b'1', 'sdfd');

-- --------------------------------------------------------

--
-- Table structure for table `vaccination_record`
--

CREATE TABLE `vaccination_record` (
  `user_id` int(11) NOT NULL,
  `vaccine_id` int(11) NOT NULL,
  `dose` int(11) NOT NULL,
  `injection_date` date NOT NULL,
  `next_dose_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Vacinnaction-record''s information';

-- --------------------------------------------------------

--
-- Table structure for table `vaccine`
--

CREATE TABLE `vaccine` (
  `vaccine_id` int(11) NOT NULL,
  `vaccine_name` varchar(255) NOT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `number_of_doses` int(11) NOT NULL,
  `side_effects` text,
  `indication` text,
  `contraindication` text,
  `dosage_and_usage` text,
  `image` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Vaccine''s information table';

--
-- Dumping data for table `vaccine`
--

INSERT INTO `vaccine` (`vaccine_id`, `vaccine_name`, `manufacturer`, `price`, `number_of_doses`, `side_effects`, `indication`, `contraindication`, `dosage_and_usage`, `image`) VALUES
(1, 'dasdf', 'df', 345, 4, 'dfg', 'sdf', 'sdfg', 'dsfg', 'Vaccine-2546579886920.');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_disease`
--

CREATE TABLE `vaccine_disease` (
  `vaccine_id` int(11) NOT NULL,
  `disease_id` int(11) NOT NULL,
  `note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vaccine_disease`
--

INSERT INTO `vaccine_disease` (`vaccine_id`, `disease_id`, `note`) VALUES
(1, 1, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `disease`
--
ALTER TABLE `disease`
  ADD PRIMARY KEY (`disease_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- Indexes for table `vaccination_record`
--
ALTER TABLE `vaccination_record`
  ADD PRIMARY KEY (`user_id`,`vaccine_id`,`dose`),
  ADD KEY `fk_vaccination_record_1_idx` (`vaccine_id`);

--
-- Indexes for table `vaccine`
--
ALTER TABLE `vaccine`
  ADD PRIMARY KEY (`vaccine_id`);

--
-- Indexes for table `vaccine_disease`
--
ALTER TABLE `vaccine_disease`
  ADD PRIMARY KEY (`vaccine_id`,`disease_id`),
  ADD KEY `fk_vaccine_disease_disease_idx` (`disease_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `disease`
--
ALTER TABLE `disease`
  MODIFY `disease_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vaccine`
--
ALTER TABLE `vaccine`
  MODIFY `vaccine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `vaccination_record`
--
ALTER TABLE `vaccination_record`
  ADD CONSTRAINT `fk_vaccination_record_1` FOREIGN KEY (`vaccine_id`) REFERENCES `vaccine` (`vaccine_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vaccination_record_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vaccine_disease`
--
ALTER TABLE `vaccine_disease`
  ADD CONSTRAINT `fk_vaccine_disease_disease` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`disease_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vaccine_disease_vaccine` FOREIGN KEY (`vaccine_id`) REFERENCES `vaccine` (`vaccine_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
