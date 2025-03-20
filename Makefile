# Include .env file if it exists
ifneq ("$(wildcard .env)","")
    include .env
    export
endif

# Make target to generate .env file
create-env:
	@echo "Generating .env file..."
	@ENCRYPTION_KEY=$$(openssl rand -hex 32) && \
	printf "PUPPETEER_VERSION=24.4.0\nPLAYWRIGHT_VERSION=1.51.1\nN8N_VERSION=1.82.3\nN8N_ENCRYPTION_KEY=$$ENCRYPTION_KEY\nN8N_SECURE_COOKIE=false\nNODE_FUNCTION_ALLOW_EXTERNAL=puppeteer-core,cheerio,n8n-workflow\nN8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true\nN8N_RUNNERS_ENABLED=true\nN8N_COMMUNITY_PACKAGES_ALLOW_TOOL_USAGE=true\nN8N_LOG_LEVEL=info\nN8N_LOG_OUTPUT=console\n" > .env
	. .env
	@echo "sourced .env file."

# Make target to build the n8n Docker image
build-image:
	@echo "Building Docker image..."
	# Check if the image exists
	@if ! docker image inspect n8n-${N8N_VERSION} > /dev/null 2>&1; then \
		echo "No existing image found, proceeding to build."; \
	else \
		echo "Image 'n8n-${N8N_VERSION}' already exists. Removing..."; \
		docker rmi -f n8n-${N8N_VERSION} || echo "Failed to remove the image."; \
	fi
	# Now build the new image
	docker build \
		--build-arg N8N_VERSION=${N8N_VERSION} \
		--build-arg PUPPETEER_VERSION=${PUPPETEER_VERSION} \
		--build-arg PLAYWRIGHT_VERSION=${PLAYWRIGHT_VERSION} \
		-t n8n-${N8N_VERSION} \
		.

# Make target to create Docker volume, network if not exist, start container
docker-up: build-image
	@echo "Checking if network exists..."
	@if docker network inspect n8n_network > /dev/null 2>&1; then \
		echo "Network 'n8n_network' already exists, hopping to the next task 🦘."; \
	else \
		echo "Creating network..."; \
		docker network create n8n_network; \
	fi
	@echo "Checking if volume exists..."
	@if docker volume inspect n8n_data-${N8N_VERSION} > /dev/null 2>&1; then \
		echo "Volume 'n8n_data-${N8N_VERSION}' already exists, hopping to the next task 🦘."; \
	else \
		echo "Creating volume..."; \
		docker volume create n8n_data-${N8N_VERSION}; \
	fi
	@echo "Running Docker container..."
	docker run -d \
		--name n8n-${N8N_VERSION} \
		--env-file .env \
		-p 5678:5678 \
		--restart unless-stopped \
		-v n8n_data-${N8N_VERSION}:/home/node/.n8n \
		--network n8n_network \
		n8n-${N8N_VERSION}

# Make target to stop docker container
docker-down:
	@echo "Stopping and removing Docker container..."
	@docker stop n8n-${N8N_VERSION} || echo "Container not running."
	@docker rm n8n-${N8N_VERSION} || echo "Container not found."
	# Optionally remove the image:
	# docker rmi n8n-${N8N_VERSION}
	# docker network rm n8n_network

# Make target to initialize the repo for new users (create env, build image, run container)
init: create-env docker-up
	@echo "Repository initialization complete! Docker container is running."