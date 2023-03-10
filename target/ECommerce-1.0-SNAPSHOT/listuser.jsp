<%@page import="java.util.ArrayList"%>
<%@page import="com.learn.ecommerce.entities.User"%>
<%@page import="com.learn.ecommerce.helper.FactoryProvider"%>
<%@page import="com.learn.ecommerce.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users</title>
<%@include file="/components/common_css_js.jsp" %>

</head>
<body>
	
	<%
		UserDao userDao = new UserDao(FactoryProvider.getFactory());
		ArrayList<User> usersList =(ArrayList<User>)userDao.getUser();
		
	%>
	
	<div class="container">
	
		<div class="row">
		
			<div class="col-md-2"></div>
			
			<div class="col-md-8">
			
				<div class="card m-3">
				
					<div class="card-header text-center">
							<h4>List of all Users</h4>
					</div>
					
					<!-- Showing list of all users -->
					<div class="card-body">
					
						<table class="table">
							<tr class="thead-light">
								<th>User Id</th>
								<th>Name</th>
								<th>Email address</th>
								<th>Phone Number</th>
							</tr>
							<tr>		
						
							<% 
							
								if(usersList!=null && usersList.size()!=0)
								{
									for(User user:usersList)
									{
										
							%>
							
										<td><%=user.getUserId() %></td>
										<td><%=user.getUserName() %></td>
										<td><%=user.getUserEmail() %></td>
										<td><%=user.getUserPhone() %></td>
									</tr>
							
							<%
									}
								}
							
							%>
						
						</table>
					
					</div>
					
				</div>
			
			</div>
			
		</div>
		
	</div>

</body>
</html>