FROM node:22

WORKDIR /app

# Install Foundry and curl
RUN apt-get update && apt-get install -y curl && \
    curl -L https://foundry.paradigm.xyz | bash && \
    /root/.foundry/bin/foundryup && \
    ln -s /root/.foundry/bin/* /usr/local/bin/

# Install JS dependencies
COPY package.json yarn.lock ./
RUN yarn install

# Copy source code
COPY . .

# Build contracts
RUN forge build

# Set default shell to bash for commands like 'source'
SHELL ["/bin/bash", "-c"]

# Command that will be executed when the container starts
CMD ["yarn", "deploy"]