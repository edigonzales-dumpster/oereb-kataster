package ch.so.agi.oereb.webservice.services;

import java.util.Iterator;
import java.util.List;

import javax.xml.bind.JAXBElement;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ch.so.agi.oereb.webservice.dao.EgridDAOImpl;
import ch.so.agi.oereb.webservice.models.Egrid;

import ch.admin.geo.schemas.v_d.oereb._1_0.extract.GetEGRIDResponseType;
import ch.admin.geo.schemas.v_d.oereb._1_0.extract.ObjectFactory;

@Service
public class GetEGRIDResponseTypeServiceImpl implements GetEGRIDResponseTypeService {
    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private EgridDAOImpl egridDAO;
    
    @Override
    public GetEGRIDResponseType getGetEGRIDResponseTypeByXY(double easting, double northing) {        
        List<Egrid> egridList = egridDAO.getEgridByXY(easting, northing);
        return createGetEGRIDResponseType(egridList);
    }
    
    private GetEGRIDResponseType createGetEGRIDResponseType(List<Egrid> egridList) {
        ObjectFactory objectFactory = new ObjectFactory();
        GetEGRIDResponseType getEGRIDResponseType = objectFactory.createGetEGRIDResponseType();

        for (Iterator<Egrid> it = egridList.iterator(); it.hasNext();) {
            Egrid egridObj = it.next();            
                JAXBElement<String> egridEl = objectFactory.createGetEGRIDResponseTypeEgrid(egridObj.getEgrid());
                getEGRIDResponseType.getEgridAndNumberAndIdentDN().add(egridEl);
    
                JAXBElement<String> numberEl = objectFactory.createGetEGRIDResponseTypeNumber(egridObj.getNumber());
                getEGRIDResponseType.getEgridAndNumberAndIdentDN().add(numberEl);
                
                JAXBElement<String> identdnEl = objectFactory.createGetEGRIDResponseTypeIdentDN(egridObj.getIdentdn());
                getEGRIDResponseType.getEgridAndNumberAndIdentDN().add(identdnEl);
        }
        return getEGRIDResponseType;
    }
}
