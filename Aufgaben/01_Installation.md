# Übung 1: Installation und Grundkonfiguration von Matomo mit Docker

## Übungsziele
- Einrichtung einer Docker-Umgebung mit WordPress und Matomo
- Grundkonfiguration von Matomo
- Verständnis der Beziehung zwischen Matomo und der Datenbank

## Benötigte Zeit
- 45-60 Minuten

## Voraussetzungen
- Ubuntu Desktop 24.04
- Installiertes Docker und Docker Compose
- Grundlegende Kenntnisse der Kommandozeile

## Übungsschritte

### Teil 1: Einrichtung der Docker-Umgebung

1. Öffnen Sie ein Terminal und erstellen Sie ein Verzeichnis für die Übung:
   ```bash
   mkdir -p ~/matomo-uebung
   cd ~/matomo-uebung
   ```

2. Erstellen Sie eine Datei `docker compose.yml` mit dem bereitgestellten Inhalt:
   ```bash
   nano docker compose.yml
   ```
   
   Fügen Sie den Inhalt aus der Datei **"Beispielkonfigurationen/Docker/docker compose.yml"** ein und speichern Sie die Datei (Strg+O, Enter, Strg+X).

3. Starten Sie die Docker-Container:
   ```bash
   docker compose up -d
   ```

4. Überprüfen Sie, ob alle Container erfolgreich gestartet wurden:
   ```bash
   docker compose ps
   ```
   
   **Aufgabe**: Notieren Sie die Status und Ports aller laufenden Container.

### Teil 2: Ersteinrichtung von WordPress

1. Öffnen Sie einen Webbrowser und navigieren Sie zu `http://localhost:8080`

2. Führen Sie die WordPress-Ersteinrichtung durch:
   - Wählen Sie Deutsch als Sprache
   - Erstellen Sie einen Administratorbenutzer mit folgenden Daten:
     - Websitetitel: "Matomo Schulung"
     - Benutzername: admin
     - Passwort: Test4711-
     - Passwort bestätigen Häckchen setzen
     - E-Mail: training@tecbits.de

### Teil 3: Ersteinrichtung von Matomo

1. Öffnen Sie einen Webbrowser und navigieren Sie zu `http://localhost:8081`

2. Folgen Sie dem Installationsassistenten:
   - Wählen Sie Deutsch als Sprache
   - Überprüfen Sie die Systemanforderungen (sollten alle erfüllt sein)
   - Bei der Datenbankeinrichtung verwenden Sie:
     - Datenbankserver: db
     - Benutzername: exampleuser
     - Passwort: examplepass
     - Datenbankname: exampledb
     - Tabellenpräfix: matomo_
   
   **Aufgabe**: Was passiert, wenn Sie ein anderes Tabellenpräfix verwenden würden? Warum ist das Präfix wichtig?

3. Erstellen Sie einen Administratorbenutzer:
   - Benutzername: matomo-admin
   - Passwort: Test4711- (notieren Sie sich ein sicheres Passwort!)
   - E-Mail: training@tecbits.de

4. Richten Sie Ihre erste Website ein:
   - Name: Matomo Schulungswebsite
   - URL: http://localhost:8080
   - Zeitzone: Deutschland-Berlin
   - Wählen Sie "Dies ist keine Ecommerce Seite" bei der Frage "E-Commerce"

5. Kopieren Sie den generierten Tracking-Code und speichern Sie ihn in einer Textdatei für die spätere Verwendung.

   **Aufgabe**: Analysieren Sie den Tracking-Code. Welche Hauptkomponenten enthält er und welche Funktion haben sie?

### Teil 4: Überprüfung der Datenbankstruktur

1. Verbinden Sie sich mit dem Datenbank-Container:
   ```bash
   docker compose exec db mysql -u exampleuser -pexamplepass exampledb
   ```

2. Zeigen Sie alle Tabellen in der Datenbank an:
   ```sql
   SHOW TABLES;
   ```
   
   **Aufgabe**: Identifizieren Sie die Tabellen, die zu WordPress gehören, und die Tabellen, die zu Matomo gehören. Wie unterscheiden sie sich?

3. Untersuchen Sie die Struktur einer Matomo-Tabelle:
   ```sql
   DESCRIBE matomo_site;
   ```
   
   **Aufgabe**: Welche Informationen werden in dieser Tabelle gespeichert?

4. Verlassen Sie die MySQL-Konsole:
   ```sql
   EXIT;
   ```

### Teil 5: Schnelle Sicherung der Matomo Configuration

1. Erstellen Sie eine Sicherung der Matomo-Konfiguration:
   ```bash
   docker compose exec matomo tar -czvf /var/www/html/matomo-config-backup.tar.gz /var/www/html/config
   ```

2. Kopieren Sie die Sicherung auf Ihren Host-Computer:
   ```bash
   docker cp $(docker compose ps -q matomo):/var/www/html/matomo-config-backup.tar.gz ./
   ```
   
   **Aufgabe**: Welche anderen wichtigen Verzeichnisse sollten bei einer vollständigen Matomo-Sicherung berücksichtigt werden?

## Abschluss und Reflexion

Beantworten Sie folgende Fragen:

1. Welche Vorteile bietet die Verwendung von Docker für die Installation von Matomo?
2. Welche Herausforderungen könnten bei der Verwendung einer gemeinsamen Datenbank für WordPress und Matomo auftreten?
3. Wie würden Sie diese Umgebung für eine Produktionsumgebung anpassen?

## Zusatzaufgaben (optional)

1. Ändern Sie die Ports in der docker compose.yml Datei und starten Sie die Container neu.
2. Richten Sie eine zweite Website in Matomo ein und vergleichen Sie die Änderungen in der Datenbank.
3. Installieren Sie ein zusätzliches Plugin in Matomo über die Benutzeroberfläche.
