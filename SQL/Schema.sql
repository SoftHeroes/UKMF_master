DROP TABLE IF EXISTS `UserInformation`;

CREATE TABLE `UserInformation` (
	`u_ID` INT(10) NOT NULL AUTO_INCREMENT,
	`password` varchar(100) NOT NULL,
	`firstName` varchar(100),
	`middleName` varchar(100),
	`lastName` varchar(100),
	`emailID` varchar(250) NOT NULL UNIQUE,
	`phoneNumber` varchar(10) NOT NULL UNIQUE,
	`creationDatetime` DATETIME NOT NULL,
	`lastUpdateDatetime` DATETIME,
	`InvaildUpdateAttemptsCount` INT NOT NULL DEFAULT '0',
	`UserPolicyID` INT(10) NOT NULL,
	`QRCode` INT(10),
	`UPIQRCode` BINARY,
	`walletAmount` INT(10) DEFAULT '0',
	`UPIID` varchar(100),
	`Active` INT(1) NOT NULL DEFAULT '1',
	`Deleted` INT(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (`u_ID`)
);

DROP TABLE IF EXISTS `Transaction`;

CREATE TABLE `Transaction` (
	`u_ID` INT(10) NOT NULL AUTO_INCREMENT UNIQUE,
	`TransactionUUID` varchar(64) NOT NULL UNIQUE,
	`datetime` varchar(64) NOT NULL UNIQUE,
	`userID` INT(10) NOT NULL UNIQUE,
	`transactionType` INT NOT NULL,
	`Amount` DECIMAL(10) NOT NULL,
	`transactionCode` INT NOT NULL,
	`merchantID` DECIMAL(10) NOT NULL,
	`FeeWaived` INT NOT NULL,
	`WaivedFeeAmount` DECIMAL(10) NOT NULL,
	`TransactionDescription` varchar(200) NOT NULL,
	`DebitCredit` varchar(200) NOT NULL,
	`EffectiveDateAndime` varchar(200) NOT NULL,
	`PostingDateAndTime` varchar(200) NOT NULL,
	`PostingFlag` varchar(200) NOT NULL,
	`InvoiceNumber` varchar(200) NOT NULL,
	`PostingReference` varchar(200) NOT NULL,
	`PostingTransactionSource` varchar(200) NOT NULL,
	`ServiceResponseCode` varchar(200) NOT NULL,
	`ServicePostingReference` varchar(200) NOT NULL,
	`PhysicalSource` varchar(200) NOT NULL,
	`Authorization` varchar(200) NOT NULL,
	`ReversalTransactionID` varchar(200) NOT NULL,
	`SettlementDate` varchar(200) NOT NULL,
	PRIMARY KEY (`u_ID`)
);

DROP TABLE IF EXISTS `UserPolicy`;

CREATE TABLE `UserPolicy` (
	`u_ID` INT(10) NOT NULL AUTO_INCREMENT,
	`InvaildUpdateAttemptsAllowed` INT NOT NULL DEFAULT '3',
	`userLockTime` INT(10) NOT NULL DEFAULT '600',
	`QRCodeMethods` INT NOT NULL,
	`walletAmountLimit` INT(10) NOT NULL,
	PRIMARY KEY (`u_ID`)
);

DROP TABLE IF EXISTS `ActivityLog`;

CREATE TABLE `ActivityLog` (
	`u_ID` INT(10) NOT NULL AUTO_INCREMENT,
	`service` varchar(100) NOT NULL,
	`ResponseCode` varchar(100) NOT NULL,
	`Response` varchar(200) NOT NULL,
	`version` varchar(100) NOT NULL,
	`source` varchar(200) NOT NULL,
	PRIMARY KEY (`u_ID`)
);

DROP TABLE IF EXISTS `ThirdPartyAPISetup`;

CREATE TABLE `ThirdPartyAPISetup` (
	`u_ID` INT(10) NOT NULL AUTO_INCREMENT,
	`server` varchar(200) NOT NULL,
	`resource` varchar(200) NOT NULL,
	`environment` varchar(200) NOT NULL,
	`method` varchar(200) NOT NULL,
	`userID` varchar(200) NOT NULL,
	`password` BINARY(200) NOT NULL,
	`accessCode` BINARY(200) NOT NULL,
	PRIMARY KEY (`u_ID`)
);

DROP TABLE IF EXISTS `APISetup`;

CREATE TABLE `APISetup` (
	`u_ID` INT(10) NOT NULL AUTO_INCREMENT,
	`serviceName` varchar(100) NOT NULL UNIQUE,
	`serviceType` varchar(100) NOT NULL,
	`resource` varchar(100) NOT NULL,
	`description` varchar(200) NOT NULL,
	PRIMARY KEY (`u_ID`)
);

DROP TABLE IF EXISTS `MessageMaster`;

CREATE TABLE `MessageMaster` (
	`u_ID` INT(10) NOT NULL AUTO_INCREMENT,
	`Code` varchar(100) NOT NULL,
	`ErrorFound` varchar(5) NOT NULL,
	`Message` varchar(200) NOT NULL,
	`version` varchar(100) NOT NULL,
	`language` varchar(100) NOT NULL,
	PRIMARY KEY (`u_ID`)
);

DROP TABLE IF EXISTS `ThirdPartyAPISetupActivityLog`;

CREATE TABLE `ThirdPartyAPISetupActivityLog` (
	`u_ID` INT(10) NOT NULL AUTO_INCREMENT,
	`serviceID` INT(10) NOT NULL,
	`ResponseCode` varchar(200) NOT NULL,
	`Response` varchar(200) NOT NULL,
	`version` varchar(100) NOT NULL,
	`source` varchar(200) NOT NULL,
	PRIMARY KEY (`u_ID`)
);

ALTER TABLE `UserInformation` ADD CONSTRAINT `UserInformation_fk0` FOREIGN KEY (`UserPolicyID`) REFERENCES `UserPolicy`(`u_ID`);

ALTER TABLE `Transaction` ADD CONSTRAINT `Transaction_fk0` FOREIGN KEY (`userID`) REFERENCES `UserInformation`(`u_ID`);

ALTER TABLE `ActivityLog` ADD CONSTRAINT `ActivityLog_fk0` FOREIGN KEY (`service`) REFERENCES `APISetup`(`serviceName`);

ALTER TABLE `ActivityLog` ADD CONSTRAINT `ActivityLog_fk1` FOREIGN KEY (`ResponseCode`) REFERENCES `MessageMaster`(`Code`);

ALTER TABLE `ActivityLog` ADD CONSTRAINT `ActivityLog_fk2` FOREIGN KEY (`Response`) REFERENCES `MessageMaster`(`Message`);

ALTER TABLE `ActivityLog` ADD CONSTRAINT `ActivityLog_fk3` FOREIGN KEY (`version`) REFERENCES `MessageMaster`(`version`);

ALTER TABLE `ThirdPartyAPISetupActivityLog` ADD CONSTRAINT `ThirdPartyAPISetupActivityLog_fk0` FOREIGN KEY (`serviceID`) REFERENCES `ThirdPartyAPISetup`(`u_ID`);
