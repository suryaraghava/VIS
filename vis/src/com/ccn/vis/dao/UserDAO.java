package com.ccn.vis.dao;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.ccn.vis.data.User;
import com.ccn.vis.data.XMLNode;

public class UserDAO {

	public List<User> getAllUsers(String mainServer,String side) {
		List<User> users = new ArrayList<User>();
		User user =null;
		String status=null;
		String subServerName=null;
		String enable = null;
		String host=null;
		String ip=null;
		String desc=null;
		try {
			Document document = XMLNode.returnDocument("E:/customer.xml");
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
									
									subServerName=subeElement.getAttribute("name");
									
									host=subeElement.getElementsByTagName("host").item(0).getTextContent();
									ip=subeElement.getElementsByTagName("ip").item(0).getTextContent();
									desc=subeElement.getElementsByTagName("desc").item(0).getTextContent();
									status=subeElement.getElementsByTagName("status").item(0).getTextContent();
									boolean flag = false;
									
									try{
										InetAddress inet = InetAddress.getByName(ip);
										flag = inet.isReachable(2000);
										System.out.println(ip+" Status Flag is:"+flag);
										if(flag)
										{
											status="1";
										}else{
											status="0";
										}
									}
									catch(UnknownHostException e)
									{
										e.printStackTrace();
									}
									catch(IOException io)
									{
										io.printStackTrace();
									}catch(NullPointerException np){
										np.printStackTrace();
									}
									
									enable = subeElement.getElementsByTagName("enable").item(0).getTextContent();
									if(status.equals("1")){
										status="OK";
									}else{
										status="Failed";
									}
									if(enable.equals("1") || enable.equalsIgnoreCase("on")){
										enable="Yes";
									}else{
										enable="No";
									}
									user.setStatus(status);
									user.setSubServerName(subServerName);
									user.setMainServerName(mainServerName);
									user.setDescription(desc);
									user.setHost(host);
									user.setIp(ip);
									user.setEnable(enable);
									users.add(user);
								}
								else if(mainServer.equalsIgnoreCase("null")&&side.equalsIgnoreCase("null")){
									
									subServerName=subeElement.getAttribute("name");
									
									host=subeElement.getElementsByTagName("host").item(0).getTextContent();
									ip=subeElement.getElementsByTagName("ip").item(0).getTextContent();
									desc=subeElement.getElementsByTagName("desc").item(0).getTextContent();
									status=subeElement.getElementsByTagName("status").item(0).getTextContent();
									enable = subeElement.getElementsByTagName("enable").item(0).getTextContent();
									if(status.equals("1")){
										status="OK";
									}else{
										status="Failed";
									}
									if(enable.equals("1")){
										enable="Yes";
									}else{
										enable="No";
									}
									user.setStatus(status);
									user.setSubServerName(subServerName);
									user.setMainServerName(mainServerName);
									user.setDescription(desc);
									user.setHost(host);
									user.setIp(ip);
									user.setEnable(enable);
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
