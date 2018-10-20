package ch.so.agi.oereb.webservice.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ch.so.agi.oereb.webservice.models.Parcel;

@Transactional
@Repository
public class ParcelDAOImpl implements ParcelDAO {
    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Parcel> getParcelByXY(double easting, double northing) {
        String sql = "SELECT parcels.t_id, \n" + 
                "  CASE \n" + 
                "    WHEN g.egris_egrid IS NULL THEN 'CH-DUMMY' \n" + 
                "    ELSE g.egris_egrid \n" + 
                "  END AS egrid, \n" + 
                "  g.nbident AS identdn, \n" + 
                "  g.nummer AS number,\n" + 
                "  'valid' AS validitytype, -- opposite: planned\n" + 
                "  CASE\n" + 
                "    WHEN g.art = 'Liegenschaft' THEN 'RealEstate' \n" + 
                "    ELSE 'Distinct_and_permanent_rights.BuildingRight'\n" + 
                "  END AS realestatetype,\n" + 
                "  ST_AsBinary(parcels.geometrie) AS geomwkb,\n" + 
                "  ST_AsText(parcels.geometrie) AS geomwkt,\n" + 
                "  gemeinde.aname AS municipality,\n" + 
                "  gemeinde.bfsnr AS municipalitycode\n" + 
                "FROM \n" + 
                "  ( \n" + 
                "    SELECT t_id,  \n" + 
                "      geometrie AS geometrie, \n" + 
                "      liegenschaft_von AS grundstueck_fk \n" + 
                "    FROM \n" + 
                "      agi_avdpool.liegenschaften_liegenschaft \n" + 
                "    UNION ALL \n" + 
                "    SELECT t_id,  \n" + 
                "      geometrie AS geometrie, \n" + 
                "      selbstrecht_von AS grundstueck_fk \n" + 
                "    FROM \n" + 
                "      agi_avdpool.liegenschaften_selbstrecht \n" + 
                "  ) AS parcels \n" + 
                "  LEFT JOIN agi_avdpool.liegenschaften_grundstueck AS g \n" + 
                "  ON g.t_id = parcels.grundstueck_fk \n" + 
                "  LEFT JOIN agi_avdpool.gemeindegrenzen_gemeindegrenze AS gemeindegrenze\n" + 
                "  ON ST_Intersects(parcels.geometrie, gemeindegrenze.geometrie)\n" + 
                "  LEFT JOIN agi_avdpool.gemeindegrenzen_gemeinde AS gemeinde \n" + 
                "  ON gemeindegrenze.gemeindegrenze_von = gemeinde.t_id\n" + 
                "WHERE \n" + 
                "  ST_Intersects(ST_SetSRID(ST_MakePoint(?, ?),2056), parcels.geometrie) \n" + 
                "";
        
        RowMapper<Parcel> rowMapper = new BeanPropertyRowMapper<Parcel>(Parcel.class);
        List<Parcel> parcelList = jdbcTemplate.query(sql, rowMapper, easting, northing);
        return parcelList;
    }

    // Ohne projektierte Grundstücke kann nur ein Grundstück
    // gefunden werden.
    @Override
    public Parcel getParcelByEgrid(String egrid) {
        String sql = "SELECT parcels.t_id, \n" + 
                "  CASE \n" + 
                "    WHEN g.egris_egrid IS NULL THEN 'CH-DUMMY' \n" + 
                "    ELSE g.egris_egrid \n" + 
                "  END AS egrid, \n" + 
                "  g.nbident AS identdn, \n" + 
                "  g.nummer AS number,\n" + 
                "  'valid' AS validitytype, -- opposite: planned\n" + 
                "  CASE\n" + 
                "    WHEN g.art = 'Liegenschaft' THEN 'RealEstate' \n" + 
                "    ELSE 'Distinct_and_permanent_rights.BuildingRight'\n" + 
                "  END AS realestatetype,\n" + 
                "  ST_AsBinary(parcels.geometrie) AS geomwkb,\n" + 
                "  ST_AsText(parcels.geometrie) AS geomwkt,\n" + 
                "  gemeinde.aname AS municipality,\n" + 
                "  gemeinde.bfsnr AS municipalitycode\n" + 
                "FROM \n" + 
                "  ( \n" + 
                "    SELECT t_id,  \n" + 
                "      geometrie AS geometrie, \n" + 
                "      liegenschaft_von AS grundstueck_fk \n" + 
                "    FROM \n" + 
                "      agi_avdpool.liegenschaften_liegenschaft \n" + 
                "    UNION ALL \n" + 
                "    SELECT t_id,  \n" + 
                "      geometrie AS geometrie, \n" + 
                "      selbstrecht_von AS grundstueck_fk \n" + 
                "    FROM \n" + 
                "      agi_avdpool.liegenschaften_selbstrecht \n" + 
                "  ) AS parcels \n" + 
                "  LEFT JOIN agi_avdpool.liegenschaften_grundstueck AS g \n" + 
                "  ON g.t_id = parcels.grundstueck_fk \n" + 
                "  LEFT JOIN agi_avdpool.gemeindegrenzen_gemeindegrenze AS gemeindegrenze\n" + 
                "  ON ST_Intersects(parcels.geometrie, gemeindegrenze.geometrie)\n" + 
                "  LEFT JOIN agi_avdpool.gemeindegrenzen_gemeinde AS gemeinde \n" + 
                "  ON gemeindegrenze.gemeindegrenze_von = gemeinde.t_id\n" + 
                "WHERE \n" + 
                "  g.egris_egrid = ? \n" + 
                "";
        
        RowMapper<Parcel> rowMapper = new BeanPropertyRowMapper<Parcel>(Parcel.class);
        Parcel parcel = jdbcTemplate.queryForObject(sql, rowMapper, egrid);
        return parcel;
    }
}
