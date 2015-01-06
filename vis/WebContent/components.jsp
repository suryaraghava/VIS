<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>index</title>
<link href="js/jtable/themes/lightcolor/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="js/jquery.jtable.js" type="text/javascript"></script>
<script src="js/jquery.jtable.min.js" type="text/javascript"></script>
<style>
	.ui-widget-header {
	   background: #AAFF90;
	   border: 1px solid #DDDDDD;
	   color: #FF87AA;
	   font-weight: bold;
	}
</style>
<script>
	$(document).ready(
		function() {
			$('#fieldAddForm').submit(
				function(event) {
					addToPage();
					event.preventDefault();
				}
			);    
		}
	);
	function addToPage() {	
		
		$components = $('#addComponent');
		var selectedCompVal = $("#selectComponent option:selected").val();
		if(selectedCompVal == 'Choose'){
			$('#warning').html('<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span><strong>Choose a component to add.</strong></p>');
		}else{
			$('#main').remove();
			$( "#tabs" ).tabs({ active: 1 });
			$components.html('<div id="message"></div><form id="insertForm"><pre>'+
				'<table><tr><td>Enter details for '+selectedCompVal+'</td></tr></table>'+
				'<table><tr><td>Server Name</td><td><input type="text" name="server" id="server" value="'+selectedCompVal+'" disabled></td>'+
				'<td>&nbsp;</td><td>Server IP</td><td><input type="text" name="ipaddress" id="ipaddress" class="required">'+
				'<td>&nbsp;</td><td>Host Name</td><td><input type="text" name="hostname" id="hostname" ></td>'+
				'<td>&nbsp;</td><td>Description</td><td><input type="text" name="desc" id="desc" class="required"></td>'+
				'<td>&nbsp;</td><td><button class="table-delete-link ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" title="Delete"type="submit"><span class="ui-button-icon-primary ui-icon ui-icon-trash ui-icon-red"></span>'+
    			'<span class="ui-button-text">Delete</span></button></td></tr></table>');
			$components.html($components.html()+
				'<input name="testconnection" type="submit" id="testConnection" value="Test Connection" onclick="testConnection();"/>&nbsp;&nbsp;&nbsp;'+'<input name="save" id="editsave" type="submit" value="Save" onclick="saveComponent();"/>&nbsp;&nbsp;<input name="addother" id="addother" type="submit" value="Add another" onclick="addother();"/></div><pre></form><br/>');
			$( "#tabs" ).tabs({ active: 1 });
		}
	}
	function testConnection(){
		var isValid = true;
		$('input[id="ipaddress"]').each(function(){
			if($.trim($('#ipaddress').val()) == ''){
				isValid = false;
				$('#ipaddress').css({
                    "border": "1px solid red",
                    "background": "#FFCECE",
                    "val": "Enter IP Address"
                });
			}else{
				$(this).css({
                    "border": "",
                    "background": ""
                });
			}
		});
		if (isValid == false) 
            e.preventDefault();
        else{
        	var testIP=
    		{
    			"ip":$('#ipaddress').val()
			};
    		$.ajax({
    			type: 'POST',
    			url: "vis/cbatest.do",
    			data: testIP,
    			dataType:'json',
    			success: function (res) {
	    			if(res.ans=='ok')
	    			{ 
	    				$('#message').html('<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span><strong>Connection to Server is Good!!!</strong></p>');
	    				//$('#editsave').removeAttr("disabled");
	    				$('#ipaddress').attr("disabled","disabled");
	    				$('#hostname').val(res.host);
	    				$('#hostname').attr("disabled","disabled");
	    				$('#desc').focus();
	    			}else if(res.ans=='fail'){
	    				$('#message').html('<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span><strong>Oops! Thats a invalid IP, enter valid IP and test.</strong></p>');
		    		}else{					
	    				$('#message').html('<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span><strong>Test Failed!!!</strong></p>');
	    			}
    			}
    		});
		} 
	}

	function saveComponent()
	{
		var isValid = true;
		$('input[id="ipaddress"]').each(function(){
			if($.trim($('#ipaddress').val()) == ''){
				isValid = false;
				$('#ipaddress').css({
                    "border": "1px solid red",
                    "background": "#FFCECE",
                    "val": "Enter IP Address"
                });
			}else{
				$(this).css({
                    "border": "",
                    "background": ""
                });
			}
		});
		if (isValid == false) 
            e.preventDefault();
		else{
			var selectedVal={
				"host":$('#hostname').val(),	
				"description":$('#desc').val(),
				"subServerName":$("#server").val(),
				"ip":$('#ipaddress').val(),
				"mainServer":'<%=request.getParameter("mainServer")%>',
				"side":'<%=request.getParameter("side")%>',
				"action":"editsave"
			};
			$.ajax({
				type: "POST",
				url: "vis/cbaSave.do",
				data: selectedVal,
				cache: true,
				dataType:'json',
				success: function (res) {
					if(res.ans=='ok')
	    			{
						$('#message').html('<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span><strong>Connection to Server is Good!!!</strong></p>');
	    				//$('#editsave').removeAttr("disabled");
	    				//$('#ipaddress').attr("disabled","disabled");
	    				$('#hostname').val(res.host);
	    				$('#hostname').attr("disabled","disabled");
	    				$('#desc').focus();
	    				$('#ipaddress').attr("disabled","disabled");
						$('#message').html('<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span><strong>Component Added!!!</strong></p>');
	    			}else if(res.ans=='fail'){
	    				$('#message').html('<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span><strong>Oops! Thats a invalid IP, enter valid IP and test.</strong></p>');
					}
				}
			});
		}
	}
	$("#").click(function(){
		   window.location.href='the_link_to_go_to.html';
		})
	function addother()
	{	
		$("#selectComponent option:not(:first):selected").remove();
		if($("#selectComponent option").length==1){
			$("#selectComponent").remove();
			$("#submitButton").remove();
			$("#warning").remove();
		}
		//$('#Edit').html('<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span><strong>Please choose Components to Add from View Page!!!</strong></p>');
		//$("#tabs").tabs({active:0});	
	}	
</script>
<script>
	$(function() {
    	$( "#tabs" ).tabs();    	
    });
</script>
<style>
#tabs {
	font-size: 12px;
}
.ui-widget-header {
	background: #FFFFFF;
	border: 0px solid #FFFFFF;
	color: #FFFFFF;
	font-weight: bold;
}
.ui-button {
	height: 22px;
}
</style>
</head>
<body>
<div id="tabs">
	<ul>
		<li><a href="#View">View Components</a></li>
		<li><a href="#Edit">Add Components</a></li>
	</ul>
<div id="View">
<script>
    $(document).ready(function () {
        $('#View').jtable({
            title: 'CCN Voice Information System',
            //paging: true, //Enable paging
            //pageSize: 10, //Set page size (default: 10)
            //sorting: false, //Enable sorting
            //defaultSorting: 'ip ASC', //Set default sorting
            //clientSort: true, //this needs jquery.tablesorter.min.js
        	//columnResizable: false,
        	//columnSelectable: true,
            //selecting: true,
            //multiselect: true,
            //selectingCheckboxes: true,
            actions: {
                listAction: function (){
                	var posdata={
						"mainServer":'<%=request.getParameter("mainServer")%>',
						"side":'<%=request.getParameter("side")%>'
					};
                	return $.Deferred(function ($dfd) {
					$.ajax({
					    url: 'VISXMLController?action=list',
					    type: 'POST',
					    dataType: 'json',
					    data: posdata,
					    success: function (data) {
							$dfd.resolve(data);
					    },
					    error: function () {
					    	$dfd.reject();
					    }
					});
                	});
            	},
                updateAction: 'VISXMLController?action=edit',
                deleteAction: 'VISXMLController?action=delete'
            },
            
            fields: {
				subServerName: {
                	title:'Server Name ',
                    key: true,
                    list: true,
                    width: '20%',
                    create:	true	                    
                },
    	        ip: {
        	        title: 'IP Address',
            	    width: '20%',
            	    list: true
	            },
            	host: {
                	title: 'Host Name',
                    width: '20%',
                    list: true
	            },
                description: {
                	title:'Description ',
                    width: '30%',
       				edit: true
                },
            	status: {
                	title: 'Status',                    
                    width: '50%',
                     display: function (data) {
                    	if(data.record.status=="OK"){
                        return '<img src="resources/images/green.jpg" height="13" width="55" align="center"/>';}
                    	else{
                    		 return '<img src="resources/images/red.jpg" height="13" width="55" align="center"/>';
                    	}
                   } 
				} 
			},
            recordsLoaded: function(event, data) {
                $('.jtable-data-row').dblclick(function() {
                    var row_id = $(this).attr('data-record-key');
                    alert('clicked row with id '+row_id);
                });
            }
        });
        
        $('#View').jtable('load');
    });
</script>

<form id="fieldAddForm">
		<%
			String str = request.getParameter("mainServer");
			request.setAttribute("main_server",str); 
			
			String str1 = request.getParameter("side");
			request.setAttribute("side",str1);
		%>
		<select id="selectComponent" name="selectComponent">
			<option value="Choose">Choose Component</option>
			<option value="Call Server">Side B Call Server</option>
			<option value="VXML Server">Side B VXML Server</option>
			<option value="Reporting Server">Side B Reporting Server</option>
			<option value="Video Media Server">Side B Video Media Server</option>
			<option value="Operations Console">Side B Operations Console</option>
		</select>
		<input name="submitButton" id="submitButton" type="submit" value="Add Component" /><br/>
		<div id="warning"></div>
		
	</form>
</div>
<div id="Edit">
<form id="fieldAddform" >
		<br/>
	<!-- 	<strong>Choose Component to Add:</strong>
		<select id="selectComponent" name="selectComponent" >
			<option value="Choose">Choose here</option>
			<option value="Call Server">Side B Call Server</option>
			<option value="VXML Server">Side B VXML Server</option>
			<option value="Reporting Server">Side B Reporting Server</option>
			<option value="Video Media Server">Side B Video Media Server</option>
			<option value="Operations Console">Side B Operations Console</option>
		</select> -->
		
		
		<div id="message"></div>
		<div id="main">
				<table><tr><td>Enter details for </td></tr></table>
				<table><tr><td>Server Name</td><td><select id="server" name="server" >
			<option value="Choose">Choose here</option>
			<option value="Call Server">Side B Call Server</option>
			<option value="VXML Server">Side B VXML Server</option>
			<option value="Reporting Server">Side B Reporting Server</option>
			<option value="Video Media Server">Side B Video Media Server</option>
			<option value="Operations Console">Side B Operations Console</option>
		</select></td>
				<td>&nbsp;</td><td>Server IP</td><td><input type="text" name="ipaddress" id="ipaddress" class="required">
				<td>&nbsp;</td><td>Host Name</td><td><input type="text" name="hostname" id="hostname" ></td>
				<td>&nbsp;</td><td>Description</td><td><input type="text" name="desc" id="desc" class="required"></td>
				<td>&nbsp;</td><td><button class="table-delete-link ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" title="Delete"type="submit"><span class="ui-button-icon-primary ui-icon ui-icon-trash ui-icon-red"></span>
    			<span class="ui-button-text">Delete</span></button></td></tr></table>
			
				<input name="testconnection" type="submit" id="testConnection" value="Test Connection" onclick="testConnection();"/>&nbsp;&nbsp;&nbsp;<input name="save" id="editsave" type="submit" value="Save" onclick="saveComponent();"/>&nbsp;&nbsp;<input name="addother" id="addother" type="submit" value="Add another" onclick="addother();"/></div><br/>
		
		<div id="warning"></div>
	
<div id="addComponent"></div>

</form>
</div>
</div>
</div>
</body>
</html>