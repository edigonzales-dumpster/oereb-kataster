
package net.opengis.gml.v_3_2_1;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for OrientableSurfaceType complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="OrientableSurfaceType"&gt;
 *   &lt;complexContent&gt;
 *     &lt;extension base="{http://www.opengis.net/gml/3.2}AbstractSurfaceType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element ref="{http://www.opengis.net/gml/3.2}baseSurface"/&gt;
 *       &lt;/sequence&gt;
 *       &lt;attribute name="orientation" type="{http://www.opengis.net/gml/3.2}SignType" default="+" /&gt;
 *     &lt;/extension&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "OrientableSurfaceType", propOrder = {
    "baseSurface"
})
public class OrientableSurfaceType
    extends AbstractSurfaceType
{

    @XmlElement(required = true)
    protected SurfacePropertyType baseSurface;
    @XmlAttribute(name = "orientation")
    protected SignType orientation;

    /**
     * Gets the value of the baseSurface property.
     * 
     * @return
     *     possible object is
     *     {@link SurfacePropertyType }
     *     
     */
    public SurfacePropertyType getBaseSurface() {
        return baseSurface;
    }

    /**
     * Sets the value of the baseSurface property.
     * 
     * @param value
     *     allowed object is
     *     {@link SurfacePropertyType }
     *     
     */
    public void setBaseSurface(SurfacePropertyType value) {
        this.baseSurface = value;
    }

    public boolean isSetBaseSurface() {
        return (this.baseSurface!= null);
    }

    /**
     * Gets the value of the orientation property.
     * 
     * @return
     *     possible object is
     *     {@link SignType }
     *     
     */
    public SignType getOrientation() {
        if (orientation == null) {
            return SignType.VALUE_2;
        } else {
            return orientation;
        }
    }

    /**
     * Sets the value of the orientation property.
     * 
     * @param value
     *     allowed object is
     *     {@link SignType }
     *     
     */
    public void setOrientation(SignType value) {
        this.orientation = value;
    }

    public boolean isSetOrientation() {
        return (this.orientation!= null);
    }

}
