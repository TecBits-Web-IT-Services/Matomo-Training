# Übung 6: Tracking-Code und Tag Manager in WordPress

## Übungsziele
- Implementierung erweiterter Tracking-Funktionen in WordPress
- Einrichtung und Verwendung des Matomo Tag Managers
- Erfassung von Benutzerinteraktionen und Ereignissen

## Benötigte Zeit
- 45-60 Minuten

## Voraussetzungen
- Abgeschlossene Übung 5 zur WordPress-Integration
- Laufende Docker-Umgebung mit WordPress und Matomo

## Übungsschritte

### Teil 1: Erweitertes JavaScript-Tracking

1. Melden Sie sich in WordPress an unter `https://training.ddev.site/wp-admin`

2. Erstellen Sie eine neue Seite mit verschiedenen Interaktionselementen:
   - Navigieren Sie zu "Seiten" > "Erstellen"
   - Geben Sie "Interaktionstest" als Titel ein
   - Fügen Sie verschiedene Elemente hinzu:
     - Ein Kontaktformular (installieren Sie das Plugin "Contact Form 7")
     - Mehrere Abschnitte mit Überschriften
     - Einige Bilder
   - Veröffentlichen Sie die Seite

3. Implementieren Sie erweitertes Ereignis-Tracking:
   - Navigieren Sie zu "Einstellungen" > "Insert Headers and Footers"
   - Fügen Sie folgenden JavaScript-Code im Footer-Bereich vor dem trackPageView-Event ein:

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
   
   **Aufgabe:** Erklären Sie, wie die verschiedenen Ereignis-Tracking-Funktionen im Code funktionieren und welche Daten sie erfassen.

4. Testen Sie die Tracking-Funktionen:
   - Besuchen Sie die erstellte Seite
   - Scrollen Sie bis zum Ende der Seite
   - Füllen Sie das Kontaktformular aus und senden Sie es ab
   - Klicken Sie auf verschiedene Links

5. Überprüfen Sie die Ergebnisse in Matomo:
   - Navigieren Sie zu "Verhalten" > "Ereignisse"
   - Analysieren Sie die erfassten Ereignisse nach Kategorien
   
   **Aufgabe:** Welche zusätzlichen Ereignisse könnten für eine WordPress-Website relevant sein?

### Teil 2: Einrichtung des Matomo Tag Managers

1. Melden Sie sich in Matomo an unter `https://matomo.training.ddev.site` und navigieren Sie oben rechts zum Tag Manager und aktivieren Sie diesen.

2. Erstellen Sie einen neuen Container:
   - Navigieren Sie zu "Tag Manager"
   - Klicken Sie auf "Container erstellen"
   - Name: "WordPress Container"
   - Wählen Sie "Web" als Kontext
   - Klicken Sie auf "Erstellen"

3. Installieren Sie den Container-Code in WordPress:
   - Kopieren Sie den generierten Container-Code
   - Melden Sie sich in WordPress an
   - Navigieren Sie zu "Einstellungen" > "Insert Headers and Footers"
   - Fügen Sie den Container-Code in den Header-Bereich ein
   - Speichern Sie die Änderungen
   
   **Aufgabe:** Warum wird der Tag Manager-Code im Header und nicht im Footer platziert?

### Teil 3: Erstellen von Tags im Tag Manager

1. Erstellen Sie einen Tag für Ereignis-Tracking:
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
   
   - Trigger: "Seitenansicht"
   - Speichern Sie den Tag

2. Erstellen Sie einen Tag für Formular-Tracking:
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
   
   - Trigger: "Seitenansicht"
   - Speichern Sie den Tag

3. Veröffentlichen Sie die Änderungen:
   - Klicken Sie auf "Veröffentlichen" in der linken Seitenleiste
   - Geben Sie eine Versionsbeschreibung ein: "Initiale Tag-Konfiguration"
   - Klicken Sie auf "Veröffentlichen"

4. Testen Sie die Tag Manager-Implementierung:
   - Besuchen Sie Ihre WordPress-Website
   - Interagieren Sie mit verschiedenen Elementen
   - Überprüfen Sie die Ergebnisse in Matomo unter "Verhalten" > "Ereignisse"
   
   **Aufgabe:** Vergleichen Sie die direkte JavaScript-Implementierung mit der Tag Manager-Implementierung. Welche Vor- und Nachteile haben beide Ansätze?

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
   - Bedingungen: "Element-Klasse enthält button"
   - Speichern Sie den Trigger

3. Erstellen Sie einen Tag, der die Variable und den Trigger verwendet:
   - Navigieren Sie zu "Tags" > "Tag erstellen"
   - Name: "Button-Klick-Tracking"
   - Typ: "Matomo Analytics"
   - Tracking Typ: "Ereignis"
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

### Teil 5: Debugging und Validierung

1. Aktivieren Sie den Debug-Modus im Tag Manager:
   - Navigieren Sie zu "Vorschau/Debug"
   - Geben Sie die URL einer der WordPress-Seiten ein und klicken Sie auf "Debug"
   - Öffnen Sie Ihre WordPress-Website in einem neuen Tab

2. Führen Sie verschiedene Aktionen auf der Website durch und beobachten Sie die Debug-Ausgabe:
   - Seitenaufrufe
   - Klicks auf Links und Buttons
   - Formularübermittlungen
   - Scrollen

## Abschluss und Reflexion

Beantworten Sie folgende Fragen:

1. Welche Vorteile bietet der Matomo Tag Manager gegenüber der direkten Implementierung des Tracking-Codes?
2. Wie können Sie sicherstellen, dass das Tracking DSGVO-konform ist?
3. Welche Arten von Benutzerinteraktionen sind besonders wertvoll für die Analyse einer WordPress-Website?
