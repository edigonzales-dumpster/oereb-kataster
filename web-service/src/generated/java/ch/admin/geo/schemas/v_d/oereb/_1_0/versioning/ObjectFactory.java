
package ch.admin.geo.schemas.v_d.oereb._1_0.versioning;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the ch.admin.geo.schemas.v_d.oereb._1_0.versioning package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _GetVersionsResponse_QNAME = new QName("http://schemas.geo.admin.ch/V_D/OeREB/1.0/Versioning", "GetVersionsResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: ch.admin.geo.schemas.v_d.oereb._1_0.versioning
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link GetVersionsResponseType }
     * 
     */
    public GetVersionsResponseType createGetVersionsResponseType() {
        return new GetVersionsResponseType();
    }

    /**
     * Create an instance of {@link VersionType }
     * 
     */
    public VersionType createVersionType() {
        return new VersionType();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetVersionsResponseType }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://schemas.geo.admin.ch/V_D/OeREB/1.0/Versioning", name = "GetVersionsResponse")
    public JAXBElement<GetVersionsResponseType> createGetVersionsResponse(GetVersionsResponseType value) {
        return new JAXBElement<GetVersionsResponseType>(_GetVersionsResponse_QNAME, GetVersionsResponseType.class, null, value);
    }

}
