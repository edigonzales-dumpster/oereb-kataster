-- THIS IS SO WRONG...
-- MUST BE EXECUTED AFTER OTHER UPDATES!
-- FROM MY POINT OF VIEW the data is not valid.

WITH zustaendige_stelle_gemeinden AS (
  SELECT
    RIGHT(t_ili_tid,4)::int AS bfsnr,
    *
  FROM
    arp_npl_oereb.vorschriften_amt
  WHERE
    t_ili_tid LIKE 'ch.so.arp.npl.%'    
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
    zustaendigestelle IS NULL
  RETURNING *
)
,
zustaendige_stelle_arp_fix_error AS (
  SELECT
    *
  FROM
    arp_npl_oereb.vorschriften_amt
  WHERE
    t_ili_tid = 'ch.so.arp.npl'
  LIMIT 1    
)
,
transferstruktur_eigentumsbeschraenkung_update_zustaendige_stelle AS (
  UPDATE
    arp_npl_oereb.transferstruktur_eigentumsbeschraenkung
  SET
    zustaendigestelle = zustaendige_stelle_arp_fix_error.t_id
  FROM
    zustaendige_stelle_arp_fix_error
  WHERE 
    zustaendigestelle IS NULL
  RETURNING *
)
,
transferstruktur_geometrie_update_zustaendige_stelle AS (
  UPDATE
    arp_npl_oereb.transferstruktur_geometrie
  SET
    zustaendigestelle = zustaendige_stelle_arp_fix_error.t_id
  FROM
    zustaendige_stelle_arp_fix_error
  WHERE 
    zustaendigestelle IS NULL
  RETURNING *
)
SELECT 1
; 
