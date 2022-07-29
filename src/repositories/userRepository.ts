import prisma from "../database";

export async function create(userDate: string){
  await prisma.user.create({
    data: {
      name: userDate
    }
  })
}