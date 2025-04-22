#!/bin/bash

#Aktualisieren der Paketlisten
sudo apt update

# Installation notwendiger Pakete
sudo apt-get install ca-certificates curl

# Hinzufügen des Docker GPG-Schlüssels
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Hinzufügen des Docker-Repositorys
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Aktualisieren der Paketlisten mit dem neuen Repository
sudo apt update

# Installation von Docker
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Hinzufügen des aktuellen Benutzers zur Docker-Gruppe (erfordert Neuanmeldung)
sudo usermod -aG docker $USER
sudo usermod -aG docker student
