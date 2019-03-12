### MyOS

## Requirements

Node 8 (or newer) and any modern web-browser.

## Installation

> MyOS runs on `localhost:8000` by default.

### Demo

You can run a demo using docker without checkout out any source-code:

```
docker run -p 8000:8000 osjs/osjs:v3
```

### Manual

```
Clone this repo
cd MyOS
```

#### Locally

```
# Install dependencies
npm install

# It's recommended that you keep your dependencies (including MyOS) up-to-date
npm update

# Optionally install extra packages:
npm install --production @osjs/example-application

# Discover installed packages
npm run package:discover

# Build your client
npm run build

# Start serving
npm run serve
```

#### Docker

You can also build a Docker image yourself or use docker-compose:

```
cp .env.example .env
docker-compose up
```
