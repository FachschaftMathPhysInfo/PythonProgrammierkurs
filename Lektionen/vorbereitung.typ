#import "../lib/helpers.typ": *


== Vorbereitung eigener Computer

Dieses Kapitel bereitet euren Computer vor, um Python-Programme zu schreiben und auszuführen. Ihr werdet drei zentrale Komponenten installieren und konfigurieren. Je nach eurem Betriebssystem unterscheiden sich die Schritte leicht.

=== Was benötigen wir?

#Theorie[
  Um mit Python zu programmieren, braucht ihr:

  1. *Python* – Die Programmiersprache selbst
  2. *Ein Text-Editor* – Um Code zu schreiben (wir nutzen Visual Studio Code)
  3. *Ein Terminal* – Um Programme auszuführen und mit dem System zu kommunizieren

  Stellt euch vor, ihr werdet handwerklich tätig: Ihr braucht die Werkzeuge (Python), einen Arbeitsplatz (Editor) und eine Möglichkeit, die Werkzeuge zu nutzen (Terminal). Ohne eines von diesen könnt ihr nicht produktiv arbeiten.

  Die Installation ist je nach Betriebssystem unterschiedlich, aber das Prinzip bleibt gleich.
]

=== Wählt euer Betriebssystem

Klickt auf den Namen eures Betriebssystems unten, um zur passenden Anleitung zu springen:

- #link(<vorbereitung-windows>)[*Windows* → „Windows + WSL2 Setup“]
- #link(<vorbereitung-macos>)[*macOS* → „macOS Setup“]
- #link(<vorbereitung-linux>)[*Linux* → „Linux Setup“]

=== Windows + WSL2 Setup <vorbereitung-windows>

==== Warum WSL2 und nicht einfach Python auf Windows?

#Theorie[
  Das ist eine berechtigte Frage. Man könnte Python auch direkt auf Windows installieren – aber warum tun wir das nicht?

    *Das Kernproblem:* Viele Programmier-Tools wurden auf Unix/Linux gebaut (macOS und Linux sind Unix-ähnlich). Diese Tools erwarten bestimmte Dateistrukturen, Befehle und Verhaltensweisen, die auf Windows anders sind oder fehlen. Teilweise existieren sie auch nur für Linux, wenn ihr später in eurem Studium mal so ein Tool braucht, wäre es von Vorteil, Linux schon mal von innen gesehen zu haben.

  *Konkrete Probleme mit Windows-native Python:*
  - *Pfade sind anders:* Linux nutzt `/home/user/projekt`, Windows nutzt `C:\Users\user\projekt`. Das führt zu Verwirung.
  - *Dateirechte fehlen:* Auf Linux könnt ihr mit `chmod` Dateien schützen. Windows hat ein ganz anderes System.
  - *Shells sind inkompatibel:* CMD und PowerShell arbeiten anders als Bash (die Standard-Shell auf Linux).
  - *Package Manager fehlen:* Auf Linux installiert ihr Programme mit `apt install` oder `brew`. Windows hat das nicht.
  - *Zukünftige Probleme:* Wenn ihr später mit Python-Bibliotheken arbeitet (Django, NumPy, etc.), erwarten sie oft Unix-ähnliche Umgebungen.

  *Die Lösung: WSL2 (Windows Subsystem for Linux)*

  WSL2 ist ein echtes Linux-Kernel auf eurem Windows-PC – kein Emulator, sondern virtualisierte Hardware. Ihr programmiert also in einer “echten” Linux-Umgebung, während euer Windows-Desktop normal läuft. Das ist das Beste aus beiden Welten:
  - Ihr habt einen normalen Windows-Arbeitsplatz
  - Aber eure Programmier-Tools laufen in einer professionellen Linux-Umgebung

  *macOS und Linux haben dieses Problem nicht:* Sie sind bereits Unix-ähnlich, daher kann Python dort direkt installiert werden.
]

==== Die Installation
*Schritt 1: WSL2 installieren*

Öffnet *PowerShell* als Administrator:
+ Geht auf die Suchleiste, sucht dort nach *PowerShell* und klickt mit rechts auf die Option "Als Administrator starten".
+ Kopiert diesen Befehl rein und drückt Enter:

```
wsl --install -d Ubuntu
```

Das Terminal wird viele Zeilen Text anzeigen – das ist normal. Der Prozess dauert 5–10 Minuten. Am Ende werdet ihr gefragt, einen *Benutzernamen* und ein *Passwort* einzugeben. Diese sind wichtig, schreibt euch beide auf, ihr braucht das Passwort später!

#image("../Assets/wsl-intallation.png", width: 115%, alt: "WSL2 Installation")

Nach der Installation: *Startet euren PC neu.*

*Schritt 2: Ubuntu Terminal öffnen*

Nach dem Neustart:
+ Öffnet das *Start-Menü*
+ Sucht nach "Ubuntu"
+ Klickt auf "Ubuntu"

Das Ubuntu-Terminal öffnet sich. Das ist euer neues "Zuhause" zum Programmieren!

*Schritt 3: Python installieren*

Im Ubuntu-Terminal gebt ihr diese Befehle ein (kopieren & einfügen mit Ctrl+Shift+V):

```bash
sudo apt update
sudo apt install python3 python3-pip git
```

Das Terminal fragt vielleicht nach eurem Passwort (das ihr beim WSL-Setup erstellt habt). Tippt es ein (es wird nicht angezeigt, das ist normal!) und drückt Enter.

Nach 2–3 Minuten ist Python installiert.

*Schritt 4: VSCode installieren*

VSCode ist der Text-Editor, in dem wir Code schreiben.

+ Geht auf https://code.visualstudio.com
+ Klickt auf "Download for Windows"
+ Installiert die `.exe` Datei normal (wie jedes andere Windows-Programm)

Nach der Installation:
+ Öffnet VSCode
+ Klickt auf die "Extensions" (linke Sidebar, das Icon mit vier Quadraten)
+ Sucht nach "WSL"
+ Installiert die Extension "Remote – WSL" von Microsoft

Das erlaubt VSCode, mit eurem Ubuntu-Linux zu kommunizieren.

*Schritt 5: VSCode mit WSL verbinden*

+ Öffnet VSCode
+ Drückt Ctrl+Shift+P (oder Cmd+Shift+P auf Mac)
+ Tippt "WSL: New Window"
+ Klickt drauf

VSCode öffnet sich jetzt im WSL-Modus. Oben sollte es "WSL: Ubuntu" anzeigen.

// *Schritt 6: Test – Euer erstes Programm*

// Im WSL-Terminal:

// ```bash
// mkdir -p ~/Programmiervorkurs
// cd ~/Programmiervorkurs
// ```

// Öffnet die Datei `helloworld.py` in VSCode:
// + Drückt Ctrl+K, dann Ctrl+O
// + Navigiert zu eurem `Programmiervorkurs` Ordner
// + Erstellt eine neue Datei: "helloworld.py"

// Kopiert diesen Code rein:


#Code("02_helloworld/helloworld.py")


// Speichern (Ctrl+S), dann im Terminal:

// ```bash
// python3 helloworld.py
// ```

// Ihr solltet sehen:
// ```
// Hello World!
// ```

// Glückwunsch! Python läuft!

#pagebreak()

=== macOS Setup <vorbereitung-macos>

Für macOS ist die Vorbereitung um einiges einfacher als Windows, da wir schon ein Unixoides Betriebssystem haben. Trotzdem können wir Python nicht einfach so installieren. Wir benötigen dafür erst nochmal einen sogenannten _Package-Manager_. Das ist wie ein App Store, der aber nicht nur Apps, sondern auch viele Bibliotheken und Hilfsprogramme enthält, die eine normale Nutzerin nicht wirklich braucht.

*Schritt 1: Homebrew installieren*

Der _Package-Manager_ den wir verwenden heißt _Homebrew_.

Öffnet *Terminal* (Spotlight: Cmd+Space, tippt "Terminal") und gebt folgenden Befehl ein:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

*Was passiert hier?* Wir benutzen hier 2 wichtige Programme. `curl` lädt eine Installationsdatei aus dem Internet herunter. Diese enthält sehr viele Anweisungen für die Shell. Die geben wir auch dann an `bash` weiter. `bash` werden wir noch ganz ausführlich behandeln.

//Hinweis, kein Code aus dem Internet einfach so ausführen.

#Hinweis[Es ist nicht ungefährlich, einfach so fremden Code aus dem Internet auszuführen. Wenn ihr euch unsicher seid, könnt ihr einfach den Link in einen Browser eingeben und nachschauen, was da genau passiert.]

Das dauert ein paar Minuten. Folgt den Anweisungen auf dem Bildschirm.

*Schritt 2: Python installieren*

Im Terminal:

```bash
brew install python3 git
```

*Schritt 3: VSCode installieren*

+ Geht auf https://code.visualstudio.com
+ Klickt "Download for Mac"
+ Öffnet die `.zip` Datei, die heruntergeladen wird
+ Zieht VSCode in den "Applications" Ordner

// *Schritt 4: Test – Euer erstes Programm*

// Im Terminal:

// ```bash
// mkdir -p ~/Programmiervorkurs
// cd ~/Programmiervorkurs
// ```

// Öffnet VSCode:
// + Drückt Cmd+Shift+P
// + Tippt  `code .`
// + Drückt Enter

// Das öffnet VSCode im `Programmiervorkurs` Ordner.

// Erstellt eine neue Datei `helloworld.py` mit:


#Code("02_helloworld/helloworld.py")


// Speichern (Cmd+S), dann im Terminal:

// ```bash
// python3 helloworld.py
// ```

// Ihr solltet sehen:
// ```
// Hello World!
// ```

#pagebreak()

=== Linux Setup <vorbereitung-linux>

Linux ist wie macOS Unix-basiert, daher läuft Python nativ ohne zusätzliche Layer.

*Schritt 1: Python und Git installieren*

Öffnet euer Terminal und gebt folgende Befehle ein:

```bash
sudo apt update
sudo apt install python3 python3-pip git
```

Das Terminal fragt euch möglicherweise nach eurem Passwort. Tippt es ein und drückt Enter.

*Hinweis:* Falls ihr ein anderes Linux nutzt (Fedora, Arch, openSUSE, etc.), ersetzt `apt` mit eurem Package Manager:
- *Fedora/RHEL:* `sudo dnf install python3 python3-pip git`
- *Arch:* `sudo pacman -S python python-pip git`
- *openSUSE:* `sudo zypper install python3 python3-pip git`

*Schritt 2: VSCode installieren*

Option A (über Terminal):
```bash
sudo apt install code
```

Option B (für die Hacker):
+ Geht auf https://code.visualstudio.com
+ Ladet die `.deb` Datei (für Debian/Ubuntu) herunter
+ Installiert sie mit `sudo dpkg -i code_*.deb`

_[Screenshot-Hinweis: VSCode unter Linux]_

*Schritt 3: Euer erstes Python-Programm*

Im Terminal:

```bash
mkdir -p ~/Programmiervorkurs
cd ~/Programmiervorkurs
code .
```

Das öffnet VSCode im `Programmiervorkurs` Ordner.

// Erstellt eine neue Datei:
// + Drückt Ctrl+N
// + Speichert sie als `helloworld.py` (Ctrl+S)

// Kopiert diesen Code rein:


#Code("02_helloworld/helloworld.py")


// Speichern (Ctrl+S), dann im Terminal:

// ```bash
// python3 helloworld.py
// ```

// Ihr solltet sehen:
// ```
// Hello World!
// ```

// *Herzlichen Glückwunsch!* Eure Umgebung ist bereit.


#pagebreak()

=== Überprüfung eurer Installation

Ob alles richtig ist, seht ihr wenn das Licht angeht, oder so. Naja, wir müssen (oder sollten) noch überprüfen ob alles geklappt hat.

#Praxis[
  *Aufgabe 1: Verifiziert, dass alles installiert ist*
  Öffnet euer Terminal (WSL/macOS/Linux) und gebt diese Befehle nacheinander ein:
  ```bash
  python3 --versione
  git --version
  code --version
  ```
  Jeder Befehl sollte eine Versionsnummer ausgeben, z.B.:
  ```
  Python 3.10.12
  git version 2.34.1
  code 1.86.2
  ```

  *Wenn ein Befehl nicht funktioniert:* Geht zurück zur passenden Anleitung oben und überprüft die Schritte.
  *Aufgabe 2: Erstellt und startet ein erstes Programm*

  Im Terminal:

  ```bash
  cd ~/Programmiervorkurs
  code test.py
  ```

   VSCode öffnet sich mit einer neuen Datei `test.py`. Schreibt diesen Code rein:

  ```python
  print("Hello World")
  ```

  Speichern (Ctrl+S oder Cmd+S). Dann im Terminal:

  ```bash
  python3 test.py
  ```

    Ihr solltet nun
    ```bash
      Hello World
    ```
    in eurem Terminal stehen haben. Herzlichen Glückwunsch zu eurem ersten Programm.

  // Das Terminal fragt euch nach eurem Namen. Tippt ihn ein und drückt Enter. Das Programm sollte antworten:
  // ```
  // Wie heißt du? Max
  // Hallo Max! Willkommen zum Python-Kurs.
  // ```

  // *Das ist bereits ein echtes Python-Programm!* Es nimmt Input entgegen und verarbeitet ihn.
]

#pagebreak()

=== Häufige Probleme und Lösungen

#Theorie[
  *Problem: "command not found: python3" (oder "python3: command not found")*

  Das bedeutet, dass Python nicht korrekt installiert wurde.
  - *Unter WSL:* Geht zurück zu "Schritt 3: Python installieren" und führt die Befehle erneut aus.
  - *Unter macOS:* Überprüft, ob Homebrew wirklich installiert wurde (tippt `brew --version`).
  - *Unter Linux:* Nutzt den Package Manager eurer Distribution (apt, dnf, pacman).

  *Problem: VSCode öffnet sich nicht im WSL-Modus (Windows)*

  - Überprüft, dass ihr die "Remote – WSL" Extension installiert habt.
  - Versucht, VSCode zu schließen und neu zu starten.
  - Öffnet PowerShell und tippt: `wsl --install` nochmal.

  *Problem: "Permission denied" beim Ausführen von Befehlen*

  Das passiert manchmal bei WSL. Versucht:
  ```bash
  sudo chmod +x ~/Programmiervorkurs/*.py
  ```

  *Problem: Tastaturkürzel funktioniert nicht*

  Manche Systeme haben andere Shortcuts. Versucht:
  - Statt `Ctrl+Shift+P`: Öffnet VSCode und klickt auf "View" > "Command Palette"
  - Statt `Cmd+N`: Datei > New File

    *Die Allgemeine Lösung:* Falls ihr irgendwo nicht mehr weiterkommt, einfach eure Tutorin fragen.
]



#Spiel[
  *Frage 1:* Ihr habt jetzt drei Komponenten installiert: Python, VSCode und ein Terminal. Welche dieser drei ist der "Computer" und welche sind die "Werkzeuge"?

  *Frage 2:* Warum braucht ihr ein Terminal/Shell, wenn es VSCode gibt? Kann man nicht alles in VSCode machen?

  *Frage 3 (für Windows-Nutzerinnen):* Warum haben wir WSL installiert, obwohl Python auch direkt auf Windows läuft? Hätte das nicht reichen können?

  Denkt über diese Fragen nach. Die Antworten werden im nächsten Kapitel wichtig.
]
