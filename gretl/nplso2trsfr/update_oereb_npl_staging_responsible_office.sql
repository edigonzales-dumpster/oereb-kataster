WITH zustaendige_stelle_rrb AS 
(
  SELECT
    *
  FROM
    arp_npl_oereb.vorschriften_amt
  WHERE
    t_ili_tid = 'ch.so.sk'
)
,
zustaendige_stelle_gemeinden AS (
  SELECT
    RIGHT(t_ili_tid,4)::int AS bfsnr,
    *
  FROM
    arp_npl_oereb.vorschriften_amt
  WHERE
    t_ili_tid LIKE 'ch.so.arp.npl.%'    
)
,
vorschrift_dokument_update_zustaendige_stelle_rrb AS (
  UPDATE
    arp_npl_oereb.vorschriften_dokument
  SET
    zustaendigestelle = zustaendige_stelle_rrb.t_id
  FROM
    zustaendige_stelle_rrb
  WHERE
    abkuerzung_de = 'RRB'
  RETURNING *
) 
,
vorschrift_dokument_update_zustaendige_stelle_gemeinden AS (
  UPDATE 
    arp_npl_oereb.vorschriften_dokument
  SET 
    zustaendigestelle = zustaendige_stelle_gemeinden.t_id
  FROM 
    zustaendige_stelle_gemeinden
  WHERE
    gemeinde = zustaendige_stelle_gemeinden.bfsnr
  AND
    abkuerzung_de != 'RRB'
  AND 
    t_type = 'vorschriften_rechtsvorschrift'
  RETURNING *
)
,
transferstruktur_eigentumsbeschraenkung_update_zustaendige_stelle AS (
  UPDATE
    arp_npl_oereb.transferstruktur_eigentumsbeschraenkung
  SET
    zustaendigestelle = subquery.zustaendige_stelle_t_id
  FROM
    (
      SELECT
        DISTINCT ON (eigentumsbeschraenkung.t_id)
        dokument.gemeinde,
        zustaendige_stelle_gemeinden.t_id AS zustaendige_stelle_t_id,
        eigentumsbeschraenkung.*
      FROM
        arp_npl_oereb.transferstruktur_eigentumsbeschraenkung AS eigentumsbeschraenkung
        LEFT JOIN arp_npl_oereb.transferstruktur_hinweisvorschrift AS hinweisvorschrift
        ON eigentumsbeschraenkung.t_id = hinweisvorschrift.eigentumsbeschraenkung
        LEFT JOIN arp_npl_oereb.vorschriften_dokument AS dokument
        ON hinweisvorschrift.vorschrift_vorschriften_dokument = dokument.t_id
        LEFT JOIN zustaendige_stelle_gemeinden 
        ON zustaendige_stelle_gemeinden.bfsnr = dokument.gemeinde
    ) AS subquery
  WHERE
    transferstruktur_eigentumsbeschraenkung.t_id = subquery.t_id
)
UPDATE 
  arp_npl_oereb.transferstruktur_geometrie
SET
  zustaendigestelle = subquery.eigentumsbeschraenkung_zustaendigestelle
FROM
(
  SELECT
    eigentumsbeschraenkung.zustaendigestelle AS eigentumsbeschraenkung_zustaendigestelle,
    geometrie.*
  FROM
    arp_npl_oereb.transferstruktur_geometrie AS geometrie
    LEFT JOIN arp_npl_oereb.transferstruktur_eigentumsbeschraenkung AS eigentumsbeschraenkung
    ON geometrie.eigentumsbeschraenkung = eigentumsbeschraenkung.t_id
) AS subquery
WHERE
  transferstruktur_geometrie.t_id = subquery.t_id
;