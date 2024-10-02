CREATE TABLE `Session` (
  `id` VARCHAR(255) NOT NULL,
  `shop` VARCHAR(255) DEFAULT NULL,
  `state` VARCHAR(255) DEFAULT NULL,
  `isOnline` TINYINT(1) NOT NULL DEFAULT '0',
  `scope` VARCHAR(255) DEFAULT NULL,
  `expires` DATETIME DEFAULT NULL,
  `accessToken` VARCHAR(255) NOT NULL,
  `userId` BIGINT DEFAULT NULL,
  `firstName` VARCHAR(255) DEFAULT NULL,
  `lastName` VARCHAR(255) DEFAULT NULL,
  `email` VARCHAR(255) DEFAULT NULL,
  `accountOwner` TINYINT(1) NOT NULL DEFAULT '0',
  `locale` VARCHAR(255) DEFAULT NULL,
  `collaborator` TINYINT(1) DEFAULT NULL,
  `emailVerified` TINYINT(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Configuration` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sessionId` VARCHAR(255) NOT NULL,
  `shop` VARCHAR(255) NOT NULL,
  `merchantKey` VARCHAR(255) DEFAULT NULL,
  `merchantPass` VARCHAR(255) DEFAULT NULL,
  `test` TINYINT(1) NOT NULL DEFAULT '1',
  UNIQUE KEY `unique_shop` (`shop`),
  UNIQUE KEY `unique_sessionId` (`sessionId`),
  CONSTRAINT `Configuration_session_id_fk` FOREIGN KEY (`sessionId`) REFERENCES `Session` (`id`) ON DELETE CASCADE,
  PRIMARY KEY (`id`),
  INDEX `idx_sessionId` (`sessionId`)
);

CREATE TABLE `PaymentSession` (
  `id` VARCHAR(255) NOT NULL,
  `gid` VARCHAR(255) DEFAULT NULL,
  `group` VARCHAR(255) DEFAULT NULL,
  `amount` DECIMAL(10,2) DEFAULT NULL,
  `test` TINYINT(1) DEFAULT NULL,
  `currency` VARCHAR(255) DEFAULT NULL,
  `kind` VARCHAR(255) DEFAULT NULL,
  `shop` VARCHAR(255) DEFAULT NULL,
  `paymentMethod` VARCHAR(255) DEFAULT NULL,
  `customer` VARCHAR(255) DEFAULT NULL,
  `cancelUrl` VARCHAR(255) DEFAULT NULL,
  `proposedAt` DATETIME DEFAULT NULL,
  `status` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `RefundSession` (
  `id` VARCHAR(255) NOT NULL,
  `gid` VARCHAR(255) DEFAULT NULL,
  `paymentId` VARCHAR(255) NOT NULL,
  `amount` DECIMAL(10,2) DEFAULT NULL,
  `currency` VARCHAR(255) DEFAULT NULL,
  `proposedAt` DATETIME DEFAULT NULL,
  `status` VARCHAR(255) DEFAULT NULL,
  CONSTRAINT `RefundSession_payment_id_fk` FOREIGN KEY (`paymentId`) REFERENCES `PaymentSession` (`id`) ON DELETE CASCADE,
  PRIMARY KEY (`id`)
);

CREATE TABLE `CaptureSession` (
  `id` VARCHAR(255) NOT NULL,
  `gid` VARCHAR(255) DEFAULT NULL,
  `paymentId` VARCHAR(255) NOT NULL,
  `amount` DECIMAL(10,2) DEFAULT NULL,
  `currency` VARCHAR(255) DEFAULT NULL,
  `proposedAt` DATETIME DEFAULT NULL,
  `status` VARCHAR(255) DEFAULT NULL,
  CONSTRAINT `CaptureSession_payment_id_fk` FOREIGN KEY (`paymentId`) REFERENCES `PaymentSession` (`id`) ON DELETE CASCADE,
  PRIMARY KEY (`id`)
);

CREATE TABLE `VoidSession` (
  `id` VARCHAR(255) NOT NULL,
  `gid` VARCHAR(255) DEFAULT NULL,
  `paymentId` VARCHAR(255) NOT NULL,
  `proposedAt` DATETIME DEFAULT NULL,
  `status` VARCHAR(255) DEFAULT NULL,
  UNIQUE KEY `unique_paymentId` (`paymentId`),
  CONSTRAINT `VoidSession_payment_id_fk` FOREIGN KEY (`paymentId`) REFERENCES `PaymentSession` (`id`) ON DELETE CASCADE,
  PRIMARY KEY (`id`)
);

-- ALTER TABLE `PaymentSession`
-- ADD CONSTRAINT `PaymentSession_refunds_id_fk` FOREIGN KEY (`id`) REFERENCES `RefundSession` (`id`) ON DELETE CASCADE,
-- ADD CONSTRAINT `PaymentSession_captures_id_fk` FOREIGN KEY (`id`) REFERENCES `CaptureSession` (`id`) ON DELETE CASCADE,
-- ADD CONSTRAINT `PaymentSession_void_id_fk` FOREIGN KEY (`id`) REFERENCES `VoidSession` (`id`) ON DELETE CASCADE;