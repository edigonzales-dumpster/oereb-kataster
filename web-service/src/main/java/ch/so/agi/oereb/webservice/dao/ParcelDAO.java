package ch.so.agi.oereb.webservice.dao;

import java.util.List;

import ch.so.agi.oereb.webservice.models.Parcel;

public interface ParcelDAO {
    List<Parcel> getParcelByXY(double easting, double northing);
    
    Parcel getParcelByEgrid(String egrid);
}
