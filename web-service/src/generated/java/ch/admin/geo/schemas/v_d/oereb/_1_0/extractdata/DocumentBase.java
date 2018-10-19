
package ch.admin.geo.schemas.v_d.oereb._1_0.extractdata;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.adapters.CollapsedStringAdapter;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;


/**
 * <p>Java class for DocumentBase complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="DocumentBase"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="DocumentType"&gt;
 *           &lt;simpleType&gt;
 *             &lt;restriction base="{http://www.w3.org/2001/XMLSchema}token"&gt;
 *               &lt;enumeration value="LegalProvision"/&gt;
 *               &lt;enumeration value="Law"/&gt;
 *               &lt;enumeration value="Hint"/&gt;
 *             &lt;/restriction&gt;
 *           &lt;/simpleType&gt;
 *         &lt;/element&gt;
 *         &lt;element name="TextAtWeb" type="{http://schemas.geo.admin.ch/V_D/OeREB/1.0/ExtractData}MultilingualUri" minOccurs="0"/&gt;
 *         &lt;element name="Lawstatus" type="{http://schemas.geo.admin.ch/V_D/OeREB/1.0/ExtractData}Lawstatus"/&gt;
 *         &lt;element ref="{http://schemas.geo.admin.ch/V_D/OeREB/1.0/ExtractData}extensions" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "DocumentBase", propOrder = {
    "documentType",
    "textAtWeb",
    "lawstatus",
    "extensions"
})
@XmlSeeAlso({
    Article.class,
    Document.class
})
public class DocumentBase {

    @XmlElement(name = "DocumentType", required = true)
    @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
    protected String documentType;
    @XmlElement(name = "TextAtWeb")
    protected MultilingualUri textAtWeb;
    @XmlElement(name = "Lawstatus", required = true)
    protected Lawstatus lawstatus;
    protected Extensions extensions;

    /**
     * Gets the value of the documentType property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDocumentType() {
        return documentType;
    }

    /**
     * Sets the value of the documentType property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDocumentType(String value) {
        this.documentType = value;
    }

    public boolean isSetDocumentType() {
        return (this.documentType!= null);
    }

    /**
     * Gets the value of the textAtWeb property.
     * 
     * @return
     *     possible object is
     *     {@link MultilingualUri }
     *     
     */
    public MultilingualUri getTextAtWeb() {
        return textAtWeb;
    }

    /**
     * Sets the value of the textAtWeb property.
     * 
     * @param value
     *     allowed object is
     *     {@link MultilingualUri }
     *     
     */
    public void setTextAtWeb(MultilingualUri value) {
        this.textAtWeb = value;
    }

    public boolean isSetTextAtWeb() {
        return (this.textAtWeb!= null);
    }

    /**
     * Gets the value of the lawstatus property.
     * 
     * @return
     *     possible object is
     *     {@link Lawstatus }
     *     
     */
    public Lawstatus getLawstatus() {
        return lawstatus;
    }

    /**
     * Sets the value of the lawstatus property.
     * 
     * @param value
     *     allowed object is
     *     {@link Lawstatus }
     *     
     */
    public void setLawstatus(Lawstatus value) {
        this.lawstatus = value;
    }

    public boolean isSetLawstatus() {
        return (this.lawstatus!= null);
    }

    /**
     * Gets the value of the extensions property.
     * 
     * @return
     *     possible object is
     *     {@link Extensions }
     *     
     */
    public Extensions getExtensions() {
        return extensions;
    }

    /**
     * Sets the value of the extensions property.
     * 
     * @param value
     *     allowed object is
     *     {@link Extensions }
     *     
     */
    public void setExtensions(Extensions value) {
        this.extensions = value;
    }

    public boolean isSetExtensions() {
        return (this.extensions!= null);
    }

}
