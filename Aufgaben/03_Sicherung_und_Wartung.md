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
   docker exec ddev-training-db mysqldump -u root -proot db > wp.sql
   docker exec ddev-training-db mysqldump -u root -proot matomo > matomo.sql
   ```

3. Überprüfen Sie den Inhalt des Backups:
   ```bash
   head -n 100 wp.sql
   ```
   
### Teil 2: Datei-Backup

1. Erstellen Sie ein Backup der Matomo-Konfigurationsdateien:
   ```bash
   docker exec ddev-training-matomo tar -czvf /tmp/matomo_config.tar.gz /var/www/html/config
   docker cp ddev-training-matomo:/tmp/matomo_config.tar.gz ./
   ```

2. Erstellen Sie ein Backup der Matomo-Plugins:
   ```bash
   docker exec ddev-training-matomo tar -czvf /tmp/matomo_plugins.tar.gz /var/www/html/plugins
   docker cp ddev-training-matomo:/tmp/matomo_plugins.tar.gz ./
   ```

### Teil 3: Wiederherstellung aus einem Backup

1. Simulieren Sie einen Datenverlust, indem Sie eine Konfigurationsänderung in Matomo vornehmen.

2. Stellen Sie die Datenbank aus dem Backup wieder her:
   ```bash
   cat matomo.sql | docker exec -i ddev-training-db mysql -u root -proot matomo
   ```

3. Überprüfen Sie, ob die Änderungen rückgängig gemacht wurden.
   
### Teil 4: Wartungsaufgaben

1. Navigieren Sie in Matomo zu "Administration" > "System" > "Diagnose"

2. Führen Sie einen Systemcheck durch und notieren Sie alle Warnungen oder Fehler.
  
3. Überprüfen Sie die Archivierungseinstellungen unter "Administration" > "System" > "Allgemeine Einstellungen"
   
   **Aufgabe**: Erklären Sie den Unterschied zwischen Browser-Trigger und Cron-basierter Archivierung. Welche Methode ist für größere Websites zu empfehlen?

## Abschluss und Reflexion

Beantworten Sie folgende Fragen:

1. Warum ist ein regelmäßiges Backup von Matomo wichtig?
2. Welche Komponenten müssen für ein vollständiges Backup gesichert werden?
3. Wie würden Sie ein Backup- und Wiederherstellungskonzept für eine produktive Matomo-Installation gestalten?