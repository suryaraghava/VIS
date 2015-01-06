package com.ccn.vis.data;

import java.io.File;

import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.Element;

public class XMLNode {
	public static Document returnDocument(String xmlPath) throws ParserConfigurationException, Exception, IOException{
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		//Build Document
		Document document = builder.parse(new File(xmlPath));
		document.getDocumentElement().normalize();
		return document;
	}
	
	public static NodeList returnNodeList(Document document){
		NodeList nList = document.getElementsByTagName("MainServer");
		return nList;

	}
	public static void transformDoc(Document doc,String str) throws Exception{

		TransformerFactory transformerFactory = TransformerFactory.newInstance();
		Transformer transformer = transformerFactory.newTransformer();
		DOMSource source = new DOMSource(doc);
		StreamResult result = new StreamResult(new File(str));
		transformer.transform(source, result);
	}

	public static void createElement(Node node,Document doc,String server,String hostname,String ipaddress,String desc,String mainServer,String side,NodeList nList) {
		Element subServer = doc.createElement("SubServer");
		Attr atr=doc.createAttribute("name");
		atr.setValue(server);
		Attr atr1=doc.createAttribute("status");
		atr1.setValue("1");
		Attr atr2=doc.createAttribute("side");
		atr1.setValue(side);
		subServer.setAttributeNode(atr);
		subServer.setAttributeNode(atr1);
		subServer.setAttributeNode(atr2);
		
		Element hostelement=doc.createElement("host");
		Element ipelement=doc.createElement("ip");
		Element descelement=doc.createElement("desc");
		hostelement.appendChild(doc.createTextNode(hostname));
		ipelement.appendChild(doc.createTextNode(ipaddress));
		descelement.appendChild(doc.createTextNode(desc));
		subServer.appendChild(hostelement);
		subServer.appendChild(ipelement);
		subServer.appendChild(descelement);
		nList.item(0).appendChild(subServer);
		
		
	}
}
