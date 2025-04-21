# Installation Docker

Diese Anleitung führt Sie durch die Installation und Konfiguration von Docker als Vorbereitung für die Schulungsumgebung.

## Voraussetzungen

- Ubuntu Desktop 24.04
- Grundlegende Kenntnisse der Kommandozeile

## 1. Installation von Docker und Docker Compose

Falls Docker und Docker Compose noch nicht installiert sind, führen Sie die folgenden Befehle aus:

```bash
# Aktualisieren der Paketlisten
sudo apt update

# Installation notwendiger Pakete
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Hinzufügen des Docker GPG-Schlüssels
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Hinzufügen des Docker-Repositorys
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Aktualisieren der Paketlisten mit dem neuen Repository
sudo apt update

# Installation von Docker
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Hinzufügen des aktuellen Benutzers zur Docker-Gruppe (erfordert Neuanmeldung)
sudo usermod -aG docker $USER

# Installation von Docker Compose
sudo apt install -y docker-compose
```

Nach der Installation müssen Sie sich ab- und wieder anmelden, damit die Gruppenänderungen wirksam werden.

## 2. Vorbereitung der Projektstruktur

Erstellen Sie ein Verzeichnis für das Projekt und wechseln Sie in dieses Verzeichnis:

```bash
mkdir -p ~/matomo-wordpress-schulung
cd ~/matomo-wordpress-schulung
```

## 3. Prüfen der Docker Installation

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
Lösung: Überprüfen Sie die Logs mit `docker-compose logs`

### Problem: Keine Verbindung zur Datenbank
Lösung: Stellen Sie sicher, dass der Datenbankcontainer läuft und die Umgebungsvariablen korrekt sind

### Problem: Ports sind bereits belegt
Lösung: Ändern Sie die Ports in der docker-compose.yml Datei (z.B. 8082:80 statt 8080:80)
