/*package com.ccn.vis.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import com.ccn.vis.dao.UserDAO;
import com.ccn.vis.data.User;
import com.ccn.vis.data.XMLNode;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

public class VISXMLController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO dao;
		   
    public VISXMLController() {
        dao=new UserDAO();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response){
    	Document document =null;
		try {
			document = XMLNode.returnDocument();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		NodeList nList = XMLNode.returnNodeList(document);
		
    	if(request.getParameter("action")!=null){
    		List<User> lstUser=new ArrayList<User>();
			String action=(String)request.getParameter("action");
			String mainServer=(String)request.getParameter("mainServer");
			String side = (String)request.getParameter("side");
			
			//System.out.println("Main Server:::"+mainServer+":::"+side);
			Gson gson = new Gson();
			response.setContentType("application/json");
			if(action.equals("list")){
				try{
					lstUser=dao.getAllUsers(mainServer,side);
					JsonElement element = gson.toJsonTree(lstUser, new TypeToken<List<User>>() {}.getType());
					
					JsonArray jsonArray = element.getAsJsonArray();
					String listData=jsonArray.toString();
					listData= "{\"Result\":\"OK\",\"Records\":"+listData+"}";
					response.getWriter().print(listData);
					
				}catch(Exception ex){
					String error="{\"Result\":\"ERROR\",\"Message\":"+ex.getMessage()+"}";
					try {
						response.getWriter().print(error);
					} catch (IOException e) {
						e.printStackTrace();
					}
					ex.printStackTrace();
				}
			}else if(action.equals("edit")){
				try{
					String server= request.getParameter("subServerName");
					String hostname=request.getParameter("host");
					String ipaddress=request.getParameter("ip");
					String desc=request.getParameter("description");

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
										NodeList list= subeElement.getChildNodes();
										for (int k = 0; k < list.getLength(); k++) {
											Node childNode = list.item(k);
											if ("host".equals(childNode.getNodeName())) {
												childNode.setTextContent(hostname);
											}
											if ("ip".equals(childNode.getNodeName())) {
												childNode.setTextContent(ipaddress);
											}
											if ("desc".equals(childNode.getNodeName())) {
												childNode.setTextContent(desc);
											}
										}
									}
								}
							}	
						}
					}
					XMLNode.transformDoc(document);
					lstUser=dao.getAllUsers(mainServer,side);
					JsonElement element = gson.toJsonTree(lstUser, new TypeToken<List<User>>() {}.getType());
					JsonArray jsonArray = element.getAsJsonArray();
					String listData=jsonArray.toString();
					listData= "{\"Result\":\"OK\",\"Records\":"+listData+"}";
					response.getWriter().print(listData);
				}catch(Exception ex){
					String error="{\"Result\":\"ERROR\",\"Message\":"+ex.getMessage()+"}";
					try {
						response.getWriter().print(error);
					} catch (IOException e) {
						e.printStackTrace();
					}
					ex.printStackTrace();
				}
			}else if(action.equals("delete")){
				try{
					
					String server= request.getParameter("subServerName");
					for (int i = 0; i < nList.getLength(); i++)
					{
						Node node = nList.item(i);
						if (node.getNodeType() == Node.ELEMENT_NODE)
						{
							Element eElement = (Element) node;
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
					XMLNode.transformDoc(document);
					
					lstUser=dao.getAllUsers(mainServer,side);
					JsonElement element = gson.toJsonTree(lstUser, new TypeToken<List<User>>() {}.getType());
					JsonArray jsonArray = element.getAsJsonArray();
					String listData=jsonArray.toString();
					listData= "{\"Result\":\"OK\",\"Records\":"+listData+"}";
					response.getWriter().print(listData);
				}catch(Exception ex){
					String error="{\"Result\":\"ERROR\",\"Message\":"+ex.getMessage()+"}";
					try {
						response.getWriter().print(error);
					} catch (IOException e) {
						e.printStackTrace();
					}
					ex.printStackTrace();
				}				
			}
    	}
    }
}*/
package com.ccn.vis.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.ccn.vis.dao.UserDAO;
import com.ccn.vis.data.User;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

public class VISXMLController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO dao;
		   
    public VISXMLController() {
        dao=new UserDAO();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doProcess(request, response);
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response){
    	doProcess(request, response);
    }
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response){
    	if(request.getParameter("action")!=null){
    		List<User> lstUser=new ArrayList<User>();
			String action=(String)request.getParameter("action");
			String mainServer=(String)request.getParameter("mainServer");
			String side = (String)request.getParameter("side");
			
			//System.out.println("Main Server:::"+mainServer+":::"+side);
			Gson gson = new Gson();
			response.setContentType("application/json");
			
			if(action.equals("list")){
				try{
					lstUser=dao.getAllUsers(mainServer,side);
					JsonElement element = gson.toJsonTree(lstUser, new TypeToken<List<User>>() {}.getType());
					
					JsonArray jsonArray = element.getAsJsonArray();
					String listData=jsonArray.toString();
					listData= "{\"Result\":\"OK\",\"Records\":"+listData+"}";
					response.getWriter().print(listData);
					
				}catch(Exception ex){
					String error="{\"Result\":\"ERROR\",\"Message\":"+ex.getMessage()+"}";
					try {
						response.getWriter().print(error);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					ex.printStackTrace();
				}
			}
			
			else if(action.equals("edit")){
				System.out.println("In Edit...");				
				try{
					
					String server= request.getParameter("subServerName");
					String hostname=request.getParameter("host");
					String ipaddress=request.getParameter("ip");
					String desc=request.getParameter("description");
					String status = request.getParameter("status");
					String enable = request.getParameter("enable");
					System.out.println("Main_Server:::::"+mainServer);
					System.out.println("Side:"+side);
					System.out.println("Server:"+server);
					System.out.println("Hostname:"+hostname);
					System.out.println("ipaddress:"+ipaddress);
					System.out.println("desc:"+desc);
					System.out.println("status:"+status);
					DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
					DocumentBuilder builder = null;
					try {
						builder = factory.newDocumentBuilder();
					} catch (ParserConfigurationException e) {
						e.printStackTrace();
					}
					//Build Document
					Document document = null;
					try {
						document = builder.parse(new File(VISXMLController.class.getResource("/customer.xml").getPath()));
					} catch (SAXException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
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
							Element eElement = (Element) node;
							String mainServerName=eElement.getAttribute("name");
							String sideName = eElement.getAttribute("side");
							if(mainServerName.equalsIgnoreCase(mainServer)&&side.equalsIgnoreCase(sideName)){
							NodeList nnlist=eElement.getElementsByTagName("SubServer");
							for (int j=0;j<nnlist.getLength();j++)
							{
								Node snode=nnlist.item(j);
								if(snode.getNodeType()==Node.ELEMENT_NODE)
								{ 
									Element subeElement=(Element)snode;
									if(server.equalsIgnoreCase(subeElement.getAttribute("name")))
									{
										NodeList list= subeElement.getChildNodes();
										for (int k = 0; k < list.getLength(); k++) {
											Node childNode = list.item(k);
											if ("host".equals(childNode.getNodeName())) {
												childNode.setTextContent(hostname);
											}
											if ("ip".equals(childNode.getNodeName())) {
												childNode.setTextContent(ipaddress);
											}
											if ("desc".equals(childNode.getNodeName())) {
												childNode.setTextContent(desc);
											}
											if ("enable".equals(childNode.getNodeName())) {
												if(enable.equals("Yes"))
												childNode.setTextContent("1");
												else
													childNode.setTextContent("0");
											}
										}
									}
								}
							}	
							}
						}
					}
					// write the content into xml file
					TransformerFactory transformerFactory = TransformerFactory.newInstance();
					Transformer transformer = null;
					try {
						transformer = transformerFactory.newTransformer();
					} catch (TransformerConfigurationException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					DOMSource source = new DOMSource(document);
					StreamResult result = new StreamResult(new File(VISXMLController.class.getResource("/customer.xml").getPath()));
					try {
						transformer.transform(source, result);
					} catch (TransformerException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					lstUser=dao.getAllUsers(mainServer,side);
					JsonElement element = gson.toJsonTree(lstUser, new TypeToken<List<User>>() {}.getType());
					JsonArray jsonArray = element.getAsJsonArray();
					String listData=jsonArray.toString();
					listData= "{\"Result\":\"OK\",\"Records\":"+listData+"}";
					response.getWriter().print(listData);
				}catch(Exception ex){
					String error="{\"Result\":\"ERROR\",\"Message\":"+ex.getMessage()+"}";
					try {
						response.getWriter().print(error);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					ex.printStackTrace();
				}
			}
			
			else if(action.equals("delete")){
				try{
					
					String server= request.getParameter("subServerName");
					String ipAddress = request.getParameter("ip");
					System.out.println(ipAddress);
					System.out.println(server);
					DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
					DocumentBuilder builder = factory.newDocumentBuilder();
					//Build Document
					Document document = builder.parse(new File(VISXMLController.class.getResource("/customer.xml").getPath()));        
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
							String sideName = eElement.getAttribute("side");
							if(mainServerName.equalsIgnoreCase(mainServer)&&side.equalsIgnoreCase(sideName)){
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
					}
					TransformerFactory transformerFactory = TransformerFactory.newInstance();
					Transformer transformer = transformerFactory.newTransformer();
					DOMSource source = new DOMSource(document);
					StreamResult result = new StreamResult(new File(VISXMLController.class.getResource("/customer.xml").getPath()));
					transformer.transform(source, result);
					
					
					lstUser=dao.getAllUsers(mainServer,side);
					JsonElement element = gson.toJsonTree(lstUser, new TypeToken<List<User>>() {}.getType());
					JsonArray jsonArray = element.getAsJsonArray();
					String listData=jsonArray.toString();
					listData= "{\"Result\":\"OK\",\"Records\":"+listData+"}";
					response.getWriter().print(listData);
				}catch(Exception ex){
					String error="{\"Result\":\"ERROR\",\"Message\":"+ex.getMessage()+"}";
					try {
						response.getWriter().print(error);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					ex.printStackTrace();
				}				
			}
    	}
    }
}
