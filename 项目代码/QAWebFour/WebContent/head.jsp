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

<div id="w" class="easyui-window" title="Window Layout" data-options="iconCls:'icon-save',closed:true" style="width:500px;height:200px;padding:5px;">
		<!-- <div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'east',split:true" style="width:100px"></div>
			<div data-options="region:'center'" style="padding:10px;">
				jQuery EasyUI framework help you build your web page easily.
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="javascript:alert('ok')" style="width:80px">Ok</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="javascript:alert('cancel')" style="width:80px">Cancel</a>
			</div>
		</div> -->
		<div>
			
		</div>
	</div>
<script>
function question(){
	$("#w").window("open")
}
</script>