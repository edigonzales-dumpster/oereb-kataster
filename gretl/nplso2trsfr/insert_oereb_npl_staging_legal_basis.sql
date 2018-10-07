WITH vorschriften_dokument_legal_basis AS (
  SELECT
    t_id AS hinweis
  FROM
    arp_npl_oereb.vorschriften_dokument
  WHERE
    t_ili_tid IN ('ch.so.sk.bgs.711.1', 'ch.admin.bk.sr.700', 'ch.so.sk.bgs.711.61') 
)
INSERT INTO arp_npl_oereb.vorschriften_hinweisweiteredokumente (
  t_basket,
  t_datasetname,
  ursprung,
  hinweis
)
SELECT
  vorschriften_dokument.t_basket,
  vorschriften_dokument.t_datasetname,
  vorschriften_dokument.t_id,  
  vorschriften_dokument_legal_basis.hinweis
FROM 
  arp_npl_oereb.vorschriften_dokument AS vorschriften_dokument
  LEFT JOIN vorschriften_dokument_legal_basis
  ON 1=1
WHERE
  t_type = 'vorschriften_rechtsvorschrift'
AND
  vorschriften_dokument.t_datasetname = 'ch.so.arp.nutzungsplanung'
;
