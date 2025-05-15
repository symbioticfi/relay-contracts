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

RUN rm script/test/utils/generate_genesis && \
    cp script/test/utils/generate_genesis_linux_amd64 script/test/utils/generate_genesis && \
    forge build && \
    yarn config set script-shell /bin/bash

SHELL ["/bin/bash", "-c"]