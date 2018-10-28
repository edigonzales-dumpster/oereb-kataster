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
import ch.so.agi.oereb.webservice.models.PLRTheme;

@Transactional
@Repository
public class PLRThemeDAOImpl implements PLRThemeDAO {
    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<PLRTheme> getThemesByParcelGeometry(byte[] geom) {
        String sql = "WITH parcel AS (\n" + 
                "  SELECT ST_GeomFromWkb(?, 2056) AS geom\n" + 
                ")\n" + 
                ",\n" + 
                "eigentumsbeschraenkung_geometrie AS (\n" + 
                "  SELECT\n" + 
                "    eigentumsbeschraenkung\n" + 
                "  FROM\n" + 
                "    agi_oereb.transferstruktur_geometrie AS geometrie,\n" + 
                "    parcel\n" + 
                "  WHERE\n" + 
                "    ST_Intersects(geometrie.flaeche_lv95, parcel.geom)\n" + 
                "    OR\n" + 
                "    ST_Intersects(geometrie.linie_lv95, parcel.geom)\n" + 
                "    OR\n" + 
                "    ST_Intersects(geometrie.punkt_lv95, parcel.geom)\n" + 
                ")\n" + 
                ",\n" + 
                "eigentumsbeschraenkung AS (\n" + 
                "  SELECT\n" + 
                "    DISTINCT ON (thema)\n" + 
                "    thema\n" + 
                "  FROM\n" + 
                "    agi_oereb.transferstruktur_eigentumsbeschraenkung AS eigentumsbeschraenkung\n" + 
                "    INNER JOIN eigentumsbeschraenkung_geometrie\n" + 
                "    ON eigentumsbeschraenkung_geometrie.eigentumsbeschraenkung = eigentumsbeschraenkung.t_id\n" + 
                ")\n" + 
                "SELECT\n" + 
                "  CASE \n" + 
                "    WHEN eigentumsbeschraenkung.thema IS NULL THEN FALSE\n" + 
                "    ELSE TRUE\n" + 
                "  END AS concerned,\n" + 
                "  thema.ilicode,\n" + 
                "  katasterthema.code AS code,\n" + 
                "  katasterthema.aname_de AS \"text\",\n" + 
                "  katasterthema.daten_vorhanden AS hasdata\n" + 
                "FROM\n" + 
                "  agi_oereb.thema AS thema \n" + 
                "  LEFT JOIN eigentumsbeschraenkung\n" + 
                "  ON thema.ilicode = eigentumsbeschraenkung.thema\n" + 
                "  LEFT JOIN agi_oereb_azg_ann.katasterauszgnnex_katasterthema AS katasterthema\n" + 
                "  ON katasterthema.thema = thema.ilicode\n" + 
                "WHERE\n" + 
                "  thema.ilicode != 'WeiteresThema'\n" + 
                "";
        
        RowMapper<PLRTheme> rowMapper = new BeanPropertyRowMapper<PLRTheme>(PLRTheme.class);
        List<PLRTheme> themeList = jdbcTemplate.query(sql, rowMapper, geom);
        return themeList;
    }

}
