import prisma from "../src/database.js";
import jsonfile from "jsonfile";

async function main() {
	let bids;

	try{
		bids = await jsonfile.readFile( 'bidsFile.json' );    
	}catch(erro){
  	console.log( erro );
	}

	//console.log(typeof bids);
	bids.forEach(async (element) => {
		await prisma.bids.upsert({
			where: { biddingNumber: element.biddingNumber },
			update: {},
			create: {
				biddingNumber: element.biddingNumber,
				process: element.process,
				type: element.type,
				organ: element.organ,
				date: element.date,
				goal: element.goal,
			},
		});
	});
	
	await prisma.user.upsert({
		where: { name: "Neto" },
		update: {},
		create: {
			name: "Neto"
		},
	});
	
	console.log("seed ok");
}

main();
