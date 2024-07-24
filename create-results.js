const fs = require("fs").promises;
const path = require("path");

const resultsDir = path.join(__dirname, "results");
const htmlFile = path.join(__dirname, "results.html");

async function getMostRecentFolder(dir) {
  const folders = await fs.readdir(dir, { withFileTypes: true });
  const postgresqlFolders = folders
    .filter(
      (dirent) => dirent.isDirectory() && dirent.name.startsWith("postgresql-")
    )
    .map((dirent) => ({
      name: dirent.name,
      path: path.join(dir, dirent.name),
      time: parseInt(dirent.name.split("-").pop()),
    }))
    .sort((a, b) => b.time - a.time);

  return postgresqlFolders[0];
}

async function readCSVFile(filePath) {
  const content = await fs.readFile(filePath, "utf-8");
  const [headers, values] = content.trim().split("\n");
  return values.split(",").map((v) => parseFloat(v).toFixed(2));
}

function updateHTML(
  htmlContent,
  prismaValues,
  drizzleValues,
  drizzleSelectValues,
  typeormValues
) {
  const tableRegex = /<table[^>]*>[\s\S]*?<\/table>/;
  const tableMatch = htmlContent.match(tableRegex);

  if (tableMatch) {
    let tableContent = tableMatch[0];
    const rows = tableContent.match(/<tr[^>]*>[\s\S]*?<\/tr>/g) || [];

    const updatedRows = rows.map((row, index) => {
      if (index === 0 || !row.includes('class="parent-row"')) {
        // Keep header row and non-parent rows unchanged
        return row;
      }

      if (index - 1 < prismaValues.length) {
        row = row.replace(
          /(<td[^>]*data-prisma[^>]*>)[^<]*(<\/td>)/,
          `$1${prismaValues[index - 1]}ms$2`
        );
        row = row.replace(
          /(<td[^>]*data-drizzle[^>]*>)[^<]*(<\/td>)/,
          `$1${drizzleValues[index - 1]}ms$2`
        );
        row = row.replace(
          /(<td[^>]*data-drizzle-select[^>]*>)[^<]*(<\/td>)/,
          `$1${drizzleSelectValues[index - 1]}ms$2`
        );
        row = row.replace(
          /(<td[^>]*data-typeorm[^>]*>)[^<]*(<\/td>)/,
          `$1${typeormValues[index - 1]}ms$2`
        );
      }
      return row;
    });

    const updatedTableContent = tableContent.replace(
      /<tbody[^>]*>[\s\S]*?<\/tbody>/,
      `<tbody>${updatedRows.slice(1).join("")}</tbody>`
    );

    htmlContent = htmlContent.replace(tableRegex, updatedTableContent);
  }

  return htmlContent;
}

async function main() {
  try {
    const recentFolder = await getMostRecentFolder(resultsDir);
    if (!recentFolder) {
      throw new Error("No suitable folder found");
    }

    const prismaValues = await readCSVFile(
      path.join(recentFolder.path, "prisma.csv")
    );
    const drizzleValues = await readCSVFile(
      path.join(recentFolder.path, "drizzle.csv")
    );
    const drizzleSelectValues = await readCSVFile(
      path.join(recentFolder.path, "drizzle-select.csv")
    );
    const typeormValues = await readCSVFile(
      path.join(recentFolder.path, "typeorm.csv")
    );

    let htmlContent = await fs.readFile(htmlFile, "utf-8");
    htmlContent = updateHTML(
      htmlContent,
      prismaValues,
      drizzleValues,
      drizzleSelectValues,
      typeormValues
    );

    await fs.writeFile(htmlFile, htmlContent);
    console.log("HTML file updated successfully");
  } catch (error) {
    console.error("Error:", error.message);
  }
}

main();
