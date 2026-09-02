import sys
import platform

print("=" * 50)
print("Installation Überprüfung")
print("=" * 50)

# Python-Version
print(f"\n✓ Python-Version: {sys.version}")

# Betriebssystem
print(f"✓ Betriebssystem: {platform.system()}")

# Architektur
print(f"✓ Architektur: {platform.machine()}")

print("\n" + "=" * 50)
print("Alle Überprüfungen bestanden! 🎉")
print("=" * 50)
print("\nNächster Schritt: Lektion 2 - Hello World")
