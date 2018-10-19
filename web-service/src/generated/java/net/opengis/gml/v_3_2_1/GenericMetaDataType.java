
package net.opengis.gml.v_3_2_1;

import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAnyElement;
import javax.xml.bind.annotation.XmlMixed;
import javax.xml.bind.annotation.XmlType;
//import com.sun.xml.bind.annotation.OverrideAnnotationOf;


/**
 * <p>Java class for GenericMetaDataType complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="GenericMetaDataType"&gt;
 *   &lt;complexContent&gt;
 *     &lt;extension base="{http://www.opengis.net/gml/3.2}AbstractMetaDataType"&gt;
 *       &lt;sequence&gt;
 *         &lt;any processContents='lax' maxOccurs="unbounded" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/extension&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "GenericMetaDataType")
public class GenericMetaDataType
    extends AbstractMetaDataType
{

    @XmlMixed
    @XmlAnyElement(lax = true)
    //@OverrideAnnotationOf
    protected List<Object> contentOverrideForGenericMetaDataType;

    public boolean isSetcontentOverrideForGenericMetaDataType() {
        return ((this.contentOverrideForGenericMetaDataType!= null)&&(!this.contentOverrideForGenericMetaDataType.isEmpty()));
    }

}
