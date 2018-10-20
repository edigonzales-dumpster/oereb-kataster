<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" version="1.1.0" xmlns:se="http://www.opengis.net/se" xmlns:xlink="http://www.w3.org/1999/xlink" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
 <NamedLayer>
  <se:Name>ch.so.arp.nutzungsplanung.grundnutzung.oereb</se:Name>
  <UserStyle>
   <se:Name>default</se:Name>
   <se:FeatureTypeStyle>
    <se:Rule>
     <se:Name>Wohnzone 1 G</se:Name>
     <se:Description>
      <se:Title>Wohnzone 1 G</se:Title>
      <se:Abstract>1110 Wohnzone 1 G</se:Abstract>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N110</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#ffff00</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Wohnzone 2 G</se:Name>
     <se:Description>
      <se:Title>Wohnzone 2 G</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N111</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#ffa600</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Wohnzone 3 G</se:Name>
     <se:Description>
      <se:Title>Wohnzone 3 G</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N112</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#e66900</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Wohnzone 4 G</se:Name>
     <se:Description>
      <se:Title>Wohnzone 4 G</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N113</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Wohnzone 5 G</se:Name>
     <se:Description>
      <se:Title>Wohnzone 5 G</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N114</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#c30000</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Wohnzone 6 G</se:Name>
     <se:Description>
      <se:Title>Wohnzone 6 G</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N115</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#ac1f0c</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Wohnzone 7 G und grösser</se:Name>
     <se:Description>
      <se:Title>Wohnzone 7 G und grösser</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N116</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#73180e</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Zone für Terrassenhäuser / Terrassensiedlung</se:Name>
     <se:Description>
      <se:Title>Zone für Terrassenhäuser / Terrassensiedlung</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N117</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#350000</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Gewerbezone ohne Wohnen</se:Name>
     <se:Description>
      <se:Title>Gewerbezone ohne Wohnen</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N120</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#6000c0</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Industriezone</se:Name>
     <se:Description>
      <se:Title>Industriezone</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N121</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#9655d7</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Arbeitszone</se:Name>
     <se:Description>
      <se:Title>Arbeitszone</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N122</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#cc99ff</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Gewerbezone mit Wohnen / Mischzone</se:Name>
     <se:Description>
      <se:Title>Gewerbezone mit Wohnen / Mischzone</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N130</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#f8c8c6</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Gewerbezone mit Wohnen / Mischzone 2 G</se:Name>
     <se:Description>
      <se:Title>Gewerbezone mit Wohnen / Mischzone 2 G</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N131</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#f3a09b</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Gewerbezone mit Wohnen / Mischzone 3 G</se:Name>
     <se:Description>
      <se:Title>Gewerbezone mit Wohnen / Mischzone 3 G</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N132</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#ed817c</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Gewerbezone mit Wohnen / Mischzone 4 G und grösser</se:Name>
     <se:Description>
      <se:Title>Gewerbezone mit Wohnen / Mischzone 4 G und grösser</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N133</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#fa6a62</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Zonen für publikumsintensive Anlagen</se:Name>
     <se:Description>
      <se:Title>Zonen für publikumsintensive Anlagen</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N134</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#be403a</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Kernzone</se:Name>
     <se:Description>
      <se:Title>Kernzone</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N140</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#e8d6c9</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Zentrumszone</se:Name>
     <se:Description>
      <se:Title>Zentrumszone</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N141</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#d9b399</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Erhaltungszone</se:Name>
     <se:Description>
      <se:Title>Erhaltungszone</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N142</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#db9769</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Zone für öffentliche Bauten</se:Name>
     <se:Description>
      <se:Title>Zone für öffentliche Bauten</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N150</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#6a6a6a</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Zone für öffentliche Anlagen</se:Name>
     <se:Description>
      <se:Title>Zone für öffentliche Anlagen</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N151</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#8c8c8c</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Grün- und Freihaltezone innerhalb Bauzone</se:Name>
     <se:Description>
      <se:Title>Grün- und Freihaltezone innerhalb Bauzone</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N160</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#80ff33</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>kommunale Uferschutzzone innerhalb Bauzone</se:Name>
     <se:Description>
      <se:Title>kommunale Uferschutzzone innerhalb Bauzone</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N161</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#c2ff9b</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Landwirtschaftliche Kernzone</se:Name>
     <se:Description>
      <se:Title>Landwirtschaftliche Kernzone</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N162</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#7fc256</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Weilerzone</se:Name>
     <se:Description>
      <se:Title>Weilerzone</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N163</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#4a8f1f</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>weitere eingeschränkte Bauzonen</se:Name>
     <se:Description>
      <se:Title>weitere eingeschränkte Bauzonen</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N169</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#275809</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Zone für Freizeit und Erholung</se:Name>
     <se:Description>
      <se:Title>Zone für Freizeit und Erholung</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N170</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#ff99ff</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Verkehrszonen innerhalb Baugebiet</se:Name>
     <se:Description>
      <se:Title>Verkehrszonen innerhalb Baugebiet</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N180</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#cccccc</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Spezialzone</se:Name>
     <se:Description>
      <se:Title>Spezialzone</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N190</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#e0d4ff</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Landwirtschaftszone</se:Name>
     <se:Description>
      <se:Title>Landwirtschaftszone</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N210</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#dbffe0</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Rebbauzone</se:Name>
     <se:Description>
      <se:Title>Rebbauzone</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N230</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#bfff66</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>spezielle Landwirtschaftszone</se:Name>
     <se:Description>
      <se:Title>spezielle Landwirtschaftszone</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N220</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#e0f294</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>weitere Landwirtschaftszonen</se:Name>
     <se:Description>
      <se:Title>weitere Landwirtschaftszonen</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N290</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#bfff66</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#000000</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
       <se:SvgParameter name="stroke-dasharray">4 4</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>kommunale Naturschutzzone</se:Name>
     <se:Description>
      <se:Title>kommunale Naturschutzzone</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N310</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#4dff73</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Waldrandschutzzone</se:Name>
     <se:Description>
      <se:Title>Waldrandschutzzone</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N311</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#b0f9bf</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>weitere Schutzzonen für Lebensräume und Landschaften</se:Name>
     <se:Description>
      <se:Title>weitere Schutzzonen für Lebensräume und Landschaften</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N319</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#03df2f</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Gewässer</se:Name>
     <se:Description>
      <se:Title>Gewässer</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N320</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#99f2ff</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>weitere Zonen für Gewässer und ihre Ufer</se:Name>
     <se:Description>
      <se:Title>weitere Zonen für Gewässer und ihre Ufer</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N329</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#14b2ff</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>weitere Schutzzonen ausserhalb Bauzonen</se:Name>
     <se:Description>
      <se:Title>weitere Schutzzonen ausserhalb Bauzonen</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N390</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#4dff73</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#000000</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
       <se:SvgParameter name="stroke-dasharray">4 4</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Verkehrsfläche Strasse</se:Name>
     <se:Description>
      <se:Title>Verkehrsfläche Strasse</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N420</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#e2e2e2</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#0a1012</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Verkehrsfläche Bahnareal</se:Name>
     <se:Description>
      <se:Title>Verkehrsfläche Bahnareal</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N421</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#fadfc6</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#000000</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Verkehrsfläche Flugplatzareal</se:Name>
     <se:Description>
      <se:Title>Verkehrsfläche Flugplatzareal</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N422</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#c9ecd3</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#000000</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>weitere Verkehrsflächen</se:Name>
     <se:Description>
      <se:Title>weitere Verkehrsflächen</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N429</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#ffdbf6</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#010102</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Reservezone Wohnzone, Mischzone, Kernzone und Zentrumszone</se:Name>
     <se:Description>
      <se:Title>Reservezone Wohnzone, Mischzone, Kernzone und Zentrumszone</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N430</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#cecdcd</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Reservezone Arbeiten</se:Name>
     <se:Description>
      <se:Title>Reservezone Arbeiten</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N431</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#a1a1a1</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Reservezone OeBA</se:Name>
     <se:Description>
      <se:Title>Reservezone OeBA</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N432</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#585858</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Reservezone</se:Name>
     <se:Description>
      <se:Title>Reservezone</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N439</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#e6e6e6</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Wald</se:Name>
     <se:Description>
      <se:Title>Wald</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N440</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#4db300</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Golfzone</se:Name>
     <se:Description>
      <se:Title>Golfzone</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N490</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#06c8c8</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Abbauzone</se:Name>
     <se:Description>
      <se:Title>Abbauzone</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N491</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#3fe7e7</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Deponiezone</se:Name>
     <se:Description>
      <se:Title>Deponiezone</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N492</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#8bf5f5</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>weitere Bauzonen nach Art. 18 RPG ausserhalb Bauzonen</se:Name>
     <se:Description>
      <se:Title>weitere Bauzonen nach Art. 18 RPG ausserhalb Bauzonen</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>artcode</ogc:PropertyName>
       <ogc:Literal>N499</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#ccffff</se:SvgParameter>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
   </se:FeatureTypeStyle>
  </UserStyle>
 </NamedLayer>
</StyledLayerDescriptor>
