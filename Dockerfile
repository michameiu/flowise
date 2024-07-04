FROM ubuntu:22.04
RUN apt update -y
RUN apt install curl -y

# Install required packages
# RUN apt-get update && \
#     apt-get install -y curl build-essential

# Install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Set environment variables for nvm
ENV NVM_DIR /root/.nvm
ENV NODE_VERSION 20.9.0

# Add nvm and node to PATH
RUN . $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    nvm use default

ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# Verify installation
RUN node -v && npm -v

# RUN which nvm
RUN node --version
# RUN npm --version
RUN npm install -g flowise 
# EXPOSE 3000

CMD ["npx","flowise","start"]
