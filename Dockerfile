# Use a Debian-based Node.js 20 image
FROM node:20-slim

# Define build arguments for N8N, Puppeteer, and Playwright versions
ARG N8N_VERSION
ARG PUPPETEER_VERSION
ARG PLAYWRIGHT_VERSION

# Install system dependencies required by Puppeteer and Playwright
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-liberation \
    libnss3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libgbm-dev \
    libgtk-3-0 \
    tini \
    xdg-utils \
    && rm -rf /var/lib/apt/lists/*

# Install n8n globally with the specified version
RUN npm install -g n8n@${N8N_VERSION}

# Install Puppeteer and Playwright
RUN npm install -g puppeteer-core@${PUPPETEER_VERSION} playwright@${PLAYWRIGHT_VERSION} \
    && npx playwright install chromium

# Set environment variables for Puppeteer and Playwright
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Create the directory for n8n's configuration
RUN mkdir -p /home/node/.n8n && chown node:node /home/node/.n8n

# install SOMETHING ** MOVE IT UP NEXT TIME WE BUILD FROM SCRATCH **
# RUN apt-get update && apt-get install -y \
#     && rm -rf /var/lib/apt/lists/*

# Switch to the 'node' user
USER node

# Set the NODE_EXTRA_CA_CERTS environment variable
ENV NODE_EXTRA_CA_CERTS=/etc/ssl/certs/custom-ca.pem

# Use tini as the init system
ENTRYPOINT ["/usr/bin/tini", "--"]

# Set the command to run n8n
CMD ["n8n"]