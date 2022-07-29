-- CreateTable
CREATE TABLE "bids" (
    "id" SERIAL NOT NULL,
    "licitacao" TEXT NOT NULL,
    "process" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "organ" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "goal" TEXT NOT NULL,

    CONSTRAINT "bids_pkey" PRIMARY KEY ("id")
);
