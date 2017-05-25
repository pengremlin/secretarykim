<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*, java.io.*"%>


<!-- top. left bottom left -->
<style type="text/css">
.attach-image-list {
	display: none;
	height: 58px;
	position: relative;
	padding: 3px 0 3px 0;
	border: 1px solid #b5b5b5;
	margin: 5px 0 0 0; /* top right bottom left*/
}

.attach-image-item {
	float: left;
	height: 44px;
	width: 46px;
	margin: 0 0 0 3px;
}

.attach-image-item .item {
	float: left;
	height: 44px;
	width: 44px;
	overflow: hidden;
}

.attach-image-item .btn {
	text-align: right;
	margin-right: 2px;
}

.attach-file {
	line-height: 1.5;
	text-align: left;
	position: relative;
	zoom: 1;
}

.attach-file-header {
	display: none;
	line-height: 1.5;
	text-align: left;
	position: relative;
	zoom: 1;
	margin: 0px 5px 0px 5px;
}

.attach-file-title {
	display: none;
	background: #f8f8f8;
	border: 1px solid #cdcdcd;
	height: 24px;
	border-width: 1px 1px 0;
	border-style: solid solid none;
	border-color: #d5d5d5 #cdcdcd;
}

.attach-file-title	.title_check {
	float: left;
	margin: 5px 3px 0 2px;
}

.attach-file-title	.title_name {
	float: left;
	margin: 3px 3px 0 0;
}

.attach-file-title	.title_size {
	float: right;
	margin: 3px 3px 0 0;
	padding-right: 20px
}

.attach-file-list {
	font: normal 12px gulim, tahoma;
	display: none;
	position: relative;
	padding: 2px;
	border: 1px solid #b5b5b5;
	margin: 5px 0 0 0; /* top right bottom left*/
}

.attach-file-item {
	height: 14px;
	width: 100%;
	margin: 2px 0 0 0;
}

.attach-file-item-hidden {
	height: 0px;
	overflow: hidden;
}

.attach-file-item .item_check {
	float: left;
	margin: 2px 3px 0 0;
}

.attach-file-item .item_name {
	width: 100px;
	float: left;
	margin: 0px 3px 0 0; /* top right bottom left*/
	overflow: hidden;
}

.attach-file-item .content_type {
	width: 100px;
	height: 100%;
	float: right;
	margin: 0px 3px 0 0;
	overflow: hidden;
}

.attach-file-item .item_size {
	width: 80px;
	float: right;
	margin: 0px 3px 0 0;
	text-align: right;
}

.attach-file-item .btn {
	width: 10px;
	float: right;
	text-align: right;
	margin: 0px 3px 0 0;
}

.file_input_div {
	position: relative;
	width: 120px;
	height: 23px;
	overflow: hidden;
}

.file_input_butten {
	width: 100px;
	position: absolute;
	top: 0px;
	background-color: #33BB00;
	color: #fff:border-style:solid;
}

.file_input_hidden {
	font-size: 45px;
	position: absolute;
	right: 0px;
	top: 0px;
	opacity: 0;
	filter: alpha(opacity = 0);
	-ms-filter: "alpha(opacity=0)";
	-khtml-opacity: 0;
	-moz-opacity: 0;
}
</style>

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="<c:url value='/resources/js/jquery/jquery.ui.widget.js'/>"></script>
<script
	src="<c:url value='/resources/js/jquery/jquery.iframe-transport.js'/>"></script>
<script src="<c:url value='/resources/js/jquery/jquery.fileupload.js'/>"></script>

<script>
	function fn_fileUploadComplete(file_type, data) {
		var divSource = "";
		if ("IMAGE" == file_type) {
			divSource += "<div id='attach_file' class='attach-image-item'>";
			divSource += "  <img class='item' src='<c:url value='/'/>"
					+ data.file_svr_path + "/" + data.file_svr_name + "'>";
			divSource += "  <div class='btn'><img class='delete_btn' src='<c:url value='/resources/images/board/btn_file_delete.gif'/>' width=14 height=14 onclick='fn_delete_attach(this, \"IMAGE\", \""
					+ data.file_svr_path
					+ "\",\""
					+ data.file_svr_name
					+ "\")'></div>";
		} else {
			divSource += "<div id='attach_file' class='attach-file-item'>";
			divSource += "  <div class='btn'><img class='button' src='<c:url value='/resources/images/board/btn_file_delete.gif'/>' width=12 height=11 onclick='fn_delete_attach(this, \"FILE\", \""
					+ data.file_svr_path
					+ "\",\""
					+ data.file_svr_name
					+ "\")'></div>";
			divSource += "  <div class='item_name' id='arr_file_name'>"
					+ data.file_name + "</div>";
			divSource += "  <div class='item_size' id='arr_file_size'>"
					+ data.file_size + "</div>";
			divSource += "  <div class='content_type' id='arr_content_type'>"
					+ data.content_type + "</div>";
		}
		divSource += "  <input type='hidden' name='file_name' value='"+data.file_name+"'>";
		divSource += "  <input type='hidden' name='file_size' value='"+data.file_size+"'>";
		divSource += "  <input type='hidden' name='file_path' value='"+data.file_svr_path+"'>";
		divSource += "  <input type='hidden' name='file_servername' value='"+data.file_svr_name+"'>";
		divSource += "  <input type='hidden' name='file_type' value='"+file_type+"'>";
		divSource += "  <input type='hidden' name='file_contenttype' value='"+data.content_type+"'>";
		divSource += "  <input type='hidden' name='trans_mode' value='I'>";
		divSource += "</div>";
		//alert(divSource);
		var contents;
		if ("IMAGE" == file_type) {
			contents = document.getElementById('image-canvas');
		} else {
			contents = document.getElementById('file-canvas');
		}
		contents.innerHTML = contents.innerHTML + divSource;
		contents.style.display = 'block';
	}

	// 첨부
	function fn_delete_attach(obj, type, file_path, file_name) {
		// DIV 를 화면에서 사라지게 한다.
		var div = obj.parentNode.parentNode;
		div.style.display = 'none';
		//div.parentNode.removeChild(div);
		$.post("<c:url value='/file/delete.do'/>", {
			file_type : type,
			file_path : file_path,
			file_name : file_name
		}, function(data, status) {
			if (status == 'success') {
				//alert("data: " + data);
			} else {
				alert("Status: " + status);
			}
		});
	}
</script>


<div>
	<input type="hidden" id="imageName" readonly="readonly" />
	<div class="file_input_div">
		<input type="button" value="Search Images" class="file_input_button" />
		<input type="file" id="image" name="image" class="file_input_hidden"
			onchange="javascript:document.getElementById('imageName').value = this.value" />
	</div>
</div>
<div id="image-canvas" class="attach-image-list"></div>
<div>
	<input type="hidden" id="fileName" readonly="readonly" />
	<div class="file_input_div">
		<input type="button" value="Search files" class="file_input_button" />
		<input type="file" id="file" name="file" class="file_input_hidden"
			onchange="javascript:document.getElementById('fileName').value = this.value" />
	</div>
</div>
<div id="file-canvas" class="attach-file-list"></div>

<script>
	$(function() {
		$('#image').fileupload({
			url : '<c:url value='/image/upload.do'/>',
			dataType : 'json',
			success : function(data) {
				// HTML 코드 작성
				fn_fileUploadComplete('IMAGE', data);
			},
			error : function(xhr, status, error) {
				alert('Error: ' + error);
				var err = eval("(" + xhr.responseText + ")");
				alert(err.Message);
			}
		});

		$('#file').fileupload({
			url : '<c:url value='/file/upload.do'/>',
			dataType : 'json',
			success : function(data) {
				// HTML 코드 작성
				fn_fileUploadComplete('FILE', data);
			},
			error : function(xhr, status, error) {
				alert('Error: ' + error);
				var err = eval("(" + xhr.responseText + ")");
				alert(err.Message);
			}
		});
	});
</script>

