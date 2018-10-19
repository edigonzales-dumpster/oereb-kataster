package ch.so.agi.oereb.webservice.services;

import javax.xml.datatype.DatatypeConfigurationException;

import ch.admin.geo.schemas.v_d.oereb._1_0.extract.GetExtractByIdResponseType;

public interface GetExtractByIdResponseTypeService {
    GetExtractByIdResponseType getExtractById(String egrid, boolean isReduced, boolean withGeometry, boolean withImages) throws DatatypeConfigurationException;
}
