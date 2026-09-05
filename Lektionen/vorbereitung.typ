#import "../lib/helpers.typ": *

== Vorbereitung eigener Computer

Dieses Kapitel bereitet deinen Computer vor, um Python-Programme zu schreiben und auszuführen. Du wirst drei zentrale Komponenten installieren und konfigurieren. Je nach deinem Betriebssystem unterscheiden sich die Schritte leicht.

=== Was benötigen wir?

#Theorie[
  Um mit Python zu programmieren, brauchst du:

  1. *Python* – Die Programmiersprache selbst
  2. *Ein Text-Editor* – Um Code zu schreiben (wir nutzen Visual Studio Code)
  3. *Ein Terminal* – Um Programme auszuführen und mit dem System zu kommunizieren

  Stell dir vor, du wirst handwerklich tätig: Du brauchst die Werkzeuge (Python), einen Arbeitsplatz (Editor) und eine Möglichkeit, die Werkzeuge zu nutzen (Terminal). Ohne eines von diesen kannst du nicht produktiv arbeiten.

  Die Installation ist je nach Betriebssystem unterschiedlich, aber das Prinzip bleibt gleich.
]

=== Wähle dein Betriebssystem

Klicke auf den Namen deines Betriebssystems unten, um zur passenden Anleitung zu springen:

- *Windows* → “Windows + WSL2 Setup”
- *macOS* → “macOS Setup”
- *Linux* → “Linux Setup”

---

== Windows + WSL2 Setup

=== Warum WSL2 und nicht einfach Python auf Windows?

#Theorie[
  Das ist eine berechtigte Frage. Man könnte Python auch direkt auf Windows installieren – aber warum tun wir das nicht?

  *Das Kernproblem:* Viele Programmier-Tools wurden auf Unix/Linux gebaut (macOS und Linux sind Unix-ähnlich). Diese Tools erwarten bestimmte Dateistrukturen, Befehle und Verhaltensweisen, die auf Windows anders sind oder fehlen.

  *Konkrete Probleme mit Windows-native Python:*
  - *Pfade sind anders:* Linux nutzt `/home/user/projekt`, Windows nutzt `C:\Users\user\projekt`. Das führt zu Verwirung.
  - *Dateirechte fehlen:* Auf Linux kannst du mit `chmod` Dateien schützen. Windows hat ein ganz anderes System.
  - *Shells sind inkompatibel:* CMD und PowerShell arbeiten anders als Bash (die Standard-Shell auf Linux).
  - *Package Manager fehlen:* Auf Linux installierst du Programme mit `apt install` oder `brew`. Windows hat das nicht.
  - *Zukünftige Probleme:* Wenn du später mit Python-Bibliotheken arbeitest (Django, NumPy, etc.), erwarten sie oft Unix-ähnliche Umgebungen.

  *Die Lösung: WSL2 (Windows Subsystem for Linux)*

  WSL2 ist ein echtes Linux-Kernel auf deinem Windows-PC – kein Emulator, sondern virtualisierte Hardware. Du programmierst also in einer “echten” Linux-Umgebung, während dein Windows-Desktop normal läuft. Das ist das Beste aus beiden Welten:
  - Du hast einen normalen Windows-Arbeitsplatz
  - Aber deine Programmier-Tools laufen in einer professionellen Linux-Umgebung

  *macOS und Linux haben dieses Problem nicht:* Sie sind bereits Unix-ähnlich, daher kann Python dort direkt installiert werden.
]

*Schritt 1: WSL2 installieren*

Öffne *PowerShell* als Administrator:
+ Gehe auf der suchleiste und dort *PowerShell* suchen, dann mitt rechts klick soll auf die option Als Administrator starten.
+ Kopiere diesen Befehl rein und drücke Enter:

```
wsl --install -d Ubuntu
```

Das Terminal wird viele Zeilen Text anzeigen – das ist normal. Der Prozess dauert 5–10 Minuten. Am Ende wirst du gefragt, einen *Benutzernamen* und ein *Passwort* einzugeben. Diese sind wichtig, schreib dir beide auf, du brauchst das Passwort später!

#image("../Assets/wsl-intallation.png", width: 115%, alt: "WSL2 Installation")

Nach der Installation: *Starte deinen PC neu.*

*Schritt 2: Ubuntu Terminal öffnen*

Nach dem Neustart:
+ Öffne das *Start-Menü*
+ Suche nach "Ubuntu"
+ Klicke auf "Ubuntu"

Das Ubuntu-Terminal öffnet sich. Das ist dein neues "Zuhause" zum Programmieren!

*Schritt 3: Python installieren*

Im Ubuntu-Terminal, gib diese Befehle ein (kopieren & einfügen mit Ctrl+Shift+V):

```bash
sudo apt update
sudo apt install python3 python3-pip git
```

Das Terminal fragt vielleicht nach deinem Passwort (das du bei WSL-Setup erstellt hast). Tippe es ein (es wird nicht angezeigt, das ist normal!) und drücke Enter.

Nach 2–3 Minuten ist Python installiert.

*Schritt 4: VSCode installieren*

VSCode ist der Text-Editor, in dem wir Code schreiben.

+ Gehe auf https://code.visualstudio.com
+ Klicke auf "Download for Windows"
+ Installiere die `.exe` Datei normal (wie jedes andere Windows-Programm)

Nach der Installation:
+ Öffne VSCode
+ Klicke auf die "Extensions" (linke Sidebar, das Icon mit vier Quadraten)
+ Suche nach "WSL"
+ Installiere die Extension "Remote – WSL" von Microsoft

Das erlaubt VSCode, mit deinem Ubuntu-Linux zu kommunizieren.

*Schritt 5: VSCode mit WSL verbinden*

+ Öffne VSCode
+ Drücke Ctrl+Shift+P (oder Cmd+Shift+P auf Mac)
+ Tippe "WSL: New Window"
+ Klicke drauf

VSCode öffnet sich jetzt im WSL-Modus. Oben sollte es "WSL: Ubuntu" anzeigen.

*Schritt 6: Test – Dein erstes Programm*

Im WSL-Terminal:

```bash
mkdir -p ~/Programmiervorkurs
cd ~/Programmiervorkurs
```

Öffne die Datei `helloworld.py` in VSCode:
+ Drücke Ctrl+K, dann Ctrl+O
+ Navigiere zu deinem `Programmiervorkurs` Ordner
+ Erstelle eine neue Datei: "helloworld.py"

Kopiere diesen Code rein:

#Code("02_helloworld/helloworld.py")

Speichern (Ctrl+S), dann im Terminal:

```bash
python3 helloworld.py
```

Du solltest sehen:
```
Hello World!
```

Glückwunsch! Python läuft!

---

=== macOS Setup

*Schritt 1: Homebrew installieren*

Homebrew ist ein "App-Manager" für macOS, wie ein App-Store für die Terminal.

Öffne *Terminal* (Spotlight: Cmd+Space, tippe "Terminal"):

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Das dauert ein paar Minuten. Folge den Anweisungen auf dem Bildschirm.

*Schritt 2: Python installieren*

Im Terminal:

```bash
brew install python3 git
```

*Schritt 3: VSCode installieren*

+ Gehe auf https://code.visualstudio.com
+ Klicke "Download for Mac"
+ Öffne die `.zip` Datei, die heruntergeladen wird
+ Ziehe VSCode in den "Applications" Ordner

*Schritt 4: Test – Dein erstes Programm*

Im Terminal:

```bash
mkdir -p ~/Programmiervorkurs
cd ~/Programmiervorkurs
```

Öffne VSCode:
+ Drücke Cmd+Shift+P
+ Tippe "code ."
+ Drücke Enter

Das öffnet VSCode im `Programmiervorkurs` Ordner.

Erstelle eine neue Datei `helloworld.py` mit:

#Code("02_helloworld/helloworld.py")

Speichern (Cmd+S), dann im Terminal:

```bash
python3 helloworld.py
```

Du solltest sehen:
```
Hello World!
```

Glückwunsch!

---

=== Linux Setup

Linux ist wie macOS Unix-basiert, daher läuft Python nativ ohne zusätzliche Layer.

*Schritt 1: Python und Git installieren*

Öffne dein Terminal und gib folgende Befehle ein:

```bash
sudo apt update
sudo apt install python3 python3-pip git
```

Das Terminal fragt dich möglicherweise nach deinem Passwort. Tippe es ein und drücke Enter.

*Hinweis:* Falls du ein anderes Linux nutzt (Fedora, Arch, openSUSE, etc.), ersetze `apt` mit deinem Package Manager:
- *Fedora/RHEL:* `sudo dnf install python3 python3-pip git`
- *Arch:* `sudo pacman -S python python-pip git`
- *openSUSE:* `sudo zypper install python3 python3-pip git`

*Schritt 2: VSCode installieren*

Option A (über Terminal):
```bash
sudo apt install code
```

Option B (manuell):
+ Gehe auf https://code.visualstudio.com
+ Lade die `.deb` Datei (für Debian/Ubuntu) herunter
+ Installiere sie mit `sudo dpkg -i code_*.deb`

_[Screenshot-Hinweis: VSCode unter Linux]_

*Schritt 3: Dein erstes Python-Programm*

Im Terminal:

```bash
mkdir -p ~/Programmiervorkurs
cd ~/Programmiervorkurs
code .
```

Das öffnet VSCode im `Programmiervorkurs` Ordner.

Erstelle eine neue Datei:
+ Drücke Ctrl+N
+ Speichere sie als `helloworld.py` (Ctrl+S)

Kopiere diesen Code rein:

#Code("02_helloworld/helloworld.py")

Speichern (Ctrl+S), dann im Terminal:

```bash
python3 helloworld.py
```

Du solltest sehen:
```
Hello World!
```

*Herzlichen Glückwunsch!* Deine Umgebung ist bereit.

---

---

== Überprüfung deiner Installation

#Praxis[
  *Aufgabe 1: Verifiziere, dass alles installiert ist*

  Öffne dein Terminal (WSL/macOS/Linux) und gib diese Befehle nacheinander ein:

  ```bash
  python3 --version
  git --version
  code --version
  ```

  Jeder Befehl sollte eine Versionsnummer ausgeben, z.B.:
  ```
  Python 3.10.12
  git version 2.34.1
  code 1.86.2
  ```

  *Wenn ein Befehl nicht funktioniert:* Gehe zurück zur passenden Anleitung oben und überprüfe die Schritte.

  *Aufgabe 2: Erstelle und starte dein erstes echtes Programm*

  Im Terminal:

  ```bash
  cd ~/Programmiervorkurs
  code test.py
  ```

  VSCode öffnet sich mit einer neuen Datei `test.py`. Schreib diesen Code rein:

  ```python
  name = input("Wie heißt du? ")
  print(f"Hallo {name}! Willkommen zum Python-Kurs.")
  ```

  Speichern (Ctrl+S oder Cmd+S). Dann im Terminal:

  ```bash
  python3 test.py
  ```

  Das Terminal fragt dich nach deinem Namen. Tippe ihn ein und drücke Enter. Das Programm sollte antworten:
  ```
  Wie heißt du? Max
  Hallo Max! Willkommen zum Python-Kurs.
  ```

  *Das ist bereits ein echtes Python-Programm!* Es nimmt Input entgegen und verarbeitet ihn.
]

---

== Häufige Probleme und Lösungen

#Theorie[
  *Problem: "command not found: python3" (oder "python3: command not found")*

  Das bedeutet, dass Python nicht korrekt installiert wurde.
  - *Unter WSL:* Gehe zurück zu "Schritt 3: Python installieren" und führe die Befehle erneut aus.
  - *Unter macOS:* Überprüfe, ob Homebrew wirklich installiert wurde (tippe `brew --version`).
  - *Unter Linux:* Nutze den Package Manager deiner Distribution (apt, dnf, pacman).

  *Problem: VSCode öffnet sich nicht im WSL-Modus (Windows)*

  - Überprüfe, dass du die "Remote – WSL" Extension installiert hast.
  - Versuche, VSCode zu schließen und neu zu starten.
  - Öffne PowerShell und tippe: `wsl --install` nochmal.

  *Problem: "Permission denied" beim Ausführen von Befehlen*

  Das passiert manchmal bei WSL. Versuche:
  ```bash
  sudo chmod +x ~/Programmiervorkurs/*.py
  ```

  *Problem: Tastaturkürzel funktioniert nicht*

  Manche Systeme haben andere Shortcuts. Versuche:
  - Statt `Ctrl+Shift+P`: Öffne VSCode und klicke auf "View" > "Command Palette"
  - Statt `Cmd+N`: Datei > New File
]

---

== Reflexion

#Spiel[
  *Frage 1:* Du hast jetzt drei Komponenten installiert: Python, VSCode und ein Terminal. Welche dieser drei ist der "Computer" und welche sind die "Werkzeuge"?

  *Frage 2:* Warum brauchst du ein Terminal/Shell, wenn es VSCode gibt? Kann man nicht alles in VSCode machen?

  *Frage 3 (für Windows-Nutzer):* Warum haben wir WSL installiert, obwohl Python auch direkt auf Windows läuft? Hätte das nicht reichen können?

  Denke über diese Fragen nach. Die Antworten werden im nächsten Kapitel wichtig.
]
