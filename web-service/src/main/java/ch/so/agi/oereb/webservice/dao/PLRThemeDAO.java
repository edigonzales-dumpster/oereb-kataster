package ch.so.agi.oereb.webservice.dao;

import java.util.List;

import ch.so.agi.oereb.webservice.models.PLRTheme;

public interface PLRThemeDAO {
    List<PLRTheme> getThemesByParcelGeometry(byte[] geom);

}
