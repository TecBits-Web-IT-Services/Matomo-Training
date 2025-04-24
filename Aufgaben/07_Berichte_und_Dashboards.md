# Übung 7: Berichte und Dashboards in Matomo

## Übungsziele
- Erstellung und Anpassung von Dashboards in Matomo
- Analyse verschiedener Berichtstypen
- Konfiguration von automatisierten Berichten

## Benötigte Zeit
- 45-60 Minuten

## Voraussetzungen
- Abgeschlossene Übungen 1 bis 6
- Laufende Docker-Umgebung mit Matomo und Beispieldaten

## Übungsschritte

### Teil 1: Erstellung eines benutzerdefinierten Dashboards

1. Melden Sie sich in Matomo an unter `https://matomo.training.ddev.site`

2. Erstellen Sie ein neues Dashboard:
   - Navigieren Sie zu "Dashboard" > "Dashboard" und dann oben auf den Dashboard-Button
   - Klicken Sie auf "Neues Dashboard erstellen"
   - Name: "WordPress Performance Dashboard"
   - Layout: "Leeres Dashboard"
   - Klicken Sie auf "Ok"

3. Fügen Sie Widgets zum Dashboard hinzu:
   - Klicken Sie oben auf den Dashboard-Button und fügen Sie ein Widget über "Ein Widget hinzufügen" hinzu
   - Fügen Sie folgende Widgets hinzu:
     - Besucher in Echtzeit (Kategorie: Besucher)
     - Besuche nach lokaler Zeit (Kategorie: Besucher)
     - Seiten (Kategorie: Verhalten)
     - Transitionen (Kategorie: Verhalten)
     - Besucherübersicht (Kategorie: Besucher)

4. Organisieren Sie das Dashboard:
   - Ziehen Sie die Widgets an die gewünschten Positionen
   - Ändern Sie die Größe der Widgets nach Bedarf
   - Klicken Sie auf das Zahnrad-Symbol eines Widgets, um dessen Einstellungen anzupassen
   
   **Aufgabe:** Gestalten Sie das Dashboard so, dass die wichtigsten Informationen auf einen Blick erkennbar sind.

5. Speichern und teilen Sie das Dashboard:
   - Klicken Sie auf "Dashboard speichern"
   - Klicken Sie auf "Teilen" und kopieren Sie den Link
   - Senden Sie den Link an einen anderen Benutzer (simulieren Sie dies, indem Sie den Link in einem anderen Browser oder im Inkognito-Modus öffnen)
   
   **Aufgabe:** Welche Berechtigungen benötigt ein Benutzer, um ein geteiltes Dashboard anzusehen?

### Teil 2: Segmentierung und Filterung

1. Erstellen Sie ein benutzerdefiniertes Segment:
   - Navigieren Sie zu einem beliebigen Bericht z.B. Besucher -> Übersicht
   - Klicken Sie oben auf "Alle Besucher"
   - Klicken Sie auf "Neues Segment hinzufügen"
   - Name: "Warenkorb über 20"
   - Bedingung: "Im Warenkorb verbliebener Umsatz mehr als 20"
   - Speichern Sie das Segment

2. Legen Sie in einem neuen Tab Produkte im Wert von min. 30 Euro in den Warenkorb und warten Sie 2 Minuten bis die Daten aktualisiert wurden. 

   **Aufgabe:** Vergleichen Sie das Verhalten der verschiedenen Segmente. Welche Unterschiede können Sie feststellen?

### Teil 3: Automatisierte Berichte

1. Konfigurieren Sie einen E-Mail-Bericht:
   - Navigieren Sie zu "Persönlich" > "E-Mail-Berichte"
   - Klicken Sie auf "Einen Bericht erstellen und Planen"
   - Segment: "Alle Besuche"
   - Berichtsperiode: "Woche"
   - Senden via: E-Mail
   - E-Mail-Zeitplan: HTML
   - Zeitplan: Wöchentlich, montags
   - Speichern Sie den Bericht
   - Da kein E-Mail-Versand in der Testumgebung möglich ist, können Sie sich den konfigurierten Bericht in der Übersicht über den Download-Button anzeigen lassen.

## Abschluss und Reflexion

Beantworten Sie folgende Fragen:

1. Welche Berichte und Dashboards sind für verschiedene Stakeholder (Management, Marketing, Entwicklung) am relevantesten?
2. Wie können Sie Matomo-Berichte nutzen, um konkrete Handlungsempfehlungen abzuleiten?
3. Welche Vorteile bietet die Segmentierung bei der Datenanalyse?
