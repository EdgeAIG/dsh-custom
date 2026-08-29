FROM node:22-bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    git curl ca-certificates python3 build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://opencode.ai/install | bash || true
ENV PATH="/root/.opencode/bin:${PATH}"

ARG DSH_VERSION=0.1.1-rc.2
RUN npm install -g @deepseek-ai/dsh@${DSH_VERSION} pnpm@9

ENV DSH_HOME=/data/dsh-home
ENV PORT=3080
ENV HOST=0.0.0.0
RUN mkdir -p /data/dsh-home /app/workspace /app/plugins

WORKDIR /app
COPY remote-trust /app/plugins/remote-trust
COPY llm-opencode /app/plugins/llm-opencode
COPY web-search /app/plugins/web-search
COPY subagent-defaults /app/plugins/subagent-defaults
COPY config-ui /app/plugins/config-ui
COPY deploy/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /app/workspace
EXPOSE 3080
ENTRYPOINT ["/entrypoint.sh"]
