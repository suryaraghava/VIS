/*package com.ccn.vis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import com.ccn.vis.data.User;
import com.ccn.vis.data.XMLNode;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import javax.servlet.http.HttpServletRequest;

@Controller
//@RequestMapping("/vis/cba")
public class VisController {

	@RequestMapping(value = "/vis/cbatest", method = RequestMethod.POST,headers={"Accept=application/json"},produces="application/json")
	public @ResponseBody User testConnection(HttpServletRequest req)throws Exception
	{
		User usrData =  new User();
		boolean flag=false;
		String status="no";

		String ipAddress=req.getParameter("ip");
		if(ipAddress==null || ipAddress == "" || ipAddress.equals(" ")){
			ipAddress = "0.0.0.0";
		}
		try{
			flag=InetAddress.getByName(ipAddress).isReachable(5000);

			if(flag)
			{
				status="ok";
				usrData.setHost(InetAddress.getByName(ipAddress).getHostName().toString());
			}else{
				status="fail";
			}
			usrData.setAns(status);
		}
		catch(UnknownHostException e)
		{
			usrData.setAns("fail");
			e.printStackTrace();
		}
		catch(IOException io)
		{
			io.printStackTrace();
		}catch(NullPointerException np){
			np.printStackTrace();
		}

		return usrData;		
	}

	@RequestMapping(value = "/vis/cbadelete", method = RequestMethod.POST,headers={"Accept=application/json"},produces="application/json")
	public @ResponseBody User delete(HttpServletRequest req)throws Exception
	{
		User usrData =  new User();
		String server= req.getParameter("subServerName");
		Document doc = XMLNode.returnDocument();
		NodeList nList = XMLNode.returnNodeList(doc);
		for (int i = 0; i < nList.getLength(); i++)
		{
			Node node = nList.item(i);
			if (node.getNodeType() == Node.ELEMENT_NODE)
			{        
				Element eElement = (Element) node;
				//String mainServerName=eElement.getAttribute("name");
				NodeList nnlist=eElement.getElementsByTagName("SubServer");
				for (int j=0;j<nnlist.getLength();j++)
				{
					Node snode=nnlist.item(j);
					if(snode.getNodeType()==Node.ELEMENT_NODE)
					{ 
						Element subeElement=(Element)snode;
						if(server.equalsIgnoreCase(subeElement.getAttribute("name")))
						{
							eElement.removeChild(snode);
						}
					}
				}	
			}
		}
		XMLNode.transformDoc(doc);		
		return usrData;
	}

	@RequestMapping(value = "/vis/cbaSave", method = RequestMethod.POST,headers={"Accept=application/json"},produces="application/json")
	public @ResponseBody User updateXml(HttpServletRequest req)throws Exception
	{
		String server= req.getParameter("subServerName");
		String hostname=req.getParameter("host");
		String ipaddress=req.getParameter("ip");
		String desc=req.getParameter("description");
		String mainServer = req.getParameter("mainServer");
		String side = req.getParameter("side");
		User usrData =  new User();
		boolean flag=false;
		String status="no";

		String ipAddress=req.getParameter("ip");
		if(ipAddress==null || ipAddress == "" || ipAddress.equals(" ")){
			ipAddress = "0.0.0.0";
		}
		flag=InetAddress.getByName(ipAddress).isReachable(5000);

		if(flag)
		{
			status="ok";
			usrData.setHost(InetAddress.getByName(ipAddress).getHostName().toString());
			server= req.getParameter("subServerName");
			hostname=req.getParameter("host");
			ipaddress=req.getParameter("ip");
			desc=req.getParameter("description");
			mainServer = req.getParameter("mainServer");
			side = req.getParameter("side");

			//System.out.println("server:"+server+",hostname:"+hostname+",ipaddress:"+ipaddress+",desc"+desc+",Main Server:"+mainServer+",Side:"+side);

			Document doc = XMLNode.returnDocument();
			NodeList nList = XMLNode.returnNodeList(doc);

			for (int i = 0; i < nList.getLength(); i++)
			{
			System.out.println("Name:"+nList.item(i).getAttributes().item(0).toString());
			System.out.println("Side:"+nList.item(i).getAttributes().item(1).toString());
			System.out.println("=====================================================");
			//System.out.println("C:"+nList.item(1).getAttributes().item(0).toString());
			//System.out.println("D:"+nList.item(1).getAttributes().item(1).toString());
			//System.out.println("BB:"+side);
				//if(nList.item(i).getAttributes().item(0).toString().equalsIgnoreCase(mainServer)&&nList.item(i).getAttributes().item(1).toString().equalsIgnoreCase(side)){
					Node node = nList.item(i);

					if (node.getNodeType() == Node.ELEMENT_NODE){
						XMLNode.createElement(node,doc,server,hostname,ipaddress,desc,mainServer,side,nList);
						XMLNode.transformDoc(doc);
					}
				//}
			}
		}else{
			status="fail";
		}
		usrData.setAns(status);

		return usrData;
	}
}
 */

package com.ccn.vis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;



import com.ccn.vis.data.User;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

@Controller
//@RequestMapping("/vis/cba")
public class VisController {

	@RequestMapping(value = "/vis/cbatest", method = RequestMethod.POST,headers={"Accept=application/json"},produces="application/json")
	public @ResponseBody User testConnection(HttpServletRequest req)throws Exception
	{
		User usrData =  new User();
		boolean flag=false;
		String status="no";

		String ipAddress=req.getParameter("ip");
		System.out.println(ipAddress);
		if(ipAddress==null || ipAddress == "" || ipAddress.equals(" ")){
			ipAddress = "0.0.0.0";
		}
		try{
			flag=InetAddress.getByName(ipAddress).isReachable(6000);

			if(flag)
			{
				status="ok";
				usrData.setHost(InetAddress.getByName(ipAddress).getHostName().toString());
			}else{
				status="fail";
			}
			usrData.setAns(status);
		}
		catch(UnknownHostException e)
		{
			usrData.setAns("fail");
			e.printStackTrace();
		}
		catch(IOException io)
		{
			io.printStackTrace();
		}catch(NullPointerException np){
			np.printStackTrace();
		}
System.out.println(status);
		return usrData;		
	}

	@RequestMapping(value = "/vis/cbadelete", method = RequestMethod.POST,headers={"Accept=application/json"},produces="application/json")
	public @ResponseBody User delete(HttpServletRequest req)throws Exception
	{
		User usrData =  new User();
		String server= req.getParameter("subServerName");
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		//Build Document
		Document document = builder.parse(new File(VisController.class.getResource("/customer.xml").getPath()));        
		//Normalize the XML Structure; It's just too important !!
		document.getDocumentElement().normalize();         
		//Here comes the root node
		Element root = document.getDocumentElement();
		NodeList nList = document.getElementsByTagName("MainServer");
		for (int i = 0; i < nList.getLength(); i++)
		{
			Node node = nList.item(i);
			if (node.getNodeType() == Node.ELEMENT_NODE)
			{
				//Print each employee's detail        
				Element eElement = (Element) node;
				String mainServerName=eElement.getAttribute("name");
				NodeList nnlist=eElement.getElementsByTagName("SubServer");
				for (int j=0;j<nnlist.getLength();j++)
				{
					Node snode=nnlist.item(j);
					if(snode.getNodeType()==Node.ELEMENT_NODE)
					{ 

						Element subeElement=(Element)snode;
						if(server.equalsIgnoreCase(subeElement.getAttribute("name")))
						{
							eElement.removeChild(snode);

						}
					}
				}	
			}
		}
		TransformerFactory transformerFactory = TransformerFactory.newInstance();
		Transformer transformer = transformerFactory.newTransformer();
		DOMSource source = new DOMSource(document);
		StreamResult result = new StreamResult(new File(VisController.class.getResource("/customer.xml").getPath()));
		transformer.transform(source, result);


		return usrData;
	}

	@RequestMapping(value = "/vis/cbaSave", method = RequestMethod.POST,headers={"Accept=application/json"},produces="application/json")
	public @ResponseBody User updateXml(HttpServletRequest req)throws Exception
	{
		System.out.println("AAA");
		User usrData =  new User();
		boolean flag=false;
		String status="no";
		
		String mainServer=req.getParameter("mainServer").toString();
		String side = req.getParameter("side").toString();
		System.out.println("Main Server:"+mainServer);
		System.out.println("Side:"+side);
		String ipAddress=req.getParameter("ip");
		String server= req.getParameter("subServerName");
		String hostname=req.getParameter("host");
		String desc=req.getParameter("description");

		System.out.println("ip ADDRESS:"+ipAddress);

		if(ipAddress==null || ipAddress == "" || ipAddress.equals(" ")){
			ipAddress = "0.0.0.0";
		}
		try{
			/*flag=InetAddress.getByName(ipAddress).isReachable(5000);

			if(flag)
			{*/
				status="ok";
				usrData.setHost(InetAddress.getByName(ipAddress).getHostName().toString());

				DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				DocumentBuilder builder = factory.newDocumentBuilder();
				Document document = builder.parse(new File(VisController.class.getResource("/customer.xml").getPath()));
				document.getDocumentElement().normalize(); 
				Element root = document.getDocumentElement();
				NodeList nList = document.getElementsByTagName("MainServer");

				Element subServer = document.createElement("SubServer");
				Attr atr=document.createAttribute("name");
				atr.setValue(server);
				Attr atr1=document.createAttribute("status");
				atr1.setValue("1");
				Attr atr2=document.createAttribute("side");
				atr2.setValue(side);
				subServer.setAttributeNode(atr);
				subServer.setAttributeNode(atr1);
				subServer.setAttributeNode(atr2);
				Element hostelement=document.createElement("host");
				Element ipelement=document.createElement("ip");
				Element descelement=document.createElement("desc");
				hostelement.appendChild(document.createTextNode(hostname));
				ipelement.appendChild(document.createTextNode(ipAddress));
				descelement.appendChild(document.createTextNode(desc));
				subServer.appendChild(hostelement);
				subServer.appendChild(ipelement);
				subServer.appendChild(descelement);

				nList.item(0).appendChild(subServer);

				TransformerFactory transformerFactory = TransformerFactory.newInstance();
				Transformer transformer = transformerFactory.newTransformer();
				DOMSource source = new DOMSource(document);
				StreamResult result = new StreamResult(new File(VisController.class.getResource("/customer.xml").getPath()));
				transformer.transform(source, result);
			/*}else{
				status="fail";
			}*/
			usrData.setAns(status);
		}
		catch(UnknownHostException e)
		{
			usrData.setAns("fail");
			e.printStackTrace();
		}
		catch(IOException io)
		{
			io.printStackTrace();
		}catch(NullPointerException np){
			np.printStackTrace();
		}
		return usrData;
	}
}