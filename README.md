# dsh-custom — remote-ready DeepSeek Harness

Run **dsh web** on Railway / Render / Fly.io / Cloudflare Tunnel with:

| Package | Role |
|---------|------|
| **dsh-remote-trust** | Public / Cloudflare hosts get full settings (no auth — temporary) |
| **dsh-llm-opencode** | OpenCode CLI free models; default **`opencode/mimo-v2.5-free`** |
| **dsh-web-search** | `web_search` + `web_fetch` via **Exa MCP** (no API key) |
| **dsh-subagent-defaults** | Sub-agents use OpenCode free, not official DeepSeek |
| **dsh-config-ui** | In-browser config editor for remote hosts |

---

## Deploy on Railway (one click)

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template?template=https://github.com/EdgeAIG/dsh-custom)

Or: **https://railway.com/new/template?template=https://github.com/EdgeAIG/dsh-custom**

### After deploy

1. Railway assigns a public URL (`*.up.railway.app`).
2. Open it — Web UI should load (remote-trust treats any Host as trusted).
3. Optional volume: mount at `/data` so sessions survive restarts (`DSH_HOME=/data/dsh-home`).
4. Optional env: `TRUSTED_HOST` = custom domain; `PORT` is set by Railway.

### Manual Railway

```bash
railway init
railway up
```

Dockerfile: root `Dockerfile`.

---

## Local install

```bash
./install.sh
curl -fsSL https://opencode.ai/install | bash
dsh web --host 0.0.0.0
```

Default model: **`opencode/mimo-v2.5-free`**.

## Other platforms

- **Render:** `deploy/render.yaml`
- **Fly.io:** `deploy/fly.toml` + volume `dsh_data` → `/data`

## Security

`remote-trust` has **no authentication**. Put Cloudflare Access / OAuth / platform auth in front for anything beyond a private experiment.
