package ch.so.agi.oereb.webservice.models;

public class Parcel {
    private int t_id;
    
    private String egrid;

    private String identdn;

    private String number;

    private String realEstateType;
    
    private String validityType;
    
    private byte[] geomWkb;
    
    private String geomWkt;
    
    private String municipality;
    
    private int municipalityCode;
    
    private String subunitOfLandRegister;

    public int getT_id() {
        return t_id;
    }

    public void setT_id(int t_id) {
        this.t_id = t_id;
    }

    public String getEgrid() {
        return egrid;
    }

    public void setEgrid(String egrid) {
        this.egrid = egrid;
    }

    public String getIdentdn() {
        return identdn;
    }

    public void setIdentdn(String identdn) {
        this.identdn = identdn;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getRealEstateType() {
        return realEstateType;
    }

    public void setRealEstateType(String realEstateType) {
        this.realEstateType = realEstateType;
    }

    public String getValidityType() {
        return validityType;
    }

    public void setValidityType(String validityType) {
        this.validityType = validityType;
    }

    public byte[] getGeomWkb() {
        return geomWkb;
    }

    public void setGeomWkb(byte[] geomWkb) {
        this.geomWkb = geomWkb;
    }

    public String getGeomWkt() {
        return geomWkt;
    }

    public void setGeomWkt(String geomWkt) {
        this.geomWkt = geomWkt;
    }

    public String getMunicipality() {
        return municipality;
    }

    public void setMunicipality(String municipality) {
        this.municipality = municipality;
    }

    public int getMunicipalityCode() {
        return municipalityCode;
    }

    public void setMunicipalityCode(int municipalityCode) {
        this.municipalityCode = municipalityCode;
    }

    public String getSubunitOfLandRegister() {
        return subunitOfLandRegister;
    }

    public void setSubunitOfLandRegister(String subunitOfLandRegister) {
        this.subunitOfLandRegister = subunitOfLandRegister;
    }

}
