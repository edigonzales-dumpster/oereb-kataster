# oereb-kataster

## OEREB-Daten Bund
[https://data.geo.admin.ch/ch.bazl.projektierungszonen-flughafenanlagen.oereb/](https://data.geo.admin.ch/ch.bazl.projektierungszonen-flughafenanlagen.oereb/)
[https://data.geo.admin.ch/ch.bazl.kataster-belasteter-standorte-zivilflugplaetze.oereb/](https://data.geo.admin.ch/ch.bazl.kataster-belasteter-standorte-zivilflugplaetze.oereb/)
[https://data.geo.admin.ch/ch.bav.kataster-belasteter-standorte-oev.oereb/](https://data.geo.admin.ch/ch.bav.kataster-belasteter-standorte-oev.oereb/)
[https://data.geo.admin.ch/ch.bazl.sicherheitszonenplan.oereb/](https://data.geo.admin.ch/ch.bazl.sicherheitszonenplan.oereb/)


## Datenbank

### Init Schema

TBD: 
- Umgang mit Constraints? Wenn z.B. Gesetzliche Grundlagen ausgetauscht werden müssen.

### Import Codelisten, Gesetzliche Grundlagen und Daten (Bund)
```
java -jar ~/Apps/ili2pg-3.12.2/ili2pg-3.12.2.jar --dbhost 192.168.50.8 --dbdatabase oereb --dbusr ddluser --dbpwd ddluser --nameByTopic --disableValidation --defaultSrsCode 2056 --strokeArcs --sqlEnableNull --createGeomIdx  --createFkIdx --createEnumTabs --beautifyEnumDispName --createBasketCol --createDatasetCol --models OeREBKRM_V1_1 --dbschema agi_oereb --dataset ch.swisstopo.code_set --import OeREBKRM_V1_1_Codelisten_20170101.xml
```

```
java -jar ~/Apps/ili2pg-3.12.2/ili2pg-3.12.2.jar --dbhost 192.168.50.8 --dbdatabase oereb --dbusr ddluser --dbpwd ddluser --nameByTopic --disableValidation --defaultSrsCode 2056 --strokeArcs --sqlEnableNull --createGeomIdx  --createFkIdx --createEnumTabs --beautifyEnumDispName --createBasketCol --createDatasetCol --models OeREBKRMvs_V1_1 --dbschema agi_oereb --dataset ch.swisstopo.legal_basis --import OeREBKRM_V1_1_Gesetze_20180501.xml
```

```
java -jar ~/Apps/ili2pg-3.12.2/ili2pg-3.12.2.jar --dbhost 192.168.50.8 --dbdatabase oereb --dbusr ddluser --dbpwd ddluser --nameByTopic --disableValidation --defaultSrsCode 2056 --strokeArcs --sqlEnableNull --createGeomIdx  --createFkIdx --createEnumTabs --beautifyEnumDispName --createBasketCol --createDatasetCol --models OeREBKRMtrsfr_V1_1 --dbschema agi_oereb --dataset ch.bav.kataster-belasteter-standorte-oev --import ch.bav.kataster-belasteter-standorte-oev.oereb_20181001.xtf
```

```
java -jar ~/Apps/ili2pg-3.12.2/ili2pg-3.12.2.jar --dbhost 192.168.50.8 --dbdatabase oereb --dbusr ddluser --dbpwd ddluser --nameByTopic --disableValidation --defaultSrsCode 2056 --strokeArcs --sqlEnableNull --createGeomIdx  --createFkIdx --createEnumTabs --beautifyEnumDispName --createBasketCol --createDatasetCol --models OeREBKRMtrsfr_V1_1 --dbschema agi_oereb --dataset ch.bazl.kataster-belasteter-standorte-zivilflugplaetze --import ch.bazl.kataster-belasteter-standorte-zivilflugplaetze.oereb_20181002.xtf
```

```
java -jar ~/Apps/ili2pg-3.12.2/ili2pg-3.12.2.jar --dbhost 192.168.50.8 --dbdatabase oereb --dbusr ddluser --dbpwd ddluser --nameByTopic --disableValidation --defaultSrsCode 2056 --strokeArcs --sqlEnableNull --createGeomIdx  --createFkIdx --createEnumTabs --beautifyEnumDispName --createBasketCol --createDatasetCol --models OeREBKRMtrsfr_V1_1 --dbschema agi_oereb --dataset ch.bazl.projektierungszonen-flughafenanlagen --import ch.bazl.projektierungszonen-flughafenanlagen.oereb_20161128.xtf
```

```
java -jar ~/Apps/ili2pg-3.12.2/ili2pg-3.12.2.jar --dbhost 192.168.50.8 --dbdatabase oereb --dbusr ddluser --dbpwd ddluser --nameByTopic --disableValidation --defaultSrsCode 2056 --strokeArcs --sqlEnableNull --createGeomIdx  --createFkIdx --createEnumTabs --beautifyEnumDispName --createBasketCol --createDatasetCol --models OeREBKRMtrsfr_V1_1 --dbschema agi_oereb --dataset ch.bazl.sicherheitszonenplan --import ch.bazl.sicherheitszonenplan.oereb_20180903.xtf
```

### Datenumbau NPLSO -> Transferstruktur

```
java -jar ~/Apps/ili2pg-3.12.2/ili2pg-3.12.2.jar --dbhost 192.168.50.8 --dbdatabase oereb --dbusr ddluser --dbpwd ddluser --nameByTopic --disableValidation --defaultSrsCode 2056 --strokeArcs --sqlEnableNull --createGeomIdx  --createFkIdx --createEnumTabs --beautifyEnumDispName --models OeREBKRMtrsfr_V1_1 --dbschema agi_oereb_npl --schemaimport
```

```
java -jar ~/Apps/ili2pg-3.12.2/ili2pg-3.12.2.jar --dbhost 192.168.50.8 --dbdatabase oereb --dbusr ddluser --dbpwd ddluser --nameByTopic --disableValidation --defaultSrsCode 2056 --strokeArcs --sqlEnableNull --createGeomIdx  --createFkIdx --createEnumTabs --beautifyEnumDispName --models SO_Nutzungsplanung_20171118 --dbschema arp_npl --schemaimport
```

```
java -jar ~/Apps/ili2pg-3.12.2/ili2pg-3.12.2.jar --dbhost 192.168.50.8 --dbdatabase oereb --dbusr ddluser --dbpwd ddluser --nameByTopic --disableValidation --defaultSrsCode 2056 --strokeArcs --sqlEnableNull --createGeomIdx  --createFkIdx --createEnumTabs --beautifyEnumDispName --models SO_Nutzungsplanung_20171118 --dbschema arp_npl --import data/ch.so.arp/2580_2018-02-13.xtf
```

Gretl:



Export:
```
java -jar ~/Apps/ili2pg-3.12.2/ili2pg-3.12.2.jar --dbhost 192.168.50.8 --dbdatabase oereb --dbusr ddluser --dbpwd ddluser --nameByTopic --disableValidation --defaultSrsCode 2056 --models OeREBKRMtrsfr_V1_1 --dbschema agi_oereb_npl --export ch.so.arp.nutzungsplanung.oereb.xtf
```

xmllint --format ch.so.arp.nutzungsplanung.oereb.xtf -o ch.so.arp.nutzungsplanung.oereb.xtf