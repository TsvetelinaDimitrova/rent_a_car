# rent_a_car

	-- Server version	10.4.11-MariaDB


======================================================= ENGLISH_README ==========================================================================================================


The database "auto" was created with CHARACTER SET uft8mb4.
CHARACTER SET uft8mb4 is used to avoid difficulties with special characters and umlauts.
The tables (kunden (customers), bankverbindung (bank details), hersteller (manufacturer), model (model), pkw (car), ausleihe (rent), protokoll (protocol)) were created, paying attention to the order with the associated primary key and foreign key.

The main tables, except for the rent and protocol tables (these two tables are fulfilled by the procedures mentioned below), were filled with data records.

A VIEW v_autobestand was created.
This is an overview of the car, manufacturer, and model tables with all the car rental company's cars, including their name, model, license plate number, and how much they cost per day.

A VIEW v_kundenalter was created.
This is an overview from the customers table with all customers of the car rental company, with their surname, first name, and date of birth. With the help of two functions, the age of the customers and a notification whether they are allowed to rent a car are determined.

A VIEW v_frei_Auto_heute was created.
This VIEW uses data from the rent and car tables and then uses a function to show all cars that are available on a given date. (The table uses the CURDATE function as the date)

A TRIGGER ange_ausleihe_after_insert was created.
This trigger uses data from the rent table and ensures that when a new data record with a certain customer number is inserted in the rent table, the number of rent records of the associated customer number in the customer table is automatically increased by 1.

A TRIGGER ange_ausleihe_after_delete was created.
This trigger uses data from the rent table and ensures that when you delete an old data record with a certain customer number in the rent table, the number of rent records from the associated customer number in the customer table is automatically reduced by 1.

A TRIGGER kmstand_after_insert was created.
The trigger uses data from the protocol table and ensures that when a new data record is inserted with a specific car number in the protocol table, the mileage of the associated car number in the car table is always up to date.

A PROCEDURE p_newKunden was created.
The procedure p_newKunden expects the following parameters:

kuname (text) ⇾ last name of the customer
kuvorname (text) ⇾ first name of the customer
kustrasse (text) ⇾ street address of the customer
kuplz (text) ⇾ city postcode of the customer
kuort (text) ⇾ location of the customer
kutelefon (text) ⇾ phone number of the customer
kugebdat (date) ⇾ birthdate of the customer
kudatfschein (date) ⇾ expiry date of the customer's driver's license
The procedure p_newKunden saves a new customer in the table customers.

A PROCEDURE p_newausleihe was created.
The procedure p_newausleihe expects the following parameters:

pnr (integer) -> car number
kunr (integer) -> customer number
start (date) -> start of rent
end (date) -> end of rent
The procedure p_newausleihe saves a new customer in the table customers.

A PROCEDURE p_freiauto was created.
The procedure p_freiauto expects the following parameters:

from_date (date) -> start date of the period
to_date (date) -> end date of the period
This procedure shows a table of all available cars in the period, through input from date and input to date.


======================================================= GERMAN_README ===========================================================================================================


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
