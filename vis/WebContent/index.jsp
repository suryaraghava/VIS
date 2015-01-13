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
         .ui-widget-header2 {
            background: #AAFF90;
            border: 1px solid #DDDDDD;
            color: #FF87AA;
            font-weight: bold;
         }
         .ui-widget-header {
            background: #AAFF90;
            border: 1px solid #DDDDDD;
            color: #FF87AA;
            font-weight: bold;
         }
         .progress-label {
            position: absolute;
            left: 50%;
            top: 13px;
            font-weight: bold;
            text-shadow: 1px 1px 0 #fff;
         }
      </style>
      <script>
      $(function() {
         var progressbar = $( "#progressbar-5" );
         progressLabel = $( ".progress-label" );
         $( "#progressbar-5" ).progressbar({
            value: false,
            change: function() {
               progressLabel.text( );
            },
            complete: function() {
               progressLabel.text( "Connected!" );
            }
         });
         function progress() {
            var val = progressbar.progressbar( "value" ) || 0;
            progressbar.progressbar( "value", val + 1 );
            if ( val < 99 ) {
               setTimeout( progress, 100 );
            }
         }
         setTimeout( progress, 3000 );
      });
   </script>
<script>
	function addToPage() {
		$components = $('#addComponent');
		var selectedCompVal = $("#selectComponent option:selected").val();
		if(selectedCompVal == 'Choose'){
			$('#warning').html('<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span><strong>Choose a component to add.</strong></p>');
		}else{
			$("#addMessage").remove();
			$components.html('<div id="message"></div><form id="insertForm"><div id="addMessage">'+
			'<table><tr><th colspan="2" align="left">Enter details for '+selectedCompVal+'</th></tr><tr><td width="50%">Server Name  </td><td width="80%"><input type="text" name="server" id="server" value="'+selectedCompVal+'" disabled></td></tr><tr><td>Server IP</td><td><input type="text" name="ipaddress" id="ipaddress" class="required"></td></tr>'+
			'<tr><td>Host Name</td><td><input type="text" name="hostname" id="hostname" disabled></td></tr><tr><td>Description</td><td><input type="text" name="desc" id="desc" class="required"></td></tr></table>')+
			'<input type="hidden" name="selectedCompVal" id="selectedCompVal" value="'+selectedCompVal+'">';
			$components.html($components.html()+'<input name="testconnection" type="submit" id="testConnection" value="Test Connection" onclick="testConnection();"/>&nbsp;&nbsp;&nbsp;'+
					'<input name="save" id="editsave" type="submit" value="Save" onclick="saveComponent();"/>&nbsp;&nbsp;<input name="addother" id="addother" type="submit" value="Add another" onclick="addother();" disabled /></div></form><br/>');
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
                    "value": "Enter IP Address"
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

	function saveComponent()
	{
		var selectedVal={
				"host":$('#hostname').val(),
				"ip":$('#ipaddress').val(),
				"description":$('#desc').val(),
				"subServerName":$("#selectComponent option:selected").val(),
				"action":"editsave"
		};
		$.ajax({
			type: "POST",
			url: "vis/cbaSave.do",
			data: selectedVal,
			cache: true,
			dataType:'json',
			success: function (res) {
				$('#editsave').attr("disabled","disabled");
				$('#message').html('<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span><strong>Component Added!!!</strong></p>');
				$('#addother').removeAttr("disabled");
			}
		});
	}
	function addother()
	{
		$("#selectComponent option:not(:first):selected").remove();
		if($("#selectComponent option").length==1){
			$("#selectComponent").remove();
			$("#submitButton").remove();
			$("#warning").remove();
		}
		$('#Edit').html('<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span><strong>Please choose Components to Add from View Page!!!</strong></p>');
		$("#tabs").tabs({active:0});
	}
	$(document).ready(
		function() {
			$('#fieldform').submit(
				function(event) {
					addToPage();
					event.preventDefault();
				}
			);
		}
	);
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
<body width="100%" align="left">
<div id="tabs">
	<ul>
		<li><a href="#View">View</a></li>
		<li><a href="#Edit">Edit</a></li>
	</ul>
<div id="View">
<script>
    $(document).ready(function () {
        $('#View').jtable({
            title: 'Cisco Unified Customer Voice Portal',
            //paging: true, //Enable paging
            //pageSize: 10, //Set page size (default: 10)
            sorting: false, //Enable sorting
            //defaultSorting: 'ip ASC', //Set default sorting
            clientSort: true, //this needs jquery.tablesorter.min.js
        	columnResizable: false,
        	columnSelectable: true,
            selecting: true,
            multiselect: true,
            selectingCheckboxes: true,
            actions: {
                listAction: 'VISXMLController?action=list&mainServer=UnifiedCVP',
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
                        return '<img src="resources/images/green.jpg" height="13" width="55" align="center"/>';
                   }
				}
			}
        });
        $('#View').jtable('load');
    });
</script>
<form id="fieldform">
		<select id="selectComponent" name="selectComponent">
			<option value="Choose" selected="selected">Choose Component</option>
			<option value="Call Server">Call Server</option>
			<option value="VXML Server">VXML Server</option>
			<option value="Reporting Server">Reporting Server</option>
			<option value="Video Media Server">Video Media Server</option>
			<option value="Operations Console">Operations Console</option>
		</select>
		<input name="submitButton" id="submitButton" type="submit" value="Add Component" /><br/>
		<div id="warning"></div>
	</form>
</div>
<div id="Edit">
<div id="addMessage"><p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span><strong>Please choose Components to Add from View Page!!!</strong></p></div>
<div id="addComponent"></div>
</div>
</div>
</body>
</html>