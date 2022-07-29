import prisma from "../database";

export async function get(){
  await prisma.bids.findMany();
}

