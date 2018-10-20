package ch.so.agi.oereb.webservice.services;

import java.util.Iterator;
import java.util.List;

import javax.xml.bind.JAXBElement;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ch.so.agi.oereb.webservice.dao.EgridDAOImpl;
import ch.so.agi.oereb.webservice.dao.ParcelDAOImpl;
import ch.so.agi.oereb.webservice.models.Egrid;
import ch.so.agi.oereb.webservice.models.Parcel;
import ch.admin.geo.schemas.v_d.oereb._1_0.extract.GetEGRIDResponseType;
import ch.admin.geo.schemas.v_d.oereb._1_0.extract.ObjectFactory;

@Service
public class GetEGRIDResponseTypeServiceImpl implements GetEGRIDResponseTypeService {
    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ParcelDAOImpl parcelDAO;
    
    @Override
    public GetEGRIDResponseType getGetEGRIDResponseTypeByXY(double easting, double northing) {        
        List<Parcel> parcelList = parcelDAO.getParcelByXY(easting, northing);
        return createGetEGRIDResponseType(parcelList);
    }
    
    private GetEGRIDResponseType createGetEGRIDResponseType(List<Parcel> parcelList) {
        ObjectFactory objectFactory = new ObjectFactory();
        GetEGRIDResponseType getEGRIDResponseType = objectFactory.createGetEGRIDResponseType();

        for (Iterator<Parcel> it = parcelList.iterator(); it.hasNext();) {
            Parcel parcelObj = it.next();            
            JAXBElement<String> egridEl = objectFactory.createGetEGRIDResponseTypeEgrid(parcelObj.getEgrid());
            getEGRIDResponseType.getEgridAndNumberAndIdentDN().add(egridEl);

            JAXBElement<String> numberEl = objectFactory.createGetEGRIDResponseTypeNumber(parcelObj.getNumber());
            getEGRIDResponseType.getEgridAndNumberAndIdentDN().add(numberEl);
            
            JAXBElement<String> identdnEl = objectFactory.createGetEGRIDResponseTypeIdentDN(parcelObj.getIdentdn());
            getEGRIDResponseType.getEgridAndNumberAndIdentDN().add(identdnEl);
        }
        return getEGRIDResponseType;
    }
}
