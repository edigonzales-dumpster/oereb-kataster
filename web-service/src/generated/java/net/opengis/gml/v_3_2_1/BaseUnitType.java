
package net.opengis.gml.v_3_2_1;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for BaseUnitType complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="BaseUnitType"&gt;
 *   &lt;complexContent&gt;
 *     &lt;extension base="{http://www.opengis.net/gml/3.2}UnitDefinitionType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="unitsSystem" type="{http://www.opengis.net/gml/3.2}ReferenceType"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/extension&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "BaseUnitType", propOrder = {
    "unitsSystem"
})
public class BaseUnitType
    extends UnitDefinitionType
{

    @XmlElement(required = true)
    protected ReferenceType unitsSystem;

    /**
     * Gets the value of the unitsSystem property.
     * 
     * @return
     *     possible object is
     *     {@link ReferenceType }
     *     
     */
    public ReferenceType getUnitsSystem() {
        return unitsSystem;
    }

    /**
     * Sets the value of the unitsSystem property.
     * 
     * @param value
     *     allowed object is
     *     {@link ReferenceType }
     *     
     */
    public void setUnitsSystem(ReferenceType value) {
        this.unitsSystem = value;
    }

    public boolean isSetUnitsSystem() {
        return (this.unitsSystem!= null);
    }

}
