# Übung 3: Konfiguration und Anpassung von Matomo

## Übungsziele
- Vertiefte Konfiguration von Matomo
- Anpassung der Datenschutzeinstellungen
- Einrichtung von Benutzern und Berechtigungen

## Benötigte Zeit
- 30-45 Minuten

## Voraussetzungen
- Abgeschlossene Übung 2 (Installation)
- Laufende Docker-Umgebung mit Matomo

## Übungsschritte

### Teil 1: Datenschutzeinstellungen

1. Navigieren Sie zu "Administration" > "Privatsphäre"

2. Konfigurieren Sie folgende Datenschutzeinstellungen:
   - Anonymisieren Sie IP-Adressen: Wählen Sie "2 Bytes anonymisieren"
   - Benutze die anonymisierte IP-Adresse auch für die Aufbereitung der Besuche: Ja
   - Do-Not-Track Unterstützung: Aktivieren
   - Erlaubt Benutzern das Tracking Opt-Out: Für das Opt-Out eigenen Code verwenden
   
3. Generieren Sie den Opt-Out-Code und speichern Sie ihn für die spätere Verwendung.

### Teil 2: Website-Einstellungen

1. Melden Sie sich wieder als Hauptadministrator an

2. Navigieren Sie zu "Administration" > "Webseiten" > "Verwalten"

3. Bearbeiten Sie die Einstellungen für Ihre Website:
   - Zeitzone: Überprüfen Sie, ob "Berlin" eingestellt ist
   - Währung: Ändern Sie die Währung in Euro 
   - Ausgeschlossene Parameter: Fügen Sie "utm_source,utm_medium,utm_campaign" hinzu

### Teil 3: Archivierungseinstellungen

1. Navigieren Sie zu "Administration" > "System" > "Allgemeine Einstellungen"

2. Überprüfen Sie die Archivierungseinstellungen:
   - Berichte archivieren, wenn diese im Browser angezeigt werden: Ja
   - Für ein schnelleres Arbeiten während der Übungen ändern Sie das Intervall für "Archiviere Berichte mindestens alle x Sekunden" auf 120.

## Abschluss und Reflexion

Beantworten Sie folgende Fragen:

1. Welche Datenschutzeinstellungen sind für eine DSGVO-konforme Nutzung von Matomo besonders wichtig?
2. Welche Konfigurationseinstellungen sollten regelmäßig überprüft werden?

## Zusatzaufgaben (optional)

1. Richten Sie eine E-Mail-Konfiguration ein, um automatische Berichte zu versenden.
2. Konfigurieren Sie die Aufbewahrungsdauer für Rohdaten auf 6 Monate.
3. Erstellen Sie eine benutzerdefinierte Benutzerrolle mit sehr eingeschränkten Rechten für einen externen Berater.
