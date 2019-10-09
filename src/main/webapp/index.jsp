<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>员工列表</title>

<%

	pageContext.setAttribute("APP_PATH",request.getContextPath());

%>

<script type="text/javascript" src="${APP_PATH }/static/js/jquery.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/css/js/bootstrap.min.js"></script>

</head>
<body>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				
				<button class="btn btn-primary">新增</button>
				<button class="btn btn-danger">删除</button>
				
			</div>
			
		
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th>#</th>
							<th>empName</th>
							<th>gender</th>
							<th>email</th>
							<th>deptName</th>
							<th>操作</th>
						</tr>
					</thead>
					
					<tbody>
						
					</tbody>
					
					
					
				</table>
			
			</div>
		
		</div>
		<div class="row">
			<div class="col-md-6" id="page_info_area">
				
			</div>
			
			<div class="col-md-6" id="page_nav_area">
				
			</div>
		
		</div>
	
	</div>

	<script type="text/javascript">
		$(function(){
			$.ajax({
				url:"${APP_PATH}/emps",
				data:"pn=1",
				type:"GET",
				success:function(result){
					//console.log(result);
					build_emps_table(result);
					build_page_info(result);
					build_page_nav(result);
					
				}
				
			});
			
		});
		
		function build_emps_table(result){
			var emps=result.extend.pageInfo.list;
			$.each(emps,function(index,item){
				var empIdTd=$("<td></td>").append(item.empId);
				var empNameTd=$("<td></td>").append(item.empName);//
				var genderTd=$("<td></td>").append(item.gender=='M'?"男":"女");//
				var emailTd=$("<td></td>").append(item.email);//
				var deptNameTd=$("<td></td>").append(item.department.deptName);//
				
				
				var editBtn=$("<button></button>").addClass("btn btn-primary btn-sm")
							  .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
				var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm")
				  .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
				
				var btnTd=$("<td></td>").append(editBtn).append(delBtn);
				$("<tr></tr>").append(empIdTd)
					.append(empNameTd)
					.append(genderTd)
					.append(emailTd)
					.append(deptNameTd)
					.append(btnTd)
					.appendTo("#emps_table tbody");
			});
			
		}
		
		function build_page_info(result){
			$("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页 ,总"+
					result.extend.pageInfo.pages+"页，总"+
					result.extend.pageInfo.total+"条记录");
			
			
		}
		
		function build_page_nav(result){
			
			var ul=$("<ul></ul>").addClass("pagination");
			
			var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
			var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
			var lastPageLi=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
			
			ul.append(firstPageLi).append(prePageLi);
			
			
			$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
				var numLi=$("<li></li>").append($("<a></a>").append(item));
				ul.append(numLi);
				
				
			});
				
			ul.append(nextPageLi).append(lastPageLi);
			
			var navEle=$("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}
	
	
	</script>
</body>
</html>