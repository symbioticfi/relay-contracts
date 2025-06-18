FROM node:22

WORKDIR /app

# Install Foundry and curl
RUN apt-get update && apt-get install -y curl jq && \
    curl -L https://foundry.paradigm.xyz | bash && \
    /root/.foundry/bin/foundryup --install v1.1.0 && \
    ln -s /root/.foundry/bin/* /usr/local/bin/

COPY package.json yarn.lock ./

# Install JS dependencies
RUN yarn install --frozen-lockfile

# Copy source code
COPY . .

# Run empty anvil
CMD ["yarn", "deploy:anvil"]
