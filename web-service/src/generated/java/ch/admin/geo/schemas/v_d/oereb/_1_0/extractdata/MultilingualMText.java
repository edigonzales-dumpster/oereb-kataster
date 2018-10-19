
package ch.admin.geo.schemas.v_d.oereb._1_0.extractdata;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for MultilingualMText complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="MultilingualMText"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="LocalisedText" type="{http://schemas.geo.admin.ch/V_D/OeREB/1.0/ExtractData}LocalisedMText" maxOccurs="unbounded"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "MultilingualMText", propOrder = {
    "localisedText"
})
public class MultilingualMText {

    @XmlElement(name = "LocalisedText", required = true)
    protected List<LocalisedMText> localisedText;

    /**
     * Gets the value of the localisedText property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the localisedText property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getLocalisedText().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link LocalisedMText }
     * 
     * 
     */
    public List<LocalisedMText> getLocalisedText() {
        if (localisedText == null) {
            localisedText = new ArrayList<LocalisedMText>();
        }
        return this.localisedText;
    }

    public boolean isSetLocalisedText() {
        return ((this.localisedText!= null)&&(!this.localisedText.isEmpty()));
    }

    public void unsetLocalisedText() {
        this.localisedText = null;
    }

}
