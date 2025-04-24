# Übung 4: Integration von Matomo in WordPress

## Übungsziele
- Installation und Konfiguration des Matomo-Plugins für WordPress
- Implementierung des Tracking-Codes in WordPress
- Verständnis der verschiedenen Integrationsmöglichkeiten

## Benötigte Zeit
- 45-60 Minuten

## Voraussetzungen
- Abgeschlossene Übungen zur Matomo-Installation
- Laufende Docker-Umgebung mit WordPress und Matomo

## Übungsschritte

### Teil 1: Manuelle Integration des Tracking-Codes am Beispiel Wordpress

1. Melden Sie sich in Matomo an unter `https://matomo.training.ddev.site`

2. Navigieren Sie zu "Administration" > "Webseiten" > "Tracking-Code"

3. Kopieren Sie den JavaScript-Tracking-Code für Ihre Website

4. Melden Sie sich in WordPress an unter `https://training.ddev.site/wp-admin`

5. Falls noch nicht vorhanden installieren und aktivieren Sie das Plugin "Insert Headers and Footers":
   - Navigieren Sie zu "Plugins" > "Installieren"
   - Suchen Sie nach "Insert Headers and Footers"
   - Klicken Sie auf "Jetzt installieren" und dann auf "Aktivieren"

6. Fügen Sie den Matomo-Tracking-Code ein:
   - Navigieren Sie zu "Einstellungen" > "WP Headers and Footers"
   - Fügen Sie den kopierten Tracking-Code in den Bereich "Skripte im Header" ein und Speichern Sie
   - Wählen Sie den Tab Settings aus und setzen Sie den Wert für "Footers Priority" auf 999 und speichern Sie die Anpassung.
   
7. Besuchen Sie Ihre WordPress-Website und führen Sie einige Aktionen durch (Seiten besuchen, Links klicken)

8. Überprüfen Sie in Matomo, ob die Besuche aufgezeichnet wurden:
   - Navigieren Sie zu "Besucher" > "Echtzeit"
   - Überprüfen Sie die "Besucher-Logs"

### Teil 2: Einrichtung des E-Commerce Trackings in Wordpress mit Woocommerce und dem TecBits Plugin Trackster

> Hinweis:
> 
> Die Umsetzung des E-Commerce Trackings kann ein relativ komplexes Thema sein und ist stark vom Trackingkonzept abhängig und davon
> welche Events getrackt werden sollen.
> Um die Übung kompakt zu halten, stellen wir Ihnen an dieser Stelle ein kleines Custom Plugin von uns bereit, welches ein Basis-Tracking
> der Produkte, des Warenkorbs und der Käufe erlaubt. Normalerweise würde dazu ein auf den Shop zugeschnittenes Plugin verwendet,
> welches auf die feinheiten des Shops eingeht.

1. Installieren und aktivieren Sie das Plugin "Trackster" aus dem Ordner Beispielkonfigurationen > WP-Plugin:
   - Navigieren Sie zu "Plugins" > "Plugin hinzufügen"
   - Auf der nächsten Seite wählen Sie ganz oben "Plugin Hochladen" und wählen Sie die Zip Datei aus dem oben angegebenen Verzeichnis
   - Klicken Sie auf "Jetzt installieren" und dann auf "Aktivieren"
   - Für das Plugin ist keine weitere Konfiguration nötig

2. Anpassung des Tracking Codes
   -  Navigieren Sie zu "Einstellungen" > "WP Headers and Footers"
   -  Entfernen Sie folgende Zeile aus dem Tracking Code im Bereich "Scripts in Header"
   ```JS
   _paq.push(['trackPageView']);
   ```
   - Fügen Sie folgendes Script im Bereich "Scripts in Footer" hinzu
   ```HTML
   <script>
    _paq.push(['trackPageView']);
   </script>
   ```
   
### Teil 3: Opt-Out und Datenschutz

1. Navigieren Sie in Matomo in den Bereich Administration > Privatsphäre > Benutzer Opt-Out
   - Setzen Sie das Häcken bei "Für das Opt Out eigenen Code verwenden" und die Sprache "Deutsch"
   - Kopieren Sie den Angezeigten Opt Out Code
   
2. Erstellen Sie eine Datenschutzseite in WordPress oder editieren Sie eine bestehende:
   - Fügen Sie einen neuen Block vom Typ HTML hinzu und fügen Sie den Opt Out Code als Inhalt ein.
   - Speichern Sie ihre Änderungen und öffnen Sie die Webseite.

3. Besuchen Sie die Datenschutzseite und testen Sie die Opt-Out-Funktion:
   - Klicken Sie auf die Option zum Deaktivieren des Trackings
   - Überprüfen Sie, ob der Status korrekt angezeigt wird
   - Surfen Sie ein wenig auf der Webseite und prüfen Sie im Anschluss, ob weiterhin Daten in Matomo einlaufen oder nicht
   
   **Aufgabe**: Warum ist die Bereitstellung einer Opt-Out-Möglichkeit wichtig für die DSGVO-Konformität?

## Abschluss und Reflexion

Beantworten Sie folgende Fragen:

1. Vergleichen Sie die verschiedenen Methoden zur Integration von Matomo in WordPress. Welche Vor- und Nachteile haben sie?
2. Wie können Sie überprüfen, ob das Tracking korrekt funktioniert?
3. Welche zusätzlichen Tracking-Funktionen könnten für eine WordPress-Website nützlich sein?