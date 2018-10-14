@GrabConfig(systemClassLoader=true)
@Grab(group='org.postgresql', module='postgresql', version='42.2.2')

import groovy.xml.*
import java.net.URLEncoder

def baseUrl = "http://192.168.50.8/cgi-bin/qgis_mapserv.fcgi?map=/vagrant/qgis/wms/ch.so.arp.nutzungsplanung.oereb.qgs"
def layerName = "ch.so.arp.nutzungsplanung.grundnutzung.oereb"

def sldFile = new File(layerName+".sld")
sldFile.newWriter()
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
    def legendGraphicUrl = baseUrl + "&SERVICE=WMS&REQUEST=GetLegendGraphic&LAYER=" + layerName + "&FORMAT=image/png&RULELABEL=false&LAYERTITLE=false&RULE=" + encodedRuleName + "&HEIGHT=70&WIDTH=94&SYMBOLHEIGHT=6&SYMBOLWIDTH=8&DPI=300" 
    println legendGraphicUrl

    try {
        def iconFile = new File(ruleName.toString().replaceAll(" ","_").replaceAll("/","-") + "_" + artCode + ".png").newOutputStream()
        iconFile << new URL(legendGraphicUrl).openStream()
        iconFile.close()
    } catch (java.io.FileNotFoundException e) {
        println e.getMessage()
    }

    println "******"   
}

