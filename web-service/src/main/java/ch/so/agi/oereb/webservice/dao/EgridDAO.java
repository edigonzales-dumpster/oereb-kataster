package ch.so.agi.oereb.webservice.dao;

import java.util.List;

import ch.so.agi.oereb.webservice.models.Egrid;

public interface EgridDAO {
    List<Egrid> getEgridByXY(double easting, double northing);
}
