# Übung 5: Tracking-Code und Tag Manager in WordPress

## Übungsziele
- Implementierung erweiterter Tracking-Funktionen in WordPress
- Einrichtung und Verwendung des Matomo Tag Managers
- Erfassung von Benutzerinteraktionen und Ereignissen

## Benötigte Zeit
- 45-60 Minuten

## Voraussetzungen
- Abgeschlossene Übung zur WordPress-Integration
- Laufende Docker-Umgebung mit WordPress und Matomo

## Übungsschritte

### Teil 1: Erweitertes JavaScript-Tracking

1. Melden Sie sich in WordPress an unter `http://localhost:8080/wp-admin`

2. Erstellen Sie eine neue Seite mit verschiedenen Interaktionselementen:
   - Navigieren Sie zu "Seiten" > "Erstellen"
   - Geben Sie "Interaktionstest" als Titel ein
   - Fügen Sie verschiedene Elemente hinzu:
     - Ein Kontaktformular (installieren Sie das Plugin "Contact Form 7")
     - Ein Video (YouTube-Embed)
     - Mehrere Abschnitte mit Überschriften
     - Einige Bilder
   - Veröffentlichen Sie die Seite

3. Implementieren Sie erweitertes Ereignis-Tracking:
   - Navigieren Sie zu "Einstellungen" > "Insert Headers and Footers"
   - Fügen Sie folgenden JavaScript-Code im Footer-Bereich ein:

   ```javascript
   <script>
   document.addEventListener('DOMContentLoaded', function() {
     // Formular-Tracking
     if (document.querySelector('.wpcf7-form')) {
       document.querySelector('.wpcf7-form').addEventListener('submit', function() {
         _paq.push(['trackEvent', 'Formular', 'Absenden', 'Kontaktformular']);
       });
     }
     
     // Scroll-Tracking
     let scrollTracked = false;
     window.addEventListener('scroll', function() {
       let scrollPos = window.scrollY + window.innerHeight;
       let docHeight = document.body.offsetHeight;
       
       if (!scrollTracked && (scrollPos / docHeight) > 0.7) {
         _paq.push(['trackEvent', 'Engagement', 'Scroll', '70% der Seite']);
         scrollTracked = true;
       }
     });
     
     // Link-Klick-Tracking
     document.querySelectorAll('a').forEach(function(link) {
       link.addEventListener('click', function() {
         let linkText = this.textContent || this.innerText;
         _paq.push(['trackEvent', 'Link', 'Klick', linkText]);
       });
     });
   });
   </script>
   ```

   - Speichern Sie die Änderungen
   
   **Aufgabe**: Erklären Sie, wie die verschiedenen Ereignis-Tracking-Funktionen im Code funktionieren und welche Daten sie erfassen.

4. Testen Sie die Tracking-Funktionen:
   - Besuchen Sie die erstellte Seite
   - Scrollen Sie bis zum Ende der Seite
   - Füllen Sie das Kontaktformular aus und senden Sie es ab
   - Klicken Sie auf verschiedene Links

5. Überprüfen Sie die Ergebnisse in Matomo:
   - Navigieren Sie zu "Verhalten" > "Ereignisse"
   - Analysieren Sie die erfassten Ereignisse nach Kategorien
   
   **Aufgabe**: Welche zusätzlichen Ereignisse könnten für eine WordPress-Website relevant sein?

### Teil 2: Einrichtung des Matomo Tag Managers

1. Melden Sie sich in Matomo an unter `http://localhost:8081`

2. Aktivieren Sie den Tag Manager:
   - Navigieren Sie zu "Administration" > "Plattform" > "Plugins"
   - Suchen Sie nach "TagManager"
   - Klicken Sie auf "Aktivieren"

3. Erstellen Sie einen neuen Container:
   - Navigieren Sie zu "Tag Manager"
   - Klicken Sie auf "Container erstellen"
   - Name: "WordPress Container"
   - Wählen Sie "Web" als Kontext
   - Klicken Sie auf "Erstellen"

4. Installieren Sie den Container-Code in WordPress:
   - Kopieren Sie den generierten Container-Code
   - Melden Sie sich in WordPress an
   - Navigieren Sie zu "Einstellungen" > "Insert Headers and Footers"
   - Fügen Sie den Container-Code in den Header-Bereich ein
   - Speichern Sie die Änderungen
   
   **Aufgabe**: Warum wird der Tag Manager-Code im Header und nicht im Footer platziert?

### Teil 3: Erstellen von Tags im Tag Manager

1. Erstellen Sie einen Tag für das Matomo-Tracking:
   - Navigieren Sie zum Tag Manager > "Tags" > "Tag erstellen"
   - Name: "Matomo Tracking"
   - Typ: "Matomo Analytics"
   - Matomo-URL: `http://matomo:80/`
   - Site-ID: 1
   - Trigger: "Alle Seiten"
   - Speichern Sie den Tag

2. Erstellen Sie einen Tag für Ereignis-Tracking:
   - Navigieren Sie zu "Tags" > "Tag erstellen"
   - Name: "Scroll-Tracking"
   - Typ: "Benutzerdefiniertes HTML"
   - HTML-Code:
   
   ```html
   <script>
   (function() {
     var scrollDepths = [25, 50, 75, 100];
     var scrollDepthTracked = {};
     scrollDepths.forEach(function(depth) {
       scrollDepthTracked[depth] = false;
     });
     
     function calculateScrollDepth() {
       var scrollPos = window.scrollY + window.innerHeight;
       var docHeight = document.body.offsetHeight;
       var scrollPercent = Math.round((scrollPos / docHeight) * 100);
       
       scrollDepths.forEach(function(depth) {
         if (!scrollDepthTracked[depth] && scrollPercent >= depth) {
           _paq.push(['trackEvent', 'Scroll', 'Tiefe', depth + '%']);
           scrollDepthTracked[depth] = true;
         }
       });
     }
     
     window.addEventListener('scroll', calculateScrollDepth);
   })();
   </script>
   ```
   
   - Trigger: "Alle Seiten"
   - Speichern Sie den Tag

3. Erstellen Sie einen Tag für Formular-Tracking:
   - Navigieren Sie zu "Tags" > "Tag erstellen"
   - Name: "Formular-Tracking"
   - Typ: "Benutzerdefiniertes HTML"
   - HTML-Code:
   
   ```html
   <script>
   (function() {
     document.addEventListener('DOMContentLoaded', function() {
       document.querySelectorAll('form').forEach(function(form) {
         form.addEventListener('submit', function() {
           var formId = this.id || 'unbekanntes-formular';
           _paq.push(['trackEvent', 'Formular', 'Absenden', formId]);
         });
       });
     });
   })();
   </script>
   ```
   
   - Trigger: "Alle Seiten"
   - Speichern Sie den Tag

4. Veröffentlichen Sie die Änderungen:
   - Klicken Sie auf "Veröffentlichen" in der oberen rechten Ecke
   - Geben Sie eine Versionsbeschreibung ein: "Initiale Tag-Konfiguration"
   - Klicken Sie auf "Veröffentlichen"

5. Testen Sie die Tag Manager-Implementierung:
   - Besuchen Sie Ihre WordPress-Website
   - Interagieren Sie mit verschiedenen Elementen
   - Überprüfen Sie die Ergebnisse in Matomo unter "Verhalten" > "Ereignisse"
   
   **Aufgabe**: Vergleichen Sie die direkte JavaScript-Implementierung mit der Tag Manager-Implementierung. Welche Vor- und Nachteile haben beide Ansätze?

### Teil 4: Erstellen von Variablen und Triggern

1. Erstellen Sie eine benutzerdefinierte Variable:
   - Navigieren Sie zu "Variablen" > "Neue Variable erstellen"
   - Name: "Seitentitel"
   - Typ: "DOM-Element"
   - Methode zum Auswählen des Elements: "CSS-Selektor"
   - Element-Selektor: "h1"
   - Attributname: "textContent"
   - Speichern Sie die Variable

2. Erstellen Sie einen benutzerdefinierten Trigger:
   - Navigieren Sie zu "Trigger" > "Trigger erstellen"
   - Name: "Klick auf Buttons"
   - Typ: "Klick - Alle Elemente"
   - Klick-Ziel: "Nur Links, Buttons und Formularelemente"
   - Bedingungen: "Element-Klasse enthält button"
   - Speichern Sie den Trigger

3. Erstellen Sie einen Tag, der die Variable und den Trigger verwendet:
   - Navigieren Sie zu "Tags" > "Tag erstellen"
   - Name: "Button-Klick-Tracking"
   - Typ: "Matomo Analytics"
   - Aktion: "Ereignis verfolgen"
   - Ereigniskategorie: "Interaktion"
   - Ereignisaktion: "Klick"
   - Ereignisname: {{Seitentitel}}
   - Trigger: "Klick auf Buttons"
   - Speichern Sie den Tag

4. Veröffentlichen Sie die Änderungen:
   - Klicken Sie auf "Veröffentlichen"
   - Geben Sie eine Versionsbeschreibung ein: "Hinzufügen von Variablen und Triggern"
   - Klicken Sie auf "Veröffentlichen"

5. Testen Sie die neue Konfiguration:
   - Besuchen Sie Ihre WordPress-Website
   - Klicken Sie auf verschiedene Buttons
   - Überprüfen Sie die Ergebnisse in Matomo
   
   **Aufgabe**: Welche weiteren Variablen könnten für das Tracking in WordPress nützlich sein?

### Teil 5: Debugging und Validierung

1. Aktivieren Sie den Debug-Modus im Tag Manager:
   - Navigieren Sie zu "Debug"
   - Klicken Sie auf "Debug-Modus starten"
   - Öffnen Sie Ihre WordPress-Website in einem neuen Tab

2. Führen Sie verschiedene Aktionen auf der Website durch und beobachten Sie die Debug-Ausgabe:
   - Seitenaufrufe
   - Klicks auf Links und Buttons
   - Formularübermittlungen
   - Scrollen

3. Überprüfen Sie die korrekte Implementierung mit dem Matomo-Tracking-Checker:
   - Navigieren Sie zu "Administration" > "Messung" > "Tracking-Code"
   - Scrollen Sie nach unten zum Abschnitt "Tracking-Code überprüfen"
   - Geben Sie die URL Ihrer WordPress-Website ein
   - Klicken Sie auf "Überprüfen"
   
   **Aufgabe**: Welche Probleme können bei der Implementierung des Trackings auftreten und wie können sie behoben werden?

## Abschluss und Reflexion

Beantworten Sie folgende Fragen:

1. Welche Vorteile bietet der Matomo Tag Manager gegenüber der direkten Implementierung von Tracking-Code?
2. Wie können Sie sicherstellen, dass das Tracking DSGVO-konform ist?
3. Welche Arten von Benutzerinteraktionen sind besonders wertvoll für die Analyse einer WordPress-Website?

## Zusatzaufgaben (optional)

1. Implementieren Sie ein A/B-Testing-Setup mit dem Tag Manager.
2. Erstellen Sie ein benutzerdefiniertes Dashboard in Matomo, das speziell auf WordPress-Metriken ausgerichtet ist.
3. Implementieren Sie Content-Tracking, um zu messen, welche Inhalte am meisten gelesen werden.
