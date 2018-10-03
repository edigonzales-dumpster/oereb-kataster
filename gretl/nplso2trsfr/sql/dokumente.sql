DELETE FROM agi_oereb_npl.vorschriften_hinweisweiteredokumente;
DELETE FROM agi_oereb_npl.localiseduri;
DELETE FROM agi_oereb_npl.multilingualuri;
DELETE FROM agi_oereb_npl.vorschriften_dokument;
DELETE FROM agi_oereb_npl.vorschriften_amt;

WITH vorschriften_amt AS 
(
  INSERT INTO agi_oereb_npl.vorschriften_amt (
    t_ili_tid, 
    aname, 
    aname_de, 
    amtimweb
  )
  VALUES
  (
    uuid_generate_v4(),
    'Amt für Raumplanung',
    'Amt für Raumplanung',
    'http://arp.so.ch'
  )
  RETURNING t_id
),
vorschrift_dokument AS 
(
  SELECT
    nextval('agi_oereb_npl.t_ili2db_seq'::regclass) AS t_id,
    rechtsvorschrften_dokument.t_id AS rechtsvorschrften_dokument_t_id,
    uuid_generate_v4() AS t_ili_tid,
    CASE
      WHEN rechtsvorschrift IS TRUE
          THEN 'vorschriften_rechtsvorschrift'
      ELSE 'vorschriften_dokument'
    END AS t_type,
    titel,
    titel AS titel_de,
    offiziellertitel,
    offiziellertitel AS offiziellertitel_de,
    abkuerzung,
    abkuerzung AS abkuerzung_de,
    kanton,
    gemeinde,
    publiziertab,
    rechtsstatus,
    'https://geo.so.ch/docs/ch.so.arp.zonenplaene/Zonenplaene_pdf/' || textimweb AS textimweb,
    vorschriften_amt.t_id AS zustaendigestelle
  FROM
      arp_npl.rechtsvorschrften_dokument AS rechtsvorschrften_dokument,
      vorschriften_amt
),
vorschrift_dokument_insert AS 
(
  INSERT INTO agi_oereb_npl.vorschriften_dokument (
    t_id,
    t_ili_tid,
    t_type,
    titel,
    titel_de,
    offiziellertitel,
    offiziellertitel_de,
    abkuerzung,
    abkuerzung_de,
    kanton,
    gemeinde,
    publiziertab,
    rechtsstatus,
    zustaendigestelle
  )
  SELECT
    t_id,
    t_ili_tid,
    t_type,
    titel,
    titel_de,
    offiziellertitel,
    offiziellertitel_de,
    abkuerzung,
    abkuerzung_de,
    kanton,
    gemeinde,
    publiziertab,
    rechtsstatus,
    zustaendigestelle
  FROM
    vorschrift_dokument
  RETURNING *
),
multilingualuri_localiseduri AS (
  SELECT
    nextval('agi_oereb_npl.t_ili2db_seq'::regclass) AS t_id, -- multilingualuri t_id.
    t_id AS vorschrift_dokument_t_id,
    textimweb AS atext,
    'de' AS alanguage
  FROM
    vorschrift_dokument
),
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
),
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
),
-- Das geht eleganter!?!?! Aaandi!
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
SELECT
  *
FROM
  multilingualuri_localiseduri
