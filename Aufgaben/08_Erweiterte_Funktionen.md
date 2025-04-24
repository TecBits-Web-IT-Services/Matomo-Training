# Übung 8: Erweiterte Funktionen und Analysen in Matomo

## Übungsziele
- Nutzung erweiterter Analysefunktionen in Matomo
- Einrichtung von Zielen und Konversionen
- Arbeit mit benutzerdefinierten Dimensionen
- Durchführung von Pfadanalysen

## Benötigte Zeit
- 45-60 Minuten

## Voraussetzungen
- Abgeschlossene Übungen 1 bis 7
- Laufende Docker-Umgebung mit Matomo und Beispieldaten

## Übungsschritte

### Teil 1: Ziele und Konversionen

1. Erstellen Sie ein neues Ziel:
   - Name: "Wichtige Seite besucht"
   - Zieltyp: "Beim Besuch einer bestimmten Seite"
   - Übereinstimmungsattribut: "Pfad"
   - Muster: "/datenschutzerklaerung/"
   - Speichern Sie das Ziel
   
   **Aufgabe:** Welche anderen Zieltypen bietet Matomo an und für welche Anwendungsfälle sind sie geeignet?

2. Analysieren Sie die Zielberichte:
   - Navigieren Sie zu "Ziele" > "Übersicht"
   - Untersuchen Sie die Konversionsraten
   
### Teil 2: Benutzerdefinierte Dimensionen

1. Erstellen Sie eine benutzerdefinierte Dimension:
   - Navigieren Sie zu "Administration" > "Webseiten" > "Benutzerdefinierte Dimensionen"
   - Klicken Sie auf "Neue benutzerdefinierte Dimension hinzufügen"
   - Name: "Benutzerrolle"
   - Bereich: "Besucher"
   - Aktiv: Ja
   - Speichern Sie die Dimension
   
   **Aufgabe:** Welche anderen Bereiche für benutzerdefinierte Dimensionen gibt es und wofür werden sie verwendet?

2. Implementieren Sie das Tracking der benutzerdefinierten Dimension:
   - Notieren Sie sich die Dimensions-ID (z.B. 1)
   - Navigieren Sie zu "Einstellungen" > "Insert Headers and Footers" in WordPress
   - Fügen Sie folgenden Code im Footer-Bereich hinzu:
   
   ```javascript
   <script>
   document.addEventListener('DOMContentLoaded', function() {
     // Beispielhafte Zuweisung einer Benutzerrolle
     var userRole = 'Gast';
     if (document.body.classList.contains('logged-in')) {
       userRole = 'Registrierter Benutzer';
     }
     _paq.push(['setCustomDimension', 1, userRole]);
   });
   </script>
   ```
   
   - Speichern Sie die Änderungen

3. Analysieren Sie die benutzerdefinierte Dimension:
   - Navigieren Sie zu "Besucher" > "Benutzerrolle"
   - Untersuchen Sie die Verteilung der Benutzerrollen
   
   **Aufgabe:** Welche anderen benutzerdefinierten Dimensionen könnten für eine WordPress-Website nützlich sein?

### Teil 3: Pfadanalysen

1. Analysieren Sie die Besuchspfade:
   - Navigieren Sie zu "Verhalten" > "Besuchspfade" > "Pfadanalyse"
   - Untersuchen Sie die häufigsten Pfade durch die Website
   
   **Aufgabe:** Identifizieren Sie die drei häufigsten Einstiegsseiten und die darauf folgenden Seiten.

2. Analysieren Sie die Seitenübergänge:
   - Navigieren Sie zu "Verhalten" > "Transitionen"
   - Wählen Sie eine wichtige Seite aus
   - Untersuchen Sie, woher Besucher kommen und wohin sie gehen
   
   **Aufgabe:** Welche Erkenntnisse können Sie aus den Seitenübergängen gewinnen? Wie könnten Sie die Navigation optimieren?

3. Untersuchen Sie die Einstiegs- und Ausstiegsseiten:
   - Navigieren Sie zu "Verhalten" > "Einstiegsseiten"
   - Analysieren Sie die Absprungrate der Einstiegsseiten
   - Navigieren Sie zu "Verhalten" > "Ausstiegsseiten"
   - Identifizieren Sie Seiten mit hoher Ausstiegsrate
   
   **Aufgabe:** Welche Maßnahmen könnten Sie ergreifen, um die Absprungrate zu reduzieren und die Ausstiegsrate zu optimieren?

### Teil 4: Heatmaps und Session Recordings (falls Plugin verfügbar)

1. Installieren Sie das Heatmap & Session Recording Plugin:
   - Navigieren Sie zu "Administration" > "Plattform" > "Marketplace"
   - Suchen Sie nach "Heatmap & Session Recording"
   - Installieren und aktivieren Sie das Plugin (falls verfügbar)

2. Erstellen Sie eine neue Heatmap:
   - Navigieren Sie zu "Verhalten" > "Heatmap & Session Recording"
   - Klicken Sie auf "Neue Heatmap erstellen"
   - URL: Ihre Hauptseite
   - Stichprobengröße: 100 Besuche
   - Speichern Sie die Heatmap
   
   **Aufgabe:** Welche Arten von Heatmaps gibt es und welche Erkenntnisse können Sie daraus gewinnen?

3. Erstellen Sie eine Session Recording:
   - Navigieren Sie zu "Verhalten" > "Heatmap & Session Recording"
   - Klicken Sie auf "Neue Aufzeichnung erstellen"
   - URL: Ihre Hauptseite
   - Stichprobengröße: 10 Besuche
   - Speichern Sie die Aufzeichnung
   
   **Aufgabe:** Wie können Session Recordings dabei helfen, das Benutzerverhalten besser zu verstehen?

### Teil 5: A/B-Tests (falls Plugin verfügbar)

1. Installieren Sie das A/B Testing Plugin:
   - Navigieren Sie zu "Administration" > "Plattform" > "Marketplace"
   - Suchen Sie nach "A/B Testing"
   - Installieren und aktivieren Sie das Plugin (falls verfügbar)

2. Erstellen Sie einen A/B-Test:
   - Navigieren Sie zu "Verhalten" > "A/B Tests"
   - Klicken Sie auf "Neuen A/B-Test erstellen"
   - Name: "Button-Farbe Test"
   - Original-URL: Ihre Hauptseite
   - Variation-URL: Eine Kopie der Hauptseite mit andersfarbigem Button
   - Konversionsziel: Ein vorher definiertes Ziel
   - Speichern Sie den Test
   
   **Aufgabe:** Welche Elemente einer Website eignen sich besonders gut für A/B-Tests und warum?

## Abschluss und Reflexion

Beantworten Sie folgende Fragen:

1. Wie können die erweiterten Analysefunktionen von Matomo dazu beitragen, die Benutzerfreundlichkeit einer Website zu verbessern?
2. Welche Rolle spielen Ziele und Konversionen bei der Bewertung des Erfolgs einer Website?
3. Wie können Pfadanalysen dabei helfen, die Struktur einer Website zu optimieren?
