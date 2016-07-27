<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ec" uri="http://www.extremecomponents.org"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="entityPath" value="/employee" />

<html>
<head>
<script type="text/javascript" src="${ctx}/static/components/jquery-easyui-1.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/static/components/jquery-easyui-1.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/components/jquery-easyui-1.4/themes/icon.css">
<script type="text/javascript" src="${ctx}/static/components/jquery-easyui-1.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/common.js"></script>
<link href="<c:url value="/static/components/extremetable/Styles/extremecomponents.css"/>" type="text/css" rel="stylesheet">
</head>

<body>
	<div class="operations">
		<form class="form-inline" role="form"  style="margin: 0 0 3px 0;display:inline-block;*display:inline;zoom:1;" id="queryform" name="queryform"  action="${ctx}${entityPath}/list">
		  &nbsp;&nbsp;输入姓名查找
		   <input id="search"   name="searchname"  value="${searchname}" style="border-radius:6px;border: 1px solid #7AA7EB;width: 220px;height: 25px" 
				onkeypress="enter();">
		  &nbsp;&nbsp;编码
          <input id="search" name="code"  value="${code}"  style="border-radius:6px;border: 1px solid #7AA7EB;width: 220px;height: 25px" 
				onkeypress="enter();">
				
		<br>
		&nbsp;&nbsp;父级名称
		 <input  class="easyui-combotree" style="width: 300px"
		 data-options="url:'${ctx}${entityPath}/getAvailableParents?id=${empty employee.id ? '0' : employee.id}',method:'get',required:false,value:'${empty employee.parent ? '0' : employee.pid}'"  name="pid" value="${pid} }"  >

		<a href="javascript:void(0)" class="easyui-linkbutton" id="subcon" data-options="iconCls:'icon-search'" onclick="submitForm()">查询</a> 
		 </form>
				
		<span> 
		    <div style="color: red;display:inline-block;*display:inline;zoom:1;" id="message">&nbsp;&nbsp;&nbsp;&nbsp;${message}</div>
		</span>
		<span class="btn green fileinput-button" style="float: right;"> <i class="icon-plus icon-white"></i> <A href="${ctx}${entityPath}/add"  class="easyui-linkbutton" iconCls="icon-add"   style="color: blue;">增加</A>&nbsp;&nbsp;&nbsp;&nbsp;
		</span>
	</div>
	
	<div class="table-responsive">
		<ec:table items="employeeList" var="employee" action="${ctx}${entityPath}/list"
		    		retrieveRowsCallback="limit" 
		            sortRowsCallback="limit" 
		            rowsDisplayed="20"
		            filterable="false"
		            sortable="false"
		            autoIncludeParameters="${empty param.autoInc?'true':'false'}">
		        <ec:row>
		        		<ec:exportXls fileName="employeeInfo.xls"   tooltip="导出 Excel" >
		        		</ec:exportXls>
		            <ec:column property="rowcount" cell="rowCount" sortable="false" title="序号"  style="text-align:center;"/>

				<ec:column property="pid" title="父级ID"></ec:column>
		        <ec:column property="name" title="姓名"></ec:column>		
		        <ec:column property="code" title="编码"></ec:column>
				<c:choose>
		        	<c:when test="${employee.sex=='1'}">
                	<ec:column property="sex" title="性别">男</ec:column>
                	</c:when>
		        	<c:when test="${employee.sex=='2'}">
                	<ec:column property="sex" title="性别">女</ec:column>
                	</c:when>
                	<c:otherwise>
	                <ec:column property="sex" title="性别">wu</ec:column>
    	            </c:otherwise>
    	        </c:choose>
				                    
				                    
		             <ec:column property="edit" title="修改" sortable="false" viewsAllowed="html" style="width: 30px">
		               <A href="${ctx}${entityPath}/edit/${employee.id}"><center> <img src="<c:url value="/static/images/icon/16x16/modify.gif"/>" border="0" /></center></A>
		            </ec:column>
		            <ec:column property="checkbox" title="删除" sortable="false" viewsAllowed="html" style="width: 30px">
		                <A href="${ctx}${entityPath}/delete/${employee.id}" onclick="return(confirm('确定刪除？'))"> <center><img src="<c:url value="/static/images/icon/16x16/delete.gif"/>" border="0" /></center>
							</A>
		            </ec:column>
		         
		        </ec:row>
		    </ec:table>
		
	</div>
</body>
</html>
