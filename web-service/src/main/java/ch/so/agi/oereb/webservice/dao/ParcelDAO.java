package ch.so.agi.oereb.webservice.dao;

import java.util.List;

import ch.so.agi.oereb.webservice.models.Parcel;

public interface ParcelDAO {
    List<Parcel> getParcelByXY(double easting, double northing);
    
    List<Parcel> getParcelByGNSS(double latitude, double longitude);

    List<Parcel> getParcelByNumberAndIdentDN(String number, String identdn);
    
    List<Parcel> getParcelByPostalcodeAndLocalisationAndHousingNumber(int postalcode, String localisation, String housingNumber);

    List<Parcel> getParcelByPostalcodeAndLocalisation(int postalcode, String localisation);

    Parcel getParcelByEgrid(String egrid);
}
