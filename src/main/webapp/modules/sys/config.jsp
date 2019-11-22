<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="dbfound-tags" prefix="d"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<d:includeLibrary />
	</head>
	<script type="text/javascript">
		function query() {
			resourceGrid.query();
		}
		
		function reset() {
			queryForm.reset();
		}
		
		
		function isCellEditable(col, row,name,record) {
			//console.log("record.json: "+JSON.stringify(record.json))
			if(undefined==record.json){//如果是新增行
				if(name=="remarks"||name=="cvalue"||name=="ckey"){
					return true;
				}
			}else{//如果不是新增行
				if(name=="remarks"||name=="cvalue"){
					return true;
				}
			}
			return false;
		}
		
		function commit(json){
			queryForm.setData(json);
		}
	</script>
	<body>
		<d:form id="queryForm" title="查询条件" labelWidth="80">
			<d:line columnWidth="0.33">
				<d:field name="id" anchor="60%" editor="textfield" prompt="编号">
				   <d:event name="enter" handle="query"/>
				</d:field>
				<d:field name="ckey"  anchor="60%" editor="textfield" prompt="参数key">
				   <d:event name="enter" handle="query"/>
				</d:field>
			</d:line>
		</d:form>
		
		<d:buttonGroup>
			<d:button id="query" title="查询" click="query" />
			<d:button title="重置" click="reset" />
		</d:buttonGroup>
		
		<d:grid id="resourceGrid" title="系统配置" selectFirstRow="false" model="sys/config" height="$D.getFullHeight('resourceGrid')" isCellEditable="isCellEditable" queryForm="queryForm" autoQuery="true" >
			<d:toolBar>
				<d:gridButton type="add"/>
				<d:gridButton type="save"/>
				<d:gridButton type="delete"/>
			</d:toolBar>
			<d:columns>
				<d:column name="id" sortable="true" prompt="编号" width="60" editable="false"/>
				<d:column name="ckey" required="true" editor="textfield" prompt="参数key" width="130" editable="false"/>
				<d:column name="cvalue" required="true" editor="textfield" prompt="参数值" width="60" />
				<d:column name="remarks" editor="textfield" prompt="备注" width="120" />
				<d:column name="create_by" prompt="创建者" width="80" editable="false"/>
				<d:column name="create_date" prompt="创建时间" width="80" editable="false"/>
				<d:column name="last_update_by" prompt="最后经手人" width="80" editable="false"/>
				<d:column name="last_update_date" prompt="最后更新时间" width="80" editable="false"/>
			</d:columns>
		</d:grid>
		
	</body>
</html>
