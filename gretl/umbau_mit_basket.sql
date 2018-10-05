DELETE FROM agi_oereb_npl.transferstruktur_geometrie WHERE t_datasetname = 'ch.so.arp.nutzungsplanung';  
DELETE FROM agi_oereb_npl.transferstruktur_hinweisvorschrift WHERE t_datasetname = 'ch.so.arp.nutzungsplanung';
DELETE FROM agi_oereb_npl.transferstruktur_darstellungsdienst WHERE t_datasetname = 'ch.so.arp.nutzungsplanung'; 
DELETE FROM agi_oereb_npl.transferstruktur_eigentumsbeschraenkung WHERE t_datasetname = 'ch.so.arp.nutzungsplanung';
DELETE FROM agi_oereb_npl.vorschriften_hinweisweiteredokumente WHERE t_datasetname = 'ch.so.arp.nutzungsplanung';
DELETE FROM agi_oereb_npl.localiseduri WHERE t_datasetname = 'ch.so.arp.nutzungsplanung';
DELETE FROM agi_oereb_npl.multilingualuri WHERE t_datasetname = 'ch.so.arp.nutzungsplanung';
DELETE FROM agi_oereb_npl.vorschriften_dokument WHERE t_datasetname = 'ch.so.arp.nutzungsplanung';
DELETE FROM agi_oereb_npl.vorschriften_amt WHERE t_datasetname = 'ch.so.arp.nutzungsplanung';
DELETE FROM agi_oereb_npl.t_ili2db_basket WHERE topic = 'OeREBKRMtrsfr_V1_1.Transferstruktur';
DELETE FROM agi_oereb_npl.t_ili2db_dataset WHERE datasetname = 'ch.so.arp.nutzungplanung';

WITH dataset_nutzungplanung AS 
(
  INSERT INTO agi_oereb_npl.t_ili2db_dataset (
    t_id, 
    datasetname
  )
  VALUES
  (
    nextval('agi_oereb_npl.t_ili2db_seq'::regclass),
    'ch.so.arp.nutzungplanung'
  )
  RETURNING *
)
,
basket_nutzungsplanung AS 
(
  INSERT INTO agi_oereb_npl.t_ili2db_basket (
    t_id,
    dataset,
    topic,
    attachmentkey
  )
  SELECT
    nextval('agi_oereb_npl.t_ili2db_seq'::regclass) AS t_id,
    dataset_nutzungplanung.t_id AS dataset,
    'OeREBKRMtrsfr_V1_1.Transferstruktur' AS topic,
    'sql'
  FROM
    dataset_nutzungplanung 
  RETURNING *
)
,
vorschriften_amt AS 
(
  INSERT INTO agi_oereb_npl.vorschriften_amt (
    t_basket,
    t_datasetname,
    t_ili_tid, 
    aname_de, 
    amtimweb
  )
  SELECT
    basket_nutzungsplanung.t_id AS t_basket,
    dataset_nutzungplanung.datasetname AS t_datasetname,
    uuid_generate_v4() AS t_ili_tid,
    'Amt für Raumplanung' AS aname_de,
    'http://arp.so.ch' AS amtimweb
  FROM
    basket_nutzungsplanung,
    dataset_nutzungplanung
  RETURNING *
)
,
vorschrift_dokument AS 
(
  SELECT
    nextval('agi_oereb_npl.t_ili2db_seq'::regclass) AS t_id,
    basket_nutzungsplanung.t_id AS t_basket,
    dataset_nutzungplanung.datasetname AS t_datasetname,
    rechtsvorschrften_dokument.t_id AS rechtsvorschrften_dokument_t_id,
    --uuid_generate_v4() AS t_ili_tid,
    rechtsvorschrften_dokument.t_ili_tid,
    CASE
      WHEN rechtsvorschrift IS TRUE
          THEN 'vorschriften_rechtsvorschrift'
      ELSE 'vorschriften_dokument'
    END AS t_type,
    titel AS titel_de,
    offiziellertitel AS offiziellertitel_de,
    abkuerzung AS abkuerzung_de,
    kanton,
    gemeinde,
    publiziertab,
    rechtsstatus,
    'https://geo.so.ch/docs/ch.so.arp.zonenplaene/Zonenplaene_pdf/' || textimweb AS textimweb,
    vorschriften_amt.t_id AS zustaendigestelle
  FROM
    arp_npl.rechtsvorschrften_dokument AS rechtsvorschrften_dokument,
    vorschriften_amt,
    basket_nutzungsplanung,
    dataset_nutzungplanung
)
,
vorschrift_dokument_insert AS 
(
  INSERT INTO agi_oereb_npl.vorschriften_dokument (
    t_id,
    t_basket,
    t_datasetname,
    t_ili_tid,
    t_type,
    titel_de,
    offiziellertitel_de,
    abkuerzung_de,
    kanton,
    gemeinde,
    publiziertab,
    rechtsstatus,
    zustaendigestelle
  )
  SELECT
    t_id,
    t_basket,
    t_datasetname,
    t_ili_tid,
    t_type,
    titel_de,
    offiziellertitel_de,
    abkuerzung_de,
    kanton,
    gemeinde,
    publiziertab,
    rechtsstatus,
    zustaendigestelle
  FROM
    vorschrift_dokument
  RETURNING *
)
SELECT
  *
FROM
  vorschrift_dokument
,
multilingualuri_localiseduri AS (
  SELECT
    nextval('agi_oereb_npl.t_ili2db_seq'::regclass) AS t_id, -- multilingualuri t_id.
    t_id AS vorschrift_dokument_t_id,
    textimweb AS atext,
    'de' AS alanguage
  FROM
    vorschrift_dokument
)
,
multilingualuri_insert AS (
  INSERT INTO agi_oereb_npl.multilingualuri 
    (
      t_id,
      t_seq,
      vorschriften_dokument_textimweb
    )
    SELECT
      t_id,
      0 AS t_seq,
      vorschrift_dokument_t_id
    FROM
      multilingualuri_localiseduri  
    RETURNING *
)
,
localiseduri_insert AS (
  INSERT INTO agi_oereb_npl.localiseduri
  (
    alanguage,
    atext,
    multilingualuri_localisedtext
  )
  SELECT 
    alanguage,
    atext,
    t_id
  FROM
    multilingualuri_localiseduri
  RETURNING *
)
,
vorschriften_hinweisweiteredokumente_insert AS 
(
  INSERT INTO agi_oereb_npl.vorschriften_hinweisweiteredokumente
    (
      ursprung,
      hinweis
    )
  SELECT
    u.ursprung,
    d.t_id AS hinweis
  FROM 
  (
    SELECT
      d.t_id AS ursprung,
      hwd.hinweis
    FROM 
      vorschrift_dokument AS d 
      LEFT JOIN arp_npl.rechtsvorschrften_hinweisweiteredokumente AS hwd
      ON d.rechtsvorschrften_dokument_t_id = hwd.ursprung
    WHERE
      hwd.ursprung IS NOT NULL
  ) AS u
  LEFT JOIN vorschrift_dokument AS d 
  ON d.rechtsvorschrften_dokument_t_id = u.hinweis
  RETURNING *
)
,
transferstruktur_darstellungsdienst AS (
  INSERT INTO agi_oereb_npl.transferstruktur_darstellungsdienst (
    verweiswms
  )
  VALUES (
    'https://geo.so.ch/ows/somap/hier/kommt/noch/was'
  )
  RETURNING *
)
,
eigentumsbeschraenkung_grundnutzung AS 
(
  SELECT
    DISTINCT ON (typ_grundnutzung.t_ili_tid)
    nextval('agi_oereb_npl.t_ili2db_seq'::regclass) AS t_id,
    typ_grundnutzung.t_id AS typ_grundnutzung_t_id,
    typ_grundnutzung.t_ili_tid,
    typ_grundnutzung.bezeichnung AS aussage_de,
    'Nutzungsplanung' AS thema,
    'Grundnutzung_Zonenflaeche' AS subthema,
    substring(typ_grundnutzung.typ_kt FROM 1 FOR 4) AS artcode,
    'urn:fdc:ilismeta.interlis.ch:2017:NP_Typ_Kanton_Grundnutzung' AS artcodeliste,
    typ_grundnutzung_dokument.dokument,
    /*
     * 1) Woher kommt dieses Attribut in der Tabelle 'Eigentumsbeschraenkung'?
     *    Im MGDM Nutzungsplanung gibt es das beim Typ auch nicht?
     * 2) Jetzt nehme ich es aus der Geometrie. dies hat zur Folge, dass bei
     *    Typen ohne Geometrie natürlich NULL herauskommt. Was wiederum 
     *    Probleme verursacht weil die Typen mit Dokumenten verknüpft sind
     *    und ich nicht einfach die Typen nicht einfach wegfiltern kann, weil
     *    sonst 'hinweisvorschrift (n:m)' eventuell ins Leere zeigt.
     *  Variante: Alles was ins Leere (NULL) zeigt, wegfiltern.
     */
    CASE 
      WHEN grundnutzung.rechtsstatus IS NULL THEN 'inKraft'
      ELSE grundnutzung.rechtsstatus
    END AS rechtsstatus,
    grundnutzung.publiziertab
  FROM
    arp_npl.nutzungsplanung_typ_grundnutzung AS typ_grundnutzung
    LEFT JOIN arp_npl.nutzungsplanung_typ_grundnutzung_dokument AS typ_grundnutzung_dokument
    ON typ_grundnutzung.t_id = typ_grundnutzung_dokument.typ_grundnutzung
    LEFT JOIN arp_npl.nutzungsplanung_grundnutzung AS grundnutzung
    ON grundnutzung.typ_grundnutzung = typ_grundnutzung.t_id
    -- Bei der Grundnutzung ist das auf den ersten Blick unlogisch,
    -- wenn Wald und Verkehrsflächen fehlen (die "orientierend" sind).
  --WHERE
    --typ_grundnutzung.verbindlichkeit = 'Nutzungsplanfestlegung'
    WHERE
      grundnutzung.rechtsstatus IS NOT NULL -- Typen ohne Geometrie (-> Folgeprobleme bei 'transferstruktur_hinweisvorschrift_grundnutzung')
)
,
eigentumsbeschraenkung_grundnutzung_insert AS 
(
  INSERT INTO agi_oereb_npl.transferstruktur_eigentumsbeschraenkung (
    t_id,
    aussage_de,
    thema,
    subthema,
    artcode,
    artcodeliste,
    rechtsstatus,
    publiziertab,
    darstellungsdienst,
    zustaendigestelle
  )
  SELECT
    eigentumsbeschraenkung_grundnutzung.t_id,
    aussage_de,
    thema,
    subthema,
    artcode,
    artcodeliste,
    rechtsstatus,
    publiziertab,
    transferstruktur_darstellungsdienst.t_id AS verweiswms,
    vorschriften_amt.t_id AS zustaendigestelle
  FROM
    eigentumsbeschraenkung_grundnutzung,
    vorschriften_amt,
    transferstruktur_darstellungsdienst
  RETURNING * 
)
,
transferstruktur_hinweisvorschrift_grundnutzung AS (
  INSERT INTO agi_oereb_npl.transferstruktur_hinweisvorschrift (
    eigentumsbeschraenkung,
    vorschrift_vorschriften_dokument
  )
  SELECT
    eigentumsbeschraenkung_grundnutzung.t_id AS eigentumsbeschraenkung,
    vorschrift_dokument.t_id AS vorschrift_vorschriften_dokument
  FROM
    arp_npl.nutzungsplanung_typ_grundnutzung_dokument AS typ_grundnutzung_dokument
    LEFT JOIN eigentumsbeschraenkung_grundnutzung
    ON eigentumsbeschraenkung_grundnutzung.typ_grundnutzung_t_id = typ_grundnutzung_dokument.typ_grundnutzung
    LEFT JOIN vorschrift_dokument
    ON vorschrift_dokument.rechtsvorschrften_dokument_t_id = typ_grundnutzung_dokument.dokument
  WHERE
    eigentumsbeschraenkung_grundnutzung.t_id IS NOT NULL -- siehe Bemerkungen bei 'eigentumsbeschraenkung_grundnutzung' 
  RETURNING *
)
,
transferstruktur_geometrie_grundnutzung AS (
  SELECT
    nextval('agi_oereb_npl.t_ili2db_seq'::regclass) AS t_id,
    nutzungsplanung_grundnutzung.t_id AS nutzungsplanung_grundnutzung_t_id,
    nutzungsplanung_grundnutzung.rechtsstatus,
    nutzungsplanung_grundnutzung.publiziertab,
    eigentumsbeschraenkung_grundnutzung.t_id AS eigentumsbeschraenkung,
    vorschriften_amt.t_id AS zustaendigestelle,
    nutzungsplanung_grundnutzung.geometrie AS flaeche_lv95
  FROM
    arp_npl.nutzungsplanung_grundnutzung AS nutzungsplanung_grundnutzung
    LEFT JOIN eigentumsbeschraenkung_grundnutzung
    ON nutzungsplanung_grundnutzung.typ_grundnutzung = eigentumsbeschraenkung_grundnutzung.typ_grundnutzung_t_id
    LEFT JOIN vorschriften_amt
    ON 1=1
)
,
transferstruktur_geometrie_grundnutzung_insert AS (
  INSERT INTO agi_oereb_npl.transferstruktur_geometrie (
    t_id,
    rechtsstatus,
    publiziertab,
    eigentumsbeschraenkung,
    zustaendigestelle,
    flaeche_lv95
  )
  SELECT
    t_id,
    rechtsstatus,
    publiziertab,
    eigentumsbeschraenkung,
    zustaendigestelle,
    flaeche_lv95
  FROM
    transferstruktur_geometrie_grundnutzung
  RETURNING *
)
,
eigentumsbeschraenkung_ueberlagernd_flaeche AS 
(
  SELECT
    DISTINCT ON (typ_ueberlagernd_flaeche.t_ili_tid)
    nextval('agi_oereb_npl.t_ili2db_seq'::regclass) AS t_id,
    typ_ueberlagernd_flaeche.t_id AS typ_ueberlagernd_flaeche_t_id,
    typ_ueberlagernd_flaeche.t_ili_tid,
    typ_ueberlagernd_flaeche.bezeichnung AS aussage_de,
    'Nutzungsplanung' AS thema,
    'Ueberlagernde_Festlegung' AS subthema, -- Wording by MGDM Nutzungsplanung
    substring(typ_ueberlagernd_flaeche.typ_kt FROM 1 FOR 4) AS artcode,
    'urn:fdc:ilismeta.interlis.ch:2017:NP_Typ_Kanton_Ueberlagernd_Flaeche' AS artcodeliste,
    typ_ueberlagernd_flaeche_dokument.dokument,
    ueberlagernd_flaeche.rechtsstatus,
    ueberlagernd_flaeche.publiziertab
  FROM
    arp_npl.nutzungsplanung_typ_ueberlagernd_flaeche AS typ_ueberlagernd_flaeche
    LEFT JOIN arp_npl.nutzungsplanung_typ_ueberlagernd_flaeche_dokument AS typ_ueberlagernd_flaeche_dokument
    ON typ_ueberlagernd_flaeche.t_id = typ_ueberlagernd_flaeche_dokument.typ_ueberlagernd_flaeche
    LEFT JOIN arp_npl.nutzungsplanung_ueberlagernd_flaeche AS ueberlagernd_flaeche
    ON ueberlagernd_flaeche.typ_ueberlagernd_flaeche = typ_ueberlagernd_flaeche.t_id
  WHERE
    ueberlagernd_flaeche.rechtsstatus IS NOT NULL -- Typen ohne Geometrie
  AND
    typ_ueberlagernd_flaeche_dokument.dokument IS NOT NULL
  AND 
    typ_ueberlagernd_flaeche.typ_kt NOT IN ('N593_Grundwasserschutzzone_S1', 'N594_Grundwasserschutzzone_S2', 'N595_Grundwasserschutzzone_S3', 'N596_Grundwasserschutzareal')
)
,
eigentumsbeschraenkung_ueberlagernd_flaeche_insert AS
(
  INSERT INTO agi_oereb_npl.transferstruktur_eigentumsbeschraenkung (
    t_id,
    aussage_de,
    thema,
    subthema,
    artcode,
    artcodeliste,
    rechtsstatus,
    publiziertab,
    darstellungsdienst,
    zustaendigestelle
  )
  SELECT
    eigentumsbeschraenkung_ueberlagernd_flaeche.t_id,
    aussage_de,
    thema,
    subthema,
    artcode,
    artcodeliste,
    rechtsstatus,
    publiziertab,
    transferstruktur_darstellungsdienst.t_id AS verweiswms,
    vorschriften_amt.t_id AS zustaendigestelle
  FROM
    eigentumsbeschraenkung_ueberlagernd_flaeche,
    vorschriften_amt,
    transferstruktur_darstellungsdienst
  RETURNING * 
)
,
transferstruktur_hinweisvorschrift_ueberlagernd_flaeche AS (
  INSERT INTO agi_oereb_npl.transferstruktur_hinweisvorschrift (
    eigentumsbeschraenkung,
    vorschrift_vorschriften_dokument
  )
  SELECT
    eigentumsbeschraenkung_ueberlagernd_flaeche.t_id AS eigentumsbeschraenkung,
    vorschrift_dokument.t_id AS vorschrift_vorschriften_dokument
  FROM
    arp_npl.nutzungsplanung_typ_ueberlagernd_flaeche_dokument AS typ_ueberlagernd_flaeche_dokument
    LEFT JOIN eigentumsbeschraenkung_ueberlagernd_flaeche
    ON eigentumsbeschraenkung_ueberlagernd_flaeche.typ_ueberlagernd_flaeche_t_id = typ_ueberlagernd_flaeche_dokument.typ_ueberlagernd_flaeche
    LEFT JOIN vorschrift_dokument
    ON vorschrift_dokument.rechtsvorschrften_dokument_t_id = typ_ueberlagernd_flaeche_dokument.dokument
  WHERE
    eigentumsbeschraenkung_ueberlagernd_flaeche.t_id IS NOT NULL -- siehe Bemerkungen bei 'eigentumsbeschraenkung_grundnutzung' 
  RETURNING *
)
,
transferstruktur_geometrie_ueberlagernd_flaeche AS (
  SELECT
    nextval('agi_oereb_npl.t_ili2db_seq'::regclass) AS t_id,
    nutzungsplanung_ueberlagernd_flaeche.t_id AS nutzungsplanung_ueberlagernd_flaeche_t_id,
    nutzungsplanung_ueberlagernd_flaeche.rechtsstatus,
    nutzungsplanung_ueberlagernd_flaeche.publiziertab,
    eigentumsbeschraenkung_ueberlagernd_flaeche.t_id AS eigentumsbeschraenkung,
    vorschriften_amt.t_id AS zustaendigestelle,
    nutzungsplanung_ueberlagernd_flaeche.geometrie AS flaeche_lv95
  FROM
    arp_npl.nutzungsplanung_ueberlagernd_flaeche AS nutzungsplanung_ueberlagernd_flaeche
    INNER JOIN eigentumsbeschraenkung_ueberlagernd_flaeche
    ON nutzungsplanung_ueberlagernd_flaeche.typ_ueberlagernd_flaeche = eigentumsbeschraenkung_ueberlagernd_flaeche.typ_ueberlagernd_flaeche_t_id
    LEFT JOIN vorschriften_amt
    ON 1=1
)
,
transferstruktur_geometrie_ueberlagernd_flaeche_insert AS (
  INSERT INTO agi_oereb_npl.transferstruktur_geometrie (
    t_id,
    rechtsstatus,
    publiziertab,
    eigentumsbeschraenkung,
    zustaendigestelle,
    flaeche_lv95
  )
  SELECT
    t_id,
    rechtsstatus,
    publiziertab,
    eigentumsbeschraenkung,
    zustaendigestelle,
    flaeche_lv95
  FROM
    transferstruktur_geometrie_ueberlagernd_flaeche
  RETURNING *
)
,
eigentumsbeschraenkung_ueberlagernd_linie AS 
(
  SELECT
    DISTINCT ON (typ_ueberlagernd_linie.t_ili_tid)
    nextval('agi_oereb_npl.t_ili2db_seq'::regclass) AS t_id,
    typ_ueberlagernd_linie.t_id AS typ_ueberlagernd_linie_t_id,
    typ_ueberlagernd_linie.t_ili_tid,
    typ_ueberlagernd_linie.bezeichnung AS aussage_de,
    'Nutzungsplanung' AS thema,
    'Linienbezogene_Festlegung' AS subthema, -- Wording by MGDM Nutzungsplanung
    substring(typ_ueberlagernd_linie.typ_kt FROM 1 FOR 4) AS artcode,
    'urn:fdc:ilismeta.interlis.ch:2017:NP_Typ_Kanton_Ueberlagernd_Flaeche' AS artcodeliste,
    typ_ueberlagernd_linie_dokument.dokument,
    ueberlagernd_linie.rechtsstatus,
    ueberlagernd_linie.publiziertab
  FROM
    arp_npl.nutzungsplanung_typ_ueberlagernd_linie AS typ_ueberlagernd_linie
    LEFT JOIN arp_npl.nutzungsplanung_typ_ueberlagernd_linie_dokument AS typ_ueberlagernd_linie_dokument
    ON typ_ueberlagernd_linie.t_id = typ_ueberlagernd_linie_dokument.typ_ueberlagernd_linie
    LEFT JOIN arp_npl.nutzungsplanung_ueberlagernd_linie AS ueberlagernd_linie
    ON ueberlagernd_linie.typ_ueberlagernd_linie = typ_ueberlagernd_linie.t_id
  WHERE
    ueberlagernd_linie.rechtsstatus IS NOT NULL -- Typen ohne Geometrie
  AND
    typ_ueberlagernd_linie_dokument.dokument IS NOT NULL
)
,
eigentumsbeschraenkung_ueberlagernd_linie_insert AS
(
  INSERT INTO agi_oereb_npl.transferstruktur_eigentumsbeschraenkung (
    t_id,
    aussage_de,
    thema,
    subthema,
    artcode,
    artcodeliste,
    rechtsstatus,
    publiziertab,
    darstellungsdienst,
    zustaendigestelle
  )
  SELECT
    eigentumsbeschraenkung_ueberlagernd_linie.t_id,
    aussage_de,
    thema,
    subthema,
    artcode,
    artcodeliste,
    rechtsstatus,
    publiziertab,
    transferstruktur_darstellungsdienst.t_id AS verweiswms,
    vorschriften_amt.t_id AS zustaendigestelle
  FROM
    eigentumsbeschraenkung_ueberlagernd_linie,
    vorschriften_amt,
    transferstruktur_darstellungsdienst
  RETURNING * 
)
,
transferstruktur_hinweisvorschrift_ueberlagernd_linie AS (
  INSERT INTO agi_oereb_npl.transferstruktur_hinweisvorschrift (
    eigentumsbeschraenkung,
    vorschrift_vorschriften_dokument
  )
  SELECT
    eigentumsbeschraenkung_ueberlagernd_linie.t_id AS eigentumsbeschraenkung,
    vorschrift_dokument.t_id AS vorschrift_vorschriften_dokument
  FROM
    arp_npl.nutzungsplanung_typ_ueberlagernd_linie_dokument AS typ_ueberlagernd_linie_dokument
    LEFT JOIN eigentumsbeschraenkung_ueberlagernd_linie
    ON eigentumsbeschraenkung_ueberlagernd_linie.typ_ueberlagernd_linie_t_id = typ_ueberlagernd_linie_dokument.typ_ueberlagernd_linie
    LEFT JOIN vorschrift_dokument
    ON vorschrift_dokument.rechtsvorschrften_dokument_t_id = typ_ueberlagernd_linie_dokument.dokument
  WHERE 
    eigentumsbeschraenkung_ueberlagernd_linie.t_id IS NOT NULL -- siehe Kommentar 'eigentumsbeschraenkung_grundnutzung'
  RETURNING *
)
,
transferstruktur_geometrie_ueberlagernd_linie AS (
  SELECT
    nextval('agi_oereb_npl.t_ili2db_seq'::regclass) AS t_id,
    nutzungsplanung_ueberlagernd_linie.t_id AS nutzungsplanung_ueberlagernd_linie_t_id,
    nutzungsplanung_ueberlagernd_linie.rechtsstatus,
    nutzungsplanung_ueberlagernd_linie.publiziertab,
    eigentumsbeschraenkung_ueberlagernd_linie.t_id AS eigentumsbeschraenkung,
    vorschriften_amt.t_id AS zustaendigestelle,
    nutzungsplanung_ueberlagernd_linie.geometrie AS linie_lv95
  FROM
    arp_npl.nutzungsplanung_ueberlagernd_linie AS nutzungsplanung_ueberlagernd_linie
    INNER JOIN eigentumsbeschraenkung_ueberlagernd_linie
    ON nutzungsplanung_ueberlagernd_linie.typ_ueberlagernd_linie = eigentumsbeschraenkung_ueberlagernd_linie.typ_ueberlagernd_linie_t_id
    LEFT JOIN vorschriften_amt
    ON 1=1
)
,
transferstruktur_geometrie_ueberlagernd_linie_insert AS (
  INSERT INTO agi_oereb_npl.transferstruktur_geometrie (
    t_id,
    rechtsstatus,
    publiziertab,
    eigentumsbeschraenkung,
    zustaendigestelle,
    linie_lv95
  )
  SELECT
    t_id,
    rechtsstatus,
    publiziertab,
    eigentumsbeschraenkung,
    zustaendigestelle,
    linie_lv95
  FROM
    transferstruktur_geometrie_ueberlagernd_linie
  RETURNING *
)
,
eigentumsbeschraenkung_ueberlagernd_punkt AS 
(
  SELECT
    DISTINCT ON (typ_ueberlagernd_punkt.t_ili_tid)
    nextval('agi_oereb_npl.t_ili2db_seq'::regclass) AS t_id,
    typ_ueberlagernd_punkt.t_id AS typ_ueberlagernd_punkt_t_id,
    typ_ueberlagernd_punkt.t_ili_tid,
    typ_ueberlagernd_punkt.bezeichnung AS aussage_de,
    'Nutzungsplanung' AS thema,
    'Objektbezogene_Festlegung' AS subthema, -- Wording by MGDM Nutzungsplanung
    substring(typ_ueberlagernd_punkt.typ_kt FROM 1 FOR 4) AS artcode,
    'urn:fdc:ilismeta.interlis.ch:2017:NP_Typ_Kanton_Ueberlagernd_Flaeche' AS artcodeliste,
    typ_ueberlagernd_punkt_dokument.dokument,
    ueberlagernd_punkt.rechtsstatus,
    ueberlagernd_punkt.publiziertab
  FROM
    arp_npl.nutzungsplanung_typ_ueberlagernd_punkt AS typ_ueberlagernd_punkt
    LEFT JOIN arp_npl.nutzungsplanung_typ_ueberlagernd_punkt_dokument AS typ_ueberlagernd_punkt_dokument
    ON typ_ueberlagernd_punkt.t_id = typ_ueberlagernd_punkt_dokument.typ_ueberlagernd_punkt
    LEFT JOIN arp_npl.nutzungsplanung_ueberlagernd_punkt AS ueberlagernd_punkt
    ON ueberlagernd_punkt.typ_ueberlagernd_punkt = typ_ueberlagernd_punkt.t_id
  WHERE
    ueberlagernd_punkt.rechtsstatus IS NOT NULL -- Typen ohne Geometrie
  AND
    typ_ueberlagernd_punkt_dokument.dokument IS NOT NULL
)
,
eigentumsbeschraenkung_ueberlagernd_punkt_insert AS
(
  INSERT INTO agi_oereb_npl.transferstruktur_eigentumsbeschraenkung (
    t_id,
    aussage_de,
    thema,
    subthema,
    artcode,
    artcodeliste,
    rechtsstatus,
    publiziertab,
    darstellungsdienst,
    zustaendigestelle
  )
  SELECT
    eigentumsbeschraenkung_ueberlagernd_punkt.t_id,
    aussage_de,
    thema,
    subthema,
    artcode,
    artcodeliste,
    rechtsstatus,
    publiziertab,
    transferstruktur_darstellungsdienst.t_id AS verweiswms,
    vorschriften_amt.t_id AS zustaendigestelle
  FROM
    eigentumsbeschraenkung_ueberlagernd_punkt,
    vorschriften_amt,
    transferstruktur_darstellungsdienst
  RETURNING * 
)
,
transferstruktur_hinweisvorschrift_ueberlagernd_punkt AS (
  INSERT INTO agi_oereb_npl.transferstruktur_hinweisvorschrift (
    eigentumsbeschraenkung,
    vorschrift_vorschriften_dokument
  )
  SELECT
    eigentumsbeschraenkung_ueberlagernd_punkt.t_id AS eigentumsbeschraenkung,
    vorschrift_dokument.t_id AS vorschrift_vorschriften_dokument
  FROM
    arp_npl.nutzungsplanung_typ_ueberlagernd_punkt_dokument AS typ_ueberlagernd_punkt_dokument
    LEFT JOIN eigentumsbeschraenkung_ueberlagernd_punkt
    ON eigentumsbeschraenkung_ueberlagernd_punkt.typ_ueberlagernd_punkt_t_id = typ_ueberlagernd_punkt_dokument.typ_ueberlagernd_punkt
    LEFT JOIN vorschrift_dokument
    ON vorschrift_dokument.rechtsvorschrften_dokument_t_id = typ_ueberlagernd_punkt_dokument.dokument
  WHERE 
    eigentumsbeschraenkung_ueberlagernd_punkt.t_id IS NOT NULL -- siehe Kommentar 'eigentumsbeschraenkung_grundnutzung'
  RETURNING *
)
,
transferstruktur_geometrie_ueberlagernd_punkt AS (
  SELECT
    nextval('agi_oereb_npl.t_ili2db_seq'::regclass) AS t_id,
    nutzungsplanung_ueberlagernd_punkt.t_id AS nutzungsplanung_ueberlagernd_punkt_t_id,
    nutzungsplanung_ueberlagernd_punkt.rechtsstatus,
    nutzungsplanung_ueberlagernd_punkt.publiziertab,
    eigentumsbeschraenkung_ueberlagernd_punkt.t_id AS eigentumsbeschraenkung,
    vorschriften_amt.t_id AS zustaendigestelle,
    nutzungsplanung_ueberlagernd_punkt.geometrie AS punkt_lv95
  FROM
    arp_npl.nutzungsplanung_ueberlagernd_punkt AS nutzungsplanung_ueberlagernd_punkt
    INNER JOIN eigentumsbeschraenkung_ueberlagernd_punkt
    ON nutzungsplanung_ueberlagernd_punkt.typ_ueberlagernd_punkt = eigentumsbeschraenkung_ueberlagernd_punkt.typ_ueberlagernd_punkt_t_id
    LEFT JOIN vorschriften_amt
    ON 1=1
)
,
transferstruktur_geometrie_ueberlagernd_punkt_insert AS (
  INSERT INTO agi_oereb_npl.transferstruktur_geometrie (
    t_id,
    rechtsstatus,
    publiziertab,
    eigentumsbeschraenkung,
    zustaendigestelle,
    punkt_lv95
  )
  SELECT
    t_id,
    rechtsstatus,
    publiziertab,
    eigentumsbeschraenkung,
    zustaendigestelle,
    punkt_lv95
  FROM
    transferstruktur_geometrie_ueberlagernd_punkt
  RETURNING *
)
SELECT 1
; 


