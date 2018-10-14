# oereb-kataster

## Entwicklungsumgebung
```
vagrant up
```
Enthält PostgresSQL/PostGIS und QGIS 2.18 und QGIS Server.

## Datenbank initialisieren
```
gradle createSchemaOereb importFederalCodesets importFederalLegalBasis createSchemaOerebNutzungsplanung importFederalLegalBasisToOerebNutzungsplanung importCantonalLegalBasisToOerebNutzungsplanung importResponsibleOfficesToOerebNutzungsplanung createOerebNutzungsplanungViews createSchemaNutzungsplanung createSchemaAmtlicheVermessung
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

```
gradle replaceCadastralSurveyingData
```

Importiert die Daten der amtlichen Vermessung.

## Umbau Nutzungsplanung kantonales Modell -> Transferstruktur
```
gradle deleteStaging insertStaging
```
Löscht zuerst die Daten aus dem Staging-Schema und führt anschliessend den Datenumbau aus. Die gesetzlichen Grundlagen wurden in einem anderen Basket/Dataset importiert und werden nicht gelöscht. Es ist nicht nur eine lange CTE, sondern es sind noch nachgelagerte Queries nötig (gesetzliche Grundlagen und zuständige Stellen). Diese Queries (UPDATES) können nicht in der CTE ausgeführt werden, da zu diesem Zeitpunkt die Daten noch nicht geschrieben sind und in eine CTE selber nicht geupdatet werden kann (nur die persistierte Tabelle).

```
groovy iconizer.groovy
```
Erzeugt vom WMS die einzelnen Ikönchen und speichert diese in der passenden Legende (**TODO:** GRETL-Task und generischer im allgemeinen). Momentan werden nur die Legendeneinträge der Grundnutzung bearbeitet.

**TODO:** Was mir nicht ganz klar ist, warum jetzt ohne "dataset"-Angabe trotzdem nur die Nutzungsplanung exportiert wird? Fehlt noch was in einer t_ili2cb-Tabelle?

```
gradle exportLandUsePlansToXtf
xmllint --format ch.so.arp.nutzungsplanung.oereb.xtf -o ch.so.arp.nutzungsplanung.oereb.xtf
```
Exportiert die Nutzungsplanungsdaten in die Transferstruktur (nur Nutzungsplanungs-Dataset, dh. ohne die gesetzlichen Grundlagen).

**TODO:** 
- Wann verweist etwas auf die gesetzliche Grundlage? Wann auf PBG, wann auf KBV?
- ArtCode: 40 Zeichen gemäss Modell. Reicht nicht für unsere Aufzähltypen -> Nur die ersten vier Zeichen NXXX?
- Das mit den zuständigen Stellen ist noch tricky. Braucht es das ARP überhaupt? Für kantonale Sachen wohl schon? Workflow/Prozess auch gut überlegen. Was gehört in welches File? Ich mache es jetzt nachträglich der ersten Umbauquery mit einem Update. Kann soweit ganz gut fein granuliert werden (glaubs).
 * Wald und Verkehrsflächen zeigen auch hier manchmal ins Leere. -> für jetzt mal einfach Kantonsstellen erfassen (im XML)?
- Was ist mit Multi-Language? alles einfach "de" machen?
- Unterschied ZustaendigeStelleEigentumsbeschraenkung zu ZustaendigeStelleGeometrie
- Sprache: so wie ich es verstehe muss nur einer der vier Sprachen unterstützt werden.
- Notfalls könnte man auch noch _nachträglich_ z.B. Typen/Eigentumsbeschränkungen (inkl. Dokumente) entfernen, an diese keine Geometrie angehängt ist.
- Was sint "keine Geometrie+Darstellung nur zulässig bei Grundlage-Eigentumsbeschränkungen" Grundlage-Eigentumsbeschränkungen
- KO-Modell... Lieferungen



http://192.168.50.8/cgi-bin/qgis_mapserv.fcgi?map=/vagrant/qgis/wms/ch.so.arp.nutzungsplanung.oereb.qgs&SERVICE=WMS&REQUEST=GetCapabilities


http://192.168.50.8/cgi-bin/qgis_mapserv.fcgi?map=/vagrant/qgis/wms/ch.so.arp.nutzungsplanung.oereb.qgs&SERVICE=WMS&REQUEST=GetLegendGraphic&LAYER=ch.so.arp.nutzungsplanung.grundnutzung.oereb&FORMAT=image/png
http://192.168.50.8/cgi-bin/qgis_mapserv.fcgi?map=/vagrant/qgis/wms/ch.so.arp.nutzungsplanung.oereb.qgs&SERVICE=WMS&REQUEST=GetLegendGraphic&LAYER=ch.so.arp.nutzungsplanung.grundnutzung.oereb&FORMAT=image/png&DPI=300
http://192.168.50.8/cgi-bin/qgis_mapserv.fcgi?map=/vagrant/qgis/wms/ch.so.arp.nutzungsplanung.oereb.qgs&SERVICE=WMS&REQUEST=GetLegendGraphic&LAYER=ch.so.arp.nutzungsplanung.grundnutzung.oereb&FORMAT=image/png&RULE=&quot;artcode&quot;='N111'

http://192.168.50.8/cgi-bin/qgis_mapserv.fcgi?map=/vagrant/qgis/wms/ch.so.arp.nutzungsplanung.oereb.qgs&SERVICE=WMS&REQUEST=GetLegendGraphic&LAYER=ch.so.arp.nutzungsplanung.grundnutzung.oereb&FORMAT=image/png&RULELABEL=false&LAYERTITLE=false&RULE=Wohnzone%201%20G&HEIGHT=68&WIDTH=94&SYMBOLHEIGHT=6&SYMBOLWIDTH=8&DPI=300


http://192.168.50.8/cgi-bin/qgis_mapserv.fcgi?map=/vagrant/qgis/wms/ch.so.arp.nutzungsplanung.oereb.qgs&SERVICE=WMS&REQUEST=GetLegendGraphic&LAYER=ch.so.arp.nutzungsplanung.grundnutzung.oereb&FORMAT=image/png&RULELABEL=false&LAYERTITLE=false&RULE=Wohnzone%201%20G&HEIGHT=100&WIDTH=100


http://192.168.50.8/cgi-bin/qgis_mapserv.fcgi?map=/vagrant/qgis/wms/ch.so.arp.nutzungsplanung.oereb.qgs&SERVICE=WMS&REQUEST=GetLegendGraphic&LAYER=ch.so.arp.nutzungsplanung.grundnutzung.oereb&FORMAT=image/png&RULELABEL=false&LAYERTITLE=false&RULE=Wohnzone%201%20G&HEIGHT=68&W

http://192.168.50.8/cgi-bin/qgis_mapserv.fcgi?map=/vagrant/qgis/wms/ch.so.arp.nutzungsplanung.oereb.qgs&SERVICE=WMS&REQUEST=GetStyles&LAYERS=ch.so.arp.nutzungsplanung.grundnutzung.oereb&SLD_VERSION=1.1.0


http://192.168.50.8/cgi-bin/qgis_mapserv.fcgi?map=/vagrant/qgis/wms/ch.so.arp.nutzungsplanung.oereb.qgs&SERVICE=WMS&REQUEST=GetLegendGraphic&LAYER=ch.so.arp.nutzungsplanung.grundnutzung.oereb&FORMAT=image/png&RULELABEL=false&LAYERTITLE=false&RULE="artcode"='N110'&&HEIGHT=100&WIDTH=100

http://192.168.50.8/cgi-bin/qgis_mapserv.fcgi?map=/vagrant/qgis/wms/ch.so.arp.nutzungsplanung.oereb.qgs&SERVICE=WMS&REQUEST=GetLegendGraphic&LAYER=ch.so.arp.nutzungsplanung.grundnutzung.oereb&FORMAT=image/png&RULELABEL=false&LAYERTITLE=false&RULE=Wohnzone 1 G&HEIGHT=100&WIDTH=100



http://192.168.50.8/cgi-bin/qgis_mapserv.fcgi?map=/vagrant/qgis/wms/ch.so.arp.nutzungsplanung.oereb.qgs&SERVICE=WMS&REQUEST=GetLegendGraphic&LAYER=ch.so.arp.nutzungsplanung.grundnutzung.oereb&FORMAT=image/png&RULELABEL=false&LAYERTITLE=false&RULE=%22artcode%22%3D%27N110%27


http://192.168.50.8/cgi-bin/qgis_mapserv.fcgi?map=/vagrant/qgis/wms/ch.so.arp.nutzungsplanung.oereb.qgs&SERVICE=WMS&REQUEST=GetLegendGraphic&LAYER=ch.so.arp.nutzungsplanung.grundnutzung.oereb&FORMAT=image/png&RULELABEL=false&LAYERTITLE=false&FILTER=ch.so.arp.nutzungsplanung.grundnutzung.oereb:"artcode"='N110'



http://192.168.50.8/cgi-bin/qgis_mapserv.fcgi?map=/vagrant/qgis/wms/ch.so.arp.nutzungsplanung.oereb_q330.qgs&SERVICE=WMS&REQUEST=GetLegendGraphic&LAYER=ch.so.arp.nutzungsplanung.grundnutzung.oereb&FORMAT=image/png



http://192.168.50.8:8080/geoserver/wms?REQUEST=GetLegendGraphic&VERSION=1.0.0&FORMAT=image/png&WIDTH=20&HEIGHT=20&LAYER=ch.so.arp:ch.so.arp.nutzungsplanung.grundnutzung.oereb

http://192.168.50.8:8080/geoserver/wms?REQUEST=GetLegendGraphic&VERSION=1.0.0&FORMAT=image/png&WIDTH=20&HEIGHT=20&LAYER=ch.so.arp:ch.so.arp.nutzungsplanung.grundnutzung.oereb&CQL_FILTER=artcode%3D%27N111%27



CQL_FILTER=artcode%3D%27N111%27


http://192.168.50.8:8080/geoserver/wms?REQUEST=GetLegendGraphic&VERSION=1.0.0&FORMAT=image/png&WIDTH=20&HEIGHT=20&LAYER=ch.so.arp:ch.so.arp.nutzungsplanung.grundnutzung.oereb&CQL_FILTER=artcode=%27N111%27&LEGEND_OPTIONS=forceLabels:off&RULE=Wohnzone%201%20G


http://192.168.50.8:8080/geoserver/wms?REQUEST=GetLegendGraphic&VERSION=1.0.0&FORMAT=image/png&WIDTH=30&HEIGHT=20&LAYER=ch.so.arp:ch.so.arp.nutzungsplanung.grundnutzung.oereb&CQL_FILTER=artcode=%27N111%27&LEGEND_OPTIONS=forceLabels:off;dpi:300&RULE=Wohnzone%201%20G



BBOX=2630905.13299151%2C1241461.5663995913%2C2630905.5803633514%2C1241461.9741603842
SRS=EPSG%3A2056&WIDTH=769&HEIGHT=701