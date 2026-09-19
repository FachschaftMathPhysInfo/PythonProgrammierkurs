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

- #link(<vorbereitung-windows>)[*Windows* → „Windows + WSL2 Setup“]
- #link(<vorbereitung-macos>)[*macOS* → „macOS Setup“]
- #link(<vorbereitung-linux>)[*Linux* → „Linux Setup“]

=== Windows + WSL2 Setup <vorbereitung-windows>

==== Warum WSL2 und nicht einfach Python auf Windows?

#Theorie[
  Das ist eine berechtigte Frage. Man könnte Python auch direkt auf Windows installieren – aber warum tun wir das nicht?

    *Das Kernproblem:* Viele Programmier-Tools wurden auf Unix/Linux gebaut (macOS und Linux sind Unix-ähnlich). Diese Tools erwarten bestimmte Dateistrukturen, Befehle und Verhaltensweisen, die auf Windows anders sind oder fehlen. Teilweise existieren sie auch nur für Linux, wenn du später in deinem Studium mal so ein Tool brauchst, wäre es von Vorteil, Linux schon mal von innen gesehen zu haben.

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

==== Die Installation
*Schritt 1: WSL2 installieren*

Öffne *PowerShell* als Administrator:
+ Geh auf die Suchleiste, such dort nach *PowerShell* und klick mit rechts auf die Option "Als Administrator starten".
+ Kopier diesen Befehl rein und drück Enter:

```
wsl --install -d Ubuntu
```

Das Terminal wird viele Zeilen Text anzeigen – das ist normal. Der Prozess dauert 5–10 Minuten. Am Ende wirst du gefragt, einen *Benutzernamen* und ein *Passwort* einzugeben. Diese sind wichtig, schreib dir beide auf, du brauchst das Passwort später!

#image("../Assets/wsl-intallation.png", width: 115%, alt: "WSL2 Installation")

Nach der Installation: *Starte deinen PC neu.*

*Schritt 2: Ubuntu Terminal öffnen*

Nach dem Neustart:
+ Öffne das *Start-Menü*
+ Such nach "Ubuntu"
+ Klick auf "Ubuntu"

Das Ubuntu-Terminal öffnet sich. Das ist dein neues "Zuhause" zum Programmieren!

*Schritt 3: Python installieren*

Im Ubuntu-Terminal gibst du diese Befehle ein (kopieren & einfügen mit Ctrl+Shift+V):

```bash
sudo apt update
sudo apt install python3 python3-pip git
```

Das Terminal fragt vielleicht nach deinem Passwort (das du beim WSL-Setup erstellt hast). Tipp es ein (es wird nicht angezeigt, das ist normal!) und drück Enter.

Nach 2–3 Minuten ist Python installiert.

*Schritt 4: VSCode installieren*

VSCode ist der Text-Editor, in dem wir Code schreiben.

+ Geh auf https://code.visualstudio.com
+ Klick auf "Download for Windows"
+ Installier die `.exe` Datei normal (wie jedes andere Windows-Programm)

Nach der Installation:
+ Öffne VSCode
+ Klick auf die "Extensions" (linke Sidebar, das Icon mit vier Quadraten)
+ Such nach "WSL"
+ Installier die Extension "Remote – WSL" von Microsoft

Das erlaubt VSCode, mit deinem Ubuntu-Linux zu kommunizieren.

*Schritt 5: VSCode mit WSL verbinden*

+ Öffne VSCode
+ Drück Ctrl+Shift+P (oder Cmd+Shift+P auf Mac)
+ Tipp "WSL: New Window"
+ Klick drauf

VSCode öffnet sich jetzt im WSL-Modus. Oben sollte es "WSL: Ubuntu" anzeigen.

// *Schritt 6: Test – Dein erstes Programm*

// Im WSL-Terminal:

// ```bash
// mkdir -p ~/Programmiervorkurs
// cd ~/Programmiervorkurs
// ```

// Öffne die Datei `helloworld.py` in VSCode:
// + Drück Ctrl+K, dann Ctrl+O
// + Navigier zu deinem `Programmiervorkurs` Ordner
// + Erstell eine neue Datei: "helloworld.py"

// Kopier diesen Code rein:

// #Code("02_helloworld/helloworld.py")

// Speichern (Ctrl+S), dann im Terminal:

// ```bash
// python3 helloworld.py
// ```

// Du solltest sehen:
// ```
// Hello World!
// ```

// Glückwunsch! Python läuft!

#pagebreak()

=== macOS Setup <vorbereitung-macos>

Für macOS ist die Vorbereitung um einiges einfacher als Windows, da wir schon ein Unixoides Betriebssystem haben. Trotzdem können wir Python nicht einfach so installieren. Wir benötigen dafür erst nochmal einen sogenannten _Package-Manager_. Das ist wie ein App Store, der aber nicht nur Apps, sondern auch viele Bibliotheken und Hilfsprogramme enthält, die eine normale Nutzerin nicht wirklich braucht.

*Schritt 1: Homebrew installieren*

Der _Package-Manager_ den wir verwenden heißt _Homebrew_.

Öffne *Terminal* (Spotlight: Cmd+Space, tipp "Terminal") und gib folgenden Befehl ein:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

*Was passiert hier?* Wir benutzen hier 2 wichtige Programme. `curl` lädt eine Installationsdatei aus dem Internet herunter. Diese enthält sehr viele Anweisungen für die Shell. Die geben wir auch dann an `bash` weiter. `bash` werden wir noch ganz ausführlich behandeln.

//Hinweis, kein Code aus dem Internet einfach so ausführen.

#Hinweis[Es ist nicht ungefährlich, einfach so fremden Code aus dem Internet auszuführen. Wenn du dir unsicher bist, kannst du einfach den Link in einen Browser eingeben und nachschauen, was da genau passiert.]

Das dauert ein paar Minuten. Folge den Anweisungen auf dem Bildschirm.

*Schritt 2: Python installieren*

Im Terminal:

```bash
brew install python3 git
```

*Schritt 3: VSCode installieren*

+ Geh auf https://code.visualstudio.com
+ Klick "Download for Mac"
+ Öffne die `.zip` Datei, die heruntergeladen wird
+ Zieh VSCode in den "Applications" Ordner

// *Schritt 4: Test – Dein erstes Programm*

// Im Terminal:

// ```bash
// mkdir -p ~/Programmiervorkurs
// cd ~/Programmiervorkurs
// ```

// Öffne VSCode:
// + Drück Cmd+Shift+P
// + Tipp  `code .`
// + Drück Enter

// Das öffnet VSCode im `Programmiervorkurs` Ordner.

// Erstell eine neue Datei `helloworld.py` mit:

// #Code("02_helloworld/helloworld.py")

// Speichern (Cmd+S), dann im Terminal:

// ```bash
// python3 helloworld.py
// ```

// Du solltest sehen:
// ```
// Hello World!
// ```

#pagebreak()

=== Linux Setup <vorbereitung-linux>

Linux ist wie macOS Unix-basiert, daher läuft Python nativ ohne zusätzliche Layer.

*Schritt 1: Python und Git installieren*

Öffne dein Terminal und gib folgende Befehle ein:

```bash
sudo apt update
sudo apt install python3 python3-pip git
```

Das Terminal fragt dich möglicherweise nach deinem Passwort. Tipp es ein und drück Enter.

*Hinweis:* Falls du ein anderes Linux nutzt (Fedora, Arch, openSUSE, etc.), ersetz `apt` mit deinem Package Manager:
- *Fedora/RHEL:* `sudo dnf install python3 python3-pip git`
- *Arch:* `sudo pacman -S python python-pip git`
- *openSUSE:* `sudo zypper install python3 python3-pip git`

*Schritt 2: VSCode installieren*

Option A (über Terminal):
```bash
sudo apt install code
```

Option B (für die Hacker):
+ Geh auf https://code.visualstudio.com
+ Lad die `.deb` Datei (für Debian/Ubuntu) herunter
+ Installier sie mit `sudo dpkg -i code_*.deb`

_[Screenshot-Hinweis: VSCode unter Linux]_

*Schritt 3: Dein erstes Python-Programm*

Im Terminal:

```bash
mkdir -p ~/Programmiervorkurs
cd ~/Programmiervorkurs
code .
```

Das öffnet VSCode im `Programmiervorkurs` Ordner.

// Erstell eine neue Datei:
// + Drück Ctrl+N
// + Speicher sie als `helloworld.py` (Ctrl+S)

// Kopier diesen Code rein:

// #Code("02_helloworld/helloworld.py")

// Speichern (Ctrl+S), dann im Terminal:

// ```bash
// python3 helloworld.py
// ```

// Du solltest sehen:
// ```
// Hello World!
// ```

// *Herzlichen Glückwunsch!* Deine Umgebung ist bereit.


#pagebreak()

=== Überprüfung deiner Installation

Ob alles richtig ist, siehst du wenn das Licht angeht, oder so. Naja, wir müssen (oder sollten) noch überprüfen ob alles geklappt hat.

#Praxis[
  *Aufgabe 1: Verifizier, dass alles installiert ist*
  Öffne dein Terminal (WSL/macOS/Linux) und gib diese Befehle nacheinander ein:
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

  *Wenn ein Befehl nicht funktioniert:* Geh zurück zur passenden Anleitung oben und überprüf die Schritte.
  *Aufgabe 2: Erstell und starte ein erstes Programm*

  Im Terminal:

  ```bash
  cd ~/Programmiervorkurs
  code test.py
  ```

   VSCode öffnet sich mit einer neuen Datei `test.py`. Schreib diesen Code rein:

  ```python
  print("Hello World")
  ```

  Speichern (Ctrl+S oder Cmd+S). Dann im Terminal:

  ```bash
  python3 test.py
  ```

    Du solltest nun
    ```bash
      Hello World
    ```
    in deinem Terminal stehen haben. Herzlichen Glückwunsch zu deinem ersten Programm.

  // Das Terminal fragt dich nach deinem Namen. Tipp ihn ein und drück Enter. Das Programm sollte antworten:
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
  - *Unter WSL:* Geh zurück zu "Schritt 3: Python installieren" und führ die Befehle erneut aus.
  - *Unter macOS:* Überprüf, ob Homebrew wirklich installiert wurde (tipp `brew --version`).
  - *Unter Linux:* Nutz den Package Manager deiner Distribution (apt, dnf, pacman).

  *Problem: VSCode öffnet sich nicht im WSL-Modus (Windows)*

  - Überprüf, dass du die "Remote – WSL" Extension installiert hast.
  - Versuch, VSCode zu schließen und neu zu starten.
  - Öffne PowerShell und tipp: `wsl --install` nochmal.

  *Problem: "Permission denied" beim Ausführen von Befehlen*

  Das passiert manchmal bei WSL. Versuch:
  ```bash
  sudo chmod +x ~/Programmiervorkurs/*.py
  ```

  *Problem: Tastaturkürzel funktioniert nicht*

  Manche Systeme haben andere Shortcuts. Versuch:
  - Statt `Ctrl+Shift+P`: Öffne VSCode und klick auf "View" > "Command Palette"
  - Statt `Cmd+N`: Datei > New File

    *Die Allgemeine Lösung:* Falls du irgendwo nicht mehr weiterkommst, einfach deine Tutorin fragen.
]



#Spiel[
  *Frage 1:* Du hast jetzt drei Komponenten installiert: Python, VSCode und ein Terminal. Welche dieser drei ist der "Computer" und welche sind die "Werkzeuge"?

  *Frage 2:* Warum brauchst du ein Terminal/Shell, wenn es VSCode gibt? Kann man nicht alles in VSCode machen?

  *Frage 3 (für Windows-Nutzerinnen):* Warum haben wir WSL installiert, obwohl Python auch direkt auf Windows läuft? Hätte das nicht reichen können?

  Denk über diese Fragen nach. Die Antworten werden im nächsten Kapitel wichtig.
]
