CREATE OR REPLACE VIEW arp_npl_oereb.v_grundnutzung_zonenflaeche AS
SELECT
  geometrie.t_id,
  geometrie.flaeche_lv95 AS geometrie,
  eigentumsbeschraenkung.thema,
  eigentumsbeschraenkung.subthema,
  eigentumsbeschraenkung.artcode,
  eigentumsbeschraenkung.aussage_de AS aussage
FROM
  arp_npl_oereb.transferstruktur_geometrie AS geometrie
  LEFT JOIN arp_npl_oereb.transferstruktur_eigentumsbeschraenkung AS eigentumsbeschraenkung
  ON geometrie.eigentumsbeschraenkung = eigentumsbeschraenkung.t_id
WHERE
  eigentumsbeschraenkung.subthema = 'Grundnutzung_Zonenflaeche'
;
