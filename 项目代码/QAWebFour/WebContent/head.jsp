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
<div id="w" class="easyui-window" title="提问"
	data-options="iconCls:'icon-save',closed:true, modal:true, draggable:false"
	style="width: 700px; height: 600px; padding: 5px;">
	<div>
		<a>问题</a><input class="easyui-textbox" />
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
        这里写你的初始化内容
    </textarea>
	</div>
</div>
<script>
	function question() {
		$("#w").window("open")
	}
</script>