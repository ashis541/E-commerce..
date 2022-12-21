


<%@page import="com.learn.ecommerce.entities.Category"%>
<%@page import="com.learn.ecommerce.dao.CategoryDao"%>
<%@page import="com.learn.ecommerce.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.ecommerce.dao.ProductDao"%>
<%@page import="com.learn.ecommerce.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Product</title>
        
        
         <%@include file="components/common_css_js.jsp" %> 
                  <%@include file="components/Common_modals.jsp" %> 

        <script src="js/categoriesJS.js" type="text/javascript"></script>
         <script src="js/" type="text/javascript"></script>
        <link href="css/categoriesCSS.css" rel="stylesheet" type="text/css"/>
                <link rel="SHORTCUT ICON" href="favicon.ico" type="image/x-icon" />

        
     
        
        
        
    </head>
    <body id="pp">
        <%@include file="components/navbar.jsp" %>
        
      
        <!--admin validations-->
        <c:set var="userSS" scope="session" value="${sessionScope['current-user']}"   />
        <!-- <%--       <c:out value="${userSS}"/><br>
                <c:out value="${userSS.userType}"/><br>     --%>-->

        <c:choose>
            <c:when test="${userSS==null}">

                <c:set var="message" scope="session" value="You are not logged in !! Login first"   />

                <c:redirect url="login.jsp"/>

            </c:when>

            <c:otherwise>       

                <c:set var="String" value="${userSS.userType}"/> 

                <c:if test="${fn:contains(String, 'normal')}">

                    <c:set var="message" scope="session" value="You are not Admin !! Acess Denied !!"   />

                    <c:redirect url="login.jsp"/>

                </c:if>
            </c:otherwise>
        </c:choose> 
        <!--admin validations ends -->

        
        
        
        
        <%
   ProductDao ps=new ProductDao(FactoryProvider.getFactory());
      List<Product> pros=ps.getAllProducts();



            %>
        
        
        
       
       <%@include  file="components/Message.jsp" %>
         
   
   <div id="demo">

       <h1 class="d-flex justify-content-center" style="color: #6372d6;margin-right: 30vw;">Product Table</h1>
       <h2 class="h2" style="color: #6372d6;font-weight:normal;font-size: 2rem">Total number of Product:</h2>
  
       
           <!--search bar-->  
  <input style="width: 300px!important;font-size:  20px!important;" class="form-control float-right mb-2" id="myInput" type="text" placeholder="Search..">
  
       
       
  <div class="table-responsive-vertical shadow-z-1">
  <!-- Table starts here -->
  <table id="table" 
         class="table table-hover table-mc-light-blue ">
      <thead>
        <tr>
            <th class="tt">ID</th>
          <th class="tt">Name</th>
          <th class="tt">Description</th>
          <th class="tt">Price</th>
          <th class="tt">Discount</th>
          <th class="tt">Quantity</th>
         
          <th class="tt">image</th><!-- comment -->
          <th class="tt">Edit</th>
          <th class="tt">Delete</th>
          
          
        </tr>
      </thead>
      <tbody id="myTable">
          
          
          <%        
              
              for(Product prodL:pros) {
          
              
              %>
 

         
        <tr>    
            <td data-title="ID"><%= prodL.getpId()   %></td>
          <td data-title="Title"><%=  prodL.getpName()  %></td>
          <td data-title="Description"><%= prodL.getpDesc()  %></td>
          <td data-title="price"><%= prodL.getpPrice()  %></td><!-- comment -->
           <td data-title="Discount"><%= prodL.getpDiscount()  %></td>
            <td data-title="quantity"><%= prodL.getpQuantity() %></td>
           
            <td data-title="photo"> <img class="card-img-top m-2" style="max-height: 60px;" src="img/products/<%=prodL.getpPhoto()%>" alt="Card image cap"></td>
          <td class="eddd" data-title="Edit"  >
              <a href="#!"  data-toggle="modal" data-target="#add-category-modal" 
                 onclick="showModal(' <%=prodL.getpId()  %>','<%=prodL.getpName()  %>',' <%=prodL.getpDesc()  %> ',' <%=prodL.getpPrice()  %> ',' <%=prodL.getpDiscount()  %> ',' <%=prodL.getpQuantity() %> ')" 
           
              
                 
                 >edit</a></td>
          <td  class="eddd" data-title="Delete"><a href="#!"  onclick="deletepod('<%=prodL.getpId()%>')"  >delete</a></td>
        
        </tr>
    
        
        
          <%        
              
          }
              
              
              %>
        
        
        

      </tbody>
    </table>
  </div>
  
  
   
   
   </div> 
   
   
   
   
   </div>  
   
        
        
        
        
          <div id="myModal">   
        
 
              
          
        <!--add category modal-->

   

        <!-- Modal -->
        <div class="modal fade open-EditTodo" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Edit category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body edit-content">
              
                        <form id="UpdateCategoryForm" action="UpdateProductServlet" method="post">

                            <input  id="catId" type="hidden" name="catId" />

                            <div class="form-group">
                                <input  id="catT" type="text" class="form-control" name="catTitle" required="true"  placeholder="Enter Category title"/>
                            </div>
                            <div class="form-group">
                                <textarea id="catD" style="height:252px;" class="form-control" name="catDescription" required="true" placeholder="Enter Category description"></textarea>
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-success">Update Category</button>
                            </div>




                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!--end add category modal-->
       
        
        
        
        
        
        
       </div> 
        
      
        
       <div id="About" class="container-fluid" style=" position: relative;margin:0px!important;padding:0px!important">
            <%@include file="footer.jsp" %> 

        </div>     
        
        
    </body>
</html>
<script>
    
    
function deletepod(data){
    //alert(data);
    console.log(data);
    
    swal({
  title: "Are you sure?",
  text: "Once deleted, you will not be able to recover this imaginary file!",
  icon: "warning",
  buttons: true,
  dangerMode: true,
})
.then((willDelete) => {
  if (willDelete) {
      
      
   
              let id=data;      
                    
               console.log("before deleting id:"+id)  ;   
              
            
            
            $.post( "DeleteProductServlet", {"pID":id},function( data ) {
             
            
                console.log(data);
                if (data.trim() == 'ss')
                {
//                    swal("Done!", "Succesfully updated", "success");
                 swal("Done!", "Succesfully deleted", "success"); 
                    
                    location.reload();
                
                
                }
                
            else
                {
                    swal("Error!!", "Something went wrong try again...", "error");
                }

            
            
            
            
                    });
            
            
            
      
                    
                    
                    
                    
                    
      
      
   
  } 
});
    
    
    
    
    
    
}


    
</script>