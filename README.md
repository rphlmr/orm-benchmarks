# ORM benchmarks

## Setup

Clone the repo, install dependecies:

```
git clone ...
npm install --legacy-peer-deps
```

> **Note**: `--legacy-peer-deps` because of the some ORMs requiring differing version of database drivers.

Set the databse URL and run a migration:

```
export DATABASE_URL=postgresql://user:password@host:port/db
npx prisma migrate dev
```

## Usage

You can execute the benchmarks by running the [`benchmark.sh`](./benchmark.sh):

```
sh ./benchmark.sh
```

### Options

You can provide the following options to the script:

| Name             | Short | Default | Description                                        | Required |
| ---------------- | ----- | ------- | -------------------------------------------------- | -------- |
| `--iterations`   | `-i`  | 10      | Number of times to execute the benchmarks          | No       |
| `--size`         | `-s`  | 50      | Size of the data set (number of records per table) | No       |
| `--database-url` | `-d`  | n/a     | Database connection string                         | Yes      |

For example:

```
sh ./benchmark.sh -i 30 -s 1000 --database-url postgresql://user:password@host:port/db
```

### Output

The results of the benchmar runs are stored in a folder called `results`. Make sure this folder exists on your machine before running the benchmarks.
