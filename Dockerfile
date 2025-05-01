FROM node:22

WORKDIR /app

# Установим curl и Foundry
RUN apt-get update && apt-get install -y curl && \
    curl -L https://foundry.paradigm.xyz | bash && \
    /root/.foundry/bin/foundryup && \
    ln -s /root/.foundry/bin/* /usr/local/bin/

# Set default shell to bash for commands like 'source'
SHELL ["/bin/bash", "-c"]

# Установка зависимостей Node
COPY package.json yarn.lock ./
RUN yarn install

# Копируем весь проект
COPY . .

# Command that will be executed when the container starts
CMD ["yarn", "deploy"]