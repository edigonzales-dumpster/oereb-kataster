@GrabConfig(systemClassLoader=true)
@Grab(group='org.postgresql', module='postgresql', version='42.2.2')

import groovy.xml.*
import groovy.sql.*

import java.net.URLEncoder
import java.nio.file.Files

def dbUrl = "jdbc:postgresql://192.168.50.8/oereb"
def dbUser = "ddluser"
def dbPassword = "ddluser"
def dbDriver = "org.postgresql.Driver"

def sql = Sql.newInstance(dbUrl, dbUser, dbPassword, dbDriver)
/*
// Muss generischer werden (`subthema`)
// Resp. vielleicht kann gejoined werden via "darstellungsdienst".
def stmt = """
SELECT DISTINCT
  artcode
FROM
  arp_npl_oereb.transferstruktur_legendeeintrag
WHERE
  subthema = 'Grundnutzung_Zonenflaeche'
ORDER BY
  artcode
;
"""

sql.eachRow(stmt) { row ->
    println row["artcode"]
}
*/


def baseUrl = "http://192.168.50.8/cgi-bin/qgis_mapserv.fcgi?map=/vagrant/qgis/wms/ch.so.arp.nutzungsplanung.oereb.qgs"
def layerName = "ch.so.arp.nutzungsplanung.grundnutzung.oereb"

def sldFile = new File(layerName+".sld")
sldFile.newWriter()
//println baseUrl + "&SERVICE=WMS&REQUEST=GetStyles&LAYERS=" + layerName + "&SLD_VERSION=1.1.0"
sldFile << new URL(baseUrl + "&SERVICE=WMS&REQUEST=GetStyles&LAYERS=" + layerName + "&SLD_VERSION=1.1.0").getText()

def xml = new XmlSlurper().parse(layerName+".sld")

xml.NamedLayer.UserStyle.FeatureTypeStyle.Rule.each { rule ->
    println rule.Name
    def ruleName = rule.Name.toString()

    // Hier geht es wohl nicht ohne Bedingungen, die man zusammen abmacht.
    // Dh. ich muss irgendwie die Zuweisung der Regel (resp. des Names) zum
    // ArtCode machen können. 
    // Eventuell Artcode in "Abstract" reinschreiben.
    // Davon ausgehen, dass der Filter immer genau gleich aufgebaut ist
    // (z.B. PropertyIsEqualTo), kann ich ja nicht.
    println rule.Filter.PropertyIsEqualTo.Literal
    def artCode = rule.Filter.PropertyIsEqualTo.Literal.toString()

    def encodedRuleName = URLEncoder.encode(ruleName, "UTF-8");
    println encodedRuleName

    // Grösse des Images plusminus berechnet für die 300 dpi. (WMS-Spec ist circa 90 dpi).
    //def legendGraphicUrl = baseUrl + "&SERVICE=WMS&REQUEST=GetLegendGraphic&LAYER=" + layerName + "&FORMAT=image/png&RULELABEL=false&LAYERTITLE=false&RULE=" + encodedRuleName + "&HEIGHT=70&WIDTH=94&SYMBOLHEIGHT=6&SYMBOLWIDTH=8&DPI=300" 
    def legendGraphicUrl = baseUrl + "&SERVICE=WMS&REQUEST=GetLegendGraphic&LAYER=" + layerName + "&FORMAT=image/png&RULELABEL=false&LAYERTITLE=false&RULE=" + encodedRuleName + "&HEIGHT=35&WIDTH=70&SYMBOLHEIGHT=3&SYMBOLWIDTH=6&DPI=300" 
    println legendGraphicUrl


      
    try {
        def fileName = ruleName.toString().replaceAll(" ","_").replaceAll("/","-") + "_" + artCode + ".png"
        def iconFile = new File(fileName).newOutputStream()
        iconFile << new URL(legendGraphicUrl).openStream()
        iconFile.close()

        byte[] fileContent = Files.readAllBytes(new File(fileName).toPath())

        sql.executeUpdate "UPDATE arp_npl_oereb.transferstruktur_legendeeintrag SET legendetext_de = $ruleName, symbol = $fileContent WHERE artcode = $artCode"
    } catch (java.io.FileNotFoundException e) {
        println e.getMessage()
    }
    
    println "******"   
}



sql.close()

