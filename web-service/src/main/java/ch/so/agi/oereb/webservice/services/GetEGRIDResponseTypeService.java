package ch.so.agi.oereb.webservice.services;

import ch.admin.geo.schemas.v_d.oereb._1_0.extract.GetEGRIDResponseType;

public interface GetEGRIDResponseTypeService {
    GetEGRIDResponseType getGetEGRIDResponseTypeByXY(double easting, double northing);

    GetEGRIDResponseType getGetEGRIDResponseTypeByGNSS(double latitude, double longitude);
    
    GetEGRIDResponseType getGetEGRIDResponseTypeByNumberAndIdentDN(String number, String identdn);
    
    GetEGRIDResponseType getGetEGRIDResponseTypeByPostalcodeAndLocalisationAndNumber(String postalcode, String localisation, String number);
}
