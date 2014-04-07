<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>File Upload Demos</title>
<link href="css/default.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/fileprogress.js"></script>
<script type="text/javascript" src="js/handlers.js"></script>
<script type="text/javascript" src="js/swfupload.js"></script>
<script type="text/javascript" src="js/guupload.js"></script>

<script language="JavaScript" src="js/json2.js"></script>
<script type="text/javascript">
var uploader;
var realname="", filename="";
var isrun_gu = true;

window.onload = function() {
	if(navigator.appName.indexOf("Internet Explorer")!=-1){     //yeah, he's using IE
		if (navigator.appVersion.indexOf("MSIE 1")==-1) isrun_gu = false;  //v10, 11, 12, etc. is fine too
    };

	if (isrun_gu){
		var settings = {
				upload_url: "upload.do",
				file_size_limit : 20*1024*1024, // 20M
				//fileTag : "file1",		// if you want to use file tag, remove comments
				custom_settings : {progressTarget : "fsUploadProgress",cancelButtonId : "btnCancel"},
				upload_progress_handler: uploadProgress,
				upload_success_handler : uploadSuccess
		};
		document.getElementById('fsUploadProgress').innerHTML = '<div style="width:99%; line-height: 99px;text-align: center;vertical-align: middle;">Drag files here.</div>';

		uploader = new GUUpload(settings);
	} else {
		var settings = {
			flash_url : "images/swfupload.swf",
			upload_url: "upload.do",
			custom_settings : {progressTarget : "fsUploadProgress",cancelButtonId : "btnCancel"},
			file_size_limit : "20 MB",
			// Button settings
			button_placeholder_id: "swfbutton",
			button_image_url: "images/swfbutton.png",
			button_text: '<span class="theFont">Browse Files</span>',
			button_text_style: ".theFont { font-size: 11; background-color: #33FF66; text-align: center;}",
			
			// The event handler functions are defined in handlers.js
			file_queued_handler : fileQueued,
			file_queue_error_handler : fileQueueError,
			upload_error_handler : uploadError,
			upload_success_handler : uploadSuccess
		};

		uploader = new SWFUpload(settings);
	}
};

function uploadFiles(){
	if (isrun_gu){
		if (uploader.files_queued()>0) 
			 uploader.uploadFiles();
		else document.form1.submit();
	} else {
		var stats = uploader.getStats();
		if (stats.files_queued>0) 
			 uploader.startUpload();
		else document.form1.submit();
	}
}

function uploadSuccess(file, serverData) {
	try {
		var progress = new FileProgress(file, uploader.customSettings.progressTarget);
		progress.setComplete();
		progress.setStatus("Complete.");
		progress.toggleCancel(false);
	} catch (ex) {
		this.debug(ex);
	}

	var jsondata = JSON.parse(serverData);

	if (realname.length>0) realname += ",";
	if (filename.length>0) filename += ",";
	filename += file.name;
	realname += jsondata.newfilename;
	document.getElementById('realname').value = realname;
	document.getElementById('filename').value = filename;
	
	uploadFiles(); // until all files are uploaded
}
function formSubmit(){
}
</script>
</head>
<body>

<div id="content">
	<h2>Board</h2><br/>
	<form id="form1" name="form1" action="example2_save.do" method="post">
      	<table cellspacing="0" cellpadding="0"   width="700px">
        <colgroup>
        <col width="15%"/>
        <col/>
        </colgroup>
        <tr>
			<td>Title</td>
			<td><input type="text" name="brd_title"/></td>
		</tr>
        <tr>
			<td>Contents</td>
			<td><textarea name="brd_contents" cols="55"></textarea></td>
		</tr>
		<tr>
			<td>Attach File</td>
			<td>
				<div class="uploadHead" style="width: 500px;">
					<span class="uploadcolumn" style="width:75%">File Name</span>
					<span class="uploadcolumn" style="width:23%">File Size</span>
				</div>
				<div class="fieldset flash" id="fsUploadProgress" style="overflow:auto; width:500px; height: 100px;" ></div>
				<br/>
				<div id="controlButtons">
					<span id="swfbutton"></span>
					<input type="button" value="Submit" onclick='uploadFiles();' />
				</div>
				<input type="hidden" id="filename" name="filename"/>
				<input type="hidden" id="realname" name="realname"/>
			</td>
		</tr>
		</table>
	</form>
</div>
</body>
</html>
