<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'form.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js" integrity="sha512-XKa9Hemdy1Ui3KSGgJdgMyYlUg1gM+QhL6cnlyTe2qzMCYm4nAZ1PsVerQzTTXzonUR+dmswHqgJPuwCq1MaAg==" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/js/bootstrap-select.min.js" integrity="sha512-yDlE7vpGDP7o2eftkCiPZ+yuUyEcaBwoJoIhdXv71KZWugFqEphIS3PU60lEkFaz8RxaVsMpSvQxMBaKVwA5xg==" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/plug-ins/1.10.24/api/sum().js"></script>




<style>
div.dataTables_wrapper {
	width: 1500px;
	margin: 0 auto;
}
</style> 
</head>
 
  <body>
	<div class="container">
		<div class="col-md-6">
			<form:form method="post" modelAttribute="datadetails" class="form-container form-group">
				<div class="col-md-6">
					<i> <label>department</label>
					</i>
				 	
						<%-- <form:option value="0">---Select department---</form:option> --%>
		
			<form:select class="form-control" id="department_id" path="department" > 
			<form:option value="0">---Select department---</form:option>
						<c:forEach items="${listd}" var="dep" >
							<form:option value="${dep.department}">${dep.department}</form:option>
						</c:forEach> 
					</form:select>
				</div>  
			
					<div class="col-md-6">
					<i> <label>HOA</label>
					</i>
					<form:select class="form-control" id="hoa_id" path="hoa">
						<form:option value="0">---Select hoa---</form:option>
					</form:select>
				</div>

				<div>
					<i> <label>DDO</label>
					</i>
					<form:select class="form-control" id="ddo_id" path="ddo">
						<form:option value="0">---Select ddo---</form:option>
					</form:select>
				</div>
				<br>
				<div><button id="button_id" type="button" class="btn btn-primary">Click</button></div><br>

			</form:form>

	

	</div>

	</div>
	
 <div class="col-md-4">
    
    <table class="display nowrap table table-sm table-bordered " id="mytable" style="width:100%">
						<thead>
							<tr>

								
								<th>district</th>
								<th>treasury</th>
								<th>department</th>
								<th>ddo</th>
								<th>hoa</th>
								<th>bill_type</th>
								<th>bill_subtype</th>
								<th>old_bill</th>
								<th>status_at_eoy</th>
								<th>new_bill</th>
								<th>status_at_boy</th>
								<th>gross_amount</th>
								<th>deduction_amount</th>
								<th>net_amount</th>
								
							</tr>
						</thead>
						<tbody id="view">
							<tr></tr>

						</tbody>
			<tfoot>
				<tr>
					<th colspan="11" style="text-align:right">Total:</th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
			</tfoot>
		</table>
    				<div class="pagination-container">

    </div>  </div></div>

	<script>
	
	
		$("#department_id").change(function() {
	
			var all = $("#department_id").val();//here all id department variable
			console.log(all);
/* 			//if (all == 'ALL') {
				$("#department_id").ready(function() {
	
					console.log("all seee798674");
	
					console.log("above");
					$.ajax(
						{
							type : 'GET',
							url : "http://localhost:8080/waste/all",
							dataType : "html",
							async : true,
							success : function(res) {
								theResponse = JSON.parse(res);
								var a = "";
								for (var i = 0; i <= theResponse.length - 1; i++) {
									a += "<tr class=\"table\" ><td>" + theResponse[i].district + "</td>" + "<td>" + theResponse[i].treasury + "</td>" + "<td>" + theResponse[i].department + "</td>" + "<td>" + theResponse[i].ddo + "</td>" + "<td>" + theResponse[i].hoa + "</td>" + "<td>" + theResponse[i].bill_type + "</td>" + "<td>" + theResponse[i].bill_subtype + "</td>" + "<td>" + theResponse[i].old_bill + "</td>" + "<td>" + theResponse[i].status_at_eoy + "</td>" + "<td>" + theResponse[i].new_bill + "</td>" + "<td>" + theResponse[i].status_at_boy + "</td>" + "<td>" + theResponse[i].gross_amount + "</td>" + "<td>" + theResponse[i].deduction_amount + "</td>" + "<td>" + theResponse[i].net_amount + "</td></tr>";
								}
	
								$("#view").html(a);
	
								$('#mytable').DataTable({
								"scrollX": true,
									"footerCallback" : function(row, data, start, end, display) {
										var api = this.api(),
											data;
	
										// Remove the formatting to get integer data for summation
										var intVal = function(i) {
											return typeof i === 'string' ?
												i.replace(/[\$,]/g, '') * 1 :
												typeof i === 'number' ?
													i : 0;
										};
	
	
										// Total over this page
										grossTotal = api.column(11, {
											page : 'current'
										}).data().reduce(function(a, b) {
											return intVal(a) + intVal(b);
										}, 0);
										// Total over this page
										deductionTotal = api.column(12, {
											page : 'current'
										}).data().reduce(function(a, b) {
											return intVal(a) + intVal(b);
										}, 0);
										// Total over this page
										netTotal = api.column(13, {
											page : 'current'
										}).data().reduce(function(a, b) {
											return intVal(a) + intVal(b);
										}, 0);
	
										// Update footer
										$(api.column(11).footer()).html(grossTotal);
										$(api.column(12).footer()).html(deductionTotal);
										$(api.column(13).footer()).html(netTotal);
	
									}
								});
							}
						});
	
	
	
						//	});
	
				});
			//} else { */
				$("#department_id").ready(function() {
					var department = $("#department_id").val();
					console.log("hellooooadkakfdjkjhfjdsgfghjsdgfhjsd");
					$.ajax(
						{
							type : 'GET',
							url : "http://localhost:8080/waste/hoa/" + department,
							dataType : "html",
							async : true,
							success : function(res) {
								theResponse = JSON.parse(res);
								var a="";
								 a += '<option value="0">---Select hoa---</option><option value="All">ALL</option>';
								for (var i = 0; i <= theResponse.length - 1; i++) {
									a += "<option  value=" + theResponse[i].hoa + ">" + theResponse[i].hoa + "</option>";
								}
								console.log(a);
								$("#hoa_id").html(a);
							}
						});
				});
		//	}
		});
		$("#hoa_id").click(function() {
			var hoa = $("#hoa_id").val();
			var n2 = hoa.localeCompare("ALL");
			if(n2==0){
			
			$.ajax(
				{
					type : 'GET',
					url : "http://localhost:8080/waste/ddoall" ,
	
					dataType : "html",
					async : true,
					success : function(res) {
						theResponse = JSON.parse(res);
						var a = '<option value="0">---Select ddo---</option><option value="All">ALL</option>';
						for (var i = 0; i <= theResponse.length - 1; i++) {
							a += "<option value=" + theResponse[i].ddo + ">"
								+ theResponse[i].ddo
								+ "</option>";
						}
						console.log(a);
						$("#ddo_id").html(a);
					}
				});
				}  
				else{
			$.ajax(
				{
					type : 'GET',
					url : "http://localhost:8080/waste/ddo/" + hoa,
	
					dataType : "html",
					async : true,
					success : function(res) {
						theResponse = JSON.parse(res);
						var a = '<option value="0">---Select ddo---</option><option value="All">ALL</option>';
						for (var i = 0; i <= theResponse.length - 1; i++) {
							a += "<option value=" + theResponse[i].ddo + ">"
								+ theResponse[i].ddo
								+ "</option>";
						}
						console.log(a);
						$("#ddo_id").html(a);
					}
				});
				}
				
				
				
				
				
		});
		$("#button_id").click(function() {
			var Dpt = $("#department_id").val();
		
			$.ajax({
				type : 'GET',
				url : "http://localhost:8080/waste/reportview/" + Dpt,
				dataType : "html",
				async : true,
				success : function(res) {
					theResponse = JSON.parse(res);
					var a = "";
					for (var i = 0; i <= theResponse.length - 1; i++) {
						a += "<tr class=\"table\" ><td>" + theResponse[i].district + "</td>" + "<td>" + theResponse[i].treasury + "</td>" + "<td>" + theResponse[i].department + "</td>" + "<td>" + theResponse[i].ddo + "</td>" + "<td>" + theResponse[i].hoa + "</td>" + "<td>" + theResponse[i].bill_type + "</td>" + "<td>" + theResponse[i].bill_subtype + "</td>" + "<td>" + theResponse[i].old_bill + "</td>" + "<td>" + theResponse[i].status_at_eoy + "</td>" + "<td>" + theResponse[i].new_bill + "</td>" + "<td>" + theResponse[i].status_at_boy + "</td>" + "<td>" + theResponse[i].gross_amount + "</td>" + "<td>" + theResponse[i].deduction_amount + "</td>" + "<td>" + theResponse[i].net_amount + "</td></tr>";
					}
					$("#view").html(a);
					$('.display').DataTable({
					
					"scrollX": true,
						"footerCallback" : function(row, data, start, end, display) {
							var api = this.api(),
								data;
	
							// Remove the formatting to get integer data for summation
							var intVal = function(i) {
								return typeof i === 'string' ?
									i.replace(/[\$,]/g, '') * 1 :
									typeof i === 'number' ?
										i : 0;
							};
	
							AllGrosstotal = api
								.column(11)
								.data()
								.reduce(function(a, b) {
									return intVal(a) + intVal(b);
								}, 0);
							AllDeductiontotal = api
								.column(12)
								.data()
								.reduce(function(a, b) {
									return intVal(a) + intVal(b);
								}, 0);
							Allnettotal = api
								.column(13)
								.data()
								.reduce(function(a, b) {
									return intVal(a) + intVal(b);
								}, 0);
							// Total over this page
							grossTotal = api.column(11, {
								page : 'current'
							}).data().reduce(function(a, b) {
								return intVal(a) + intVal(b);
							}, 0);
							// Total over this page
							deductionTotal = api.column(12, {
								page : 'current'
							}).data().reduce(function(a, b) {
								return intVal(a) + intVal(b);
							}, 0);
							// Total over this page
							netTotal = api.column(13, {
								page : 'current'
							}).data().reduce(function(a, b) {
								return intVal(a) + intVal(b);
							}, 0);
	
							// Update footer
							$(api.column(11).footer()).html(grossTotal+'('+AllGrosstotal+')');
							$(api.column(12).footer()).html(deductionTotal+'('+AllDeductiontotal+')');
							$(api.column(13).footer()).html(netTotal+'('+Allnettotal+')');
	
						}
					});
				},
			});
		});
	</script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"
		integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"
		integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj"
		crossorigin="anonymous"></script>
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">			
				
				
				</body>
</html>
