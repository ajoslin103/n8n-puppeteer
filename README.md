# n8n-puppeteer-fork

This project provides an n8n docker image with compiled-in support for Playwright

1. You must execute these [bash] commands (at the root of this repo) to bring down our FOC Certs (we welcome PowerShell versions of these commands)

`mkdir tmp && curl -sSLk "https://tools.circleci.foc.zone/certs/bundle.tgz" -o ./tmp/bundle.tgz`
`mkdir tmp/pki && tar -xvzf tmp/bundle.tgz -C tmp/pki && rm tmp/bundle.tgz`
`cat tmp/pki/* > tmp/pki/combined.pem`

2. follow the rest of the repo startup instructions

<small>(personally: I believe MCP E2E Testing could revolutionize how we test across the FOC's, imagine that you have setup all the details about a fictional person who wants to buy a house -- we could use verbal directions to have this [personalized] chatbot: find a home on RH; chat with a Banker; apply for a mortgage on RM; do a reFi...)</small>

**Note**: *(devzilla)[https://github.com/devszilla] originated this work, adding Puppeteer support to n8n*

![n8n.io - Workflow Automation](https://user-images.githubusercontent.com/65276001/173571060-9f2f6d7b-bac0-43b6-bdb2-001da9694058.png)

# n8n - Secure Workflow Automation for Technical Teams

n8n is a workflow automation platform that gives technical teams the flexibility of code with the speed of no-code. With 400+ integrations, native AI capabilities, and a fair-code license, n8n lets you build powerful automations while maintaining full control over your data and deployments.

**Note**: *This project is forked from the [official n8nio/n8n repository](https://github.com/n8n-io/n8n.git) and includes additional components to allow for Puppeteer to function properly within code nodes.*

**Note**: *This project is forked from the [devszilla n8n-puppeteer](https://github.com/devszilla/n8n-puppeteer.git) and includes additional components to allow for Playwright to function properly within code nodes.*

**Note**: *This project is forked from the [ajoslin103](https://github.com/ajoslin103/n8n-puppeteer) and includes our FOC Certs and continues work towards e2e chatbot testing.*

## Prerequisites

Before you begin, ensure that you have the following tools installed:

### 1. **Docker**
Docker is required to build and run containers for n8n. If you don't have Docker installed, you can follow the instructions below to get it set up on your machine.

- **Read more**: [Docker Installation Guide](https://docs.docker.com/get-docker/)

### 2. **Make**
Make is a build automation tool that simplifies tasks like building containers and managing projects. It is required for running the `make init` command to start n8n.

- **Read more**: [Make Installation Guide](https://www.gnu.org/software/make/)

### 3. **OpenSSL**
OpenSSL is a toolkit that provides encryption functions, and we use it to generate a secure encryption key for n8n. Make sure it is installed before running the setup.

- **Read more**: [OpenSSL Installation Guide](https://www.openssl.org/)

### Verifying Installation
After installing these tools, you can verify their presence by running the following commands:

```bash
# Verify Docker
docker --version

# Verify Make
make --version

# Verify OpenSSL
openssl --version

```

## Setup
To clone the repo, set up environment variables, build and run n8n, follow these steps:

```bash
# Clone the repository
git clone https://github.com/devszilla/n8n-puppeteer.git

# Navigate to the project root directory
cd n8n-puppeteer

# Initialize the repo
make create-env

# Run as needed
make init

```

## Troubleshooting

You can exec into the instance `docker exec -ti n8n-1.82.3 /bin/bash`

https://docs.n8n.io/hosting/cli-commands/


## Exploration

##### See what happens when I leave you kids alone!?!?!

Anthropic dropped MCP on 11/2024, it’s a [discoverable] protocol for connecting Agents to external data and tools.

https://www.youtube.com/watch?v=sb5hCcFYPIE

evolution of MCP

https://youtu.be/m0YrxLnFPzQ?t=181

Basically MCP moves the reponsibility/difficulty of connecting to data sources, over to the owners of those data sources as MCP Servers

Al;

https://modelcontextprotocol.io

TLDR: this is a tectonic shift for agents - get ready to hang on - AI just took a Huuuuuuuge step forward

https://github.com/modelcontextprotocol

SELECTED VIDEOS


A good executive overview
https://www.youtube.com/watch?v=VChRPFUzJGA

Very full video about MCP 
https://www.youtube.com/watch?v=v_6EXt6T83I


MCP Deep dive with mahesh murag
Wherin he attaches an MCP tool in n8n
https://www.youtube.com/watch?v=kQmXtrmQ5Zg
https://github.com/maheshmurag/workshop-mcp-agent-example


SELECTED LINKS

model-context-protocol
https://modelcontextprotocol.io
https://github.com/modelcontextprotocol (for devs)

n8n self hosting info
https://github.com/n8n-io/n8n-hosting/tree/main/kubernetes


N8N MCP COMMUNITY

https://community.n8n.io/

N8N MCP COMMUNITY MODULE USAGE

https://www.npmjs.com/package/n8n-nodes-mcp

https://github.com/executeautomation/mcp-playwright


LEADING EDGE STUFF (at the time of this writing)


n8n in god mode (which will get danerous someday...)

https://www.youtube.com/watch?v=SkxgOjyH8Dc


build n8n workflows using claude

https://www.youtube.com/watch?v=8tXYwLRZj3o



MCP SERVER REPOS


https://glama.ai/mcp/servers

https://github.com/restyler/awesome-n8n

https://github.com/hanson-cheng/n8n-workflows

https://github.com/8gears/n8n-helm-chart

