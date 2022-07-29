/*
  Warnings:

  - A unique constraint covering the columns `[licitacao]` on the table `bids` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "bids_licitacao_key" ON "bids"("licitacao");
