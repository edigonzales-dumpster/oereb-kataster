
package net.opengis.gml.v_3_2_1;

import javax.xml.bind.annotation.XmlEnum;
import javax.xml.bind.annotation.XmlEnumValue;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for IncrementOrder.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * <p>
 * <pre>
 * &lt;simpleType name="IncrementOrder"&gt;
 *   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}string"&gt;
 *     &lt;enumeration value="+x+y"/&gt;
 *     &lt;enumeration value="+y+x"/&gt;
 *     &lt;enumeration value="+x-y"/&gt;
 *     &lt;enumeration value="-x-y"/&gt;
 *   &lt;/restriction&gt;
 * &lt;/simpleType&gt;
 * </pre>
 * 
 */
@XmlType(name = "IncrementOrder")
@XmlEnum
public enum IncrementOrder {

    @XmlEnumValue("+x+y")
    VALUE_1("+x+y"),
    @XmlEnumValue("+y+x")
    VALUE_2("+y+x"),
    @XmlEnumValue("+x-y")
    VALUE_3("+x-y"),
    @XmlEnumValue("-x-y")
    VALUE_4("-x-y");
    private final String value;

    IncrementOrder(String v) {
        value = v;
    }

    public String value() {
        return value;
    }

    public static IncrementOrder fromValue(String v) {
        for (IncrementOrder c: IncrementOrder.values()) {
            if (c.value.equals(v)) {
                return c;
            }
        }
        throw new IllegalArgumentException(v);
    }

}
