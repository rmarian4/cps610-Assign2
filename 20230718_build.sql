/*
 Navicat Premium Data Transfer

 Source Server         : BreweryDOapp
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33-0ubuntu0.22.10.2)
 Source Host           : 159.89.123.27:3306
 Source Schema         : brewery

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33-0ubuntu0.22.10.2)
 File Encoding         : 65001

 Date: 18/07/2023 10:41:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bb_account
-- ----------------------------
DROP TABLE IF EXISTS `bb_account`;
CREATE TABLE `bb_account` (
  `idAccount` int NOT NULL AUTO_INCREMENT,
  `idUsergroup` int NOT NULL,
  `idShopper` int DEFAULT NULL,
  `EmpNo` int DEFAULT NULL,
  `Username` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Active` tinyint(1) NOT NULL,
  PRIMARY KEY (`idAccount`,`idUsergroup`),
  KEY `fk_usergroups_id` (`idUsergroup`),
  CONSTRAINT `fk_usergroups_id` FOREIGN KEY (`idUsergroup`) REFERENCES `bb_usergroups` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of bb_account
-- ----------------------------
BEGIN;
INSERT INTO `bb_account` (`idAccount`, `idUsergroup`, `idShopper`, `EmpNo`, `Username`, `Password`, `Active`) VALUES (1, 2, NULL, 7369, 'Smith', 'pass', 1);
INSERT INTO `bb_account` (`idAccount`, `idUsergroup`, `idShopper`, `EmpNo`, `Username`, `Password`, `Active`) VALUES (2, 2, NULL, 7499, 'Allen', 'pass', 1);
INSERT INTO `bb_account` (`idAccount`, `idUsergroup`, `idShopper`, `EmpNo`, `Username`, `Password`, `Active`) VALUES (3, 2, NULL, 7521, 'Ward', 'pass', 1);
INSERT INTO `bb_account` (`idAccount`, `idUsergroup`, `idShopper`, `EmpNo`, `Username`, `Password`, `Active`) VALUES (4, 2, NULL, 7566, 'Jones', 'pass', 1);
INSERT INTO `bb_account` (`idAccount`, `idUsergroup`, `idShopper`, `EmpNo`, `Username`, `Password`, `Active`) VALUES (5, 2, NULL, 7654, 'Martin', 'pass', 1);
INSERT INTO `bb_account` (`idAccount`, `idUsergroup`, `idShopper`, `EmpNo`, `Username`, `Password`, `Active`) VALUES (6, 2, NULL, 7698, 'Blake', 'pass', 1);
INSERT INTO `bb_account` (`idAccount`, `idUsergroup`, `idShopper`, `EmpNo`, `Username`, `Password`, `Active`) VALUES (7, 2, NULL, 7782, 'Clark', 'pass', 1);
INSERT INTO `bb_account` (`idAccount`, `idUsergroup`, `idShopper`, `EmpNo`, `Username`, `Password`, `Active`) VALUES (8, 2, NULL, 7788, 'Scott', 'pass', 1);
INSERT INTO `bb_account` (`idAccount`, `idUsergroup`, `idShopper`, `EmpNo`, `Username`, `Password`, `Active`) VALUES (9, 1, NULL, 7839, 'King', 'pass', 1);
INSERT INTO `bb_account` (`idAccount`, `idUsergroup`, `idShopper`, `EmpNo`, `Username`, `Password`, `Active`) VALUES (10, 2, NULL, 7844, 'Turner', 'pass', 1);
INSERT INTO `bb_account` (`idAccount`, `idUsergroup`, `idShopper`, `EmpNo`, `Username`, `Password`, `Active`) VALUES (11, 2, NULL, 7876, 'Adams', 'pass', 1);
INSERT INTO `bb_account` (`idAccount`, `idUsergroup`, `idShopper`, `EmpNo`, `Username`, `Password`, `Active`) VALUES (12, 2, NULL, 7900, 'James', 'pass', 1);
INSERT INTO `bb_account` (`idAccount`, `idUsergroup`, `idShopper`, `EmpNo`, `Username`, `Password`, `Active`) VALUES (13, 2, NULL, 7902, 'Ford', 'pass', 1);
INSERT INTO `bb_account` (`idAccount`, `idUsergroup`, `idShopper`, `EmpNo`, `Username`, `Password`, `Active`) VALUES (14, 2, NULL, 7934, 'Miller', 'pass', 1);
INSERT INTO `bb_account` (`idAccount`, `idUsergroup`, `idShopper`, `EmpNo`, `Username`, `Password`, `Active`) VALUES (15, 4, 21, NULL, 'Crackj', 'pass', 1);
INSERT INTO `bb_account` (`idAccount`, `idUsergroup`, `idShopper`, `EmpNo`, `Username`, `Password`, `Active`) VALUES (16, 4, 22, NULL, 'MaryS', 'pass', 1);
INSERT INTO `bb_account` (`idAccount`, `idUsergroup`, `idShopper`, `EmpNo`, `Username`, `Password`, `Active`) VALUES (17, 4, 23, NULL, 'rat55', 'a', 1);
INSERT INTO `bb_account` (`idAccount`, `idUsergroup`, `idShopper`, `EmpNo`, `Username`, `Password`, `Active`) VALUES (18, 4, 24, NULL, 'kids2', 'pass', 1);
INSERT INTO `bb_account` (`idAccount`, `idUsergroup`, `idShopper`, `EmpNo`, `Username`, `Password`, `Active`) VALUES (19, 4, 25, NULL, 'fdwell', 'pass', 1);
INSERT INTO `bb_account` (`idAccount`, `idUsergroup`, `idShopper`, `EmpNo`, `Username`, `Password`, `Active`) VALUES (20, 4, 26, NULL, 'gma1', 'pass', 1);
COMMIT;

-- ----------------------------
-- Table structure for bb_audit_logon
-- ----------------------------
DROP TABLE IF EXISTS `bb_audit_logon`;
CREATE TABLE `bb_audit_logon` (
  `userId` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `logDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of bb_audit_logon
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bb_basket
-- ----------------------------
DROP TABLE IF EXISTS `bb_basket`;
CREATE TABLE `bb_basket` (
  `idBasket` int NOT NULL AUTO_INCREMENT,
  `Quantity` int DEFAULT NULL,
  `idShopper` int DEFAULT NULL,
  `OrderPlaced` tinyint(1) DEFAULT NULL,
  `SubTotal` decimal(7,2) DEFAULT NULL,
  `Total` decimal(7,2) DEFAULT NULL,
  `Shipping` decimal(5,2) DEFAULT NULL,
  `Tax` decimal(5,2) DEFAULT NULL,
  `dtCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Promo` int DEFAULT NULL,
  `ShipFirstName` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipLastName` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipAddress` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipCity` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipState` varchar(2) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipZipCode` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipPhone` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipFax` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipEmail` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BillFirstName` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BillLastName` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BillAddress` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BillCity` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BillState` varchar(2) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BillZipCode` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BillPhone` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BillFax` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BillEmail` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dtOrdered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ShipProvince` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipCountry` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BillProvince` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BillCountry` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CardType` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CardNumber` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ExpMonth` char(2) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ExpYear` char(4) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CardName` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShipBill` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N',
  `ShipFlag` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N',
  PRIMARY KEY (`idBasket`),
  KEY `idShopper` (`idShopper`),
  CONSTRAINT `bb_basket_ibfk_1` FOREIGN KEY (`idShopper`) REFERENCES `bb_shopper` (`idShopper`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of bb_basket
-- ----------------------------
BEGIN;
INSERT INTO `bb_basket` (`idBasket`, `Quantity`, `idShopper`, `OrderPlaced`, `SubTotal`, `Total`, `Shipping`, `Tax`, `dtCreated`, `Promo`, `ShipFirstName`, `ShipLastName`, `ShipAddress`, `ShipCity`, `ShipState`, `ShipZipCode`, `ShipPhone`, `ShipFax`, `ShipEmail`, `BillFirstName`, `BillLastName`, `BillAddress`, `BillCity`, `BillState`, `BillZipCode`, `BillPhone`, `BillFax`, `BillEmail`, `dtOrdered`, `ShipProvince`, `ShipCountry`, `BillProvince`, `BillCountry`, `CardType`, `CardNumber`, `ExpMonth`, `ExpYear`, `CardName`, `ShipBill`, `ShipFlag`) VALUES (3, 3, 21, 1, 26.60, 32.40, 5.00, 0.80, '2012-01-23 00:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-23 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', 'N');
INSERT INTO `bb_basket` (`idBasket`, `Quantity`, `idShopper`, `OrderPlaced`, `SubTotal`, `Total`, `Shipping`, `Tax`, `dtCreated`, `Promo`, `ShipFirstName`, `ShipLastName`, `ShipAddress`, `ShipCity`, `ShipState`, `ShipZipCode`, `ShipPhone`, `ShipFax`, `ShipEmail`, `BillFirstName`, `BillLastName`, `BillAddress`, `BillCity`, `BillState`, `BillZipCode`, `BillPhone`, `BillFax`, `BillEmail`, `dtOrdered`, `ShipProvince`, `ShipCountry`, `BillProvince`, `BillCountry`, `CardType`, `CardNumber`, `ExpMonth`, `ExpYear`, `CardName`, `ShipBill`, `ShipFlag`) VALUES (4, 1, 21, 1, 28.50, 34.36, 5.00, 0.86, '2012-02-12 00:00:00', 0, 'John', 'Carter', '21 Front St.', 'Raleigh', 'NC', '54822', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-12 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', 'N');
INSERT INTO `bb_basket` (`idBasket`, `Quantity`, `idShopper`, `OrderPlaced`, `SubTotal`, `Total`, `Shipping`, `Tax`, `dtCreated`, `Promo`, `ShipFirstName`, `ShipLastName`, `ShipAddress`, `ShipCity`, `ShipState`, `ShipZipCode`, `ShipPhone`, `ShipFax`, `ShipEmail`, `BillFirstName`, `BillLastName`, `BillAddress`, `BillCity`, `BillState`, `BillZipCode`, `BillPhone`, `BillFax`, `BillEmail`, `dtOrdered`, `ShipProvince`, `ShipCountry`, `BillProvince`, `BillCountry`, `CardType`, `CardNumber`, `ExpMonth`, `ExpYear`, `CardName`, `ShipBill`, `ShipFlag`) VALUES (5, 4, 22, 1, 41.60, 48.47, 5.00, 1.87, '2012-02-19 00:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-19 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', 'N');
INSERT INTO `bb_basket` (`idBasket`, `Quantity`, `idShopper`, `OrderPlaced`, `SubTotal`, `Total`, `Shipping`, `Tax`, `dtCreated`, `Promo`, `ShipFirstName`, `ShipLastName`, `ShipAddress`, `ShipCity`, `ShipState`, `ShipZipCode`, `ShipPhone`, `ShipFax`, `ShipEmail`, `BillFirstName`, `BillLastName`, `BillAddress`, `BillCity`, `BillState`, `BillZipCode`, `BillPhone`, `BillFax`, `BillEmail`, `dtOrdered`, `ShipProvince`, `ShipCountry`, `BillProvince`, `BillCountry`, `CardType`, `CardNumber`, `ExpMonth`, `ExpYear`, `CardName`, `ShipBill`, `ShipFlag`) VALUES (6, 3, 22, 1, 149.99, 161.74, 5.00, 6.75, '2012-03-01 00:00:00', 0, 'Margaret', 'Somner', '287 Walnut Drive', 'Chesapeake', 'VA', '23321', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-03-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', 'N');
INSERT INTO `bb_basket` (`idBasket`, `Quantity`, `idShopper`, `OrderPlaced`, `SubTotal`, `Total`, `Shipping`, `Tax`, `dtCreated`, `Promo`, `ShipFirstName`, `ShipLastName`, `ShipAddress`, `ShipCity`, `ShipState`, `ShipZipCode`, `ShipPhone`, `ShipFax`, `ShipEmail`, `BillFirstName`, `BillLastName`, `BillAddress`, `BillCity`, `BillState`, `BillZipCode`, `BillPhone`, `BillFax`, `BillEmail`, `dtOrdered`, `ShipProvince`, `ShipCountry`, `BillProvince`, `BillCountry`, `CardType`, `CardNumber`, `ExpMonth`, `ExpYear`, `CardName`, `ShipBill`, `ShipFlag`) VALUES (7, 2, 23, 1, 21.60, 27.25, 5.00, 0.65, '2012-01-26 00:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-01-26 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', 'N');
INSERT INTO `bb_basket` (`idBasket`, `Quantity`, `idShopper`, `OrderPlaced`, `SubTotal`, `Total`, `Shipping`, `Tax`, `dtCreated`, `Promo`, `ShipFirstName`, `ShipLastName`, `ShipAddress`, `ShipCity`, `ShipState`, `ShipZipCode`, `ShipPhone`, `ShipFax`, `ShipEmail`, `BillFirstName`, `BillLastName`, `BillAddress`, `BillCity`, `BillState`, `BillZipCode`, `BillPhone`, `BillFax`, `BillEmail`, `dtOrdered`, `ShipProvince`, `ShipCountry`, `BillProvince`, `BillCountry`, `CardType`, `CardNumber`, `ExpMonth`, `ExpYear`, `CardName`, `ShipBill`, `ShipFlag`) VALUES (8, 2, 23, 1, 21.60, 27.25, 5.00, 0.65, '2012-02-16 00:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-16 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', 'N');
INSERT INTO `bb_basket` (`idBasket`, `Quantity`, `idShopper`, `OrderPlaced`, `SubTotal`, `Total`, `Shipping`, `Tax`, `dtCreated`, `Promo`, `ShipFirstName`, `ShipLastName`, `ShipAddress`, `ShipCity`, `ShipState`, `ShipZipCode`, `ShipPhone`, `ShipFax`, `ShipEmail`, `BillFirstName`, `BillLastName`, `BillAddress`, `BillCity`, `BillState`, `BillZipCode`, `BillPhone`, `BillFax`, `BillEmail`, `dtOrdered`, `ShipProvince`, `ShipCountry`, `BillProvince`, `BillCountry`, `CardType`, `CardNumber`, `ExpMonth`, `ExpYear`, `CardName`, `ShipBill`, `ShipFlag`) VALUES (9, 2, 23, 1, 21.60, 27.25, 5.00, 0.65, '2012-03-02 00:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-03-02 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', 'N');
INSERT INTO `bb_basket` (`idBasket`, `Quantity`, `idShopper`, `OrderPlaced`, `SubTotal`, `Total`, `Shipping`, `Tax`, `dtCreated`, `Promo`, `ShipFirstName`, `ShipLastName`, `ShipAddress`, `ShipCity`, `ShipState`, `ShipZipCode`, `ShipPhone`, `ShipFax`, `ShipEmail`, `BillFirstName`, `BillLastName`, `BillAddress`, `BillCity`, `BillState`, `BillZipCode`, `BillPhone`, `BillFax`, `BillEmail`, `dtOrdered`, `ShipProvince`, `ShipCountry`, `BillProvince`, `BillCountry`, `CardType`, `CardNumber`, `ExpMonth`, `ExpYear`, `CardName`, `ShipBill`, `ShipFlag`) VALUES (10, 3, 24, 1, 38.90, 45.65, 5.00, 1.75, '2012-02-07 00:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-07 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', 'N');
INSERT INTO `bb_basket` (`idBasket`, `Quantity`, `idShopper`, `OrderPlaced`, `SubTotal`, `Total`, `Shipping`, `Tax`, `dtCreated`, `Promo`, `ShipFirstName`, `ShipLastName`, `ShipAddress`, `ShipCity`, `ShipState`, `ShipZipCode`, `ShipPhone`, `ShipFax`, `ShipEmail`, `BillFirstName`, `BillLastName`, `BillAddress`, `BillCity`, `BillState`, `BillZipCode`, `BillPhone`, `BillFax`, `BillEmail`, `dtOrdered`, `ShipProvince`, `ShipCountry`, `BillProvince`, `BillCountry`, `CardType`, `CardNumber`, `ExpMonth`, `ExpYear`, `CardName`, `ShipBill`, `ShipFlag`) VALUES (11, 1, 24, 1, 10.00, 15.45, 5.00, 0.45, '2012-02-27 00:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-27 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', 'N');
INSERT INTO `bb_basket` (`idBasket`, `Quantity`, `idShopper`, `OrderPlaced`, `SubTotal`, `Total`, `Shipping`, `Tax`, `dtCreated`, `Promo`, `ShipFirstName`, `ShipLastName`, `ShipAddress`, `ShipCity`, `ShipState`, `ShipZipCode`, `ShipPhone`, `ShipFax`, `ShipEmail`, `BillFirstName`, `BillLastName`, `BillAddress`, `BillCity`, `BillState`, `BillZipCode`, `BillPhone`, `BillFax`, `BillEmail`, `dtOrdered`, `ShipProvince`, `ShipCountry`, `BillProvince`, `BillCountry`, `CardType`, `CardNumber`, `ExpMonth`, `ExpYear`, `CardName`, `ShipBill`, `ShipFlag`) VALUES (12, 7, 25, 0, 72.40, 83.66, 8.00, 3.26, '2012-02-19 00:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2012-02-19 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', 'N');
INSERT INTO `bb_basket` (`idBasket`, `Quantity`, `idShopper`, `OrderPlaced`, `SubTotal`, `Total`, `Shipping`, `Tax`, `dtCreated`, `Promo`, `ShipFirstName`, `ShipLastName`, `ShipAddress`, `ShipCity`, `ShipState`, `ShipZipCode`, `ShipPhone`, `ShipFax`, `ShipEmail`, `BillFirstName`, `BillLastName`, `BillAddress`, `BillCity`, `BillState`, `BillZipCode`, `BillPhone`, `BillFax`, `BillEmail`, `dtOrdered`, `ShipProvince`, `ShipCountry`, `BillProvince`, `BillCountry`, `CardType`, `CardNumber`, `ExpMonth`, `ExpYear`, `CardName`, `ShipBill`, `ShipFlag`) VALUES (13, 2, 26, 0, 20.00, 0.00, 0.00, 0.00, '2012-02-09 00:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-30 12:46:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', 'N');
INSERT INTO `bb_basket` (`idBasket`, `Quantity`, `idShopper`, `OrderPlaced`, `SubTotal`, `Total`, `Shipping`, `Tax`, `dtCreated`, `Promo`, `ShipFirstName`, `ShipLastName`, `ShipAddress`, `ShipCity`, `ShipState`, `ShipZipCode`, `ShipPhone`, `ShipFax`, `ShipEmail`, `BillFirstName`, `BillLastName`, `BillAddress`, `BillCity`, `BillState`, `BillZipCode`, `BillPhone`, `BillFax`, `BillEmail`, `dtOrdered`, `ShipProvince`, `ShipCountry`, `BillProvince`, `BillCountry`, `CardType`, `CardNumber`, `ExpMonth`, `ExpYear`, `CardName`, `ShipBill`, `ShipFlag`) VALUES (14, 0, 26, 0, 0.00, 0.00, 0.00, 0.00, '2012-02-10 00:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-30 12:46:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', 'N');
INSERT INTO `bb_basket` (`idBasket`, `Quantity`, `idShopper`, `OrderPlaced`, `SubTotal`, `Total`, `Shipping`, `Tax`, `dtCreated`, `Promo`, `ShipFirstName`, `ShipLastName`, `ShipAddress`, `ShipCity`, `ShipState`, `ShipZipCode`, `ShipPhone`, `ShipFax`, `ShipEmail`, `BillFirstName`, `BillLastName`, `BillAddress`, `BillCity`, `BillState`, `BillZipCode`, `BillPhone`, `BillFax`, `BillEmail`, `dtOrdered`, `ShipProvince`, `ShipCountry`, `BillProvince`, `BillCountry`, `CardType`, `CardNumber`, `ExpMonth`, `ExpYear`, `CardName`, `ShipBill`, `ShipFlag`) VALUES (15, 2, 27, 0, 16.20, 21.69, 5.00, 0.49, '2012-02-14 00:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-30 12:46:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', 'N');
COMMIT;

-- ----------------------------
-- Table structure for bb_basket_item
-- ----------------------------
DROP TABLE IF EXISTS `bb_basket_item`;
CREATE TABLE `bb_basket_item` (
  `idBasketItem` int NOT NULL AUTO_INCREMENT,
  `idProduct` int DEFAULT NULL,
  `Price` decimal(6,2) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `idBasket` int DEFAULT NULL,
  `option1` int DEFAULT NULL,
  `option2` int DEFAULT NULL,
  PRIMARY KEY (`idBasketItem`),
  KEY `bb_basket_item_ibfk_2` (`idProduct`),
  KEY `bb_basket_item_ibfk_1` (`idBasket`),
  CONSTRAINT `bb_basket_item_ibfk_1` FOREIGN KEY (`idBasket`) REFERENCES `bb_basket` (`idBasket`),
  CONSTRAINT `bb_basket_item_ibfk_2` FOREIGN KEY (`idProduct`) REFERENCES `bb_product` (`idProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of bb_basket_item
-- ----------------------------
BEGIN;
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (15, 6, 5.00, 1, 3, 1, 4);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (16, 8, 10.80, 2, 3, 2, 4);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (17, 4, 28.50, 1, 4, NULL, NULL);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (18, 7, 10.80, 1, 5, 2, 3);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (19, 8, 10.80, 1, 5, 2, 3);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (20, 9, 10.00, 1, 5, 2, 3);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (21, 10, 10.00, 1, 5, 2, 3);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (22, 10, 10.00, 2, 6, 2, 4);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (23, 2, 129.99, 1, 6, NULL, NULL);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (24, 7, 10.80, 1, 7, 2, 3);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (25, 8, 10.80, 1, 7, 2, 3);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (26, 7, 10.80, 1, 8, 2, 3);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (27, 8, 10.80, 1, 8, 2, 3);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (28, 7, 10.80, 1, 9, 2, 3);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (29, 8, 10.80, 1, 9, 2, 3);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (30, 6, 5.00, 1, 10, 1, 3);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (31, 8, 5.40, 1, 10, 1, 3);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (32, 4, 28.50, 1, 10, NULL, NULL);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (33, 9, 10.00, 1, 11, 2, 3);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (34, 8, 10.80, 2, 12, 2, 3);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (35, 9, 10.00, 2, 12, 2, 3);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (36, 6, 10.00, 2, 12, 2, 3);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (37, 7, 10.80, 1, 12, 2, 3);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (38, 9, 10.00, 2, 13, 2, 3);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (40, 8, 10.80, 1, 15, 2, 3);
INSERT INTO `bb_basket_item` (`idBasketItem`, `idProduct`, `Price`, `Quantity`, `idBasket`, `option1`, `option2`) VALUES (41, 7, 5.40, 1, 15, 1, 3);
COMMIT;

-- ----------------------------
-- Table structure for bb_basket_status
-- ----------------------------
DROP TABLE IF EXISTS `bb_basket_status`;
CREATE TABLE `bb_basket_status` (
  `idStatus` int NOT NULL,
  `idBasket` int DEFAULT NULL,
  `idStage` tinyint(1) DEFAULT NULL,
  `dtStage` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Notes` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Shipper` varchar(5) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ShippingNum` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idStatus`),
  KEY `bb_basket_status_ibfk_1` (`idBasket`),
  CONSTRAINT `bb_basket_status_ibfk_1` FOREIGN KEY (`idBasket`) REFERENCES `bb_basket` (`idBasket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of bb_basket_status
-- ----------------------------
BEGIN;
INSERT INTO `bb_basket_status` (`idStatus`, `idBasket`, `idStage`, `dtStage`, `Notes`, `Shipper`, `ShippingNum`) VALUES (1, 3, 1, '2012-01-24 00:00:00', NULL, NULL, NULL);
INSERT INTO `bb_basket_status` (`idStatus`, `idBasket`, `idStage`, `dtStage`, `Notes`, `Shipper`, `ShippingNum`) VALUES (2, 3, 5, '2023-06-30 12:50:27', 'Customer called to confirm shipment', 'UPS', 'ZW845584GD89H569');
INSERT INTO `bb_basket_status` (`idStatus`, `idBasket`, `idStage`, `dtStage`, `Notes`, `Shipper`, `ShippingNum`) VALUES (3, 4, 1, '2012-02-13 00:00:00', NULL, NULL, NULL);
INSERT INTO `bb_basket_status` (`idStatus`, `idBasket`, `idStage`, `dtStage`, `Notes`, `Shipper`, `ShippingNum`) VALUES (4, 4, 5, '2012-02-14 00:00:00', NULL, NULL, NULL);
INSERT INTO `bb_basket_status` (`idStatus`, `idBasket`, `idStage`, `dtStage`, `Notes`, `Shipper`, `ShippingNum`) VALUES (15, 12, 3, '2023-06-30 12:47:12', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for bb_checkout
-- ----------------------------
DROP TABLE IF EXISTS `bb_checkout`;
CREATE TABLE `bb_checkout` (
  `idCheckout` int NOT NULL AUTO_INCREMENT,
  `idShopper` int NOT NULL,
  `Quantity` int NOT NULL,
  `CartDetails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `SubTotal` decimal(10,2) DEFAULT NULL,
  `Tax` decimal(10,3) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `dtCreated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idCheckout`),
  UNIQUE KEY `idShopper` (`idShopper`),
  CONSTRAINT `bb_checkout_chk_1` CHECK (json_valid(`CartDetails`))
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of bb_checkout
-- ----------------------------
BEGIN;
INSERT INTO `bb_checkout` (`idCheckout`, `idShopper`, `Quantity`, `CartDetails`, `SubTotal`, `Tax`, `Total`, `dtCreated`) VALUES (1, 26, 1, '[{\"productId\": \"10\", \"name\": \"Espresso\", \"description\": \"dense, caramel-like sweetness with a soft acidity. Roasted somewhat darker than traditional Italian.\", \"price\": \"10.00\", \"form\": \"  Whole Bean \", \"option1\": \"4\", \"option2\": \"2\", \"size\": \"  1/2 LB.\", \"quantity\": 1}]', 10.00, 0.450, 10.45, '2023-07-04 23:27:33');
INSERT INTO `bb_checkout` (`idCheckout`, `idShopper`, `Quantity`, `CartDetails`, `SubTotal`, `Tax`, `Total`, `dtCreated`) VALUES (21, 21, 2, '[{\"productId\": \"5\", \"name\": \"Sumatra\", \"description\": \"Spicy and intense with herbal aroma. \", \"price\": \"10.50\", \"form\": \"  Whole Bean \", \"option1\": \"3\", \"option2\": \"1\", \"size\": \"  1/2 LB.\", \"quantity\": 5}, {\"productId\": \"1\", \"name\": \"CapressoBar Model #351\", \"description\": \"A fully programmable pump espresso machine and 10-cup coffee maker complete with GoldTone filter\", \"price\": \"99.99\", \"form\": null, \"option1\": null, \"option2\": null, \"size\": null, \"quantity\": 1}]', 152.49, 4.575, 157.06, '2023-07-16 20:41:13');
COMMIT;

-- ----------------------------
-- Table structure for bb_department
-- ----------------------------
DROP TABLE IF EXISTS `bb_department`;
CREATE TABLE `bb_department` (
  `idDepartment` int NOT NULL,
  `DeptName` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DeptDesc` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DeptImage` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idDepartment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of bb_department
-- ----------------------------
BEGIN;
INSERT INTO `bb_department` (`idDepartment`, `DeptName`, `DeptDesc`, `DeptImage`) VALUES (1, 'Coffee', 'Many types of coffee beans', 'coffee.gif');
INSERT INTO `bb_department` (`idDepartment`, `DeptName`, `DeptDesc`, `DeptImage`) VALUES (2, 'Equipment and Supplies', 'Coffee makers to coffee filters available', 'machines.gif');
INSERT INTO `bb_department` (`idDepartment`, `DeptName`, `DeptDesc`, `DeptImage`) VALUES (3, 'Coffee Club', 'Benefits of our club membership?', 'club.gif');
COMMIT;

-- ----------------------------
-- Table structure for bb_employee
-- ----------------------------
DROP TABLE IF EXISTS `bb_employee`;
CREATE TABLE `bb_employee` (
  `EmpNo` int NOT NULL,
  `UsergroupNo` int NOT NULL DEFAULT '3',
  `EName` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Username` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Job` varchar(9) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Mgr` int DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `Sal` decimal(7,2) DEFAULT NULL,
  `Comm` decimal(7,2) DEFAULT NULL,
  `DeptNo` int NOT NULL,
  PRIMARY KEY (`EmpNo`),
  KEY `fk_usergroup` (`UsergroupNo`),
  CONSTRAINT `fk_usergroup` FOREIGN KEY (`UsergroupNo`) REFERENCES `bb_usergroups` (`Id`),
  CONSTRAINT `CONSTRAINT_1` CHECK ((`Sal` < 100000))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of bb_employee
-- ----------------------------
BEGIN;
INSERT INTO `bb_employee` (`EmpNo`, `UsergroupNo`, `EName`, `Username`, `Password`, `Job`, `Mgr`, `HireDate`, `Sal`, `Comm`, `DeptNo`) VALUES (7369, 2, 'SMITH', 'Smith', 'pass', 'CLERK', 7902, '2003-12-17', 800.00, NULL, 20);
INSERT INTO `bb_employee` (`EmpNo`, `UsergroupNo`, `EName`, `Username`, `Password`, `Job`, `Mgr`, `HireDate`, `Sal`, `Comm`, `DeptNo`) VALUES (7499, 2, 'ALLEN', 'Allen', 'pass', 'SALESMAN', 7698, '1999-02-20', 1600.00, 300.00, 30);
INSERT INTO `bb_employee` (`EmpNo`, `UsergroupNo`, `EName`, `Username`, `Password`, `Job`, `Mgr`, `HireDate`, `Sal`, `Comm`, `DeptNo`) VALUES (7521, 2, 'WARD', 'Ward', 'pass', 'SALESMAN', 7698, '2003-02-22', 1250.00, 500.00, 30);
INSERT INTO `bb_employee` (`EmpNo`, `UsergroupNo`, `EName`, `Username`, `Password`, `Job`, `Mgr`, `HireDate`, `Sal`, `Comm`, `DeptNo`) VALUES (7566, 2, 'JONES', 'Jones', 'pass', 'MANAGER', 7839, '1991-04-02', 2975.00, NULL, 20);
INSERT INTO `bb_employee` (`EmpNo`, `UsergroupNo`, `EName`, `Username`, `Password`, `Job`, `Mgr`, `HireDate`, `Sal`, `Comm`, `DeptNo`) VALUES (7654, 2, 'MARTIN', 'Martin', 'pass', 'SALESMAN', 7698, '1997-09-28', 1250.00, 1400.00, 30);
INSERT INTO `bb_employee` (`EmpNo`, `UsergroupNo`, `EName`, `Username`, `Password`, `Job`, `Mgr`, `HireDate`, `Sal`, `Comm`, `DeptNo`) VALUES (7698, 2, 'BLAKE', 'Blake', 'pass', 'MANAGER', 7839, '1998-05-01', 2850.00, NULL, 30);
INSERT INTO `bb_employee` (`EmpNo`, `UsergroupNo`, `EName`, `Username`, `Password`, `Job`, `Mgr`, `HireDate`, `Sal`, `Comm`, `DeptNo`) VALUES (7782, 2, 'CLARK', 'Clark', 'pass', 'MANAGER', 7839, '1996-06-09', 2450.00, NULL, 10);
INSERT INTO `bb_employee` (`EmpNo`, `UsergroupNo`, `EName`, `Username`, `Password`, `Job`, `Mgr`, `HireDate`, `Sal`, `Comm`, `DeptNo`) VALUES (7788, 2, 'SCOTT', 'Scott', 'pass', 'ANALYST', 7566, '2004-12-09', 3000.00, NULL, 20);
INSERT INTO `bb_employee` (`EmpNo`, `UsergroupNo`, `EName`, `Username`, `Password`, `Job`, `Mgr`, `HireDate`, `Sal`, `Comm`, `DeptNo`) VALUES (7839, 1, 'KING', 'King', 'pass', 'PRESIDENT', NULL, '1991-11-17', 5000.00, NULL, 10);
INSERT INTO `bb_employee` (`EmpNo`, `UsergroupNo`, `EName`, `Username`, `Password`, `Job`, `Mgr`, `HireDate`, `Sal`, `Comm`, `DeptNo`) VALUES (7844, 2, 'TURNER', 'Turner', 'pass', 'SALESMAN', 7698, '1999-09-08', 1500.00, 0.00, 30);
INSERT INTO `bb_employee` (`EmpNo`, `UsergroupNo`, `EName`, `Username`, `Password`, `Job`, `Mgr`, `HireDate`, `Sal`, `Comm`, `DeptNo`) VALUES (7876, 2, 'ADAMS', 'Adams', 'pass', 'CLERK', 7788, '1999-01-12', 1100.00, NULL, 20);
INSERT INTO `bb_employee` (`EmpNo`, `UsergroupNo`, `EName`, `Username`, `Password`, `Job`, `Mgr`, `HireDate`, `Sal`, `Comm`, `DeptNo`) VALUES (7900, 2, 'JAMES', 'James', 'pass', 'CLERK', 7698, '2001-12-03', 950.00, NULL, 30);
INSERT INTO `bb_employee` (`EmpNo`, `UsergroupNo`, `EName`, `Username`, `Password`, `Job`, `Mgr`, `HireDate`, `Sal`, `Comm`, `DeptNo`) VALUES (7902, 2, 'FORD', 'Ford', 'pass', 'ANALYST', 7566, '2005-12-03', 3000.00, NULL, 20);
INSERT INTO `bb_employee` (`EmpNo`, `UsergroupNo`, `EName`, `Username`, `Password`, `Job`, `Mgr`, `HireDate`, `Sal`, `Comm`, `DeptNo`) VALUES (7934, 2, 'MILLER', 'Miller', 'pass', 'CLERK', 7782, '2000-01-23', 1300.00, NULL, 10);
COMMIT;

-- ----------------------------
-- Table structure for bb_prod_sales
-- ----------------------------
DROP TABLE IF EXISTS `bb_prod_sales`;
CREATE TABLE `bb_prod_sales` (
  `idProduct` int DEFAULT NULL,
  `month` char(3) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `year` char(4) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `total` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of bb_prod_sales
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bb_product
-- ----------------------------
DROP TABLE IF EXISTS `bb_product`;
CREATE TABLE `bb_product` (
  `idProduct` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProductImage` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Price` decimal(6,2) DEFAULT NULL,
  `SaleStart` date DEFAULT NULL,
  `SaleEnd` date DEFAULT NULL,
  `SalePrice` decimal(6,2) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `Featured` tinyint(1) DEFAULT NULL,
  `FeatureStart` date DEFAULT NULL,
  `FeatureEnd` date DEFAULT NULL,
  `Type` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idDepartment` int NOT NULL,
  `Stock` int DEFAULT '0',
  `Ordered` int DEFAULT '0',
  `Reorder` int DEFAULT '0',
  PRIMARY KEY (`idProduct`),
  KEY `idDepartment` (`idDepartment`),
  CONSTRAINT `bb_product_ibfk_1` FOREIGN KEY (`idDepartment`) REFERENCES `bb_department` (`idDepartment`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of bb_product
-- ----------------------------
BEGIN;
INSERT INTO `bb_product` (`idProduct`, `ProductName`, `Description`, `ProductImage`, `Price`, `SaleStart`, `SaleEnd`, `SalePrice`, `Active`, `Featured`, `FeatureStart`, `FeatureEnd`, `Type`, `idDepartment`, `Stock`, `Ordered`, `Reorder`) VALUES (1, 'CapressoBar Model #351', 'A fully programmable pump espresso machine and 10-cup coffee maker complete with GoldTone filter', 'capresso.gif', 99.99, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'E', 2, 23, 0, 12);
INSERT INTO `bb_product` (`idProduct`, `ProductName`, `Description`, `ProductImage`, `Price`, `SaleStart`, `SaleEnd`, `SalePrice`, `Active`, `Featured`, `FeatureStart`, `FeatureEnd`, `Type`, `idDepartment`, `Stock`, `Ordered`, `Reorder`) VALUES (2, 'Capresso Ultima', 'Coffee and Espresso and Cappuccino Machine. Brews from one espresso to two six ounce cups of coffee', 'capresso2.gif', 129.99, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'E', 2, 15, 0, 9);
INSERT INTO `bb_product` (`idProduct`, `ProductName`, `Description`, `ProductImage`, `Price`, `SaleStart`, `SaleEnd`, `SalePrice`, `Active`, `Featured`, `FeatureStart`, `FeatureEnd`, `Type`, `idDepartment`, `Stock`, `Ordered`, `Reorder`) VALUES (3, 'Eileen 4-cup French Press', 'A unique coffeemaker from those proud craftsmen in windy Normandy.', 'frepress.gif', 32.50, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'E', 2, 30, 0, 15);
INSERT INTO `bb_product` (`idProduct`, `ProductName`, `Description`, `ProductImage`, `Price`, `SaleStart`, `SaleEnd`, `SalePrice`, `Active`, `Featured`, `FeatureStart`, `FeatureEnd`, `Type`, `idDepartment`, `Stock`, `Ordered`, `Reorder`) VALUES (4, 'Coffee Grinder', 'Avoid blade grinders! This mill grinder allows you to choose a fine grind to a coarse grind.', 'grind.gif', 28.50, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'E', 2, 26, 0, 25);
INSERT INTO `bb_product` (`idProduct`, `ProductName`, `Description`, `ProductImage`, `Price`, `SaleStart`, `SaleEnd`, `SalePrice`, `Active`, `Featured`, `FeatureStart`, `FeatureEnd`, `Type`, `idDepartment`, `Stock`, `Ordered`, `Reorder`) VALUES (5, 'Sumatra', 'Spicy and intense with herbal aroma. ', 'sumatra.jpg', 10.50, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'C', 1, 41, 0, 45);
INSERT INTO `bb_product` (`idProduct`, `ProductName`, `Description`, `ProductImage`, `Price`, `SaleStart`, `SaleEnd`, `SalePrice`, `Active`, `Featured`, `FeatureStart`, `FeatureEnd`, `Type`, `idDepartment`, `Stock`, `Ordered`, `Reorder`) VALUES (6, 'Guatamala', 'heavy body, spicy twist, aromatic and smokey flavor.', 'guatamala.jpg', 10.00, '2012-06-01', '2012-06-15', 8.00, 1, NULL, NULL, NULL, 'C', 1, 42, 0, 35);
INSERT INTO `bb_product` (`idProduct`, `ProductName`, `Description`, `ProductImage`, `Price`, `SaleStart`, `SaleEnd`, `SalePrice`, `Active`, `Featured`, `FeatureStart`, `FeatureEnd`, `Type`, `idDepartment`, `Stock`, `Ordered`, `Reorder`) VALUES (7, 'Columbia', 'dry, nutty flavor and smoothness', 'columbia.jpg', 10.80, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'C', 1, 61, 0, 35);
INSERT INTO `bb_product` (`idProduct`, `ProductName`, `Description`, `ProductImage`, `Price`, `SaleStart`, `SaleEnd`, `SalePrice`, `Active`, `Featured`, `FeatureStart`, `FeatureEnd`, `Type`, `idDepartment`, `Stock`, `Ordered`, `Reorder`) VALUES (8, 'Brazil', 'well-balanced mellow flavor, a medium body with hints of cocoa and a mild, nut-like aftertaste', 'brazil.jpg', 10.80, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'C', 1, 53, 0, 35);
INSERT INTO `bb_product` (`idProduct`, `ProductName`, `Description`, `ProductImage`, `Price`, `SaleStart`, `SaleEnd`, `SalePrice`, `Active`, `Featured`, `FeatureStart`, `FeatureEnd`, `Type`, `idDepartment`, `Stock`, `Ordered`, `Reorder`) VALUES (9, 'Ethiopia', 'distinctive berry-like flavor and aroma, reminds many of a fruity, memorable wine. ', 'ethiopia.jpg', 10.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'C', 1, 54, 0, 35);
INSERT INTO `bb_product` (`idProduct`, `ProductName`, `Description`, `ProductImage`, `Price`, `SaleStart`, `SaleEnd`, `SalePrice`, `Active`, `Featured`, `FeatureStart`, `FeatureEnd`, `Type`, `idDepartment`, `Stock`, `Ordered`, `Reorder`) VALUES (10, 'Espresso', 'dense, caramel-like sweetness with a soft acidity. Roasted somewhat darker than traditional Italian.', 'espresso.jpg', 10.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'C', 1, 50, 50, 50);
INSERT INTO `bb_product` (`idProduct`, `ProductName`, `Description`, `ProductImage`, `Price`, `SaleStart`, `SaleEnd`, `SalePrice`, `Active`, `Featured`, `FeatureStart`, `FeatureEnd`, `Type`, `idDepartment`, `Stock`, `Ordered`, `Reorder`) VALUES (11, 'Roasted Blend', 'Well-balanced mix of roasted beans, a medium body', 'roasted.jpg', 9.50, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 0, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for bb_product_option
-- ----------------------------
DROP TABLE IF EXISTS `bb_product_option`;
CREATE TABLE `bb_product_option` (
  `idProductOption` int NOT NULL,
  `idOption` int DEFAULT NULL,
  `idProduct` int DEFAULT NULL,
  PRIMARY KEY (`idProductOption`),
  KEY `bb_product_option_ibfk_1` (`idProduct`),
  CONSTRAINT `bb_product_option_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `bb_product` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of bb_product_option
-- ----------------------------
BEGIN;
INSERT INTO `bb_product_option` (`idProductOption`, `idOption`, `idProduct`) VALUES (1, 1, 5);
INSERT INTO `bb_product_option` (`idProductOption`, `idOption`, `idProduct`) VALUES (2, 2, 5);
INSERT INTO `bb_product_option` (`idProductOption`, `idOption`, `idProduct`) VALUES (3, 3, 5);
INSERT INTO `bb_product_option` (`idProductOption`, `idOption`, `idProduct`) VALUES (4, 4, 5);
INSERT INTO `bb_product_option` (`idProductOption`, `idOption`, `idProduct`) VALUES (5, 1, 6);
INSERT INTO `bb_product_option` (`idProductOption`, `idOption`, `idProduct`) VALUES (6, 2, 6);
INSERT INTO `bb_product_option` (`idProductOption`, `idOption`, `idProduct`) VALUES (7, 3, 6);
INSERT INTO `bb_product_option` (`idProductOption`, `idOption`, `idProduct`) VALUES (8, 4, 6);
INSERT INTO `bb_product_option` (`idProductOption`, `idOption`, `idProduct`) VALUES (9, 1, 7);
INSERT INTO `bb_product_option` (`idProductOption`, `idOption`, `idProduct`) VALUES (10, 2, 7);
INSERT INTO `bb_product_option` (`idProductOption`, `idOption`, `idProduct`) VALUES (11, 3, 7);
INSERT INTO `bb_product_option` (`idProductOption`, `idOption`, `idProduct`) VALUES (12, 4, 7);
INSERT INTO `bb_product_option` (`idProductOption`, `idOption`, `idProduct`) VALUES (13, 1, 8);
INSERT INTO `bb_product_option` (`idProductOption`, `idOption`, `idProduct`) VALUES (14, 2, 8);
INSERT INTO `bb_product_option` (`idProductOption`, `idOption`, `idProduct`) VALUES (15, 3, 8);
INSERT INTO `bb_product_option` (`idProductOption`, `idOption`, `idProduct`) VALUES (16, 4, 8);
INSERT INTO `bb_product_option` (`idProductOption`, `idOption`, `idProduct`) VALUES (17, 1, 9);
INSERT INTO `bb_product_option` (`idProductOption`, `idOption`, `idProduct`) VALUES (18, 2, 9);
INSERT INTO `bb_product_option` (`idProductOption`, `idOption`, `idProduct`) VALUES (19, 3, 9);
INSERT INTO `bb_product_option` (`idProductOption`, `idOption`, `idProduct`) VALUES (20, 4, 9);
INSERT INTO `bb_product_option` (`idProductOption`, `idOption`, `idProduct`) VALUES (21, 1, 10);
INSERT INTO `bb_product_option` (`idProductOption`, `idOption`, `idProduct`) VALUES (22, 2, 10);
INSERT INTO `bb_product_option` (`idProductOption`, `idOption`, `idProduct`) VALUES (23, 3, 10);
INSERT INTO `bb_product_option` (`idProductOption`, `idOption`, `idProduct`) VALUES (24, 4, 10);
COMMIT;

-- ----------------------------
-- Table structure for bb_product_option_category
-- ----------------------------
DROP TABLE IF EXISTS `bb_product_option_category`;
CREATE TABLE `bb_product_option_category` (
  `idOptionCategory` int NOT NULL,
  `CategoryName` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idOptionCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of bb_product_option_category
-- ----------------------------
BEGIN;
INSERT INTO `bb_product_option_category` (`idOptionCategory`, `CategoryName`) VALUES (1, 'Size');
INSERT INTO `bb_product_option_category` (`idOptionCategory`, `CategoryName`) VALUES (2, 'Form');
COMMIT;

-- ----------------------------
-- Table structure for bb_product_option_detail
-- ----------------------------
DROP TABLE IF EXISTS `bb_product_option_detail`;
CREATE TABLE `bb_product_option_detail` (
  `idOption` int NOT NULL,
  `OptionName` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idOptionCategory` int DEFAULT NULL,
  PRIMARY KEY (`idOption`),
  KEY `idOptionCategory` (`idOptionCategory`),
  CONSTRAINT `bb_product_option_detail_ibfk_1` FOREIGN KEY (`idOptionCategory`) REFERENCES `bb_product_option_category` (`idOptionCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of bb_product_option_detail
-- ----------------------------
BEGIN;
INSERT INTO `bb_product_option_detail` (`idOption`, `OptionName`, `idOptionCategory`) VALUES (1, '1/2 LB.', 1);
INSERT INTO `bb_product_option_detail` (`idOption`, `OptionName`, `idOptionCategory`) VALUES (2, '1 LB.', 1);
INSERT INTO `bb_product_option_detail` (`idOption`, `OptionName`, `idOptionCategory`) VALUES (3, 'Whole Bean', 2);
INSERT INTO `bb_product_option_detail` (`idOption`, `OptionName`, `idOptionCategory`) VALUES (4, 'Regular Grind', 2);
COMMIT;

-- ----------------------------
-- Table structure for bb_product_request
-- ----------------------------
DROP TABLE IF EXISTS `bb_product_request`;
CREATE TABLE `bb_product_request` (
  `idRequest` int NOT NULL,
  `idProduct` int DEFAULT NULL,
  `dtRequest` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dtRecd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cost` decimal(6,2) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `idVendor` int DEFAULT NULL,
  PRIMARY KEY (`idRequest`),
  KEY `bb_product_request_ibfk_1` (`idProduct`),
  CONSTRAINT `bb_product_request_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `bb_product` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of bb_product_request
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bb_promo
-- ----------------------------
DROP TABLE IF EXISTS `bb_promo`;
CREATE TABLE `bb_promo` (
  `idPromo` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `amount` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of bb_promo
-- ----------------------------
BEGIN;
INSERT INTO `bb_promo` (`idPromo`, `amount`) VALUES ('B', 0.05);
COMMIT;

-- ----------------------------
-- Table structure for bb_promo_list
-- ----------------------------
DROP TABLE IF EXISTS `bb_promo_list`;
CREATE TABLE `bb_promo_list` (
  `idShopper` int DEFAULT NULL,
  `month` char(3) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `year` char(4) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `promo_flag` char(2) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Used` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N',
  UNIQUE KEY `idShopper` (`idShopper`,`month`,`year`),
  CONSTRAINT `bb_promo_list_ibfk_1` FOREIGN KEY (`idShopper`) REFERENCES `bb_shopper` (`idShopper`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of bb_promo_list
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bb_shipping
-- ----------------------------
DROP TABLE IF EXISTS `bb_shipping`;
CREATE TABLE `bb_shipping` (
  `idRange` int NOT NULL,
  `Low` int DEFAULT NULL,
  `High` int DEFAULT NULL,
  `Fee` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`idRange`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of bb_shipping
-- ----------------------------
BEGIN;
INSERT INTO `bb_shipping` (`idRange`, `Low`, `High`, `Fee`) VALUES (1, 1, 5, 5.00);
INSERT INTO `bb_shipping` (`idRange`, `Low`, `High`, `Fee`) VALUES (2, 6, 10, 8.00);
INSERT INTO `bb_shipping` (`idRange`, `Low`, `High`, `Fee`) VALUES (3, 11, 99, 11.00);
COMMIT;

-- ----------------------------
-- Table structure for bb_shop_sales
-- ----------------------------
DROP TABLE IF EXISTS `bb_shop_sales`;
CREATE TABLE `bb_shop_sales` (
  `idShopper` int DEFAULT NULL,
  `total` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of bb_shop_sales
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bb_shopper
-- ----------------------------
DROP TABLE IF EXISTS `bb_shopper`;
CREATE TABLE `bb_shopper` (
  `idShopper` int NOT NULL,
  `FirstName` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LastName` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Address` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `City` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `State` char(2) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ZipCode` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Phone` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Fax` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Email` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cookie` int DEFAULT '0',
  `dtEntered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Province` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Country` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `promo` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idShopper`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of bb_shopper
-- ----------------------------
BEGIN;
INSERT INTO `bb_shopper` (`idShopper`, `FirstName`, `LastName`, `Address`, `City`, `State`, `ZipCode`, `Phone`, `Fax`, `Email`, `Cookie`, `dtEntered`, `Province`, `Country`, `promo`) VALUES (21, 'John', 'Carter', '21 Front St.', 'Raleigh', 'NC', '54822', '9014317701', NULL, 'Crackjack@aol.com', 1, '2012-01-13 00:00:00', NULL, 'USA', NULL);
INSERT INTO `bb_shopper` (`idShopper`, `FirstName`, `LastName`, `Address`, `City`, `State`, `ZipCode`, `Phone`, `Fax`, `Email`, `Cookie`, `dtEntered`, `Province`, `Country`, `promo`) VALUES (22, 'Margaret', 'Somner', '287 Walnut Drive', 'Cheasapeake', 'VA', '23321', '7574216559', NULL, 'MargS@infi.net', 1, '2012-02-03 00:00:00', NULL, 'USA', NULL);
INSERT INTO `bb_shopper` (`idShopper`, `FirstName`, `LastName`, `Address`, `City`, `State`, `ZipCode`, `Phone`, `Fax`, `Email`, `Cookie`, `dtEntered`, `Province`, `Country`, `promo`) VALUES (23, 'Kenny', 'Ratman', '1 Fun Lane', 'South Park', 'NC', '54674', '9015680902', '', 'ratboy@msn.net', 0, '2012-01-26 00:00:00', '', 'USA', '');
INSERT INTO `bb_shopper` (`idShopper`, `FirstName`, `LastName`, `Address`, `City`, `State`, `ZipCode`, `Phone`, `Fax`, `Email`, `Cookie`, `dtEntered`, `Province`, `Country`, `promo`) VALUES (24, 'Camryn', 'Sonnie', '40162 Talamore', 'South Riding', 'VA', '20152', '7035556868', NULL, 'kids2@xis.net', 1, '2012-03-19 00:00:00', NULL, 'USA', NULL);
INSERT INTO `bb_shopper` (`idShopper`, `FirstName`, `LastName`, `Address`, `City`, `State`, `ZipCode`, `Phone`, `Fax`, `Email`, `Cookie`, `dtEntered`, `Province`, `Country`, `promo`) VALUES (25, 'Scott', 'Savid', '11 Pine Grove', 'Hickory', 'VA', '22954', '7578221010', '', 'scott1@odu.edu', 1, '2012-02-19 00:00:00', '', 'USA', '');
INSERT INTO `bb_shopper` (`idShopper`, `FirstName`, `LastName`, `Address`, `City`, `State`, `ZipCode`, `Phone`, `Fax`, `Email`, `Cookie`, `dtEntered`, `Province`, `Country`, `promo`) VALUES (26, 'Monica', 'Cast', '112 W. 4th', 'Greensburg', 'VA', '27754', '7573217384', '', 'gma@earth.net', 1, '2012-02-09 00:00:00', '', 'USA', '');
INSERT INTO `bb_shopper` (`idShopper`, `FirstName`, `LastName`, `Address`, `City`, `State`, `ZipCode`, `Phone`, `Fax`, `Email`, `Cookie`, `dtEntered`, `Province`, `Country`, `promo`) VALUES (27, 'Pete', 'Parker', '1 Queens', 'New York', 'NY', '67233', '1013217384', NULL, 'spider@web.net', 0, '2012-02-14 00:00:00', NULL, 'USA', NULL);
COMMIT;

-- ----------------------------
-- Table structure for bb_tax
-- ----------------------------
DROP TABLE IF EXISTS `bb_tax`;
CREATE TABLE `bb_tax` (
  `idState` int NOT NULL,
  `State` char(2) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TaxRate` decimal(4,3) DEFAULT NULL,
  PRIMARY KEY (`idState`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of bb_tax
-- ----------------------------
BEGIN;
INSERT INTO `bb_tax` (`idState`, `State`, `TaxRate`) VALUES (1, 'VA', 0.045);
INSERT INTO `bb_tax` (`idState`, `State`, `TaxRate`) VALUES (2, 'NC', 0.030);
INSERT INTO `bb_tax` (`idState`, `State`, `TaxRate`) VALUES (3, 'SC', 0.060);
COMMIT;

-- ----------------------------
-- Table structure for bb_trans_log
-- ----------------------------
DROP TABLE IF EXISTS `bb_trans_log`;
CREATE TABLE `bb_trans_log` (
  `shopper` int DEFAULT NULL,
  `appAction` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `errCode` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `errMsg` varchar(80) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of bb_trans_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bb_usergroups
-- ----------------------------
DROP TABLE IF EXISTS `bb_usergroups`;
CREATE TABLE `bb_usergroups` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Usergroup` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of bb_usergroups
-- ----------------------------
BEGIN;
INSERT INTO `bb_usergroups` (`Id`, `Usergroup`) VALUES (1, 'admin');
INSERT INTO `bb_usergroups` (`Id`, `Usergroup`) VALUES (2, 'employee');
INSERT INTO `bb_usergroups` (`Id`, `Usergroup`) VALUES (3, 'guest');
INSERT INTO `bb_usergroups` (`Id`, `Usergroup`) VALUES (4, 'shopper');
COMMIT;

-- ----------------------------
-- View structure for bb_basket_admin
-- ----------------------------
DROP VIEW IF EXISTS `bb_basket_admin`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `bb_basket_admin` AS select `bb_basket`.`idBasket` AS `idBasket`,`bb_basket`.`Quantity` AS `Quantity`,`bb_basket`.`idShopper` AS `idShopper`,`bb_basket`.`OrderPlaced` AS `OrderPlaced`,`bb_basket`.`SubTotal` AS `SubTotal`,`bb_basket`.`Total` AS `Total`,`bb_basket`.`Shipping` AS `Shipping`,`bb_basket`.`Tax` AS `Tax`,`bb_basket`.`dtCreated` AS `dtCreated`,`bb_basket`.`Promo` AS `Promo`,`bb_basket`.`ShipFirstName` AS `ShipFirstName`,`bb_basket`.`ShipLastName` AS `ShipLastName`,`bb_basket`.`ShipAddress` AS `ShipAddress`,`bb_basket`.`ShipCity` AS `ShipCity`,`bb_basket`.`ShipState` AS `ShipState`,`bb_basket`.`ShipZipCode` AS `ShipZipCode`,`bb_basket`.`ShipPhone` AS `ShipPhone`,`bb_basket`.`ShipFax` AS `ShipFax`,`bb_basket`.`ShipEmail` AS `ShipEmail`,`bb_basket`.`BillFirstName` AS `BillFirstName`,`bb_basket`.`BillLastName` AS `BillLastName`,`bb_basket`.`BillAddress` AS `BillAddress`,`bb_basket`.`BillCity` AS `BillCity`,`bb_basket`.`BillState` AS `BillState`,`bb_basket`.`BillZipCode` AS `BillZipCode`,`bb_basket`.`BillPhone` AS `BillPhone`,`bb_basket`.`BillFax` AS `BillFax`,`bb_basket`.`BillEmail` AS `BillEmail`,`bb_basket`.`dtOrdered` AS `dtOrdered`,`bb_basket`.`ShipProvince` AS `ShipProvince`,`bb_basket`.`ShipCountry` AS `ShipCountry`,`bb_basket`.`BillProvince` AS `BillProvince`,`bb_basket`.`BillCountry` AS `BillCountry`,`bb_basket`.`CardType` AS `CardType`,`bb_basket`.`CardNumber` AS `CardNumber`,`bb_basket`.`ExpMonth` AS `ExpMonth`,`bb_basket`.`ExpYear` AS `ExpYear`,`bb_basket`.`CardName` AS `CardName`,`bb_basket`.`ShipBill` AS `ShipBill`,`bb_basket`.`ShipFlag` AS `ShipFlag` from `bb_basket`;

-- ----------------------------
-- View structure for bb_basket_item_vu
-- ----------------------------
DROP VIEW IF EXISTS `bb_basket_item_vu`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `bb_basket_item_vu` AS select `bb_basket_item`.`idBasketItem` AS `idBasketItem`,`bb_basket_item`.`idProduct` AS `idProduct`,`bb_basket_item`.`Price` AS `Price`,`bb_basket_item`.`Quantity` AS `Quantity`,`bb_basket_item`.`idBasket` AS `idBasket`,`bb_basket_item`.`option1` AS `option1`,`bb_basket_item`.`option2` AS `option2` from `bb_basket_item`;

-- ----------------------------
-- View structure for bb_order_admin
-- ----------------------------
DROP VIEW IF EXISTS `bb_order_admin`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `bb_order_admin` AS select `bb_basket`.`idBasket` AS `idBasket`,`bb_basket`.`Quantity` AS `Quantity`,`bb_basket`.`idShopper` AS `idShopper`,`bb_basket`.`OrderPlaced` AS `OrderPlaced`,`bb_basket`.`SubTotal` AS `SubTotal`,`bb_basket`.`Total` AS `Total`,`bb_basket`.`Shipping` AS `Shipping`,`bb_basket`.`Tax` AS `Tax`,`bb_basket`.`dtCreated` AS `dtCreated`,`bb_basket`.`Promo` AS `Promo`,`bb_basket`.`ShipFirstName` AS `ShipFirstName`,`bb_basket`.`ShipLastName` AS `ShipLastName`,`bb_basket`.`ShipAddress` AS `ShipAddress`,`bb_basket`.`ShipCity` AS `ShipCity`,`bb_basket`.`ShipState` AS `ShipState`,`bb_basket`.`ShipZipCode` AS `ShipZipCode`,`bb_basket`.`ShipPhone` AS `ShipPhone`,`bb_basket`.`ShipFax` AS `ShipFax`,`bb_basket`.`ShipEmail` AS `ShipEmail`,`bb_basket`.`BillFirstName` AS `BillFirstName`,`bb_basket`.`BillLastName` AS `BillLastName`,`bb_basket`.`BillAddress` AS `BillAddress`,`bb_basket`.`BillCity` AS `BillCity`,`bb_basket`.`BillState` AS `BillState`,`bb_basket`.`BillZipCode` AS `BillZipCode`,`bb_basket`.`BillPhone` AS `BillPhone`,`bb_basket`.`BillFax` AS `BillFax`,`bb_basket`.`BillEmail` AS `BillEmail`,`bb_basket`.`dtOrdered` AS `dtOrdered`,`bb_basket`.`ShipProvince` AS `ShipProvince`,`bb_basket`.`ShipCountry` AS `ShipCountry`,`bb_basket`.`BillProvince` AS `BillProvince`,`bb_basket`.`BillCountry` AS `BillCountry`,`bb_basket`.`CardType` AS `CardType`,`bb_basket`.`CardNumber` AS `CardNumber`,`bb_basket`.`ExpMonth` AS `ExpMonth`,`bb_basket`.`ExpYear` AS `ExpYear`,`bb_basket`.`CardName` AS `CardName`,`bb_basket`.`ShipBill` AS `ShipBill`,`bb_basket`.`ShipFlag` AS `ShipFlag` from `bb_basket`;

-- ----------------------------
-- View structure for bb_orderitems_admin
-- ----------------------------
DROP VIEW IF EXISTS `bb_orderitems_admin`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `bb_orderitems_admin` AS select `bb_basket_item`.`idBasketItem` AS `idBasketItem`,`bb_basket_item`.`idProduct` AS `idProduct`,`bb_basket_item`.`Price` AS `Price`,`bb_basket_item`.`Quantity` AS `Quantity`,`bb_basket_item`.`idBasket` AS `idBasket`,`bb_basket_item`.`option1` AS `option1`,`bb_basket_item`.`option2` AS `option2` from `bb_basket_item`;

-- ----------------------------
-- View structure for bb_product_admin
-- ----------------------------
DROP VIEW IF EXISTS `bb_product_admin`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `bb_product_admin` AS select `bb_product`.`idProduct` AS `idProduct`,`bb_product`.`ProductName` AS `ProductName`,`bb_product`.`Description` AS `Description`,`bb_product`.`ProductImage` AS `ProductImage`,group_concat((case when (`poc`.`CategoryName` = 'Form') then `pod`.`OptionName` end) separator ';') AS `Form`,group_concat((case when (`poc`.`CategoryName` = 'Size') then `pod`.`OptionName` end) separator ';') AS `Size`,`bb_product`.`Price` AS `Price`,`bb_product`.`SaleStart` AS `SaleStart`,`bb_product`.`SaleEnd` AS `SaleEnd`,`bb_product`.`SalePrice` AS `SalePrice`,`bb_product`.`Active` AS `Active`,`bb_product`.`Featured` AS `Featured`,`bb_product`.`FeatureStart` AS `FeatureStart`,`bb_product`.`FeatureEnd` AS `FeatureEnd`,`bb_product`.`Type` AS `Type`,`bb_product`.`idDepartment` AS `idDepartment`,`bb_product`.`Stock` AS `Stock`,`bb_product`.`Ordered` AS `Ordered`,`bb_product`.`Reorder` AS `Reorder` from ((((`bb_product` join `bb_department` on((`bb_department`.`idDepartment` = `bb_product`.`idDepartment`))) left join `bb_product_option` `po` on((`bb_product`.`idProduct` = `po`.`idProduct`))) left join `bb_product_option_detail` `pod` on((`pod`.`idOption` = `po`.`idOption`))) left join `bb_product_option_category` `poc` on((`poc`.`idOptionCategory` = `pod`.`idOptionCategory`))) where (`bb_product`.`Active` = 1) group by `bb_product`.`idProduct`;

-- ----------------------------
-- View structure for bb_product_employee
-- ----------------------------
DROP VIEW IF EXISTS `bb_product_employee`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `bb_product_employee` AS select `bb_product`.`idProduct` AS `idProduct`,`bb_product`.`ProductName` AS `ProductName`,`bb_product`.`Description` AS `Description`,`bb_product`.`ProductImage` AS `ProductImage`,group_concat((case when (`poc`.`CategoryName` = 'Form') then `pod`.`OptionName` end) separator ';') AS `Form`,group_concat((case when (`poc`.`CategoryName` = 'Size') then `pod`.`OptionName` end) separator ';') AS `Size`,`bb_product`.`Price` AS `Price`,`bb_product`.`SaleStart` AS `SaleStart`,`bb_product`.`SaleEnd` AS `SaleEnd`,`bb_product`.`SalePrice` AS `SalePrice`,`bb_product`.`Active` AS `Active`,`bb_product`.`Featured` AS `Featured`,`bb_product`.`FeatureStart` AS `FeatureStart`,`bb_product`.`FeatureEnd` AS `FeatureEnd`,`bb_department`.`DeptName` AS `DeptName`,`bb_department`.`DeptDesc` AS `DeptDesc`,`bb_department`.`DeptImage` AS `DeptImage`,`bb_product`.`Stock` AS `Stock`,`bb_product`.`Ordered` AS `Ordered`,`bb_product`.`Reorder` AS `Reorder` from ((((`bb_product` join `bb_department` on((`bb_department`.`idDepartment` = `bb_product`.`idDepartment`))) left join `bb_product_option` `po` on((`bb_product`.`idProduct` = `po`.`idProduct`))) left join `bb_product_option_detail` `pod` on((`pod`.`idOption` = `po`.`idOption`))) left join `bb_product_option_category` `poc` on((`poc`.`idOptionCategory` = `pod`.`idOptionCategory`))) where (`bb_product`.`Active` = 1) group by `bb_product`.`idProduct`;

-- ----------------------------
-- View structure for bb_product_guest
-- ----------------------------
DROP VIEW IF EXISTS `bb_product_guest`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `bb_product_guest` AS select `bb_product`.`idProduct` AS `idProduct`,`bb_product`.`ProductName` AS `ProductName`,`bb_product`.`Description` AS `Description`,`bb_product`.`ProductImage` AS `ProductImage`,group_concat((case when (`poc`.`CategoryName` = 'Form') then concat(`pod`.`idOption`,'_',`pod`.`OptionName`) end) separator ';') AS `Form`,group_concat((case when (`poc`.`CategoryName` = 'Size') then concat(`pod`.`idOption`,'_',`pod`.`OptionName`) end) separator ';') AS `Size`,`bb_product`.`Price` AS `Price`,`bb_product`.`SaleStart` AS `SaleStart`,`bb_product`.`SaleEnd` AS `SaleEnd`,`bb_product`.`SalePrice` AS `SalePrice` from (((`bb_product` left join `bb_product_option` `po` on((`bb_product`.`idProduct` = `po`.`idProduct`))) left join `bb_product_option_detail` `pod` on((`pod`.`idOption` = `po`.`idOption`))) left join `bb_product_option_category` `poc` on((`poc`.`idOptionCategory` = `pod`.`idOptionCategory`))) where (`bb_product`.`Active` = 1) group by `bb_product`.`idProduct`;

-- ----------------------------
-- View structure for bb_ship_vu
-- ----------------------------
DROP VIEW IF EXISTS `bb_ship_vu`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `bb_ship_vu` AS select `b`.`idBasket` AS `idbasket`,`b`.`ShipFlag` AS `shipflag`,`bs`.`idStage` AS `idstage`,`bs`.`dtStage` AS `dtstage`,`bs`.`Notes` AS `notes`,`bs`.`Shipper` AS `shipper`,`bs`.`ShippingNum` AS `shippingnum` from (`bb_basket` `b` join `bb_basket_status` `bs`) where (`b`.`idBasket` = `bs`.`idBasket`);

-- ----------------------------
-- Procedure structure for get_basketitems_by_basketid_full
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_basketitems_by_basketid_full`;
delimiter ;;
CREATE PROCEDURE `get_basketitems_by_basketid_full`(IN inBasketId int)
BEGIN
  SELECT 
        bi.idBasketItem,
        bi.idProduct,
        bi.Price as 'PriceBasketItem',
        bi.Quantity,
        bi.idBasket,
        pod1.OptionName as 'Form',
        pod2.OptionName as 'Size',
        p.ProductName,
        p.Description,
        p.ProductImage,
        p.Price as 'PriceProduct',
        p.SaleStart,
        p.SaleEnd,
        p.SalePrice as 'PriceSale',
        p.Active,
        p.Featured,
        p.FeatureStart,
        p.FeatureEnd,
        p.Type,
        p.Stock,
        p.Ordered,
        p.Reorder,
        d.DeptName,
        d.DeptDesc,
        d.DeptImage
    FROM bb_basket_item bi
    LEFT JOIN bb_product p ON p.idProduct = bi.idProduct
    LEFT JOIN bb_department d ON d.idDepartment = p.idDepartment
    LEFT JOIN bb_product_option_detail pod1 ON pod1.idOption = bi.option1
    LEFT JOIN bb_product_option_detail pod2 ON pod2.idOption = bi.option2
    WHERE bi.idBasket = inBasketId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_basketitems_by_basketid_shopper
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_basketitems_by_basketid_shopper`;
delimiter ;;
CREATE PROCEDURE `get_basketitems_by_basketid_shopper`(IN inBasketId int)
BEGIN
  SELECT 
        p.ProductName,
				p.Description,
				pod1.OptionName as 'Form',
        pod2.OptionName as 'Size',
				p.ProductImage,
				bi.Price as 'Price',
        bi.Quantity,
        d.DeptName,
        d.DeptDesc,
        d.DeptImage
    FROM bb_basket_item bi
    LEFT JOIN bb_product p ON p.idProduct = bi.idProduct
    LEFT JOIN bb_department d ON d.idDepartment = p.idDepartment
    LEFT JOIN bb_product_option_detail pod1 ON pod1.idOption = bi.option1
    LEFT JOIN bb_product_option_detail pod2 ON pod2.idOption = bi.option2
    WHERE bi.idBasket = inBasketId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_baskets_by_admin
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_baskets_by_admin`;
delimiter ;;
CREATE PROCEDURE `get_baskets_by_admin`()
BEGIN
  SELECT * from bb_basket_admin;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_baskets_by_shopperid
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_baskets_by_shopperid`;
delimiter ;;
CREATE PROCEDURE `get_baskets_by_shopperid`(IN inShopperId int)
BEGIN
  SELECT * FROM bb_basket b WHERE b.idShopper=inShopperId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_checkout_by_shopperid
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_checkout_by_shopperid`;
delimiter ;;
CREATE PROCEDURE `get_checkout_by_shopperid`(IN inShopperId int)
BEGIN
  SELECT * FROM bb_checkout WHERE idShopper=inShopperId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_departments
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_departments`;
delimiter ;;
CREATE PROCEDURE `get_departments`()
BEGIN
  Select idDepartment, DeptName FROM bb_department;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_productoptions_by_productid
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_productoptions_by_productid`;
delimiter ;;
CREATE PROCEDURE `get_productoptions_by_productid`(IN inIdProduct int)
BEGIN
  SELECT
    poc.CategoryName,
    GROUP_CONCAT(pod.OptionName SEPARATOR ';') AS Options
	FROM bb_product_option po
	JOIN bb_product_option_detail pod ON pod.idOption = po.idOption
	JOIN bb_product_option_category poc ON poc.idOptionCategory = pod.idOptionCategory
	WHERE
			po.idProduct = inIdProduct
	GROUP BY
			poc.CategoryName;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_products_by_usergroup
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_products_by_usergroup`;
delimiter ;;
CREATE PROCEDURE `get_products_by_usergroup`(IN idUsergroup INT)
BEGIN
    CASE idUsergroup
        WHEN 1 THEN
            SELECT * FROM bb_product_admin;
        WHEN 2 THEN
            SELECT * FROM bb_product_employee;
        WHEN 3 THEN
            SELECT * FROM bb_product_guest;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid user group provided';
    END CASE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_shopper_by_shopperid
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_shopper_by_shopperid`;
delimiter ;;
CREATE PROCEDURE `get_shopper_by_shopperid`(IN inIdShopper int)
BEGIN
  SELECT
		s.idShopper,
		s.FirstName,
		s.LastName,
		s.Address,
		s.City,
		s.State,
		s.ZipCode,
		s.Phone,
		s.Fax,
		s.Email,
		s.Province,
		s.Country,
		s.Promo,
		t.TaxRate
	FROM bb_shopper s
	JOIN bb_tax t ON t.State=s.State
	WHERE idShopper=inIdShopper;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_taxrate_by_shopperid
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_taxrate_by_shopperid`;
delimiter ;;
CREATE PROCEDURE `get_taxrate_by_shopperid`(IN inShopperId int)
BEGIN
  SELECT t.TaxRate FROM bb_shopper s
	JOIN bb_tax t ON t.State=s.State
	WHERE s.idShopper=inShopperId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_basket
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_basket`;
delimiter ;;
CREATE PROCEDURE `insert_basket`(IN inIdShopper INT(5),
    IN inPromo INT(2),
    IN inShipFirstName VARCHAR(10),
    IN inShipLastName VARCHAR(20),
    IN inShipAddress VARCHAR(40),
    IN inShipCity VARCHAR(20),
    IN inShipState VARCHAR(2),
    IN inShipZipCode VARCHAR(15),
    IN inShipPhone VARCHAR(15),
    IN inShipFax VARCHAR(10),
    IN inShipEmail VARCHAR(25),
    IN inShipProvince VARCHAR(20),
    IN inShipCountry VARCHAR(20),
    IN inBillFirstName VARCHAR(10),
    IN inBillLastName VARCHAR(20),
    IN inBillAddress VARCHAR(40),
    IN inBillCity VARCHAR(20),
    IN inBillState VARCHAR(2),
    IN inBillZipCode VARCHAR(15),
    IN inBillPhone VARCHAR(15),
    IN inBillFax VARCHAR(10),
    IN inBillEmail VARCHAR(25),
    IN inBillProvince VARCHAR(20),
    IN inBillCountry VARCHAR(20),
    IN inCardType CHAR(1),
    IN inCardNumber VARCHAR(20),
    IN inExpMonth CHAR(2),
    IN inExpYear CHAR(4),
    IN inCardName VARCHAR(25))
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE checkout_subtotal DECIMAL(10, 2);
    DECLARE checkout_tax DECIMAL(10, 3);
    DECLARE checkout_total DECIMAL(10, 2);
    DECLARE checkout_quantity INT;
    DECLARE cart_details JSON DEFAULT NULL;
    DECLARE cart_item JSON DEFAULT NULL;
    DECLARE idx INT DEFAULT 0;
    DECLARE num_items INT DEFAULT 0;

    -- Start the transaction
    START TRANSACTION;
    
    BEGIN
        -- Exception handling block
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET done = 1;
        
        -- Insert into bb_basket
        INSERT INTO bb_basket (
            IdShopper,dtCreated,Promo,
            ShipFirstName,ShipLastName,ShipAddress,ShipCity,ShipState,ShipZipCode,ShipPhone,ShipFax,ShipEmail,ShipProvince,ShipCountry,
            BillFirstName,BillLastName,BillAddress,BillCity,BillState,BillZipCode,BillPhone,BillFax,BillEmail,
            dtOrdered,BillProvince,BillCountry,CardType,CardNumber,ExpMonth,ExpYear,CardName
        ) VALUES (
            inIdShopper,NOW(),inPromo,
            inShipFirstName,inShipLastName,inShipAddress,inShipCity,inShipState,inShipZipCode,inShipPhone,inShipFax,inShipEmail,inShipProvince,inShipCountry,
            inBillFirstName,inBillLastName,inBillAddress,inBillCity,inBillState,inBillZipCode,inBillPhone,inBillFax,inBillEmail,
            NOW(),inBillProvince,inBillCountry,inCardType,inCardNumber,inExpMonth,inExpYear,inCardName
        );
        
        SELECT LAST_INSERT_ID() INTO @last_inserted_id;
        SELECT SubTotal, Tax, Total, Quantity, CartDetails
        INTO checkout_subtotal, checkout_tax, checkout_total, checkout_quantity, cart_details
        FROM bb_checkout
        WHERE idShopper = inIdShopper
        ORDER BY dtCreated DESC
        LIMIT 1;

        UPDATE bb_basket
        SET Quantity = checkout_quantity,
            SubTotal = checkout_subtotal,
            Tax = checkout_tax,
            Total = checkout_total,
            OrderPlaced=1
        WHERE idBasket = @last_inserted_id AND IdShopper=inIdShopper;
        
        -- Get the number of items in the JSON array
        SET num_items = JSON_LENGTH(cart_details);

        -- Loop through each item in the JSON array
        WHILE idx < num_items DO
            SET cart_item = JSON_EXTRACT(cart_details, CONCAT('$[', idx, ']'));

            -- Extract the properties you need from cart_item
            SET @productId = JSON_EXTRACT(cart_item, '$.productId');
            SET @productId = CAST(JSON_UNQUOTE(@productId) AS UNSIGNED);
            SET @price = CAST(JSON_EXTRACT(cart_item, '$.price') AS DECIMAL(10, 2));
            SET @quantity = CAST(JSON_EXTRACT(cart_item, '$.quantity') AS UNSIGNED);

            SET @option1 = JSON_EXTRACT(cart_item, '$.option1');
            IF @option1 IS NOT NULL THEN
                SET @option1 = JSON_EXTRACT(cart_item, '$.option1');
								SET @option1 = CAST(JSON_UNQUOTE(@option1) AS UNSIGNED);
            END IF;
    
            SET @option2 = JSON_EXTRACT(cart_item, '$.option2');
            IF @option2 IS NOT NULL THEN
                SET @option2 = JSON_EXTRACT(cart_item, '$.option2');
								SET @option2 = CAST(JSON_UNQUOTE(@option2) AS UNSIGNED);
            END IF;

            -- Call insert_basketitem stored procedure
            CALL insert_basketitem(@productId, @price, @quantity, @last_inserted_id, @option1, @option2);

            SET idx = idx + 1;
        END WHILE;

    END;
    
    -- Commit or rollback transaction
    IF done = 1 THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_basketitem
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_basketitem`;
delimiter ;;
CREATE PROCEDURE `insert_basketitem`(IN inIdProduct INT(2),
	IN inPrice DECIMAL(6),
	IN inQuantity INT(2),
	IN inIdBasket INT(5),
	IN inOption1 INT(2),
	IN inOption2 INT(2))
BEGIN
  INSERT INTO bb_basket_item (idProduct, Price, Quantity, idBasket, option1, option2) VALUES (inIdProduct, inPrice, inQuantity, inIdBasket, inOption1, inOption2);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_checkout
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_checkout`;
delimiter ;;
CREATE PROCEDURE `insert_checkout`(IN inIdShopper INT, IN inCartDetails LONGTEXT)
BEGIN
    -- Declare variables
    DECLARE finished INT DEFAULT 0;
    DECLARE productId INT;
    DECLARE quantity INT;
		DECLARE totalQuantity INT DEFAULT 0;
    DECLARE actual_price DECIMAL(10, 4);
    DECLARE subtotal DECIMAL(10, 2) DEFAULT 0;
    DECLARE taxRate DECIMAL(10, 4);
    DECLARE tax DECIMAL(10, 4);
    DECLARE total DECIMAL(10, 4);
    DECLARE indexCounter INT DEFAULT 0;
    DECLARE jsonDataLength INT;

    -- Determine the length of the JSON array
    SET jsonDataLength = JSON_LENGTH(inCartDetails);

    -- Loop through each element in the JSON array
    WHILE indexCounter < jsonDataLength DO
        -- Extract product ID and quantity from the JSON, remove quotes and cast them to the appropriate types
        SET productId = CAST(JSON_UNQUOTE(JSON_EXTRACT(inCartDetails, CONCAT('$[', indexCounter, '].productId'))) AS UNSIGNED);
        SET quantity = CAST(JSON_UNQUOTE(JSON_EXTRACT(inCartDetails, CONCAT('$[', indexCounter, '].quantity'))) AS UNSIGNED);
        
        -- Increment index counter
        SET indexCounter = indexCounter + 1;

        -- Get price for the current product
        SELECT price INTO actual_price FROM bb_product WHERE idProduct = productId;

        -- Check if the product ID and price are valid
        IF actual_price IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid product ID or price';
        END IF;

        -- Add to subtotal
        SET subtotal = subtotal + (actual_price * quantity);
				SET totalQuantity = totalQuantity + 1;
    END WHILE;

    -- Get the tax rate
    SELECT t.TaxRate INTO taxRate 
        FROM bb_shopper s
        JOIN bb_tax t ON t.State=s.State
        WHERE s.idShopper=inIdShopper;

    -- Calculate tax
    SET tax = subtotal * taxRate;

    -- Calculate total
    SET total = subtotal + tax;

    -- Insert data into bb_checkout
    INSERT INTO bb_checkout (idShopper, Quantity, CartDetails, SubTotal, Tax, Total, dtCreated)
		VALUES (inIdShopper, totalQuantity, inCartDetails, subtotal, tax, total, NOW())
		ON DUPLICATE KEY UPDATE
				Quantity = totalQuantity,
				CartDetails = inCartDetails,
				SubTotal = subtotal,
				Tax = tax,
				Total = total,
				dtCreated = NOW();
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_product
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_product`;
delimiter ;;
CREATE PROCEDURE `insert_product`(IN inProductName varchar(25), IN inDescription varchar(100), IN inProductImage varchar(25), 
IN inPrice decimal(6, 2), IN inActive tinyint(1), IN inIdDepartment int(11))
BEGIN
  INSERT INTO bb_product (ProductName, Description, ProductImage, Price, Active, idDepartment) VALUES (inProductName, inDescription, inProductImage, inPrice, inActive, inIdDepartment);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for is_account_by_accountid_and_username_and_password
-- ----------------------------
DROP PROCEDURE IF EXISTS `is_account_by_accountid_and_username_and_password`;
delimiter ;;
CREATE PROCEDURE `is_account_by_accountid_and_username_and_password`(IN inIdAccount int, IN inUsername varchar(255), IN inPassword varchar(255))
BEGIN
  SELECT idAccount FROM bb_account 
	WHERE idAccount=inIdAccount
	AND Username = inUsername
	AND Password = inPassword;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for is_basket_owner_by_basketid_and_shopperid
-- ----------------------------
DROP PROCEDURE IF EXISTS `is_basket_owner_by_basketid_and_shopperid`;
delimiter ;;
CREATE PROCEDURE `is_basket_owner_by_basketid_and_shopperid`(IN inIdBasket int, IN inIdShopper int)
BEGIN
  SELECT idShopper FROM bb_basket WHERE bb_basket.idBasket=inIdBasket AND bb_basket.idShopper=inIdShopper;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_account_password
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_account_password`;
delimiter ;;
CREATE PROCEDURE `update_account_password`(IN inAccountId int, IN inPassword varchar(255))
BEGIN
  UPDATE bb_account SET `Password`=inPassword WHERE idAccount=inAccountId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_product
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_product`;
delimiter ;;
CREATE PROCEDURE `update_product`(IN inProductId int, IN inNewDescription VARCHAR(100), IN inActive tinyint)
BEGIN
  UPDATE bb_product SET Description=inNewDescription, Active=inActive WHERE idProduct=inProductId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_shopper
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_shopper`;
delimiter ;;
CREATE PROCEDURE `update_shopper`(IN inIdShopper int,
IN inFirstName varchar(15),
IN inLastName varchar(20),
IN inAddress varchar(40),
IN inCity varchar(20),
IN inState char(2),
IN inZipCode varchar(15),
IN inPhone varchar(10),
IN inFax varchar(10),
IN inEmail varchar(25),
IN inProvince varchar(15),
IN inCountry varchar(15),
IN inPromo char(1))
BEGIN
  UPDATE bb_shopper SET FirstName=inFirstName, LastName=inLastName, Address=inAddress, City=inCity, State=inState, ZipCode=inZipCode,
	Phone=inPhone, Fax=inFax, Email=inEmail, Province=inProvince, Country=inCountry, Promo=inPromo
	WHERE idShopper=inIdShopper;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
