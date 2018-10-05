DELETE FROM agi_oereb_npl.transferstruktur_geometrie;  
DELETE FROM agi_oereb_npl.transferstruktur_hinweisvorschrift;  
DELETE FROM agi_oereb_npl.transferstruktur_darstellungsdienst; 
DELETE FROM agi_oereb_npl.transferstruktur_eigentumsbeschraenkung WHERE thema = 'Nutzungsplanung';
DELETE FROM agi_oereb_npl.vorschriften_hinweisweiteredokumente;
DELETE FROM agi_oereb_npl.localiseduri;
DELETE FROM agi_oereb_npl.multilingualuri;
DELETE FROM agi_oereb_npl.vorschriften_dokument;
DELETE FROM agi_oereb_npl.vorschriften_amt;

