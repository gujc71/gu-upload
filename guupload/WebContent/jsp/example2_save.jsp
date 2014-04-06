<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>File Upload Demos</title>
<link href="css/default.css" rel="stylesheet" type="text/css" />

</head>
<body>

<div id="content">
	<h2>Board</h2><br/>
      	<table cellspacing="0" cellpadding="0"   width="700px">
        <colgroup>
        <col width="15%"/>
        <col/>
        </colgroup>
        <tr>
			<td>Title</td>
			<td><s:property value="brd_title"/></td>
		</tr>
        <tr>
			<td>Contents</td>
			<td><s:property value="brd_contents"/></td>
		</tr>
		<tr>
			<td>Attach File</td>
			<td>
				<s:iterator value="filelist" status="status">
					<s:property value="top"/> <br/>
				</s:iterator>
			</td>
		</tr>
		</table>
</div>
</body>
</html>
