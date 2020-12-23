# rent_a_car

	-- Server version	10.4.11-MariaDB

1.	Die Datenbank auto  wurde mit CHARACTER SET uft8mb4 erstellt.
-	CHARACTER SET uft8mb4 wird verwendet um Schwierigkeiten mit Sonderzeichen und Umlaute zu vermeiden.

2.	Es wurden die Tabellen (kunden, bankverbindung, hersteller, modell, pkw, ausleihe, protokoll) erstellt, wobei auf die Reihenfolge mit dem dazugehörigen Primärschlüssel und Fremdschlüssel geachtet wurde.
	
3.	Die Haupttabellen, außer die Tabellen ausleihe und protokoll (Diese zwei Tabellen werden, durch unten genannten Prozeduren, erfüllt) wurden mit Datensätze erfüllt.

4.	Es wurde eine VIEW v_autobestand erstellt.
-	Das ist eine Übersicht aus den Tabellen pkw, hersteller und modell  mit allen Autos des Autovermieters, indem ihren Namen, Modell und Kennzeichen und wie viel sie pro Tag kosten steht.

5.	Es wurde eine VIEW v_kundenalter erstellt.
-	Das ist eine Übersicht aus der Tabelle kunden mit allen Kunden des Autovermieters, indem ihren Namen, Vornamen und Geburtsdatum steht. Mithilfe zwei Funktionen wird das Alter der Kunden, und mit Mitteilung ob sie einen Auto mieten dürfen, ermittelt.

6.	Es wurde eine VIEW v_frei_Auto_heute erstellt.
-	Dieses VIEW verwendet Daten aus den Tabellen ausleihe und pkw und zeigt durch eine Funktion alle Autos, die am eine Datum verfügbar sind. (Die Tabelle verwendet die CURDATE-Funktion als Datum)

7.	Es wurde einen TRIGGER anz_ausleihe_after_insert erstellt.
-	Dieser Trigger verwendet Daten aus der Tabelle ausleihe und sorgt dafür, dass beim Einfügen eines neuen Datensatzes, mit bestimmter Kundennummer, in der Tabelle ausleihe, dass die Anzahl der Ausleihen der zugehörigen Kundennummer, in der Tabelle kunden, automatisch um 1 erhöht wird.

8.	Es wurde einen TRIGGER anz_ausleihe_after_delete erstellt.
-	Dieser Trigger verwendet Daten aus der Tabelle ausleihe und sorgt dafür, dass beim Löschen eines alten Datensatzes, mit bestimmter Kundennummer, in der Tabelle ausleihe, dass die Anzahl der Ausleihen der zugehörigen Kundennummer, in der Tabelle kunden, automatisch um 1 abnehmen wird.

9.	Es wurde einen TRIGGER kmstand_after_insert erstellt.
-	Der Trigger verwendet Daten aus der Tabelle protokoll und sorgt dafür, dass beim Einfügen eines neuen Datensatzes, mit bestimmter PKW-Nummer in der Tabelle protokoll, dass den Kilometerstand der zugehörigen PKW-Nummer in der Tabelle pkw immer aktuell ist.

10.	Es wurde eine PROCEDURE p_newKunden erstellt.

Die Prozedur p_newKunden erwartet folgendeParameter:

1.	kuname (Text) -> Nachname des Kundes
2.	kuvorname (Text) -> Vorname des Kundes
3.	kustrasse (Text) -> Straße des Kundes
4.	kuplz (Text) -> Postleitzahl der Stadt des Kundes
5.	kuort (Text) -> Ort des Kundes
6.	kutelefon (Text) -> Ttelefonnummer des Kundes
7.	kugebdat (Datum) -> Geburtstagdatum des Kundes
8.	kudatfschein (Datum) -> Gültigkeitsdatum des Führerscheins des Kundes

Die Prozedur p_newKunden speichert einen neuen Kunde in der Tabelle kunden.

11.	Es wurde eine PROCEDURE p_newausleihe erstellt.

Die Prozedur p_newausleihe erwartet folgende Parameter:

1.	pnr (Ganzzahl) -> PKW-Nummer
2.	kunr (Ganzzahl) -> Kundennummer
3.	beginn (Datum) -> Beginn der Ausleihe
4.	ende (Datum) -> Ende der Ausleihe

Die Prozedur p_newausleihe speichert einen neuen Kunde in der Tabelle kunden.

12.	Es wurde eine PROCEDURE p_freiauto erstellt.

Die Prozedur p_freiauto erwartet folgende Parameter:

1.	from_date (Datum) -> Anfangsdatum der Periode
2.	to_date (Datun) -> Schlussdatum der Periode

Diese Prozedur zeigt eine Tabelle, durch Input von Datum und Input bis Datum, alle verfügbaren Autos in diesem Zeitraum. Diese Prozedur zeigt, durch das Aufrufen der Prozedur, eine Tabelle mit alle verfügbaren Autos in den genannten Zeitraum.


 
