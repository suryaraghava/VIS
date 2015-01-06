package com.ccn.vis.dao;

import java.util.ArrayList;
import java.util.List;
import com.ccn.vis.data.*;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class UserDAO {

	public List<User> getAllUsers(String mainServer,String side) {
		List<User> users = new ArrayList<User>();
		User user =null;
		String status=null;
		String subServerName=null;
		
		String host=null;
		String ip=null;
		String desc=null;
		try {
			Document document = XMLNode.returnDocument(UserDAO.class.getResource("/customer.xml").getPath());
			NodeList nList = XMLNode.returnNodeList(document);
		
			for (int i = 0; i < nList.getLength(); i++)
			{
				Node node = nList.item(i);
				if (node.getNodeType() == Node.ELEMENT_NODE)
				{
					Element eElement = (Element) node;
					String mainServerName=eElement.getAttribute("name");
					
					String serverSide = eElement.getAttribute("side"); 
					
					//if(mainServerName.equalsIgnoreCase(mainServer)&&serverSide.equalsIgnoreCase(side)){
						NodeList nnlist=eElement.getElementsByTagName("SubServer");

						for (int j=0;j<nnlist.getLength();j++)
						{
							Node snode=nnlist.item(j);
							if(snode.getNodeType()==Node.ELEMENT_NODE)
							{ 
								user = new User();
								Element subeElement=(Element)snode;
								if(mainServer.equalsIgnoreCase(mainServerName)&&serverSide.equalsIgnoreCase(side)){
									status=subeElement.getAttribute("status").toString();
									subServerName=subeElement.getAttribute("name");
									
									host=subeElement.getElementsByTagName("host").item(0).getTextContent();
									ip=subeElement.getElementsByTagName("ip").item(0).getTextContent();
									desc=subeElement.getElementsByTagName("desc").item(0).getTextContent();
									
									if(status.equals("1")){
										status="OK";
									}else{
										status="Failed";
									}
									user.setStatus(status);
									user.setSubServerName(subServerName);
									user.setMainServerName(mainServerName);
									user.setDescription(desc);
									user.setHost(host);
									user.setIp(ip);

									users.add(user);
								}
								else if(mainServer.equalsIgnoreCase("null")&&side.equalsIgnoreCase("null")){
									status=subeElement.getAttribute("status").toString();
									subServerName=subeElement.getAttribute("name");
									
									host=subeElement.getElementsByTagName("host").item(0).getTextContent();
									ip=subeElement.getElementsByTagName("ip").item(0).getTextContent();
									desc=subeElement.getElementsByTagName("desc").item(0).getTextContent();
									
									if(status.equals("1")){
										status="OK";
									}else{
										status="Failed";
									}
									user.setStatus(status);
									user.setSubServerName(subServerName);
									user.setMainServerName(mainServerName);
									user.setDescription(desc);
									user.setHost(host);
									user.setIp(ip);

									users.add(user);
								}
								
							
								}
						}
						
					//}					
				}
			}						
		} catch (Exception e){
			e.printStackTrace();
		}
		
		return users;
	}
}
