# Digitale Edition: Egon Entdecken
Sophie Schwammer 11738106

Digitale Editionen (WiSe 2025/26)

Universität Wien

## Projektbeschreibung
Dieses Projekt entstand im Rahmen des Seminars „Digitale Edition“ an der Universität Wien (2025/26). Ziel ist die digitale Aufbereitung ausgewählter handschriftlicher Quellen von Egon Schiele (1890–1918), darunter Briefe, Ansichtskarten, eine Werkliste und eine Visitenkarte.

Die Edition kombiniert Transkription mit strukturierter Datenmodellierung auf Basis der Text Encoding Initiative (TEI) und macht die Quellen in einer selbsterstellten Webseite zugänglich.

## Fragestellung der Edition
Die Edition geht der Frage nach, wie sich Egon Schieles künstlerische Praxis, seine Netzwerke sowie seine Interaktionen mit Sammlern und Institutionen anhand seiner schriftlichen Zeugnisse rekonstruieren lassen.

Im Zentrum stehen folgende Aspekte:
- Welche Beziehungen lassen sich zwischen Künstler, Sammlern, Institutionen und Orten erkennen?
- Wie reflektiert Schiele seine eigene künstlerische Produktion in Briefen und Listen?
- Welche Rolle spielen ökonomische und organisatorische Faktoren (z. B. Verkauf, Transport, Ausstellung)?

Methodisch basiert das Projekt auf:
- einer quellennahen Transkription
- semantischen Auszeichnung mittels TEI
- der Verknüpfung von Entitäten (Personen, Orte, Organisationen, Werke)

## Datenmodell (TEI)

Die Edition verwendet das XML-basierte Format der Text Encoding Initiative (TEI).

Zentrale Strukturen:
- teiHeader: Metadaten zu Quelle, Entstehung, physischer Beschaffenheit
- text: Transkribierter Inhalt
- div type="letter", div type="postcard", div type="businesscard": Dokumenttypen
- opener, closer: Briefstruktur
- correspDesc: Sender/Empfänger-Modellierung

Semantische Auszeichnung:
- persName → Personen
- placeName → Orte
- orgName → Organisationen
- objectName → Werke

Diese sind über @ref mit separaten Verzeichnissen verknüpft:
- personen.html
- orte.html
- organisation.html
- werke.html

Besondere Modellierungsentscheidungen:
- Zeilenumbrüche werden mit lb/ abgebildet (layouttreu)
- Seitenwechsel mit pb/
- Editorische Eingriffe werden markiert
- Fehler im Original werden mit [sic!] gekennzeichnet
- Unsichere Identifikationen werden mit <note> dokumentiert

Für Postkarten wurden zusätzliche Strukturen eingeführt:
- Vorder-/Rückseite (div type="front", div type="back")
- Adress- und Nachrichtenteil
- Layoutbeschreibung (layoutDesc)

## Erschließung der Quellen und Referenzen
Die Edition umfasst mehrere Dokumenttypen:
- Briefe (adressiert an Ferdinand Kofron, Oskar Reichel, Arthur Roessler)
- Ansichtskarten (adressiert an Reichel und Roessler)
- Visitenkarten (adressiert an Roessler)
- Werkeliste (Gemälde mit Besitzern)

Die Transkriptionen basieren auf:

Digitalisaten der Wienbibliothek im Rathaus
https://www.digital.wienbibliothek.at/nav/classification/2612562

Bereits vorhandenen Transkriptionen des Leopold Museums
https://www.egonschiele.at/de

Diese wurden:
- überprüft
- ergänzt
- und in TEI überführt

Zusätzliche editorische Maßnahmen:
- Markierung von Schreibfehlern ([sic!])
- Ergänzung von Kontextinformationen
- Identifikation von Personen/Orten/Organisationen/Werken

## Transformation und Webpräsentation
Die Transformation erfolgt mittels XSLT:
- TEI → HTML
- semantische Elemente werden in HTML-Strukturen überführt
- Entitäten werden als Links dargestellt

CSS dient zur:
- visuellen Strukturierung
- Hervorhebung semantischer Kategorien
- Darstellung von Listen, Briefstrukturen und Registern

## Funktionalität der Edition
Die Edition enthält folgende funktionale Elemente:

- Verlinkte Entitäten
  - Personen, Orte, Organisationen und Werke sind miteinander vernetzt
- Registerseiten
  - Personenverzeichnis
  - Ortsverzeichnis
  - Organisationsverzeichnis
- Navigierbarkeit
  - direkte Sprünge zwischen Text und Registereinträgen
- Strukturierte Darstellung
  - Briefe (mit opener/closer)
  - Postkarten (Vorder-/Rückseite)

(Erweiterungen wie Suche oder Visualisierungen sind konzeptionell möglich, wurden aber im Rahmen des Projekts nicht implementiert.)

## Einsatz von KI
Im Rahmen dieses Projekts wurde künstliche Intelligenz unterstützend eingesetzt.

Dies betrifft insbesondere:

XSLT-Entwicklung
- Erstellung und Optimierung der Datei transform.xsl
- Entwicklung von Templates für:
  - Personen
  - Orte
  - Organisationen
  - Werke
- Debugging und Strukturverbesserung

TEI-Modellierung
- Überprüfung der korrekten Verwendung von TEI-Elementen
- Beratung bei:
  - Header-Strukturen
  - sourceDesc und msDesc
  - Brief- und Postkartenmodellierung
- Klärung von Encoding-Fragen

Qualitätssicherung
- Kontrolle von:
  - Konsistenz der Auszeichnung
  - Struktur der XML-Dateien
  - Vollständigkeit der Metadaten

Die inhaltliche Arbeit (Transkription, Auswahl der Quellen, editorische Entscheidungen) wurde eigenständig durchgeführt.

## Autorin
Sophie Schwammer (11738106)

Universität Wien

Master Digital Humanities
