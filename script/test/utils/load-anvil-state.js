// load-anvil-state.js  (CommonJS)
const fs = require('node:fs/promises') // ✅ promise-based readFile
const dotenv = require('dotenv')

function parseCli() {
  const args = process.argv.slice(2)
  const opts = {}
  for (let i = 0; i < args.length; i++) {
    if (args[i].startsWith('--')) {
      const key = args[i].slice(2)
      const val = args[i + 1]
      if (!val || val.startsWith('--'))
        throw new Error(`Missing value for --${key}`)
      opts[key] = val
      i++
    }
  }
  return opts
}

async function main() {
  dotenv.config()

  const { stateFile, rpcUrl } = parseCli()
  if (!stateFile || !rpcUrl) {
    console.error(`Usage:
    node load-anvil-state.js --stateFile script/deploy/data/anvil_master.txt --rpcUrl ETH_RPC_URL_MASTER`)
    process.exit(1)
  }

  try {
    const snapshotPath = (await fs.readFile(stateFile, 'utf8')).trim()

    const res = await fetch(rpcUrl, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        jsonrpc: '2.0',
        id: 1,
        method: 'anvil_loadState',
        params: [snapshotPath.replace(/^"|"$/g, '')],
      }),
    }).then((r) => r.json())

    if (res.error) throw new Error(JSON.stringify(res.error, null, 2))
    console.log('✅  State loaded:', res.result)
  } catch (err) {
    console.error('❌  Failed to load state:', err.message ?? err)
    process.exit(1)
  }
}

main()
