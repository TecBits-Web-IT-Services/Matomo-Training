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
   - Fügen Sie den kopierten Tracking-Code in den Bereich "Skripte im Footer" ein
   - Speichern Sie die Änderungen
   
   **Aufgabe**: Warum ist es besser, den Tracking-Code im Footer statt im Header einzufügen?

7. Besuchen Sie Ihre WordPress-Website und führen Sie einige Aktionen durch (Seiten besuchen, Links klicken)

8. Überprüfen Sie in Matomo, ob die Besuche aufgezeichnet wurden:
   - Navigieren Sie zu "Besucher" > "Echtzeit"
   - Überprüfen Sie die "Besucher-Logs"

### Teil 2: Einrichtung des E-Commerce Trackings in Wordpress mit Woocommerce und Tracktastic

> Hinweis:
> 
> Aufgrund einer aktuellen Inkompatibilität in der Pluginversion im offiziellen Wordpress Repository funktioniert die
> frei verfügbare Version des Plugins aktuell nicht, im Order "Beispielkonfigurationen > WP-Plugins" finden Sie eine angepasste Version
> des Plugins. Bitte installieren Sie diese entgegen der unten beschriebenen Methode als ZIP Upload in Wordpress.

1. Installieren und aktivieren Sie das Plugin "Tracktastic: Free Matomo Integration for WooCommerce":
   - Navigieren Sie zu "Plugins" > "Installieren"
   - Suchen Sie nach "Tracktastic"
   - Klicken Sie auf "Jetzt installieren" und dann auf "Aktivieren"
   
### Teil 5: Opt-Out und Datenschutz

1. Konfigurieren Sie die Datenschutzoptionen im Connect Matomo-Plugin:
   - Navigieren Sie zu "Einstellungen" > "Connect Matomo" > "Datenschutz"
   - Aktivieren Sie "Opt-Out-Iframe anzeigen"
   - Speichern Sie die Einstellungen

2. Erstellen Sie eine Datenschutzseite in WordPress:
   - Navigieren Sie zu "Seiten" > "Erstellen"
   - Geben Sie "Datenschutz" als Titel ein
   - Fügen Sie einen Text zur Datenerfassung hinzu
   - Fügen Sie den Shortcode ` ein
   - Veröffentlichen Sie die Seite

3. Besuchen Sie die Datenschutzseite und testen Sie die Opt-Out-Funktion:
   - Klicken Sie auf die Option zum Deaktivieren des Trackings
   - Überprüfen Sie, ob der Status korrekt angezeigt wird
   
   **Aufgabe**: Warum ist die Bereitstellung einer Opt-Out-Möglichkeit wichtig für die DSGVO-Konformität?

## Abschluss und Reflexion

Beantworten Sie folgende Fragen:

1. Vergleichen Sie die verschiedenen Methoden zur Integration von Matomo in WordPress. Welche Vor- und Nachteile haben sie?
2. Wie können Sie überprüfen, ob das Tracking korrekt funktioniert?
3. Welche zusätzlichen Tracking-Funktionen könnten für eine WordPress-Website nützlich sein?

## Zusatzaufgaben (optional)

1. Implementieren Sie E-Commerce-Tracking für WooCommerce (falls installiert).
2. Konfigurieren Sie benutzerdefinierte Dimensionen, um WordPress-Benutzerrollen zu tracken.
3. Erstellen Sie ein benutzerdefiniertes Dashboard in Matomo speziell für die WordPress-Website.
