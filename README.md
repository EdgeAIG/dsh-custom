# dsh-custom

Remote-ready [DeepSeek Harness](https://github.com/deepseek-ai/deepseek-harness) for Railway / Docker.

**Docs (GitHub Pages):** https://edgeaig.github.io/dsh-custom/

## Highlights

| Feature | Details |
|---------|---------|
| Remote trust | Public browser can load **Settings** / providers (Host rewrite + `isLoopback` force) |
| Free models | `opencode-free` (Zen) + `empero-free` |
| Web search | **Exa MCP** replaces **web-search-deepseek** / `deepseek-official` search |
| Agent Rail | Plan map + trail (`agent_rail_*` tools) |
| Telegram | Owner DM protocol + customer channel |

## Web search replacement

Stock dsh includes `@deepseek-ai/dsh-web-search-deepseek` and `searchProvider: deepseek-official`.

This project:

1. Sets `DSH_WEB_SEARCH_PROVIDER=exa-mcp` and `DSH_WEB_FETCH_PROVIDER=exa-mcp`
2. Patches the `web` cordis row to those providers
3. Points DeepSeek search at `DSH_DISABLE_DEEPSEEK_WEB_SEARCH` (no key)
4. Registers `dsh-web-search` (Exa MCP, no API key) and removes/disables `deepseek-official` at runtime
5. Adds settings namespace **`web-search-exa`**

## Quick start (Railway)

```bash
railway up
```

Optional env:

```
TELEGRAM_BOT_TOKEN=
TELEGRAM_OWNER_CHAT_ID=
TELEGRAM_CHANNEL_ID=
TRUSTED_HOST=your.domain
```

## Local Docker

```bash
docker build -t dsh-custom .
docker run --rm -p 8080:8080 -e PORT=8080 dsh-custom
```

## License

MIT (plugins). Upstream dsh remains under its own license.
