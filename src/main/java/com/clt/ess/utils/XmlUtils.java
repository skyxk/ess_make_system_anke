package com.clt.ess.utils;


import org.w3c.dom.Document;
import org.w3c.dom.Element;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.ByteArrayOutputStream;

public class XmlUtils {


    public static void main(String[] args) {
        createXml();
    }
    private static String createXml() {
        String xmlString = "";

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        try {
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document document = builder.newDocument();
            document.setXmlStandalone(true);

            Element itemInfo = document.createElement("ItemInfo");
            document.appendChild(itemInfo);

            Element itemStatistics = document.createElement("ESSSeal");
            itemStatistics.setTextContent("商品统计");
            itemInfo.appendChild(itemStatistics);


            Element remark = document.createElement("PIC");
            remark.setTextContent("配送");
            itemInfo.appendChild(remark);

            TransformerFactory transFactory = TransformerFactory.newInstance();
            Transformer transformer = transFactory.newTransformer();
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            DOMSource domSource = new DOMSource(document);

            // xml transform String
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            transformer.transform(domSource, new StreamResult(bos));
            xmlString = bos.toString();
            System.out.println(xmlString);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return xmlString;
    }


}
