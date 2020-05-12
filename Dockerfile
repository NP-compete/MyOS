FROM node:10

# Default Environment
ARG NODE_ENV=production
ARG NODE_PORT=8000
ARG DOCKER_UID=1000
ARG DOCKER_GID=1000
ENV NODE_ENV $NODE_ENV

# Set user/group IDs
RUN usermod -u ${DOCKER_UID} node; exit 0
RUN groupmod -g ${DOCKER_GID} node; exit 0

# Set up base dirs and permissions
RUN mkdir -p /usr/src/osjs/dist/{apps,icons,themes}

# Install system dependencies
RUN npm install -g nodemon

# Working area
WORKDIR /usr/src/osjs

# Copy our npm setup
COPY . .

# Set the correct user
RUN chown -R node:node /usr/src/osjs
USER node

# Install dependencies
RUN NODE_ENV=development npm install

# Discover packages
RUN npm run package:discover

# Build OS.js
RUN npm run build

# Start the node server
EXPOSE $NODE_PORT

CMD npm run serve
