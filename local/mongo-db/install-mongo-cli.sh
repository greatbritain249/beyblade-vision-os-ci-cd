#!/usr/bin/env bash

source /etc/os-release

if [[ $ID == *"ubuntu"* && $VERSION_ID == "20.04" ]]; then

  echo "[+] Installing Mongo CLI tools for $NAME $VERSION_ID"

  sudo apt -y install gnupg
  curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
  echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
  sudo apt update
  sudo apt install -y mongodb-org

elif [[ $ID == *"ubuntu"* && $VERSION_ID == "22.04" ]]; then

  echo "[+] Installing Mongo CLI tools for $NAME $VERSION_ID"

  sudo apt -y install gnupg
  wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
  echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
  sudo apt update
  sudo apt install -y mongodb-org

else
  echo "[x] Sorry, your OS isn't covered in this script. You'll have to install mongosh on your own :("
fi