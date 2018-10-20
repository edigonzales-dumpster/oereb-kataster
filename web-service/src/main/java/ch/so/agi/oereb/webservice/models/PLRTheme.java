package ch.so.agi.oereb.webservice.models;

public class PLRTheme {
    private String ilicode;
    
    private String code;
    
    private String text;
    
    private boolean concerned;

    private boolean hasdata;
    
    public String getIlicode() {
        return ilicode;
    }

    public void setIlicode(String ilicode) {
        this.ilicode = ilicode;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public boolean isConcerned() {
        return concerned;
    }

    public void setConcerned(boolean concerned) {
        this.concerned = concerned;
    }

    public boolean isHasdata() {
        return hasdata;
    }

    public void setHasdata(boolean hasdata) {
        this.hasdata = hasdata;
    }
}
