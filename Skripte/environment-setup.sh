#!/bin/bash

# Erzeuge Arbeitsverzeichnis
mkdir -p ~/matomo-uebung
cd ~/matomo-uebung

git clone https://github.com/TecBits-Web-IT-Services/Matomo-Training-Env.git
cd Matomo-Training-Env

ddev start
ddev snapshot restore --name clean-wp-setup-mariadb_10.11.gz
