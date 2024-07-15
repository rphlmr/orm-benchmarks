#!/bin/bash


# Function to perform a benchmark run
run_benchmark() {
  npm start
}

# Default number of iterations
iterations=2
size=50

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
  case $1 in
    -i|--iterations) iterations="$2"; shift ;;
    -s|--size) size="$2"; shift ;;
    -d|--database-url) database_url="$2"; shift ;;
    *) echo "Unknown parameter passed: $1"; exit 1 ;;
  esac
  shift
done

echo "Running benchmarks"
echo "Iterations: $iterations"
echo "Size: $size"

export ITERATIONS=$iterations
export SIZE=$size
if [ -n "$database_url" ]; then
  echo "Database URL: $database_url"
  export DATABASE_URL=$database_url
else
  echo "No database URL provided via command line, reading from .env ..."
fi

run_benchmark
