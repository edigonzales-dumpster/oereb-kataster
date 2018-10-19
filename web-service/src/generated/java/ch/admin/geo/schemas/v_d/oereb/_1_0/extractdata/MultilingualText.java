
package ch.admin.geo.schemas.v_d.oereb._1_0.extractdata;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for MultilingualText complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="MultilingualText"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="LocalisedText" type="{http://schemas.geo.admin.ch/V_D/OeREB/1.0/ExtractData}LocalisedText" maxOccurs="unbounded"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "MultilingualText", propOrder = {
    "localisedText"
})
public class MultilingualText {

    @XmlElement(name = "LocalisedText", required = true)
    protected List<LocalisedText> localisedText;

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
     * {@link LocalisedText }
     * 
     * 
     */
    public List<LocalisedText> getLocalisedText() {
        if (localisedText == null) {
            localisedText = new ArrayList<LocalisedText>();
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
