# WFS zu Wasserentnahmestellen

## INSPIRE

Es findet sich auch ein INSPIRE-Datensatz, der aber nicht alle Informationen zu
enthalten scheint:

http://www.brandenburg-forst.de/inspire/dls/fuek_wes/

## WFS

https://geoportal.brandenburg.de/de/geoportal-brandenburg/portal/gp-entwicklung/anwendungen/dienste/psv/landesbetrieb-forst-lfb/bGFuZC1sZmItYmI=/

Dort bei "Wasserentnahmestellen im Land Brandenburg - WMS" auf das (i)-Symbol klicken.
Auf der folgenden Seite auf "XML-Datei öffnen" führt zu dieser Datei:

https://geoportal.brandenburg.de/gs-json/xml?fileid=EE4C8A1C-FB73-4F6F-8C36-1D09B2217B17

Hier findet sich folgender Schnipsel:

    <gmd:transferOptions>
      <gmd:MD_DigitalTransferOptions>
        <gmd:onLine>
          <gmd:CI_OnlineResource>
            <gmd:linkage>
              <gmd:URL>https://www.brandenburg-forst.de/geoserver/WES/wms?REQUEST=GetCapabilities&SERVICE=WMS</gmd:URL>
            </gmd:linkage>
            <gmd:name>
              <gco:CharacterString>Dienst "Wasserentnahmestellen im Land Brandenburg - WMS" (GetCapabilities)</gco:CharacterString>
            </gmd:name>
            <gmd:function>
              <gmd:CI_OnLineFunctionCode codeList="http://standards.iso.org/iso/19139/resources/gmxCodelists.xml#CI_OnLineFunctionCode" codeListValue="information">information</gmd:CI_OnLineFunctionCode>
            </gmd:function>
          </gmd:CI_OnlineResource>
        </gmd:onLine>
      </gmd:MD_DigitalTransferOptions>
    </gmd:transferOptions>

Dort findet sich also der WMS, welcher sich auch als WFS abfragen lässt:

* https://www.brandenburg-forst.de/geoserver/WES/wms?REQUEST=GetCapabilities&SERVICE=WFS
* https://www.brandenburg-forst.de/geoserver/WES/wms?REQUEST=DescribeFeatureType&VERSION=2.0.0&SERVICE=WFS

## Datentypen abfragen

https://www.brandenburg-forst.de/geoserver/WES/wms?REQUEST=DescribeFeatureType&VERSION=2.0.0&SERVICE=WFS

    <?xml version="1.0" encoding="UTF-8"?><xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:WES="Wasserentnahmestellen" xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:wfs="http://www.opengis.net/wfs/2.0" elementFormDefault="qualified" targetNamespace="Wasserentnahmestellen">
      <xsd:import namespace="http://www.opengis.net/gml/3.2" schemaLocation="https://www.brandenburg-forst.de/geoserver/schemas/gml/3.2.1/gml.xsd"/>
      <xsd:complexType name="wesType">
        <xsd:complexContent>
          <xsd:extension base="gml:AbstractFeatureType">
            <xsd:sequence>
              <xsd:element maxOccurs="1" minOccurs="0" name="fstatus" nillable="true" type="xsd:short"/>
              <xsd:element maxOccurs="1" minOccurs="0" name="akz" nillable="true" type="xsd:string"/>
              <xsd:element maxOccurs="1" minOccurs="0" name="baujahr" nillable="true" type="xsd:string"/>
              <xsd:element maxOccurs="1" minOccurs="0" name="fkt_faehig" nillable="true" type="xsd:short"/>
              <xsd:element maxOccurs="1" minOccurs="0" name="bemerkung" nillable="true" type="xsd:string"/>
              <xsd:element maxOccurs="1" minOccurs="0" name="oart" nillable="true" type="xsd:short"/>
              <xsd:element maxOccurs="1" minOccurs="0" name="menge" nillable="true" type="xsd:short"/>
              <xsd:element maxOccurs="1" minOccurs="0" name="rechts_w" nillable="true" type="xsd:int"/>
              <xsd:element maxOccurs="1" minOccurs="0" name="hoch_w" nillable="true" type="xsd:int"/>
              <xsd:element maxOccurs="1" minOccurs="0" name="land" nillable="true" type="xsd:int"/>
              <xsd:element maxOccurs="1" minOccurs="0" name="gdb_geomattr_data" nillable="true" type="xsd:hexBinary"/>
              <xsd:element maxOccurs="1" minOccurs="0" name="shape" nillable="true" type="gml:GeometryPropertyType"/>
            </xsd:sequence>
          </xsd:extension>
        </xsd:complexContent>
      </xsd:complexType>
      <xsd:element name="wes" substitutionGroup="gml:AbstractFeature" type="WES:wesType"/>
    </xsd:schema>

## Daten holen

* https://www.brandenburg-forst.de/geoserver/WES/wfs?REQUEST=GetFeature&SERVICE=WFS&VERSION=2.0.0&TYPENAMES=wes&OUTPUTFORMAT=gml2
* https://www.brandenburg-forst.de/geoserver/WES/wfs?REQUEST=GetFeature&SERVICE=WFS&VERSION=2.0.0&TYPENAMES=wes&OUTPUTFORMAT=csv
* https://www.brandenburg-forst.de/geoserver/WES/wfs?REQUEST=GetFeature&SERVICE=WFS&VERSION=2.0.0&TYPENAMES=wes&OUTPUTFORMAT=json
