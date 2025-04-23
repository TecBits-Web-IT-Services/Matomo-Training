# Installation Docker

Diese Anleitung führt Sie durch die Installation und Konfiguration von Docker als Vorbereitung für die Schulungsumgebung.

## Voraussetzungen

- Ubuntu Desktop 24.04
- Grundlegende Kenntnisse der Kommandozeile

## Variante 1a. Automatische Installation auf von uns bereitgestellten Testrechnern

> Hinweis:
>
> - sollten Sie nach einem Root-Passwort gefragt werden so verwenden Sie bitte das Passwort des "student" Benutzers
> - Nach der ausführung des Scriptes müssen Sie sich einmal ab- und wieder anmelden damit die neue Gruppenzuweisung zum tragen kommt.
> - 
1. Öffnen Sie den Browser Firefox in der virtuelen Ubuntu Umgebung öffnen die [https://google.de](https://google.de), damit die SSL Datenbank des Browsers erstellt wird.
2. Öffnen Sie die Linux Kommandozeile (Terminal) und führen Sie folgende Befehle aus:
```bash
wget https://raw.githubusercontent.com/TecBits-Web-IT-Services/Matomo-Training/main/Skripte/docker-setup.sh &&\
 chmod +x docker-setup.sh &&\
 ./docker-setup.sh
```

## Variante 1b. Manuelle Installation von Docker und zuweisen der Benutzergruppe

Falls Docker und Docker Compose noch nicht installiert sind, führen Sie die folgenden Befehle aus:

```bash
#Aktualisieren der Paketlisten
sudo apt update

# Installation notwendiger Pakete und einiger basics
sudo apt-get install ca-certificates curl git nano mc htop

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

# Setup DDEV
# Add DDEV’s GPG key to your keyring
sudo sh -c 'echo ""'
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://pkg.ddev.com/apt/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/ddev.gpg > /dev/null
sudo chmod a+r /etc/apt/keyrings/ddev.gpg

# Add DDEV releases to your package repository
sudo sh -c 'echo ""'
echo "deb [signed-by=/etc/apt/keyrings/ddev.gpg] https://pkg.ddev.com/apt/ * *" | sudo tee /etc/apt/sources.list.d/ddev.list >/dev/null

# Update package information and install DDEV
sudo sh -c 'echo ""'
sudo apt-get update && sudo apt-get install -y ddev

# One-time initialization of mkcert
mkcert -install

# Hinzufügen des aktuellen Benutzers zur Docker-Gruppe (erfordert Neuanmeldung)
sudo usermod -aG docker student

```
> Hinweis:
>
> Nach der ausführung des Scriptes müssen Sie sich einmal ab- und wieder anmelden damit die neue Gruppenzuweisung zum tragen kommt.

## 2. Prüfen der Docker Installation

```bash
docker run hello-world
```

Wenn alles funktioniert hat, sollten Sie folgende Ausgabe sehen und die Aufgabe ist beendet:
```bash
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.
```

## Fehlerbehebung

### Problem: Container starten nicht
Lösung: Überprüfen Sie die Logs mit `docker compose logs`

### Problem: Keine Verbindung zur Datenbank
Lösung: Stellen Sie sicher, dass der Datenbankcontainer läuft und die Umgebungsvariablen korrekt sind

### Problem: Ports sind bereits belegt
Lösung: Ändern Sie die Ports in der docker-compose.yml Datei (z.B. 8082:80 statt 8080:80)
