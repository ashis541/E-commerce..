<%@page import="java.util.ArrayList"%>
<%@page import="com.learn.ecommerce.entities.User"%>
<%@page import="com.learn.ecommerce.model.Cart"%>
<%
    User user11 = (User) session.getAttribute("current-user");


%>
<%
	ArrayList<Cart> cartList = (ArrayList<Cart>)session.getAttribute("cartItems");
	int cartQuantity = 0;
	// checking for NullPointerException
	if(cartList!=null)
		cartQuantity = cartList.size();

%>




<nav class="navbar navbar-expand-md navbar-dark bg-dark">

    <div class="container">
       
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="https://dadytees.business.site/?utm_source=gmb&utm_medium=referral" >
                        Contact-us
                    </a>
                  
                </li>

            </ul>

            
            <h2 style="    color: aliceblue;">D A D Y T E E S</h2>

            <ul class="navbar-nav ml-auto">
                
                
               	<li class="nav-item active">
						<a class="nav-link" href="cartItems.jsp">
							<i class="fa fa-cart-plus"><span id="cart-items"> ( <%=cartQuantity %> )</span></i></a> 
			    </li>
                

                <%        if (user11 == null) {
                                  
                         %>
                    
                  
                         
                         
                <li class="nav-item active">
                    <a class="nav-link" href="login.jsp">Login </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="register.jsp">Register </a>
                </li>
                         
                         
                         <%
                           } else {
                    
                     %>
                    
                         
                                 
                <li class="nav-item active">
                    <a class="nav-link" href="<%=user11.getUserType().equals("admin") ? "admin.jsp" : "normalUser.jsp" %>"><%=user11.getUserName()%> </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet">Logout </a>
                </li>
                         
                         
                         <%
                    

                          }
                %>




            </ul>

        </div>
    </div>
</nav>