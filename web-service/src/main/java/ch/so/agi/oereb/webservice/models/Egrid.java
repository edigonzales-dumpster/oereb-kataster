package ch.so.agi.oereb.webservice.models;

public class Egrid {
    private int t_id;
    
    private String egrid;

    private String identdn;

    private String number;

    private String realEstateType;
    
    private String validityType;

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
}
