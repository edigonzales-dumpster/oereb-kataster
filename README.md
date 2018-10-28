# oereb-kataster

Proof-of-Concept:
- Systemarchitektur im Allgemeinen
- Datenumbauten
- Werkzeuge (ili2pg etc.)
- Cookie-Cutter-Web-Service (XML-Auszug)
- Iconizer

## Datenbank und WMS-Server
```
vagrant up
```
Enthält PostgresSQL/PostGIS und QGIS 2.18, QGIS Server und GeoServer.

## OEREB-(Daten-)Infrastruktur
### Datenbank initialisieren
```
gradle createSchemaOereb importFederalCodesets importFederalLegalBasis importCantonalLegalBasisToOereb createSchemaOerebAuszugAnnex createSchemaOerebNutzungsplanung importFederalLegalBasisToOerebNutzungsplanung importCantonalLegalBasisToOerebNutzungsplanung importResponsibleOfficesToOerebNutzungsplanung createOerebNutzungsplanungViews createSchemaNutzungsplanung createSchemaAmtlicheVermessung
```
Erstellt vier Schemas in zwei Datenbanken (`oereb`=OEREB-Datenbank und `edit`=GDI-Erfassungsdatenbank):

1. OEREB-Schema in Transferstruktur. Alle Bundesdaten und kantonalen Daten werden in der modelläquivalenten Transferstrukturform in diesem Schema gespeichert. Der OEREB-Service greift auf dieses Schema zu ("Cookie Cutter").
2. OEREB-Annex-Schema. Dies beinhaltet zusätzlich notwendige Daten für den XML-/PDF-Auszug. Z.B. Informationen zu Gemeinden, Logos, Glossar aber auch Übersetzungstabellen von Themen und ebenfalls Informationen über Subthemen.
3. OEREB-Nutzungsplanungsschema: Schema für die kantonale Nutzungsplanung in der Transferstruktur. Dient als Staging und zur Anreicherung mit Hinweisen auf die gesetzlichen Grundlagen und Dienststellen.
4. Nutzungplanungs-Schema: Schema mit den Nutzungsplanungsdaten im kantonalen Modell.

### Datenimport
```
gradle replaceFederalData replaceCantonalLandUsePlansData replaceCadastralSurveyingData importOerebAuszugAnnex
```
Importiert:
- die Bundes-OEREB-Daten (mittels Download der XTF)
- kantonale NPL-Daten (im kantonalen Modell). Liegen auf AWS S3.
- die amtliche Vermessung im DM01CH (mittels Download von AGI-Webseite)
- OEREB-Annex-Daten

### Umbau Nutzungsplanung kantonales Modell -> Transferstruktur
```
gradle deleteStaging insertStaging updateLegendEntrySymbols
```
Löscht zuerst die Daten aus dem Staging-Schema und führt anschliessend den Datenumbau aus. Die gesetzlichen Grundlagen wurden in einem anderen Basket/Dataset importiert und werden nicht gelöscht. Es ist nicht nur eine lange CTE, sondern es sind noch nachgelagerte Queries nötig (gesetzliche Grundlagen und zuständige Stellen). Diese Queries (UPDATES) können nicht in der CTE ausgeführt werden, da zu diesem Zeitpunkt die Daten noch nicht geschrieben sind und in eine CTE selber nicht geupdatet werden kann (nur die persistierte Tabelle).

Mit dem `updateLegendEntrySymbols` werden die Symbole für den Auszug erstelle. Nur für Grundnutzung und sehr PRE-ALPHA (**TODO:** GRETL-Task und generischer im allgemeinen).

```
gradle exportLandUsePlansToXtf
xmllint --format ch.so.arp.nutzungsplanung.oereb.xtf -o ch.so.arp.nutzungsplanung.oereb.xtf
```
Exportiert die Nutzungsplanungsdaten in die Transferstruktur (nur Nutzungsplanungs-Dataset, dh. ohne die (externen) gesetzlichen Grundlagen).

```
gradle replaceOerebNutzungsplanung 
```
Importiert die so eben exportierten Nutzungsplanungs-OEREB in die OEREB-Katasterdatenbank.


### Verschiedene OEREB-Daten einmalig herstellen 
Um gewisse Daten einmalig herzustellen oder testweise, sind verschieden GRETL-Tasks entstanden. Teilweise mit Dummydaten. Die Nachführung dieser Daten werden dann in QGIS o.ä. gemacht. 

Diese Tasks sind zwecks besserer Übersicht getrennt von den anderen Tasks. 

## Web service

### Requests

```
http://localhost:8888/oereb/getegrid/xml/?XY=2598098,1225627
http://localhost:8888/oereb/getegrid/xml/?XY=2598097,1225805 (Liegenschaft und Baurecht)
http://localhost:8888/oereb/getegrid/xml/?GNSS=7.4131,47.1819
http://localhost:8888/oereb/getegrid/xml/SO0200002546/336
http://localhost:8888/oereb/getegrid/xml/2540/Flughafenstrasse/95
http://localhost:8888/oereb/getegrid/xml/2540/Flughafenstrasse

http://localhost:8888/oereb/extract/reduced/xml/geometry/CH870672603279 (Flughafen Grenchen)
http://localhost:8888/oereb/extract/reduced/xml/CH870672603279
http://localhost:8888/oereb/extract/reduced/xml/geometry/CH933273065885 (nur Nutzungsplanung)
```

### Jaxb

```
xjc Extract.xsd -extension -b globalBindings.xjb -b gml-v_3_2_1.xjb -b iso19139-v_20070417.ignore.xjb -b xlink.xjb -Xinject-code
```

Noch ist Extract.xsd leicht angepasst, dh. "xmldsig" auskommentiert. In der Klasse generierten Klasse net.opengis.gml.v_3_2_1.GenericMetaDataType wird ebenfalls ein Fehler gemeldet: nicht mehr Java 1.8 tauglich. Das habe ich einfach auskommentiert.

Irgendwo ist/war noch der Hund begraben: Es gab keinen richtigen XML-Ouput. Ich habe jetzt einfach die Java-Jaxb-Klassen aus dem alten Projekt kopiert.



