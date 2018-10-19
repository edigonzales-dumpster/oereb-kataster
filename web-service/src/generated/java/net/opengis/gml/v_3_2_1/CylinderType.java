
package net.opengis.gml.v_3_2_1;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for CylinderType complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="CylinderType"&gt;
 *   &lt;complexContent&gt;
 *     &lt;extension base="{http://www.opengis.net/gml/3.2}AbstractGriddedSurfaceType"&gt;
 *       &lt;attribute name="horizontalCurveType" type="{http://www.opengis.net/gml/3.2}CurveInterpolationType" fixed="circularArc3Points" /&gt;
 *       &lt;attribute name="verticalCurveType" type="{http://www.opengis.net/gml/3.2}CurveInterpolationType" fixed="linear" /&gt;
 *     &lt;/extension&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "CylinderType")
public class CylinderType
    extends AbstractGriddedSurfaceType
{

    /**
     * 
     * 
     */
    @XmlAttribute(name = "horizontalCurveType")
    public final static CurveInterpolationType HORIZONTAL_CURVE_TYPE = CurveInterpolationType.CIRCULAR_ARC_3_POINTS;
    /**
     * 
     * 
     */
    @XmlAttribute(name = "verticalCurveType")
    public final static CurveInterpolationType VERTICAL_CURVE_TYPE = CurveInterpolationType.LINEAR;

}
