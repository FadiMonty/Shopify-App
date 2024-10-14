/*
  Warnings:

  - The primary key for the `CaptureSession` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `CaptureSession` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `paymentId` on the `CaptureSession` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `status` on the `CaptureSession` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `sessionId` on the `Configuration` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `shop` on the `Configuration` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - The primary key for the `PaymentSession` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `PaymentSession` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `status` on the `PaymentSession` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - The primary key for the `RefundSession` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `RefundSession` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `paymentId` on the `RefundSession` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `status` on the `RefundSession` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - The primary key for the `Session` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `Session` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `scope` on the `Session` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `accessToken` on the `Session` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `firstName` on the `Session` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `lastName` on the `Session` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `email` on the `Session` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `locale` on the `Session` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - The primary key for the `VoidSession` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `VoidSession` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `paymentId` on the `VoidSession` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - You are about to alter the column `status` on the `VoidSession` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(191)`.
  - Made the column `gid` on table `CaptureSession` required. This step will fail if there are existing NULL values in that column.
  - Made the column `amount` on table `CaptureSession` required. This step will fail if there are existing NULL values in that column.
  - Made the column `currency` on table `CaptureSession` required. This step will fail if there are existing NULL values in that column.
  - Made the column `proposedAt` on table `CaptureSession` required. This step will fail if there are existing NULL values in that column.
  - Made the column `merchantKey` on table `Configuration` required. This step will fail if there are existing NULL values in that column.
  - Made the column `merchantPass` on table `Configuration` required. This step will fail if there are existing NULL values in that column.
  - Made the column `gid` on table `PaymentSession` required. This step will fail if there are existing NULL values in that column.
  - Made the column `group` on table `PaymentSession` required. This step will fail if there are existing NULL values in that column.
  - Made the column `amount` on table `PaymentSession` required. This step will fail if there are existing NULL values in that column.
  - Made the column `test` on table `PaymentSession` required. This step will fail if there are existing NULL values in that column.
  - Made the column `currency` on table `PaymentSession` required. This step will fail if there are existing NULL values in that column.
  - Made the column `kind` on table `PaymentSession` required. This step will fail if there are existing NULL values in that column.
  - Made the column `shop` on table `PaymentSession` required. This step will fail if there are existing NULL values in that column.
  - Made the column `paymentMethod` on table `PaymentSession` required. This step will fail if there are existing NULL values in that column.
  - Made the column `customer` on table `PaymentSession` required. This step will fail if there are existing NULL values in that column.
  - Made the column `cancelUrl` on table `PaymentSession` required. This step will fail if there are existing NULL values in that column.
  - Made the column `proposedAt` on table `PaymentSession` required. This step will fail if there are existing NULL values in that column.
  - Made the column `gid` on table `RefundSession` required. This step will fail if there are existing NULL values in that column.
  - Made the column `amount` on table `RefundSession` required. This step will fail if there are existing NULL values in that column.
  - Made the column `currency` on table `RefundSession` required. This step will fail if there are existing NULL values in that column.
  - Made the column `proposedAt` on table `RefundSession` required. This step will fail if there are existing NULL values in that column.
  - Made the column `shop` on table `Session` required. This step will fail if there are existing NULL values in that column.
  - Made the column `state` on table `Session` required. This step will fail if there are existing NULL values in that column.
  - Made the column `gid` on table `VoidSession` required. This step will fail if there are existing NULL values in that column.
  - Made the column `proposedAt` on table `VoidSession` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE `CaptureSession` DROP FOREIGN KEY `CaptureSession_payment_id_fk`;

-- DropForeignKey
ALTER TABLE `Configuration` DROP FOREIGN KEY `Configuration_session_id_fk`;

-- DropForeignKey
ALTER TABLE `RefundSession` DROP FOREIGN KEY `RefundSession_payment_id_fk`;

-- DropForeignKey
ALTER TABLE `VoidSession` DROP FOREIGN KEY `VoidSession_payment_id_fk`;

-- AlterTable
ALTER TABLE `CaptureSession` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `gid` VARCHAR(191) NOT NULL,
    MODIFY `paymentId` VARCHAR(191) NOT NULL,
    MODIFY `amount` DECIMAL(65, 30) NOT NULL,
    MODIFY `currency` VARCHAR(191) NOT NULL,
    MODIFY `proposedAt` DATETIME(3) NOT NULL,
    MODIFY `status` VARCHAR(191) NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `Configuration` MODIFY `sessionId` VARCHAR(191) NOT NULL,
    MODIFY `shop` VARCHAR(191) NOT NULL,
    MODIFY `merchantKey` VARCHAR(191) NOT NULL,
    MODIFY `merchantPass` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `PaymentSession` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `gid` VARCHAR(191) NOT NULL,
    MODIFY `group` VARCHAR(191) NOT NULL,
    MODIFY `amount` DECIMAL(65, 30) NOT NULL,
    MODIFY `test` BOOLEAN NOT NULL,
    MODIFY `currency` VARCHAR(191) NOT NULL,
    MODIFY `kind` VARCHAR(191) NOT NULL,
    MODIFY `shop` VARCHAR(191) NOT NULL,
    MODIFY `paymentMethod` VARCHAR(191) NOT NULL,
    MODIFY `customer` VARCHAR(191) NOT NULL,
    MODIFY `cancelUrl` VARCHAR(191) NOT NULL,
    MODIFY `proposedAt` DATETIME(3) NOT NULL,
    MODIFY `status` VARCHAR(191) NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `RefundSession` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `gid` VARCHAR(191) NOT NULL,
    MODIFY `paymentId` VARCHAR(191) NOT NULL,
    MODIFY `amount` DECIMAL(65, 30) NOT NULL,
    MODIFY `currency` VARCHAR(191) NOT NULL,
    MODIFY `proposedAt` DATETIME(3) NOT NULL,
    MODIFY `status` VARCHAR(191) NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `Session` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `shop` VARCHAR(191) NOT NULL,
    MODIFY `state` VARCHAR(191) NOT NULL,
    MODIFY `scope` VARCHAR(191) NULL,
    MODIFY `expires` DATETIME(3) NULL,
    MODIFY `accessToken` VARCHAR(191) NOT NULL,
    MODIFY `firstName` VARCHAR(191) NULL,
    MODIFY `lastName` VARCHAR(191) NULL,
    MODIFY `email` VARCHAR(191) NULL,
    MODIFY `locale` VARCHAR(191) NULL,
    MODIFY `collaborator` BOOLEAN NULL DEFAULT false,
    MODIFY `emailVerified` BOOLEAN NULL DEFAULT false,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `VoidSession` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    MODIFY `gid` VARCHAR(191) NOT NULL,
    MODIFY `paymentId` VARCHAR(191) NOT NULL,
    MODIFY `proposedAt` DATETIME(3) NOT NULL,
    MODIFY `status` VARCHAR(191) NULL,
    ADD PRIMARY KEY (`id`);

-- AddForeignKey
ALTER TABLE `Configuration` ADD CONSTRAINT `Configuration_sessionId_fkey` FOREIGN KEY (`sessionId`) REFERENCES `Session`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RefundSession` ADD CONSTRAINT `RefundSession_paymentId_fkey` FOREIGN KEY (`paymentId`) REFERENCES `PaymentSession`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CaptureSession` ADD CONSTRAINT `CaptureSession_paymentId_fkey` FOREIGN KEY (`paymentId`) REFERENCES `PaymentSession`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `VoidSession` ADD CONSTRAINT `VoidSession_paymentId_fkey` FOREIGN KEY (`paymentId`) REFERENCES `PaymentSession`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- RedefineIndex
CREATE INDEX `Configuration_sessionId_idx` ON `Configuration`(`sessionId`);
DROP INDEX `idx_sessionId` ON `Configuration`;

-- RedefineIndex
CREATE UNIQUE INDEX `Configuration_sessionId_key` ON `Configuration`(`sessionId`);
DROP INDEX `unique_sessionId` ON `Configuration`;

-- RedefineIndex
CREATE UNIQUE INDEX `Configuration_shop_key` ON `Configuration`(`shop`);
DROP INDEX `unique_shop` ON `Configuration`;

-- RedefineIndex
CREATE UNIQUE INDEX `VoidSession_paymentId_key` ON `VoidSession`(`paymentId`);
DROP INDEX `unique_paymentId` ON `VoidSession`;
