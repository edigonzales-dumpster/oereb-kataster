
package net.opengis.gml.v_3_2_1;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for CurveType complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="CurveType"&gt;
 *   &lt;complexContent&gt;
 *     &lt;extension base="{http://www.opengis.net/gml/3.2}AbstractCurveType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element ref="{http://www.opengis.net/gml/3.2}segments"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/extension&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "CurveType", propOrder = {
    "segments"
})
public class CurveType
    extends AbstractCurveType
{

    @XmlElement(required = true)
    protected CurveSegmentArrayPropertyType segments;

    /**
     * Gets the value of the segments property.
     * 
     * @return
     *     possible object is
     *     {@link CurveSegmentArrayPropertyType }
     *     
     */
    public CurveSegmentArrayPropertyType getSegments() {
        return segments;
    }

    /**
     * Sets the value of the segments property.
     * 
     * @param value
     *     allowed object is
     *     {@link CurveSegmentArrayPropertyType }
     *     
     */
    public void setSegments(CurveSegmentArrayPropertyType value) {
        this.segments = value;
    }

    public boolean isSetSegments() {
        return (this.segments!= null);
    }

}
