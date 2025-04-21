# Übung 3: Backup und Wartung von Matomo

## Übungsziele
- Erlernen verschiedener Backup-Strategien für Matomo
- Durchführung von Wartungsaufgaben
- Verständnis der Datenarchivierung

## Benötigte Zeit
- 30-45 Minuten

## Voraussetzungen
- Abgeschlossene Übungen 1 und 2
- Laufende Docker-Umgebung mit Matomo

## Übungsschritte

### Teil 1: Datenbank-Backup

1. Öffnen Sie ein Terminal und navigieren Sie zu Ihrem Docker-Projekt:
   ```bash
   cd ~/matomo-uebung
   ```

2. Erstellen Sie ein Backup der MySQL-Datenbank:
> Hinweis: Verwenden Sie das in Aufgabenblock 01 notierte MySQL Root Password

   ```bash
   docker compose exec db mysqldump -u root -p exampledb > matomo_backup.sql
   ```

3. Überprüfen Sie den Inhalt des Backups:
   ```bash
   head -n 100 matomo_backup.sql
   ```
   
### Teil 2: Datei-Backup

1. Erstellen Sie ein Backup der Matomo-Konfigurationsdateien:
   ```bash
   docker compose exec matomo tar -czvf /tmp/matomo_config.tar.gz /var/www/html/config
   docker cp $(docker compose ps -q matomo):/tmp/matomo_config.tar.gz ./
   ```

2. Erstellen Sie ein Backup der Matomo-Plugins:
   ```bash
   docker compose exec matomo tar -czvf /tmp/matomo_plugins.tar.gz /var/www/html/plugins
   docker cp $(docker compose ps -q matomo):/tmp/matomo_plugins.tar.gz ./
   ```

### Teil 3: Automatisiertes Backup-Skript

1. Erstellen Sie ein Backup-Skript `backup_matomo.sh`:
   ```bash
   nano backup_matomo.sh
   ```

2. Fügen Sie folgenden Inhalt ein:
   ```bash
   #!/bin/bash
   
   # Variablen
   BACKUP_DIR="./backups"
   DATE=$(date +%Y-%m-%d_%H-%M-%S)
   
   # Backup-Verzeichnis erstellen
   mkdir -p $BACKUP_DIR
   
   # Datenbank-Backup
   echo "Erstelle Datenbank-Backup..."
   docker compose exec -T db mysqldump -u exampleuser -pexamplepass exampledb > "$BACKUP_DIR/matomo_db_$DATE.sql"
   
   # Konfigurationsdateien-Backup
   echo "Erstelle Konfigurationsdateien-Backup..."
   docker compose exec matomo tar -czvf /tmp/matomo_config_$DATE.tar.gz /var/www/html/config
   docker cp $(docker compose ps -q matomo):/tmp/matomo_config_$DATE.tar.gz "$BACKUP_DIR/"
   
   # Plugins-Backup
   echo "Erstelle Plugins-Backup..."
   docker compose exec matomo tar -czvf /tmp/matomo_plugins_$DATE.tar.gz /var/www/html/plugins
   docker cp $(docker compose ps -q matomo):/tmp/matomo_plugins_$DATE.tar.gz "$BACKUP_DIR/"
   
   echo "Backup abgeschlossen. Dateien befinden sich in $BACKUP_DIR"
   ```

3. Machen Sie das Skript ausführbar und führen Sie es aus:
   ```bash
   chmod +x backup_matomo.sh
   ./backup_matomo.sh
   ```

### Teil 4: Wiederherstellung aus einem Backup

1. Simulieren Sie einen Datenverlust, indem Sie eine Konfigurationsänderung in Matomo vornehmen.

2. Stellen Sie die Datenbank aus dem Backup wieder her:
   ```bash
   cat matomo_backup.sql | docker compose exec -T db mysql -u exampleuser -pexamplepass exampledb
   ```

3. Überprüfen Sie, ob die Änderungen rückgängig gemacht wurden.
   
### Teil 5: Wartungsaufgaben

1. Navigieren Sie in Matomo zu "Administration" > "System" > "Diagnose"

2. Führen Sie einen Systemcheck durch und notieren Sie alle Warnungen oder Fehler.

3. Navigieren Sie zu "Administration" > "System" > "Datenbank"

4. Führen Sie eine Datenbankoptimierung durch.
   
5. Überprüfen Sie die Archivierungseinstellungen unter "Administration" > "System" > "Allgemeine Einstellungen"
   
   **Aufgabe**: Erklären Sie den Unterschied zwischen Browser-Trigger und Cron-basierter Archivierung. Welche Methode ist für größere Websites zu empfehlen?

## Abschluss und Reflexion

Beantworten Sie folgende Fragen:

1. Warum ist ein regelmäßiges Backup von Matomo wichtig?
2. Welche Komponenten müssen für ein vollständiges Backup gesichert werden?
3. Wie würden Sie ein Backup- und Wiederherstellungskonzept für eine produktive Matomo-Installation gestalten?

## Zusatzaufgaben (optional)

1. Erstellen Sie einen Cron-Job, der das Backup-Skript täglich ausführt.
2. Implementieren Sie eine Rotation der Backups, sodass nur die letzten 7 täglichen Backups aufbewahrt werden.
3. Recherchieren Sie, wie Sie die Matomo-Datenbank optimieren können, um die Leistung zu verbessern.
