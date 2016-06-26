<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="navi">
	<ul>
		<li><a onclick="question()">提问</a></li>
		<li><a>条鱼</a></li>
		<li><a>c</a></li>
		<li><a>d</a></li>
	</ul>
</div>

<div id="wquestion" class="easyui-window wquestion" title="提问"
	data-options="iconCls:'icon-save',closed:true, modal:true, draggable:false"
	style="width: 700px; height: 600px; padding: 5px;">
	<div class="title">
		<a>问题</a><br/> <input id="qstitle"
			class="easyui-textbox qstitle" style="width: 100%; height: 32px; font-size:20px"
			data-options="required:true,validType:'length[1,50]'" /><br />
	</div>
	<br />
	<!-- 配置文件 -->
	<script type="text/javascript" src="./ueditor/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="./ueditor/ueditor.all.js"></script>
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
		var ue = UE.getEditor('container');
	</script>
	<!-- 加载编辑器的容器 -->
	<textarea id="container" name="content" type="text/plain">
   		</textarea>
	<br /> <br /> <a>选择话题</a><input class="easyui-combobox qstopic"
		style="width: 250px"
		data-options="
					url:'http://localhost:8080/QAFour/REST/Topic/getAllTopic',
					method:'get',
					valueField:'ID',
					textField:'tpname',
					textField:'tpdetail',
					multiple:true,
					panelHeight:'auto',
					iconCls:'icon-search',
					groupField:'tpname'
			" />
	<br /> <br />
	<a class="easyui-linkbutton" iconCls="icon-ok">提问</a>
	<style scoped="scoped">
.title {
	margin-top: 20px;
}
.title a{
	font-size: 20px;
	font-family: "微软雅黑"
}

.qstitle {
	font-size: 20px;
	font-family: "微软雅黑";
}
</style>
</div>
<script>
	var myloader = function(param, success, error) {
		var q = param.q || '';
		if (q.length <= 1) {
			return false
		}
		$.ajax({
			url : 'http://ws.geonames.org/searchJSON',
			dataType : 'jsonp',
			data : {
				featureClass : "P",
				style : "full",
				maxRows : 20,
				name_startsWith : q
			},
			success : function(data) {
				var items = $.map(data.geonames, function(item) {
					return {
						id : item.geonameId,
						name : item.name
								+ (item.adminName1 ? ', ' + item.adminName1
										: '') + ', ' + item.countryName
					};
				});
				success(items);
			},
			error : function() {
				error.apply(this, arguments);
			}
		});
	}
	function question() {
		$("#wquestion").window("open")
	}
</script>