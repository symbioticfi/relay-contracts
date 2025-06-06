FROM node:22

WORKDIR /app

# Install Foundry and curl
RUN apt-get update && apt-get install -y curl jq && \
    curl -L https://foundry.paradigm.xyz | bash && \
    /root/.foundry/bin/foundryup && \
    ln -s /root/.foundry/bin/* /usr/local/bin/

# Install JS dependencies
COPY package.json yarn.lock ./
RUN yarn install

# Copy source code
COPY . .


SHELL ["/bin/bash", "-c"]

# Run empty anvil
CMD ["yarn", "deploy:anvil"]

