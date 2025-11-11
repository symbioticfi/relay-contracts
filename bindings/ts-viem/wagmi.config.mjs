import { defineConfig } from "@wagmi/cli";
import { foundry } from "@wagmi/cli/plugins";
import { readFileSync, readdirSync } from "node:fs";
import { join, relative } from "node:path";

const ROOT = process.cwd();
const OUT_DIR = join(ROOT, "out");

const collectArtifactPaths = () => {
  const targets = [];
  const stack = [OUT_DIR];

  while (stack.length) {
    const current = stack.pop();
    for (const dirent of readdirSync(current, { withFileTypes: true })) {
      const fullPath = join(current, dirent.name);
      if (dirent.isDirectory()) {
        stack.push(fullPath);
        continue;
      }

      if (!dirent.isFile()) continue;
      if (!dirent.name.endsWith(".json")) continue;
      if (dirent.name.endsWith(".abi.json")) continue;

      const artifactRaw = readFileSync(fullPath, "utf8");
      let artifact;
      try {
        artifact = JSON.parse(artifactRaw);
      } catch {
        continue;
      }

      const metadataRaw = artifact.metadata;
      if (!metadataRaw) continue;

      let metadata;
      if (typeof metadataRaw === "string") {
        try {
          metadata = JSON.parse(metadataRaw);
        } catch {
          continue;
        }
      } else {
        metadata = metadataRaw;
      }

      const compilationTarget =
        (metadata?.settings?.compilationTarget && Object.keys(metadata.settings.compilationTarget)) || [];
      const sourcePath = compilationTarget[0];
      if (!sourcePath || typeof sourcePath !== "string") continue;
      if (!sourcePath.startsWith("src/")) continue;

      const lower = sourcePath.toLowerCase();
      if (lower.includes("interfac") || lower.includes("librar") || lower.includes("logic")) continue;

      const relativePath = relative(OUT_DIR, fullPath);
      targets.push(relativePath);
    }
  }

  targets.sort();

  const seen = new Set();
  for (const target of targets) {
    const name = target
      .split("/")
      .pop()
      ?.replace(/\.json$/, "");
    if (!name) continue;
    if (seen.has(name)) {
      throw new Error(`Duplicate contract name detected for wagmi config: ${name}`);
    }
    seen.add(name);
  }

  return targets;
};

const includeArtifacts = collectArtifactPaths();

export default defineConfig({
  out: "bindings/ts-viem/generated.ts",
  plugins: [
    foundry({
      project: ".",
      artifacts: "out",
      include: includeArtifacts,
    }),
  ],
});
