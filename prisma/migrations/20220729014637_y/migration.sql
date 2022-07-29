-- CreateTable
CREATE TABLE "user" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "read" (
    "id" SERIAL NOT NULL,
    "userID" INTEGER NOT NULL,
    "bidsId" INTEGER NOT NULL,

    CONSTRAINT "read_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_name_key" ON "user"("name");

-- AddForeignKey
ALTER TABLE "read" ADD CONSTRAINT "read_bidsId_fkey" FOREIGN KEY ("bidsId") REFERENCES "bids"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "read" ADD CONSTRAINT "read_userID_fkey" FOREIGN KEY ("userID") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
