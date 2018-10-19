
package ch.admin.geo.schemas.v_d.oereb._1_0.versioning;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for GetVersionsResponseType complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="GetVersionsResponseType"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="supportedVersion" type="{http://schemas.geo.admin.ch/V_D/OeREB/1.0/Versioning}VersionType" maxOccurs="unbounded" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "GetVersionsResponseType", propOrder = {
    "supportedVersion"
})
public class GetVersionsResponseType {

    protected List<VersionType> supportedVersion;

    /**
     * Gets the value of the supportedVersion property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the supportedVersion property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getSupportedVersion().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link VersionType }
     * 
     * 
     */
    public List<VersionType> getSupportedVersion() {
        if (supportedVersion == null) {
            supportedVersion = new ArrayList<VersionType>();
        }
        return this.supportedVersion;
    }

    public boolean isSetSupportedVersion() {
        return ((this.supportedVersion!= null)&&(!this.supportedVersion.isEmpty()));
    }

    public void unsetSupportedVersion() {
        this.supportedVersion = null;
    }

}
