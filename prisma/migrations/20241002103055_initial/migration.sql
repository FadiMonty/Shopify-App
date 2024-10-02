/*
  Warnings:

  - A unique constraint covering the columns `[shop]` on the table `Configuration` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Configuration_shop_key" ON "Configuration"("shop");
