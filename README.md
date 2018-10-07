# oereb-kataster

## Entwicklungsumgebung
```
vagrant up
```
Enthält PostgresSQL/PostGIS und QGIS 3.

## Datenbank initialisieren
```
gradle createSchemaOereb importFederalCodesets importFederalLegalBasis createSchemaOerebNutzungsplanung importFederalLegalBasisToOerebNutzungsplanung importCantonalLegalBasisToOerebNutzungsplanung createSchemaNutzungsplanung
```
Erstellt drei Schemas:

1. OEREB-Schema in Transferstruktur. Alle Bundesdaten und kantonalen Daten werden in der modelläquivalenten Transferstrukturform in diesem Schema gespeichert. Der OEREB-Service greift auf dieses Schema zu ("Cookie Cutter").
2. OEREB-Nutzungsplanungsschema: Schema für die kantonale Nutzungsplanung in der Transferstruktur. Dient als Staging und eventuell zur Anreicherung mit Hinweisen auf die gesetzlichen Grundlagen.
3. Nutzungplanungs-Schema: Schema mit den Nutzungsplanungsdaten im kantonalen Modell.

## Datenimport
```
gradle replaceFederalData
```
Importiert die Bundes-OEREB-Daten (mittels Download der XTF).

```
gradle replaceCantonalLandUsePlansData
```
Importiert die Nutzungsplanungsdaten im kantonalen Modell (liegen auf AWS S3).

## Umbau Nutzungsplanung kantonales Modell -> Transferstruktur
```
gradle deleteStaging deleteStaging
```
Löscht zuerst die Daten aus dem Staging-Schema und führt anschliessend den Datenumbau aus. Die gesetzlichen Grundlagen wurde in einem anderen Basket/Dataset importiert und werden nicht gelöscht. 

**TODO:** Was mir nicht ganz klar ist, warum jetzt ohne "dataset"-Angabe trotzdem nur die Nutzungsplanung exportiert wird? Fehlt noch was in einer t_ili2cb-Tabelle?

```
gradle exportLandUsePlansToXtf
xmllint --format ch.so.arp.nutzungsplanung.oereb.xtf -o ch.so.arp.nutzungsplanung.oereb.xtf
```
Exportiert die Nutzungsplanungsdaten in die Transferstruktur (nur Nutzungsplanungs-Dataset, dh. ohne die gesetzlichen Grundlagen).

**TODO:** 
- Wann verweist etwas auf die gesetzliche Grundlage? Wann auf PBG, wann auf KBV?
- Symbole? GeoScript-Groovy und SLD?