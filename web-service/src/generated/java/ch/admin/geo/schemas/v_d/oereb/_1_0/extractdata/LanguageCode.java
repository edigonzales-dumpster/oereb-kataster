
package ch.admin.geo.schemas.v_d.oereb._1_0.extractdata;

import javax.xml.bind.annotation.XmlEnum;
import javax.xml.bind.annotation.XmlEnumValue;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for LanguageCode.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * <p>
 * <pre>
 * &lt;simpleType name="LanguageCode"&gt;
 *   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}string"&gt;
 *     &lt;enumeration value="de"/&gt;
 *     &lt;enumeration value="fr"/&gt;
 *     &lt;enumeration value="it"/&gt;
 *     &lt;enumeration value="rm"/&gt;
 *     &lt;enumeration value="en"/&gt;
 *   &lt;/restriction&gt;
 * &lt;/simpleType&gt;
 * </pre>
 * 
 */
@XmlType(name = "LanguageCode")
@XmlEnum
public enum LanguageCode {

    @XmlEnumValue("de")
    DE("de"),
    @XmlEnumValue("fr")
    FR("fr"),
    @XmlEnumValue("it")
    IT("it"),
    @XmlEnumValue("rm")
    RM("rm"),
    @XmlEnumValue("en")
    EN("en");
    private final String value;

    LanguageCode(String v) {
        value = v;
    }

    public String value() {
        return value;
    }

    public static LanguageCode fromValue(String v) {
        for (LanguageCode c: LanguageCode.values()) {
            if (c.value.equals(v)) {
                return c;
            }
        }
        throw new IllegalArgumentException(v);
    }

}
