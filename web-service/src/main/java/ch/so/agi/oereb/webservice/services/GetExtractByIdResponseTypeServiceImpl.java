package ch.so.agi.oereb.webservice.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.xml.datatype.DatatypeConfigurationException;

import org.springframework.stereotype.Service;

import ch.admin.geo.schemas.v_d.oereb._1_0.extract.GetExtractByIdResponseType;
import ch.admin.geo.schemas.v_d.oereb._1_0.extractdata.Extract;

@Service
public class GetExtractByIdResponseTypeServiceImpl implements GetExtractByIdResponseTypeService {
    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @Override
    public GetExtractByIdResponseType getExtractById(String egrid, boolean isReduced, boolean withGeometry,
            boolean withImages) throws DatatypeConfigurationException {

        ch.admin.geo.schemas.v_d.oereb._1_0.extract.ObjectFactory objectFactoryExtract = 
                new ch.admin.geo.schemas.v_d.oereb._1_0.extract.ObjectFactory();
        
        ch.admin.geo.schemas.v_d.oereb._1_0.extractdata.ObjectFactory objectFactoryExtractData =
                new ch.admin.geo.schemas.v_d.oereb._1_0.extractdata.ObjectFactory();

        GetExtractByIdResponseType extractByIdResponseType = objectFactoryExtract.createGetExtractByIdResponseType();

        Extract extract = objectFactoryExtractData.createExtract();

        // Information zum Grundstück einmalig abholen?
        // - Geometrie
        // - Gemeinde / BFS-Nr.
        // - Typ
        // - NBIdent
        // - Egrid
        
        
        extract.setIsReduced(isReduced);
        
        extractByIdResponseType.setExtract(extract);
        return extractByIdResponseType;
    }

}
