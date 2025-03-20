# n8n-puppeteer

![n8n.io - Workflow Automation](https://user-images.githubusercontent.com/65276001/173571060-9f2f6d7b-bac0-43b6-bdb2-001da9694058.png)

# n8n - Secure Workflow Automation for Technical Teams

n8n is a workflow automation platform that gives technical teams the flexibility of code with the speed of no-code. With 400+ integrations, native AI capabilities, and a fair-code license, n8n lets you build powerful automations while maintaining full control over your data and deployments.

**Note**: *This project is forked from the [official n8nio/n8n repository](https://github.com/n8n-io/n8n.git) and includes additional components to allow for Puppeteer and Playwright to function properly within code nodes.*

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

# Initialize the repo (create .env, build the image, and start the container)
make init

# just keep running until works
make init

```
