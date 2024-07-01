import { PrismaClient } from '@prisma/client';
import { faker } from '@faker-js/faker';

const prisma = new PrismaClient();

const NUMBER_OF_RECORDS = 10

export default async function prepare() {

  console.log(`Preparing DB ...`)

  // Clean tables
  console.log(`Clearing tables ...`)

  // SQLite
  // await prisma.address.deleteMany()
  // await prisma.$executeRaw`DELETE FROM sqlite_sequence WHERE name='Address';`
  // await prisma.order.deleteMany()
  // await prisma.$executeRaw`DELETE FROM sqlite_sequence WHERE name='Order';`
  // await prisma.product.deleteMany()
  // await prisma.$executeRaw`DELETE FROM sqlite_sequence WHERE name='Product';`
  // await prisma.customer.deleteMany()
  // await prisma.$executeRaw`DELETE FROM sqlite_sequence WHERE name='Customer';`

  // Postgres
  await prisma.address.deleteMany();
  await prisma.$executeRaw`ALTER SEQUENCE "Address_id_seq" RESTART WITH 1`;

  await prisma.order.deleteMany();
  await prisma.$executeRaw`ALTER SEQUENCE "Order_id_seq" RESTART WITH 1`;

  await prisma.product.deleteMany();
  await prisma.$executeRaw`ALTER SEQUENCE "Product_id_seq" RESTART WITH 1`;

  await prisma.customer.deleteMany();
  await prisma.$executeRaw`ALTER SEQUENCE "Customer_id_seq" RESTART WITH 1`;


  console.log(`Seeding data ...`)
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
    for (let j = 0; j < 10; j++) {
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
  console.log(`Created: \n${ordersCount} orders\n${productsCount} products\n${addressesCount} addresses\n${customersCount} customers`)

}
