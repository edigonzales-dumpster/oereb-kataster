
package ch.admin.geo.schemas.v_d.oereb._1_0.extractdata;

import javax.xml.bind.annotation.XmlEnum;
import javax.xml.bind.annotation.XmlEnumValue;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for LawstatusCode.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * <p>
 * <pre>
 * &lt;simpleType name="LawstatusCode"&gt;
 *   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}string"&gt;
 *     &lt;enumeration value="inForce"/&gt;
 *     &lt;enumeration value="runningModifications"/&gt;
 *   &lt;/restriction&gt;
 * &lt;/simpleType&gt;
 * </pre>
 * 
 */
@XmlType(name = "LawstatusCode")
@XmlEnum
public enum LawstatusCode {

    @XmlEnumValue("inForce")
    IN_FORCE("inForce"),
    @XmlEnumValue("runningModifications")
    RUNNING_MODIFICATIONS("runningModifications");
    private final String value;

    LawstatusCode(String v) {
        value = v;
    }

    public String value() {
        return value;
    }

    public static LawstatusCode fromValue(String v) {
        for (LawstatusCode c: LawstatusCode.values()) {
            if (c.value.equals(v)) {
                return c;
            }
        }
        throw new IllegalArgumentException(v);
    }

}
