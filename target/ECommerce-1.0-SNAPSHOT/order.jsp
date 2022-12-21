<%@page import="com.learn.ecommerce.dao.CartDao"%>
<%@page import="com.learn.ecommerce.model.Cart"%>
<%@page import="com.learn.ecommerce.model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.ecommerce.helper.FactoryProvider"%>
<%@page import="com.learn.ecommerce.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders</title>
<%@include file="/components/common_css_js.jsp"%>

</head>
<body>	

	<%
            
		OrderDao orderDao = new OrderDao(FactoryProvider.getFactory());
		ArrayList<Order> orderList =(ArrayList<Order>)orderDao.listAllOrders();
		

	%>
	
	<div class="container">
	
		<div class="row">
		
			<div class="col-md-2"></div>
			
			<div class="col-md-10">
			
				<div class="card ">
				
					<div class="card-header text-center">
							<h4>List of all orders</h4>
					</div>
					
					<!-- Showing orders -->
					<div class="">
					
					<%
						if (orderList!=null && orderList.size()!=0) 
						{
						%>
						
							<table class="table">
									<thead class="thead-light">
										<tr>
											<th>Order Id</th>
											<th>Customer Name</th>
											<th>Customer Email</th>
                                                                                        <th>Customer address</th>
                                                                                        <th>product</th>
                                                                                        <th>Quantity</th><!-- comment -->
                                                                                        <th>price</th>
										</tr>
									</thead>
							<tr>
							
						<%
							for (int i = 0; i < orderList.size(); i++) 
							{
								Order order = orderList.get(i);
                                                                CartDao cart=new CartDao(FactoryProvider.getFactory());
                                                  List<Cart> myOrderList =(List<Cart>)orderDao.getOrderByCustomerEmail(order.getCustomerEmail());
                                                  for(Cart c:myOrderList)
									{
								
						%>
                                                
						
							<td><%=order.getOrderId() %></td>
							<td><%=order.getCustomerName() %></td>
							<td><%=order.getCustomerEmail() %></td>
                                                        <td><%=order.getCustomerAddress() %></td>
                                                     
					
	                                                
										
										<td><%=c.getItemName() %></td>
										<td><%=c.getItemQuantity()%></td>
                                                                                <td><%=c.getTotalPrice()%></td>
                                                                                
									</tr>
							
                                                        <%
                                                            }
}

						%>
                                                
						
						</table>
						<%
						}
				%>
							
					
					</div>
					
				</div>
			
			</div>
			
		</div>
		
	</div>

</body>
</html>