package com.ccn.vis.data;

import java.io.File;
import java.io.StringWriter;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.w3c.dom.Text;

public class SampleXML {
	public static void main(String args[]) throws Exception{
		DocumentBuilderFactory domFactory = DocumentBuilderFactory.newInstance(); 
		domFactory.setIgnoringComments(true);
		DocumentBuilder builder = domFactory.newDocumentBuilder(); 
		Document doc = builder.parse(new File("C:/Files/file.xml")); 

		NodeList nodes = doc.getElementsByTagName("CustomerId");
		Text a = doc.createTextNode("value"); 
		Element p = doc.createElement("newNode");
		p.appendChild(a); 
		
		System.out.println(nodes.item(0).getParentNode());
		nodes.item(0).getParentNode().insertBefore(p, nodes.item(0));
		
		
		Transformer transformer = TransformerFactory.newInstance().newTransformer();
		//transformer.setOutputProperty(OutputKeys.INDENT, "yes");
		DOMSource source = new DOMSource(doc);
		StreamResult result = new StreamResult(new StringWriter());
		transformer.transform(source, result);

		String xmlOutput = result.getWriter().toString();
		System.out.println(xmlOutput);
	}
}
