/*
  Warnings:

  - You are about to drop the column `licitacao` on the `bids` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[biddingNumber]` on the table `bids` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `biddingNumber` to the `bids` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "bids_licitacao_key";

-- AlterTable
ALTER TABLE "bids" DROP COLUMN "licitacao",
ADD COLUMN     "biddingNumber" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "bids_biddingNumber_key" ON "bids"("biddingNumber");
