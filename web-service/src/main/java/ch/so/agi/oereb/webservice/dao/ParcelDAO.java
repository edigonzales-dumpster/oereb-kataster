package ch.so.agi.oereb.webservice.dao;

import java.util.List;

import ch.so.agi.oereb.webservice.models.Parcel;

public interface ParcelDAO {
    /**
     * Finds parcels at a specific coordinate.
     * 
     * @param easting Easting of coordinate (EPSG:2056)
     * @param northing Northing of coordinate (EPSG:2056)
     * @return List of found parcels
     */
    List<Parcel> getParcelByXY(double easting, double northing);
    
    /**
     * Finds parcels at a specific coordinate.
     * 
     * @param latitude Latitude of coordinate (EPSG:4036)
     * @param longitude Longitude of coordinate (EPSG:4036)
     * @return List of found parcels
     */
    List<Parcel> getParcelByGNSS(double latitude, double longitude);

    /**
     * Finds parcels by a land register number and a numbering range (IdentND).
     * 
     * @param number Official land register number
     * @param identdn Numbering range
     * @return List of found parcels
     */
    List<Parcel> getParcelByNumberAndIdentDN(String number, String identdn);
    
    /**
     * Finds parcels by a postal code, a localisation name (e.g. street name) and a housing number.
     *
     * @param postalcode Postal code (4 digits)
     * @param localisation Name of localisation
     * @param housingNumber Housing number
     * @return List of found parcels
     */
    List<Parcel> getParcelByPostalcodeAndLocalisationAndHousingNumber(int postalcode, String localisation, String housingNumber);

    /** 
     * Finds parcels by a postal code, a localisation name (e.g. street name).
     *  
     * @param postalcode Postal code (4 digits)
     * @param localisation Name of localisation
     * @return List of found parcels
     */
    List<Parcel> getParcelByPostalcodeAndLocalisation(int postalcode, String localisation);

    /** 
     * Finds a parcel by a given egrid.
     * 
     * @param egrid Egrid 
     * @return Parcel 
     */
    Parcel getParcelByEgrid(String egrid);
}
