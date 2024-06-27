#!/bin/bash

exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check and install curl if necessary
if exists curl; then
  echo 'curl is already installed.'
else
  sudo apt-get update && sudo apt upgrade && sudo apt-get install curl screen -y < "/dev/null"
fi

# Logo
sleep 1 && curl -s https://raw.githubusercontent.com/0xpatatedouce/logo-/main/sweet%20potato.sh  | bash && sleep 1

# Check and install Docker if necessary
if exists docker; then
  echo 'Docker is already installed.'
else
  sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt update
  sudo apt install docker-ce -y
  # Launch Docker and Set to Autostart:
  sudo systemctl start docker
  sudo systemctl enable docker
  docker --version
fi

# Check and install Docker Compose if necessary
if exists docker-compose; then
  echo 'Docker Compose is already installed.'
else
  sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose 
  docker-compose --version
fi

# Install build essentials and clang
sudo apt install build-essential screen clang -y

# Install Rust
if exists rustc; then
  echo 'Rust is already installed.'
else
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source $HOME/.cargo/env
fi

# Clone and setup Bitcoin Signet
git clone https://github.com/chainwayxyz/bitcoin_signet && cd bitcoin_signet
docker build -t bitcoin-signet .
docker run -d --name bitcoin-signet-client-instance \
  --env MINERENABLED=0 \
  --env SIGNETCHALLENGE=512102653734c749d5f7227d9576b3305574fd3b0efdeaa64f3d500f121bf235f0a43151ae \
  --env BITCOIN_DATA=/mnt/task/btc-data \
  --env ADDNODE=signet.citrea.xyz:38333 -p 38332:38332 \
  bitcoin-signet
docker logs bitcoin-signet-client-instance

# Clone and setup Citrea
cd
git clone https://github.com/chainwayxyz/citrea --branch=v0.4.1 && cd citrea

# Modify the config file
sed -i 's/node_url = ".*"/node_url = "http:\/\/0.0.0.0:38332"/' configs/devnet/rollup_config.toml
sed -i 's/node_username = ".*"/node_username = "bitcoin"/' configs/devnet/rollup_config.toml
sed -i 's/node_password = ".*"/node_password = "bitcoin"/' configs/devnet/rollup_config.toml

# Build and run Citrea
SKIP_GUEST_BUILD=1 make build-release
screen -dmS citrea bash -c './target/release/citrea --da-layer bitcoin --rollup-config-path configs/devnet/rollup_config.toml --genesis-paths configs/devnet/genesis-files'

echo "Setup complete. Citrea is running in a screen session named 'citrea'."
echo "To attach to the session, use: screen -r citrea"
