import { readFileSync } from "node:fs";
import { spawnSync } from "node:child_process";

const manifestUrl = new URL("../package.json", import.meta.url);
const manifest = JSON.parse(readFileSync(manifestUrl, "utf8"));
const dependencies = {
  ...manifest.dependencies,
  ...manifest.devDependencies,
};
const packages = Object.entries(dependencies).map(
  ([name, version]) => `${name}@${version}`,
);

if (packages.length === 0) {
  throw new Error("package.json does not declare any Node tools");
}

const npm = process.platform === "win32" ? "npm.cmd" : "npm";
const result = spawnSync(npm, ["install", "--global", ...packages], {
  stdio: "inherit",
});

if (result.error) {
  throw result.error;
}

process.exitCode = result.status ?? 1;
