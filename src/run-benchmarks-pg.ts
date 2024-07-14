import { preparePg } from "./lib/prepare-pg";
import writeResults from "./lib/write-results";
import { BenchmarkOptions, MultipleBenchmarkRunResults, SingleBenchmarkRunResult, QueryResult, ORM } from "./lib/types";
import { prismaPg } from "./prisma/prisma-postgres";
import { typeormPg } from "./typeorm/typeorm-postgres";
import { drizzlePg } from "./drizzle/drizzle-postgres";
import { compareResults } from "./lib/compare-results";

export default async function runBenchmarksPg(
  benchmarkOptions: BenchmarkOptions
) {
  const { databaseUrl, iterations, size, fakerSeed } = benchmarkOptions;

  const prismaResults: MultipleBenchmarkRunResults = [];
  for (let i = 0; i < iterations; i++) {
    await preparePg({ databaseUrl, size, fakerSeed });
    const results = await prismaPg(databaseUrl);
    if (i === 0) console.log(`RTESULTS PRISMA`, results);
    prismaResults.push(results);
  }
  writeResults("prisma", "postgresql", prismaResults, benchmarkOptions);

  const drizzleResults: MultipleBenchmarkRunResults = [];
  for (let i = 0; i < iterations; i++) {
    await preparePg({ databaseUrl, size, fakerSeed });
    const results = await drizzlePg(databaseUrl);
    drizzleResults.push(results);
  }
  writeResults("drizzle", "postgresql", drizzleResults, benchmarkOptions);

  const typeormResults: MultipleBenchmarkRunResults = [];
  for (let i = 0; i < iterations; i++) {
    await preparePg({ databaseUrl, size, fakerSeed });
    const results = await typeormPg(databaseUrl);
    typeormResults.push(results);
  }
  writeResults("typeorm", "postgresql", typeormResults, benchmarkOptions);

  // Optionally compare results
  if (process.env.DEBUG === 'benchmarks:compare-results') {
    compareResults({
      prismaResults,
      drizzleResults,
      typeormResults
    });

  }

}
