# dsh-custom — remote-ready DeepSeek Harness

Plugins + deploy configs for running **dsh web** on Railway / Render / Fly.io / Cloudflare Tunnel with:

| Package | Role |
|---------|------|
| **dsh-remote-trust** | Any Host / Cloudflare tunnel → full settings + privileged APIs (no auth; temporary) |
| **dsh-llm-opencode** | OpenCode CLI free models (`opencode`), auto-detect |
| **dsh-web-search** | `web_search` + `web_fetch` via **Exa MCP** (`mcp.exa.ai`) — **no API key, no DuckDuckGo** |
| **dsh-subagent-defaults** | Sub-agents / inline processes default to OpenCode free (`mimo-v2.5-free`), not official DeepSeek |
| **dsh-config-ui** | In-browser editor for `cordis.patch.yml` (replaces “open configuration file” on remote) |

## Quick install (local)

```bash
./install.sh
# or:
dsh plugin --profile web add file:$PWD/remote-trust
dsh plugin --profile web add file:$PWD/llm-opencode
dsh plugin --profile web add file:$PWD/web-search
dsh plugin --profile web add file:$PWD/subagent-defaults
dsh plugin --profile web add file:$PWD/config-ui
```

Optional free models:

```bash
curl -fsSL https://opencode.ai/install | bash
```

```bash
dsh web --host 0.0.0.0
```

Default model: **`opencode/mimo-v2.5-free`** (live free catalog; DeepSeek V4 Flash Free is flaky).

## Deploy

Docker context = **repository root**.

### Railway
- Connect repo, set Dockerfile path `deploy/Dockerfile` (or root `Dockerfile`)

### Render
Use `deploy/render.yaml` blueprint.

### Fly.io
```bash
fly launch --config deploy/fly.toml
fly volumes create dsh_data --size 5
fly deploy
```

### Env

| Variable | Purpose |
|----------|---------|
| `PORT` / `HOST` | Listen (default `3080` / `0.0.0.0`) |
| `DSH_HOME` | Persistent state (mount a volume) |
| `TRUSTED_HOST` | Extra public hostname for trust fence |
| `RAILWAY_PUBLIC_DOMAIN` / `RENDER_EXTERNAL_HOSTNAME` / `FLY_APP_NAME` | Auto-trusted by entrypoint |

## Security

`remote-trust` opens the host with **no authentication**. Put Cloudflare Access, OAuth proxy, or platform auth in front before public exposure.

## Layout

```
remote-trust/  llm-opencode/  web-search/  subagent-defaults/  config-ui/
deploy/        Dockerfile     install.sh   shared/
```
