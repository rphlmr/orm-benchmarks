import { PrismaClient } from "../prisma/client-postgresql";
import { faker } from "@faker-js/faker";
import { executeCommand, extractConnectionDetailsFromUrl } from "./execute-command";
import { promises as fs } from 'fs';

export async function createDataSet(
  options: { databaseUrl: string, size: number, fakerSeed: number; }
) {

  const NUMBER_OF_RECORDS = options.size || 1000;
  const NUMBER_OF_RELATED_RECORDS = 10;
  const FAKER_SEED = options.fakerSeed || 42;

  const prisma = new PrismaClient({
    datasourceUrl: databaseUrl,
  });

  // console.log(`Preparing DB ...`, databaseUrl);

  // Clean tables
  console.log(`Clearing tables ...`);

  // Postgres
  await prisma.address.deleteMany();
  await prisma.$executeRaw`ALTER SEQUENCE "Address_id_seq" RESTART WITH 1`;

  await prisma.order.deleteMany();
  await prisma.$executeRaw`ALTER SEQUENCE "Order_id_seq" RESTART WITH 1`;

  await prisma.product.deleteMany();
  await prisma.$executeRaw`ALTER SEQUENCE "Product_id_seq" RESTART WITH 1`;

  await prisma.customer.deleteMany();
  await prisma.$executeRaw`ALTER SEQUENCE "Customer_id_seq" RESTART WITH 1`;

  faker.seed(FAKER_SEED);

  console.log(`Seeding data ...`);
  // Seed Customers
  // console.log(`Customers with orders ...`)
  for (let i = 0; i < NUMBER_OF_RECORDS; i++) {
    const customer = await prisma.customer.create({
      data: {
        name: faker.person.fullName(),
        email: faker.internet.email(),
        isActive: faker.datatype.boolean(),
        address: {
          create: {
            street: faker.location.streetAddress(),
            city: faker.location.city(),
            postalCode: faker.location.zipCode(),
            country: faker.location.country(),
          },
        },
      },
    });

    // Seed Orders for each Customer
    for (let j = 0; j < NUMBER_OF_RELATED_RECORDS; j++) {
      await prisma.order.create({
        data: {
          date: faker.date.past(),
          totalAmount: faker.number.int({ min: 10, max: 1000 }),
          customerId: customer.id,
        },
      });
    }
  }

  // Seed Products
  // console.log(`Products ...`)
  for (let i = 0; i < NUMBER_OF_RECORDS; i++) {
    await prisma.product.create({
      data: {
        name: faker.commerce.productName(),
        price: parseFloat(faker.commerce.price()),
        quantity: faker.number.int({ min: 1, max: 100 }),
        description: faker.commerce.productDescription(),
      },
    });
  }

  // Associate Products with Orders
  // console.log(`Connect products with orders ...`)
  const orders = await prisma.order.findMany();
  const products = await prisma.product.findMany();

  for (const order of orders) {
    const randomProducts = faker.helpers.shuffle(products).slice(0, faker.number.int({ min: 1, max: 5 }));
    for (const product of randomProducts) {
      await prisma.order.update({
        where: { id: order.id },
        data: {
          products: {
            connect: { id: product.id },
          },
        },
      });
    }
  }

  const ordersCount = await prisma.order.count();
  const productsCount = await prisma.product.count();
  const addressesCount = await prisma.address.count();
  const customersCount = await prisma.customer.count();
  console.log(
    `Created: \n${ordersCount} orders\n${productsCount} products\n${addressesCount} addresses\n${customersCount} customers`
  );

  await prisma.$disconnect();

  const filePath = `./data/data-${NUMBER_OF_RECORDS}-${FAKER_SEED}.sql`;
  if (!fileExists(filePath)) {
    createSQLDump(options.databaseUrl, filePath);
  }

}

export async function createSQLDump(databaseUrl: string, filePath?: string) {
  const connectionDetails = extractConnectionDetailsFromUrl(databaseUrl);
  console.log(`dumping dataset with connection details: `, connectionDetails);
  const { host, user, db, password } = connectionDetails;
  const command = `pg_dump -h ${host} -U ${user} -d ${db} --no-owner -F c -b -v -f ./data/${filePath}`;
  console.log(`dump command: `, command);
  try {
    await executeCommand(command, { PGPASSWORD: password });
    console.log("pg_restore command executed successfully.");
  } catch (error) {
    console.error("Failed to execute pg_restore command.");
  }
}

async function fileExists(filePath: string): Promise<boolean> {
  try {
    await fs.access(filePath);
    return true;
  } catch {
    return false;
  }
}
