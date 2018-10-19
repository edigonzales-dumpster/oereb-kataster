
package net.opengis.gml.v_3_2_1;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * Direction vectors are specified by providing components of a vector.
 * 
 * <p>Java class for DirectionVectorType complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="DirectionVectorType"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;choice&gt;
 *         &lt;element ref="{http://www.opengis.net/gml/3.2}vector"/&gt;
 *         &lt;sequence&gt;
 *           &lt;element name="horizontalAngle" type="{http://www.opengis.net/gml/3.2}AngleType"/&gt;
 *           &lt;element name="verticalAngle" type="{http://www.opengis.net/gml/3.2}AngleType"/&gt;
 *         &lt;/sequence&gt;
 *       &lt;/choice&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "DirectionVectorType", propOrder = {
    "vector",
    "horizontalAngle",
    "verticalAngle"
})
public class DirectionVectorType {

    protected VectorType vector;
    protected AngleType horizontalAngle;
    protected AngleType verticalAngle;

    /**
     * Gets the value of the vector property.
     * 
     * @return
     *     possible object is
     *     {@link VectorType }
     *     
     */
    public VectorType getVector() {
        return vector;
    }

    /**
     * Sets the value of the vector property.
     * 
     * @param value
     *     allowed object is
     *     {@link VectorType }
     *     
     */
    public void setVector(VectorType value) {
        this.vector = value;
    }

    public boolean isSetVector() {
        return (this.vector!= null);
    }

    /**
     * Gets the value of the horizontalAngle property.
     * 
     * @return
     *     possible object is
     *     {@link AngleType }
     *     
     */
    public AngleType getHorizontalAngle() {
        return horizontalAngle;
    }

    /**
     * Sets the value of the horizontalAngle property.
     * 
     * @param value
     *     allowed object is
     *     {@link AngleType }
     *     
     */
    public void setHorizontalAngle(AngleType value) {
        this.horizontalAngle = value;
    }

    public boolean isSetHorizontalAngle() {
        return (this.horizontalAngle!= null);
    }

    /**
     * Gets the value of the verticalAngle property.
     * 
     * @return
     *     possible object is
     *     {@link AngleType }
     *     
     */
    public AngleType getVerticalAngle() {
        return verticalAngle;
    }

    /**
     * Sets the value of the verticalAngle property.
     * 
     * @param value
     *     allowed object is
     *     {@link AngleType }
     *     
     */
    public void setVerticalAngle(AngleType value) {
        this.verticalAngle = value;
    }

    public boolean isSetVerticalAngle() {
        return (this.verticalAngle!= null);
    }

}
