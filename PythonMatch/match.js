const fs = require("fs");
const path = require("path");
const base64 = require("base-64");
const utf8 = require("utf8");

function main() {
  if (process.argv.length !== 4) {
    console.log("Usage: node regex_file_matcher.js <base64_regex> <file_path>");
    return;
  }
  const base64Regex = process.argv[2];
  const filePath = process.argv[3];
  try {
    const regex = utf8.decode(base64.decode(base64Regex));
    const pattern = new RegExp(regex, "g");
    try {
      const content = fs.readFileSync(filePath, "utf-8");
      let matches;
      while ((matches = pattern.exec(content)) !== null) {
        console.log(`Found match: ${matches[0]} at position ${matches.index}`);
      }
    } catch (e) {
      console.log(`Error reading file: ${e.message}`);
    }
  } catch (e) {
    console.log(`Error decoding Base64 regex: ${e.message}`);
  }
}
if (require.main === module) {
  main();
}
