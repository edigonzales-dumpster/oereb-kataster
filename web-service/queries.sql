SELECT parcels.t_id, 
  CASE 
    WHEN g.egris_egrid IS NULL THEN 'CH-DUMMY' 
    ELSE g.egris_egrid 
  END AS egrid, 
  g.nbident AS identdn, 
  g.nummer AS number,
  'valid' AS validitytype, -- opposite: planned
  CASE
    WHEN g.art = 'Liegenschaft' THEN 'RealEstate' 
    ELSE 'Distinct_and_permanent_rights.BuildingRight'
  END AS realestatetype
FROM 
  ( 
    SELECT t_id,  
      geometrie AS geometrie, 
      liegenschaft_von AS grundstueck_fk 
    FROM 
      agi_avdpool.liegenschaften_liegenschaft 
    UNION ALL 
    SELECT t_id,  
      geometrie AS geometrie, 
      selbstrecht_von AS grundstueck_fk 
    FROM 
      agi_avdpool.liegenschaften_selbstrecht 
  ) AS parcels 
  LEFT JOIN agi_avdpool.liegenschaften_grundstueck AS g 
  ON g.t_id = parcels.grundstueck_fk 
WHERE 
  ST_Intersects(ST_SetSRID(ST_MakePoint(2598098, 1225627),2056), geometrie) 
;

