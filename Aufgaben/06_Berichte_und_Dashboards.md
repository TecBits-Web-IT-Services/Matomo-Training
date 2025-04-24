# Übung 6: Berichte und Dashboards in Matomo

## Übungsziele
- Erstellung und Anpassung von Dashboards in Matomo
- Analyse verschiedener Berichtstypen
- Konfiguration von automatisierten Berichten

## Benötigte Zeit
- 45-60 Minuten

## Voraussetzungen
- Abgeschlossene Übungen zur Matomo-Installation und WordPress-Integration
- Laufende Docker-Umgebung mit Matomo und Beispieldaten

## Übungsschritte

### Teil 1: Analyse der Standard-Berichte

1. Melden Sie sich in Matomo an unter `http://localhost:8081`

2. Erkunden Sie die verschiedenen Standardberichte:
   - Navigieren Sie zu "Besucher" > "Übersicht"
   - Analysieren Sie die Besucherquellen unter "Akquisition" > "Übersicht"
   - Untersuchen Sie das Besucherverhalten unter "Verhalten" > "Seiteninhalte" > "Seitenaufrufe"
   
   **Aufgabe**: Identifizieren Sie die drei am häufigsten besuchten Seiten und notieren Sie deren Absprungrate.

3. Passen Sie die Berichtszeiträume an:
   - Wählen Sie verschiedene Zeiträume aus dem Datumsauswahl-Widget
   - Vergleichen Sie zwei Zeiträume mit der Vergleichsfunktion
   - Analysieren Sie die Trends über verschiedene Zeiträume
   
   **Aufgabe**: Welche Unterschiede können Sie zwischen Wochentagen und Wochenenden im Besucherverhalten feststellen?

4. Exportieren Sie einen Bericht:
   - Wählen Sie einen beliebigen Bericht aus
   - Klicken Sie auf das Export-Symbol
   - Exportieren Sie den Bericht in verschiedenen Formaten (CSV, TSV, Excel, HTML, PDF)
   
   **Aufgabe**: Vergleichen Sie die verschiedenen Exportformate. Welches Format eignet sich am besten für welchen Zweck?

### Teil 2: Erstellung eines benutzerdefinierten Dashboards

1. Erstellen Sie ein neues Dashboard:
   - Navigieren Sie zu "Dashboard" > "Dashboard-Verwaltung"
   - Klicken Sie auf "Neues Dashboard erstellen"
   - Name: "WordPress Performance Dashboard"
   - Layout: "3 Spalten"
   - Klicken Sie auf "Erstellen"

2. Fügen Sie Widgets zum Dashboard hinzu:
   - Klicken Sie auf "Widget hinzufügen"
   - Fügen Sie folgende Widgets hinzu:
     - Besucher in Echtzeit (Kategorie: Besucher)
     - Besuche nach Tageszeit (Kategorie: Besucher)
     - Seitenaufrufe (Kategorie: Verhalten)
     - Besuchszeit nach Seite (Kategorie: Verhalten)
     - Besucherquellen (Kategorie: Akquisition)
     - Browser (Kategorie: Besucher)
   
   **Aufgabe**: Welche zusätzlichen Widgets wären für ein WordPress-spezifisches Dashboard sinnvoll?

3. Organisieren Sie das Dashboard:
   - Ziehen Sie die Widgets an die gewünschten Positionen
   - Ändern Sie die Größe der Widgets nach Bedarf
   - Klicken Sie auf das Zahnrad-Symbol eines Widgets, um dessen Einstellungen anzupassen
   
   **Aufgabe**: Gestalten Sie das Dashboard so, dass die wichtigsten Informationen auf einen Blick erkennbar sind.

4. Speichern und teilen Sie das Dashboard:
   - Klicken Sie auf "Dashboard speichern"
   - Klicken Sie auf "Teilen" und kopieren Sie den Link
   - Senden Sie den Link an einen anderen Benutzer (simulieren Sie dies, indem Sie den Link in einem anderen Browser oder im Inkognito-Modus öffnen)
   
   **Aufgabe**: Welche Berechtigungen benötigt ein Benutzer, um ein geteiltes Dashboard anzusehen?

### Teil 3: Segmentierung und Filterung

1. Erstellen Sie ein benutzerdefiniertes Segment:
   - Navigieren Sie zu einem beliebigen Bericht
   - Klicken Sie auf "Segment hinzufügen"
   - Klicken Sie auf "Neues Segment erstellen"
   - Name: "Mobile Besucher"
   - Bedingung: "Gerät ist Smartphone"
   - Speichern Sie das Segment

2. Erstellen Sie ein weiteres Segment:
   - Name: "Neue Besucher mit langer Verweildauer"
   - Bedingungen:
     - "Besuchertyp ist neuer Besucher" UND
     - "Besuchsdauer ist größer als 180 Sekunden"
   - Speichern Sie das Segment

3. Wenden Sie die Segmente auf verschiedene Berichte an:
   - Navigieren Sie zu "Verhalten" > "Seiteninhalte" > "Seitenaufrufe"
   - Wählen Sie das Segment "Mobile Besucher"
   - Analysieren Sie die Ergebnisse
   - Wechseln Sie zum Segment "Neue Besucher mit langer Verweildauer"
   
   **Aufgabe**: Vergleichen Sie das Verhalten der verschiedenen Segmente. Welche Unterschiede können Sie feststellen?

4. Erstellen Sie einen Segmentvergleich:
   - Klicken Sie auf "Segmente vergleichen"
   - Wählen Sie "Mobile Besucher" und "Neue Besucher mit langer Verweildauer"
   - Analysieren Sie die Unterschiede in den Metriken
   
   **Aufgabe**: Welche Erkenntnisse können Sie aus dem Segmentvergleich gewinnen?

### Teil 4: Automatisierte Berichte

1. Konfigurieren Sie einen E-Mail-Bericht:
   - Navigieren Sie zu "Persönlich" > "E-Mail-Berichte"
   - Klicken Sie auf "Neuen Bericht erstellen"
   - Berichtstyp: "Dashboard"
   - Wählen Sie Ihr erstelltes Dashboard
   - Zeitraum: "Woche"
   - Senden an: Ihre E-Mail-Adresse
   - Format: HTML
   - Zeitplan: Wöchentlich, montags
   - Speichern Sie den Bericht
   
   **Aufgabe**: Welche anderen Berichtstypen können automatisiert werden?

2. Erstellen Sie einen PDF-Bericht:
   - Navigieren Sie zu einem beliebigen Bericht
   - Klicken Sie auf das Export-Symbol
   - Wählen Sie "Als PDF generieren"
   - Passen Sie die PDF-Einstellungen an
   - Generieren Sie den Bericht
   
   **Aufgabe**: Wie könnten Sie einen monatlichen PDF-Bericht für das Management automatisieren?

### Teil 5: Benutzerdefinierte Berichte

1. Erstellen Sie einen benutzerdefinierten Bericht:
   - Navigieren Sie zu "Administration" > "Persönlich" > "Benutzerdefinierte Berichte"
   - Klicken Sie auf "Neuen Bericht erstellen"
   - Name: "WordPress Leistungsbericht"
   - Berichtstyp: "Tabelle"
   - Metriken: Besuche, eindeutige Seitenaufrufe, durchschnittliche Besuchszeit
   - Dimensionen: Seitentitel
   - Speichern Sie den Bericht
   
   **Aufgabe**: Welche Erkenntnisse können Sie aus diesem benutzerdefinierten Bericht gewinnen?

2. Passen Sie den benutzerdefinierten Bericht an:
   - Bearbeiten Sie den erstellten Bericht
   - Fügen Sie weitere Metriken hinzu: Absprungrate, Ausstiegsrate
   - Ändern Sie die Sortierung nach Besuchen (absteigend)
   - Speichern Sie die Änderungen
   
   **Aufgabe**: Wie unterscheidet sich dieser benutzerdefinierte Bericht von den Standardberichten?

## Abschluss und Reflexion

Beantworten Sie folgende Fragen:

1. Welche Berichte und Dashboards sind für verschiedene Stakeholder (Management, Marketing, Entwicklung) am relevantesten?
2. Wie können Sie Matomo-Berichte nutzen, um konkrete Handlungsempfehlungen abzuleiten?
3. Welche Vorteile bietet die Segmentierung bei der Datenanalyse?

## Zusatzaufgaben (optional)

1. Erstellen Sie ein Dashboard speziell für die Analyse des mobilen Traffics.
2. Konfigurieren Sie einen monatlichen E-Mail-Bericht mit den wichtigsten KPIs.
3. Erstellen Sie ein Segment für Besucher, die über soziale Medien kommen und eine Conversion durchgeführt haben.
