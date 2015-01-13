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
// see http://www.CodeDesignPatterns.com/javascript/window-onload-function-chaining/
function onloadFunction(prevOnloadFunction) {
   return function() {
      displayUI();
   };
}
window.onload = onloadFunction(window.onload);
</script>
<script>
	$(document).ready(
		function() {
			$('#fieldAddForm').submit(
				function(event) {

					event.preventDefault();
				}
			);
		}
	);
	function test(){
		alert("hi");
	}
	function displayCVPSub(){
		var selectedCVPSub  = $("#serverName option:selected").val();
		//alert(selectedCVPSub);
		$("#warning").empty();
		if( selectedCVPSub == 'VXML Server' ){
			$("#display").empty();
			$("#display").html('<br>'+
					'<table><tr><td><select name="serverName" id="serverName" onchange="displayCVPSub()"><option value="Call Server">Call Server</option>'+
					'<option value="VXML Server" selected>VXML Server</option><option value="Reporting Server">Reporting Server</option>'+
					'<option value="Video Media Server">Video Media Server</option><option value="Operations Console">Operations Console</option>'+
					'</select></td>'+
					'<td><input type="checkbox" name="enable" id="enable">Enable</input></td>'+
					'<td><input type="checkbox" name="enableCallServer" id="enable">Same as Call Server</input></td>'+
					'</tr>'+
					'<tr></tr>'+
					'<tr><td>*IP Address</td><td><input type="text" name="ipaddress" id="ipaddress" class="required">'+
					'<td>*Host Name</td><td><input type="text" name="hostname" id="hostname" ></td>'+
					'<td>Description</td><td><input type="text" name="description" id="desc" class="required"></td>'+
					'<td><button class="table-delete-link ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" type="submit"><span class="ui-button-icon-primary ui-icon ui-icon-trash ui-icon-red"></span></td></tr>'+
	    			'</td></tr></table>'+'<br>'+
					'<input name="testconnection" type="button" id="testConnection" value="Test Connection" onclick="testConnection1();"/>&nbsp;&nbsp;&nbsp;'+'<input name="save" id="editsave" type="submit" value="Save" onclick="saveComponent();"/>&nbsp;&nbsp;<input name="addother" id="addother" type="submit" value="Add another" onclick="addother();"/><br/>');

		} else if( selectedCVPSub == 'Call Server' ){
			$("#display").empty();
			$("#display").html('<br>'+
					'<table><tr><td><select name="serverName" id="serverName" onchange="displayCVPSub()"><option value="Call Server" selected>Call Server</option>'+
					'<option value="VXML Server">VXML Server</option><option value="Reporting Server">Reporting Server</option>'+
					'<option value="Video Media Server">Video Media Server</option><option value="Operations Console">Operations Console</option>'+
					'</select></td>'+
					'<td><input type="checkbox" name="enable" id="enable">Enable</input></td>'+
					'</tr>'+
					'<tr></tr>'+
					'<tr><td>*IP Address</td><td><input type="text" name="ipaddress" id="ipaddress" class="required">'+
					'<td>*Host Name</td><td><input type="text" name="hostname" id="hostname" ></td>'+
					'<td>Description</td><td><input type="text" name="description" id="desc" class="required"></td>'+
					'<td><button class="table-delete-link ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" type="submit"><span class="ui-button-icon-primary ui-icon ui-icon-trash ui-icon-red"></span></td></tr>'+
	    			'</td></tr></table>'+'<br>'+
					'<input name="testconnection" type="button" id="testConnection" value="Test Connection" onclick="testConnection1();"/>&nbsp;&nbsp;&nbsp;'+'<input name="save" id="editsave" type="submit" value="Save" onclick="saveComponent();"/>&nbsp;&nbsp;<input name="addother" id="addother" type="submit" value="Add another" onclick="addother();"/><br/>');

		} else if( selectedCVPSub == 'Reporting Server' ){
			$("#display").empty();
			$("#display").html('<br>'+
					'<table><tr><td><select name="serverName" id="serverName" onchange="displayCVPSub()"><option value="Call Server">Call Server</option>'+
					'<option value="VXML Server">VXML Server</option><option value="Reporting Server" selected>Reporting Server</option>'+
					'<option value="Video Media Server">Video Media Server</option><option value="Operations Console">Operations Console</option>'+
					'</select></td>'+
					'<td><input type="checkbox" name="enable" id="enable">Enable</input></td>'+
					'</tr>'+
					'<tr></tr>'+
					'<tr><td>*IP Address</td><td><input type="text" name="ipaddress" id="ipaddress" class="required">'+
					'<td>*Host Name</td><td><input type="text" name="hostname" id="hostname" ></td>'+
					'<td>Description</td><td><input type="text" name="description" id="desc" class="required"></td>'+
					'<td><button class="table-delete-link ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" type="submit"><span class="ui-button-icon-primary ui-icon ui-icon-trash ui-icon-red"></span></td></tr>'+
	    			'</td></tr></table>'+'<br>'+
					'<input name="testconnection" type="button" id="testConnection" value="Test Connection" onclick="testConnection1();"/>&nbsp;&nbsp;&nbsp;'+'<input name="save" id="editsave" type="submit" value="Save" onclick="saveComponent();"/>&nbsp;&nbsp;<input name="addother" id="addother" type="submit" value="Add another" onclick="addother();"/><br/>');

		} else if( selectedCVPSub == 'Video Media Server' ){
			$("#display").empty();
			$("#display").html('<br>'+
					'<table><tr><td><select name="serverName" id="serverName" onchange="displayCVPSub()"><option value="Call Server">Call Server</option>'+
					'<option value="VXML Server">VXML Server</option><option value="Reporting Server">Reporting Server</option>'+
					'<option value="Video Media Server" selected>Video Media Server</option><option value="Operations Console">Operations Console</option>'+
					'</select></td>'+
					'<td><input type="checkbox" name="enable" id="enable">Enable</input></td>'+
					'</tr>'+
					'<tr></tr>'+
					'<tr><td>*IP Address</td><td><input type="text" name="ipaddress" id="ipaddress" class="required">'+
					'<td>*Host Name</td><td><input type="text" name="hostname" id="hostname" ></td>'+
					'<td>Description</td><td><input type="text" name="description" id="desc" class="required"></td>'+
					'<td><button class="table-delete-link ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" type="submit"><span class="ui-button-icon-primary ui-icon ui-icon-trash ui-icon-red"></span></td></tr>'+
	    			'</td></tr></table>'+'<br>'+
					'<input name="testconnection" type="button" id="testConnection" value="Test Connection" onclick="testConnection1();"/>&nbsp;&nbsp;&nbsp;'+'<input name="save" id="editsave" type="submit" value="Save" onclick="saveComponent();"/>&nbsp;&nbsp;<input name="addother" id="addother" type="submit" value="Add another" onclick="addother();"/><br/>');

		} else if( selectedCVPSub == 'Operations Console' ){
			$("#display").empty();
			$("#display").html('<br>'+
					'<table><tr><td><select name="serverName" id="serverName" onchange="displayCVPSub()"><option value="Call Server">Call Server</option>'+
					'<option value="VXML Server">VXML Server</option><option value="Reporting Server">Reporting Server</option>'+
					'<option value="Video Media Server">Video Media Server</option><option value="Operations Console" selected>Operations Console</option>'+
					'</select></td>'+
					'<td><input type="checkbox" name="enable" id="enable">Enable</input></td>'+
					'</tr>'+
					'<tr></tr>'+
					'<tr><td>*IP Address</td><td><input type="text" name="ipaddress" id="ipaddress" class="required">'+
					'<td>*Host Name</td><td><input type="text" name="hostname" id="hostname" ></td>'+
					'<td>Description</td><td><input type="text" name="description" id="desc" class="required"></td>'+
					'<td><button class="table-delete-link ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" type="submit"><span class="ui-button-icon-primary ui-icon ui-icon-trash ui-icon-red"></span></td></tr>'+
	    			'</td></tr></table>'+'<br>'+
					'<input name="testconnection" type="button" id="testConnection" value="Test Connection" onclick="testConnection1();"/>&nbsp;&nbsp;&nbsp;'+'<input name="save" id="editsave" type="submit" value="Save" onclick="saveComponent();"/>&nbsp;&nbsp;<input name="addother" id="addother" type="submit" value="Add another" onclick="addother();"/><br/>');

		}

	}
	function displayUI() {

		var selectedCompVal = $("#selectComponent option:selected").val();

		if(selectedCompVal == 'Choose' || selectedCompVal == undefined || selectedCompVal == ''){
			$("#display").empty();
			$('#warning').html('<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span><strong>Choose a component to add.</strong></p>');
		}else{
			$("#display").add();
			$("#warning").empty();
			if(selectedCompVal == "UnifiedICM"){
				displayICM();
			}
			if(selectedCompVal == "UnifiedCVP"){
				displayCVP();
			}
			if(selectedCompVal == "UnifiedCM"){
				displayCM();
			}
			if(selectedCompVal == "MediaServer"){
				displayMS();
			}
			if(selectedCompVal == "SpeechServer"){
				displaySS();
			}
			if(selectedCompVal == "CAD-Finesse"){
				displayCF();
			}
			if(selectedCompVal == "MediaSense"){
				displayMSense();
			}
			if(selectedCompVal == "UnifiedIC"){
				displayUIC();
			}
			if(selectedCompVal == "Unity"){
				displayUnity();
			}
			if(selectedCompVal == "Gateway"){
				displayGateway();
			}
			/* $("#display").html('<div id="message"></div><form id="insertForm"><pre>'+
				'<table><tr><td>Enter details for '+selectedCompVal+'</td></tr></table>'+
				'<table><tr><td>Server Name</td><td><input type="text" name="server" id="server" value="'+selectedCompVal+'" disabled></td>'+
				'<td>&nbsp;</td><td>Server IP</td><td><input type="text" name="ipaddress" id="ipaddress" class="required">'+
				'<td>&nbsp;</td><td>Host Name</td><td><input type="text" name="hostname" id="hostname" ></td>'+
				'<td>&nbsp;</td><td>Description</td><td><input type="text" name="desc" id="desc" class="required"></td>'+
				'<td>&nbsp;</td><td><button class="table-delete-link ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" title="Delete"type="submit"><span class="ui-button-icon-primary ui-icon ui-icon-trash ui-icon-red"></span>'+
    			'<span class="ui-button-text">Delete</span></button></td></tr></table>');
			$components.html($components.html()+
				'<input name="testconnection" type="submit" id="testConnection" value="Test Connection" onclick="testConnection();"/>&nbsp;&nbsp;&nbsp;'+'<input name="save" id="editsave" type="submit" value="Save" onclick="saveComponent();"/>&nbsp;&nbsp;<input name="addother" id="addother" type="submit" value="Add another" onclick="addother();"/></div><pre></form><br/>');
			 */
		}
	}

	function testConnection1(){
		//alert("test");
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
	    				$('#message').html('<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span><strong>Oops! Thats an invalid IP Address. Please enter a valid IP Address.</strong></p>');
		    		}else{
	    				$('#message').html('<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span><strong>Test Failed!!!</strong></p>');
	    			}
    			}
    		});
		}
	}


	function displayICM(){

		$("#display").html('<br>'+
				'<table><tr><td><select name="serverName" id="serverName"><option value="Call Router">Call Router</option>'+
				'<option value="Logger">Logger</option><option value="AW">AW</option>'+
				'<option value="AW-HDS">AW-HDS</option><option value="CCM PG">CCM PG</option>'+
				'<option value="VRU PG">VRU PG</option><option value="MR PG">MR PG</option>'+
				'<option value="GatewayXML">GatewayXML</option></select></td><td><input type="checkbox" name="enable" id="enable">Enable</input>'+
				'<tr></tr>'+

				'<tr><td>IP Address</td><td><input type="text" name="ipaddress" id="ipaddress" class="required">'+
				'<td>Host Name</td><td><input type="text" name="hostname" id="hostname" ></td>'+
				'<td>Description</td><td><input type="text" name="description" id="desc" class="required"></td>'+
				'<td><button class="table-delete-link ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" type="submit"><span class="ui-button-icon-primary ui-icon ui-icon-trash ui-icon-red"></span></td></tr>'+
    			'</td></tr></table>'+'<br>'+
				'<input name="testconnection" type="button" id="testConnection" value="Test Connection" onclick="testConnection1();"/>&nbsp;&nbsp;&nbsp;'+'<input name="save" id="editsave" type="submit" value="Save" onclick="saveComponent();"/>&nbsp;&nbsp;<input name="addother" id="addother" type="submit" value="Add another" onclick="addother();"/><br/>');

	}
function displayCVP(){

		$("#display").html('<br>'+
				'<table><tr><td><select name="serverName" id="serverName" onchange="displayCVPSub()" onfocus="displayCVPSub()">'+
				'<option value="Call Server" selected>Call Server</option>'+
				'<option value="VXML Server">VXML Server</option><option value="Reporting Server">Reporting Server</option>'+
				'<option value="Video Media Server">Video Media Server</option><option value="Operations Console">Operations Console</option>'+
				'</select></td><td><input type="checkbox" name="enable" id="enable">Enable</input></td></tr>'+
				'<tr></tr>'+

				'<tr><td>*IP Address</td><td><input type="text" name="ipaddress" id="ipaddress" class="required">'+
				'<td>*Host Name</td><td><input type="text" name="hostname" id="hostname" ></td>'+
				'<td>Description</td><td><input type="text" name="description" id="desc" class="required"></td>'+
				'<td><button class="table-delete-link ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" type="submit"><span class="ui-button-icon-primary ui-icon ui-icon-trash ui-icon-red"></span></td></tr>'+
    			'</td></tr></table>'+'<br>'+
				'<input name="testconnection" type="button" id="testConnection" value="Test Connection" onclick="testConnection1();"/>&nbsp;&nbsp;&nbsp;'+'<input name="save" id="editsave" type="submit" value="Save" onclick="saveComponent();"/>&nbsp;&nbsp;<input name="addother" id="addother" type="submit" value="Add another" onclick="addother();"/><br/>');

	}
function displayCM(){

	$("#display").html('<br>'+
			'<table><tr><td><select name="serverName" id="serverName" ><option value="Publisher">Publisher</option>'+
			'<option value="Subsricber">Subsricber</option>'+
			'</select></td><td><input type="checkbox" name="enable" id="enable">Enable</input></td></tr>'+
			'<tr></tr>'+

			'<tr><td>Server IP</td><td><input type="text" name="ipaddress" id="ipaddress" class="required">'+
			'<td>Host Name</td><td><input type="text" name="hostname" id="hostname" ></td>'+
			'<td>Description</td><td><input type="text" name="description" id="desc" class="required"></td>'+
			'<td><button class="table-delete-link ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" type="submit"><span class="ui-button-icon-primary ui-icon ui-icon-trash ui-icon-red"></span></td></tr>'+
			'</td></tr></table>'+'<br>'+
			'<input name="testconnection" type="button" id="testConnection" value="Test Connection" onclick="testConnection1();"/>&nbsp;&nbsp;&nbsp;'+'<input name="save" id="editsave" type="submit" value="Save" onclick="saveComponent();"/>&nbsp;&nbsp;<input name="addother" id="addother" type="submit" value="Add another" onclick="addother();"/><br/>');

}
function displayMS(){

	$("#display").html('<br>'+
			'<table><tr><td><select name="serverName" id="serverName" ><option value="MediaServer">Media Server</option>'+
			''+
			'</select></td><td><input type="checkbox" name="enable" id="enable">Enable</input></td></tr>'+
			'<tr></tr>'+

			'<tr><td>Server IP</td><td><input type="text" name="ipaddress" id="ipaddress" class="required">'+
			'<td>Host Name</td><td><input type="text" name="hostname" id="hostname" ></td>'+
			'<td>Description</td><td><input type="text" name="description" id="desc" class="required"></td>'+
			'<td><button class="table-delete-link ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" type="submit"><span class="ui-button-icon-primary ui-icon ui-icon-trash ui-icon-red"></span></td></tr>'+
			'</td></tr></table>'+'<br>'+
			'<input name="testconnection" type="button" id="testConnection" value="Test Connection" onclick="testConnection1();"/>&nbsp;&nbsp;&nbsp;'+'<input name="save" id="editsave" type="submit" value="Save" onclick="saveComponent();"/>&nbsp;&nbsp;<input name="addother" id="addother" type="submit" value="Add another" onclick="addother();"/><br/>');

}
function displaySS(){

	$("#display").html('<br>'+
			'<table><tr><td><select name="serverName" id="serverName" ><option value="SpeechServer">Speech Server</option>'+
			''+
			'</select></td><td><input type="checkbox" name="enable" id="enable">Enable</input></td></tr>'+
			'<tr></tr>'+

			'<tr><td>Server IP</td><td><input type="text" name="ipaddress" id="ipaddress" class="required">'+
			'<td>Host Name</td><td><input type="text" name="hostname" id="hostname" ></td>'+
			'<td>Description</td><td><input type="text" name="description" id="desc" class="required"></td>'+
			'<td><button class="table-delete-link ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" type="submit"><span class="ui-button-icon-primary ui-icon ui-icon-trash ui-icon-red"></span></td></tr>'+
			'</td></tr></table>'+'<br>'+
			'<input name="testconnection" type="button" id="testConnection" value="Test Connection" onclick="testConnection1();"/>&nbsp;&nbsp;&nbsp;'+'<input name="save" id="editsave" type="submit" value="Save" onclick="saveComponent();"/>&nbsp;&nbsp;<input name="addother" id="addother" type="submit" value="Add another" onclick="addother();"/><br/>');

}
function displayCF(){

	$("#display").html('<br>'+
			'<table><tr><td><select name="serverName" id="serverName" ><option value="CAD">CAD</option>'+
			'<option value="Finesse">Finesse</option>'+
			'</select></td><td><input type="checkbox" name="enable" id="enable">Enable</input></td></tr>'+
			'<tr></tr>'+

			'<tr><td>Server IP</td><td><input type="text" name="ipaddress" id="ipaddress" class="required">'+
			'<td>Host Name</td><td><input type="text" name="hostname" id="hostname" ></td>'+
			'<td>Description</td><td><input type="text" name="description" id="desc" class="required"></td>'+
			'<td><button class="table-delete-link ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" type="submit"><span class="ui-button-icon-primary ui-icon ui-icon-trash ui-icon-red"></span></td></tr>'+
			'</td></tr></table>'+'<br>'+
			'<input name="testconnection" type="button" id="testConnection" value="Test Connection" onclick="testConnection1();"/>&nbsp;&nbsp;&nbsp;'+'<input name="save" id="editsave" type="submit" value="Save" onclick="saveComponent();"/>&nbsp;&nbsp;<input name="addother" id="addother" type="submit" value="Add another" onclick="addother();"/><br/>');

}
function displayUIC(){

	$("#display").html('<br>'+
			'<table><tr><td><select name="serverName" id="serverName" ><option value="Publisher">Publisher</option>'+
			'<option value="Member">Member</option>'+
			'</select></td><td><input type="checkbox" name="enable" id="enable">Enable</input></td></tr>'+
			'<tr></tr>'+

			'<tr><td>Server IP</td><td><input type="text" name="ipaddress" id="ipaddress" class="required">'+
			'<td>Host Name</td><td><input type="text" name="hostname" id="hostname" ></td>'+
			'<td>Description</td><td><input type="text" name="description" id="desc" class="required"></td>'+
			'<td><button class="table-delete-link ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" type="submit"><span class="ui-button-icon-primary ui-icon ui-icon-trash ui-icon-red"></span></td></tr>'+
			'</td></tr></table>'+'<br>'+
			'<input name="testconnection" type="button" id="testConnection" value="Test Connection" onclick="testConnection1();"/>&nbsp;&nbsp;&nbsp;'+'<input name="save" id="editsave" type="submit" value="Save" onclick="saveComponent();"/>&nbsp;&nbsp;<input name="addother" id="addother" type="submit" value="Add another" onclick="addother();"/><br/>');

}
function displayMSense(){

	$("#display").html('<br>'+
			'<table><tr><td><select name="serverName" id="serverName" ><option value="Primary">Primary</option>'+
			'<option value="Secondary">Secondary</option><option value="Expansion">Expansion</option>'+
			'</select></td><td><input type="checkbox" name="enable" id="enable">Enable</input></td></tr>'+
			'<tr></tr>'+

			'<tr><td>Server IP</td><td><input type="text" name="ipaddress" id="ipaddress" class="required">'+
			'<td>Host Name</td><td><input type="text" name="hostname" id="hostname" ></td>'+
			'<td>Description</td><td><input type="text" name="description" id="desc" class="required"></td>'+
			'<td><button class="table-delete-link ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" type="submit"><span class="ui-button-icon-primary ui-icon ui-icon-trash ui-icon-red"></span></td></tr>'+
			'</td></tr></table>'+'<br>'+
			'<input name="testconnection" type="button" id="testConnection" value="Test Connection" onclick="testConnection1();"/>&nbsp;&nbsp;&nbsp;'+'<input name="save" id="editsave" type="submit" value="Save" onclick="saveComponent();"/>&nbsp;&nbsp;<input name="addother" id="addother" type="submit" value="Add another" onclick="addother();"/><br/>');

}
function displayUnity(){

	$("#display").html('<br>'+
			'<table><tr><td><select name="serverName" id="serverName" ><option value="Unity">Unity</option>'+
			'<option value="Unity Connection">Unity Connection</option><option value="Unity Express">Unity Express</option>'+
			'</select></td><td><input type="checkbox" name="enable" id="enable">Enable</input></td></tr>'+
			'<tr></tr>'+

			'<tr><td>Server IP</td><td><input type="text" name="ipaddress" id="ipaddress" class="required">'+
			'<td>Host Name</td><td><input type="text" name="hostname" id="hostname" ></td>'+
			'<td>Description</td><td><input type="text" name="description" id="desc" class="required"></td>'+
			'<td><button class="table-delete-link ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" type="submit"><span class="ui-button-icon-primary ui-icon ui-icon-trash ui-icon-red"></span></td></tr>'+
			'</td></tr></table>'+'<br>'+
			'<input name="testconnection" type="button" id="testConnection" value="Test Connection" onclick="testConnection1();"/>&nbsp;&nbsp;&nbsp;'+'<input name="save" id="editsave" type="submit" value="Save" onclick="saveComponent();"/>&nbsp;&nbsp;<input name="addother" id="addother" type="submit" value="Add another" onclick="addother();"/><br/>');

}
function displayGateway(){

	$("#display").html('<br>'+
			'<table><tr><td><select name="serverName" id="serverName" ><option value="Ingress/Egress">Ingress/Egress</option>'+
			'<option value="Ingress">Ingress</option><option value="Egress">Egress</option><option value="VXML">VXML</option>'+
			'<option value="CUBE">CUBE</option><option value="Gateway">Gateway</option>'+
			'</select></td><td><input type="checkbox" name="enable" id="enable">Enable</input></td></tr>'+
			'<tr></tr>'+

			'<tr><td>Server IP</td><td><input type="text" name="ipaddress" id="ipaddress" class="required">'+
			'<td>Host Name</td><td><input type="text" name="hostname" id="hostname" ></td>'+
			'<td>Description</td><td><input type="text" name="description" id="desc" class="required"></td>'+
			'<td><button class="table-delete-link ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" type="submit"><span class="ui-button-icon-primary ui-icon ui-icon-trash ui-icon-red"></span></td></tr>'+
			'</td></tr></table>'+'<br>'+
			'<input name="testconnection" type="button" id="testConnection" value="Test Connection" onclick="testConnection1();"/>&nbsp;&nbsp;&nbsp;'+'<input name="save" id="editsave" type="submit" value="Save" onclick="saveComponent();"/>&nbsp;&nbsp;<input name="addother" id="addother" type="submit" value="Add another" onclick="addother();"/><br/>');

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
				"component":$('#selectComponent').val(),
				"side":$('#side').val(),
				"hostname":$('#hostname').val(),
				"description":$('#desc').val(),
				"serverName":$("#serverName").val(),
				"ipaddress":$('#ipaddress').val(),
				"action":"editsave",
				"enable":$('#enable').val()
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
						$('#message').html('<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span><strong>Component is added successfully!!!</strong></p>');
	    			}else if(res.ans=='fail'){
	    				$('#message').html('<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span><strong>Oops! Thats an invalid IP Address. Please enter a valid IP Address</strong></p>');
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
    	$("#selectComponent").val('<%=request.getParameter("mainServer")%>');
        $('#View').jtable({
            title: '<%=request.getParameter("title")%>',
           // paging: true, //Enable paging
           // pageSize: 10, //Set page size (default: 10)
            // sorting: true, //Enable sorting
            defaultSorting: 'subServerName ASC', //Set default sorting
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
						"side":'<%=request.getParameter("side")%>',
						"title":"Components"
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
                updateAction: 'VISXMLController?action=edit&mainServer=<%=request.getParameter("mainServer")%>&side=<%=request.getParameter("side")%>',
                deleteAction: 'VISXMLController?action=delete&mainServer=<%=request.getParameter("mainServer")%>&side=<%=request.getParameter("side")%>'
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
                    list: true,

	            },
                description: {
                	title:'Description ',
                    width: '30%',
       				edit: true
                },
                enable: {
                	title:'Enable ',
                    width: '20%',
       				edit: true
                },
            	status: {
            		edit:false,
                	title: 'Status',
                    width: '10%',
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


</div>
<div id="Edit" >

		<br/>
		<form id="fieldAddForm" >
		<%
			String str = request.getParameter("mainServer");
			request.setAttribute("main_server",str);

			String str1 = request.getParameter("side");
			request.setAttribute("side",str1);
		%>
		<select id="selectComponent" name="component" onchange="displayUI()" onfocus="displayUI()">
			<option value="Choose" selected="selected">Choose Component</option>
			<option value="UnifiedICM">Unified ICM</option>
			<option value="UnifiedCVP">Unified CVP</option>
			<option value="UnifiedCM">Unified CM</option>
			<option value="MediaServer">Media Server</option>
			<option value="SpeechServer">Speech Server</option>
			<option value="CAD-Finesse">CAD-Finesse</option>
			<option value="MediaSense">MediaSense</option>
			<option value="UnifiedIC">Unified IC</option>
			<option value="Unity">Unity</option>
			<option value="Gateway">Gateway</option>
		</select>

		<select id="side" name="side" >

			<option value="A">Side A</option>
			<option value="B">Side B</option>
		</select>



	<div id="display"></div>
	</form>
		<div id="message"></div>

		<div id="warning"></div>

<div id="addComponent"></div>


</div>
</div>
</div>
</body>
</html>