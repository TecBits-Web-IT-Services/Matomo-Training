# Übung 1: Installation und Grundkonfiguration von Matomo mit Docker

## Übungsziele
- Einrichtung einer Docker-Umgebung mit WordPress und Matomo
- Grundkonfiguration von Matomo
- Verständnis der Beziehung zwischen Matomo und der Datenbank

## Benötigte Zeit
- 45-60 Minuten

## Voraussetzungen
- Ubuntu Desktop 24.04
- Installiertes Docker und Docker Compose
- Grundlegende Kenntnisse der Kommandozeile

## Übungsschritte

### Teil 1: Einrichtung der DDEV/Docker-Umgebung
> Hinweis:
> - Bestätigen Sie die Nachfrage "Permission to beam up?" mit Yes / Ja
> - sollten Sie nach einem Root-Passwort gefragt werden so verwenden Sie bitte das Passwort des "student" Benutzers

1. Öffnen Sie ein Terminal und führen Sie das Installationsskript für die Umgebung aus und wechseln sie im Anschluss in das neu angelegte Arbeitsverzeichnis
   ```bash
    wget https://raw.githubusercontent.com/TecBits-Web-IT-Services/Matomo-Training/main/Skripte/environment-setup.sh &&\
      chmod +x environment-setup.sh &&\
      ./environment-setup.sh
   
   cd matomo-uebung/Matomo-Training-Env/
   ```

2. Prüfen Sie mit dem Befehl "ddev describe" ob die Umgebung hochgefahren wurde, die Ausgabe sollte ähnlich wie diese aussehen:
```bash
┌───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│ Project: training ~/matomo-uebung/Matomo-Training-Env https://training.ddev.site                                                          │
│ Docker platform: linux-docker                                                                                                             │
│ Router: traefik                                                                                                                           │
├──────────────┬──────┬────────────────────────────────────────────────────────────────────────────────────────────────┬────────────────────┤
│ SERVICE      │ STAT │ URL/PORT                                                                                       │ INFO               │
├──────────────┼──────┼────────────────────────────────────────────────────────────────────────────────────────────────┼────────────────────┤
│ web          │ OK   │ https://training.ddev.site                                                                     │ wordpress PHP 8.3  │
│              │      │ InDocker -> Host:                                                                              │ Server: apache-fpm │
│              │      │  - web:80 -> 127.0.0.1:32772                                                                   │ Docroot: ''        │
│              │      │  - web:443 -> 127.0.0.1:32773                                                                  │ Perf mode: none    │
│              │      │  - web:8025 -> 127.0.0.1:32782                                                                 │ Node.js: 22        │
├──────────────┼──────┼────────────────────────────────────────────────────────────────────────────────────────────────┼────────────────────┤
│ db           │ OK   │ InDocker -> Host:                                                                              │ mariadb:10.11      │
│              │      │  - db:3306 -> 127.0.0.1:32781                                                                  │ User/Pass: 'db/db' │
│              │      │                                                                                                │ or 'root/root'     │
├──────────────┼──────┼────────────────────────────────────────────────────────────────────────────────────────────────┼────────────────────┤
│ matomo       │ OK   │ https://matomo.training.ddev.site                                                              │                    │
│              │      │ InDocker:                                                                                      │                    │
│              │      │  - matomo:80                                                                                   │                    │
├──────────────┼──────┼────────────────────────────────────────────────────────────────────────────────────────────────┼────────────────────┤
│ Mailpit      │      │ Mailpit: https://training.ddev.site:8026                                                       │                    │
│              │      │ Launch: ddev mailpit                                                                           │                    │
├──────────────┼──────┼────────────────────────────────────────────────────────────────────────────────────────────────┼────────────────────┤
│ Project URLs │      │ https://training.ddev.site, https://127.0.0.1:32773, http://training.ddev.site,                │                    │
│              │      │ http://127.0.0.1:32772                                                                         │                    │
└──────────────┴──────┴────────────────────────────────────────────────────────────────────────────────────────────────┴────────────────────┘
```
### Teil 2: Test von WordPress

1. Öffnen Sie einen Webbrowser und navigieren Sie zu `https://training.ddev.site`, es sollte eine Wordpress Shop Seite erscheinen

2. Öffnen Sie einen Webbrowser und navigieren Sie zu `https://training.ddev.site/wp-admin`, es sollte der Wordpress Backend Login erscheinen
   - Die Zugangsdaten lauten wie folgt:
     - Benutzername: admin
     - Passwort: Test4711-
     - E-Mail: training@tecbits.de

### Teil 3: Ersteinrichtung von Matomo

1. Öffnen Sie einen Webbrowser und navigieren Sie zu `https://matomo.training.ddev.site`

2. Folgen Sie dem Installationsassistenten:
   - Wählen Sie Deutsch als Sprache
   - Überprüfen Sie die Systemanforderungen (sollten alle erfüllt sein)
   - Bei der Datenbankeinrichtung verwenden Sie:
     - Datenbankserver: db
     - Benutzername: root
     - Passwort: root
     - Datenbankname: matomo
     - Tabellenpräfix: matomo_
     - Adapter: PDO\MYSQL
     - Datenbank Engine: MySQL

3. Erstellen Sie einen Administratorbenutzer:
   - Benutzername: matomo-admin
   - Passwort: Test4711- (notieren Sie sich ein sicheres Passwort!)
   - E-Mail: training@tecbits.de

4. Richten Sie Ihre erste Website ein:
   - Name: Matomo Schulungswebsite
   - URL: https://training.ddev.site
   - Zeitzone: Deutschland-Berlin
   - E-Commerce: Ecommerce aktiviert

5. Kopieren Sie den generierten Tracking-Code und speichern Sie ihn in einer Textdatei für die spätere Verwendung.

   **Aufgabe**: Analysieren Sie den Tracking-Code. Welche Hauptkomponenten enthält er und welche Funktion haben sie?

### Teil 4: Überprüfung der Datenbankstruktur

**Aufgabe**: Identifizieren Sie die Tabellen, die zu Matomo gehören?

1. Verbinden Sie sich mit dem Datenbank-Container:
   ```bash
   docker exec ddev-training-db mysql -u root -proot
   ```
   
2. Zeigen Sie sich alle Datenbanken an und identifizieren Sie die Matomo Datenbank
   ```sql
   SHOW DATABASES;
   ```
   
3. Wechseln Sie in die Matomo Tabelle Zeigen Sie alle Tabellen in der Datenbank an:
   ```sql
   USE matomo;
   SHOW TABLES;
   ```

4. Verlassen Sie die MySQL-Konsole:
   ```sql
   EXIT;
   ```

## Abschluss und Reflexion

Beantworten Sie folgende Fragen:

1. Welche Vorteile bietet die Verwendung von Docker für die Installation von Matomo?
2. Welche Herausforderungen könnten bei der Verwendung einer gemeinsamen Datenbank für WordPress und Matomo auftreten?
3. Wie würden Sie diese Umgebung für eine Produktionsumgebung anpassen?

## Zusatzaufgaben (optional)

1. Installieren Sie ein zusätzliches Plugin in Matomo über die Benutzeroberfläche.
