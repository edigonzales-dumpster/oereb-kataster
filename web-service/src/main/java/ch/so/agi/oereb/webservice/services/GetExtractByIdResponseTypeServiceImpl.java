package ch.so.agi.oereb.webservice.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.GregorianCalendar;
import java.util.List;

import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ch.admin.geo.schemas.v_d.oereb._1_0.extract.GetExtractByIdResponseType;
import ch.admin.geo.schemas.v_d.oereb._1_0.extractdata.Extract;
import ch.admin.geo.schemas.v_d.oereb._1_0.extractdata.LanguageCode;
import ch.admin.geo.schemas.v_d.oereb._1_0.extractdata.LocalisedText;
import ch.admin.geo.schemas.v_d.oereb._1_0.extractdata.ObjectFactory;
import ch.admin.geo.schemas.v_d.oereb._1_0.extractdata.Theme;
import ch.so.agi.oereb.webservice.dao.ParcelDAOImpl;
import ch.so.agi.oereb.webservice.dao.PLRThemeDAOImpl;
import ch.so.agi.oereb.webservice.models.Parcel;
import ch.so.agi.oereb.webservice.models.PLRTheme;

@Service
public class GetExtractByIdResponseTypeServiceImpl implements GetExtractByIdResponseTypeService {
    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ParcelDAOImpl parcelDAO;
    
    @Autowired
    private PLRThemeDAOImpl plrThemeDAO;

    
    @Override
    public GetExtractByIdResponseType getExtractById(String egrid, boolean isReduced, boolean withGeometry,
            boolean withImages) throws DatatypeConfigurationException {

        ch.admin.geo.schemas.v_d.oereb._1_0.extract.ObjectFactory objectFactoryExtract = 
                new ch.admin.geo.schemas.v_d.oereb._1_0.extract.ObjectFactory();
        
        ch.admin.geo.schemas.v_d.oereb._1_0.extractdata.ObjectFactory objectFactoryExtractData =
                new ch.admin.geo.schemas.v_d.oereb._1_0.extractdata.ObjectFactory();

        // This is the root element of the XML extract.
        GetExtractByIdResponseType extractByIdResponseType = objectFactoryExtract.createGetExtractByIdResponseType();

        Extract extract = objectFactoryExtractData.createExtract();
        
        // General information, e.g. egrid, municipality, geometry etc.
        Parcel parcel = parcelDAO.getParcelByEgrid(egrid);
        
        // Creation date
        GregorianCalendar cal = new GregorianCalendar();
        DatatypeFactory.newInstance().newXMLGregorianCalendar(cal);
        XMLGregorianCalendar creationDate = DatatypeFactory.newInstance().newXMLGregorianCalendar(cal);
        extract.setCreationDate(creationDate);

        // Themes: 
        // - ConcernedTheme
        // - NotConcernedTheme
        // - ThemeWithoutData
        List<PLRTheme> plrThemeList = plrThemeDAO.getThemesByParcelGeometry(parcel.getGeomWkb());
        for(PLRTheme plrTheme : plrThemeList) {
            log.info(plrTheme.getCode());
            Theme theme = objectFactoryExtractData.createTheme();
            theme.setCode(plrTheme.getCode());
            
            LocalisedText localisedText = objectFactoryExtractData.createLocalisedText();
            localisedText.setLanguage(LanguageCode.fromValue("de")); // TODO
            localisedText.setText(plrTheme.getText());
            theme.setText(localisedText);
            
            if (!plrTheme.isHasdata()) {
                extract.getThemeWithoutData().add(theme);
            } else {
                if (plrTheme.isConcerned()) {
                    extract.getConcernedTheme().add(theme);
                } else {
                    extract.getNotConcernedTheme().add(theme);
                }
            }
        }
        
        // Extract flavour
        extract.setIsReduced(isReduced);
        
        extractByIdResponseType.setExtract(extract);
        return extractByIdResponseType;
    }

}
