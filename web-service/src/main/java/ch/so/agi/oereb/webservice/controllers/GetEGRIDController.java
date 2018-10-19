package ch.so.agi.oereb.webservice.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ch.admin.geo.schemas.v_d.oereb._1_0.extract.GetEGRIDResponseType;
import ch.so.agi.oereb.webservice.services.GetEGRIDResponseTypeServiceImpl;

//200: OK, Antwort konnte erstellt werden
//204: Kein Grundstück gefunden 
//500: Andere Fehler 

@RestController
public class GetEGRIDController {
    private final Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    private GetEGRIDResponseTypeServiceImpl getEGRIDResponseTypeService;
    
    @RequestMapping(value="/getegrid/{format:xml}/", method=RequestMethod.GET,
            produces={MediaType.APPLICATION_XML_VALUE},
            params={"XY"})
    public ResponseEntity<?> getEgridByXY (
            @PathVariable("format") String format,
            @RequestParam(value = "XY") String xy) {
                
        double[] coords = validateCoordinateRequestParam(xy);
        GetEGRIDResponseType getEGRIDResponseType = getEGRIDResponseTypeService.getGetEGRIDResponseTypeByXY(coords[0], coords[1]);
        
        if (getEGRIDResponseType.getEgridAndNumberAndIdentDN().size() == 0) {
            log.warn("No egrid found at: " + xy);
            return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
        }
        return ResponseEntity.ok(getEGRIDResponseType);
        
    }

    // For both coordinate request methods (XY, GNSS), 
    // the request parameter must be two doubles, separated with a comma.
    private double[] validateCoordinateRequestParam(String coordinate) {
        String[] parts = coordinate.split(",");
        if (parts.length != 2) {
            throw new IllegalArgumentException("Request parameter 'XY' / 'GNSS' not in correct format");
        }
        
        double[] coords = new double[2];
        coords[0] = Double.parseDouble(parts[0]);
        coords[1] = Double.parseDouble(parts[1]);

        return coords;
    }

    @ExceptionHandler({IllegalArgumentException.class, NumberFormatException.class})
    private ResponseEntity<?> handleBadRequests(Exception e) {
        log.error(e.getMessage());      
        return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
