

<%@page import="com.learn.ecommerce.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.ecommerce.dao.CategoryDao"%>
<%@page import="com.learn.ecommerce.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Categories</title>
        
        
         <%@include file="components/common_css_js.jsp" %> 
                  <%@include file="components/Common_modals.jsp" %> 

        <script src="js/categoriesJS.js" type="text/javascript"></script>
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
            
   CategoryDao cDao=new CategoryDao(FactoryProvider.getFactory());
      List<Category> cats=cDao.getCategories();
     



            %>
        
        
        
       
       <%@include  file="components/Message.jsp" %>
         
   
   <div id="demo">

       <h1 class="d-flex justify-content-center" style="color: #6372d6;margin-right: 30vw;">Category Table</h1>
       <h2 class="h2" style="color: #6372d6;font-weight:normal;font-size: 2rem">Total number of Categories:</h2>
  
       
           <!--search bar-->  
  <input style="width: 300px!important;font-size:  20px!important;" class="form-control float-right mb-2" id="myInput" type="text" placeholder="Search..">
  
       
       
       
  <!-- Responsive table starts here -->
  <!-- For correct display on small screens you must add 'data-title' to each 'td' in your table -->
  <div class="table-responsive-vertical shadow-z-1">
  <!-- Table starts here -->
  <table id="table" 
         class="table table-hover table-mc-light-blue ">
      <thead>
        <tr>
            <th class="tt">ID</th>
          <th class="tt">Title</th>
          <th class="tt">Description</th>
          <th class="tt">Edit</th>
          <th class="tt">Delete</th>
         
          
        </tr>
      </thead>
      <tbody id="myTable">
          
          
          <%        
              
              for(Category catL:cats) {
          
              
              %>
          
  

         
        <tr>    
            <td data-title="ID"><%= catL.getCategoryId()   %></td>
          <td data-title="Title"><%=  catL.getCategoryTitle()  %></td>
          <td data-title="Description"><%= catL.getCategoryDescription()  %></td>
          <td class="eddd" data-title="Edit"  >
              <a href="#!"  data-toggle="modal" data-target="#add-category-modal" 
                 onclick="showModal(' <%=catL.getCategoryId()   %>','<%=catL.getCategoryTitle()  %>',' <%=catL.getCategoryDescription()  %> ')" 
           
              
                 
                 >edit</a></td>
          <td  class="eddd" data-title="Delete"><a href="#!"  onclick="deleteCat('<%=catL.getCategoryId() %>')"  >delete</a></td>
        
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
              
                        <form id="UpdateCategoryForm" action="UpdateCategoryServlet" method="post">

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





function showModal(id,title,description)
{
// alert(id);
// alert(title);
// alert(description);
 

 $("#catId").val(id) ;// = id;
 $("#catT").val(title) ;// = id;
 $("#catD").val(description) ;
     
 
}

function deleteCat(data){
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
              
            
            
            $.post( "DeleteCategoryServlet", {"catID":id},function( data ) {
             
            
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





$(document).ready(function () {







//seaerch bar
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });






$('#UpdateCategoryForm').submit(function (event) {
        event.preventDefault(); // Prevent the form from submitting via the browser
           console.log("clicked on submit");
        let form = $(this);
           console.log(form);


  $.ajax({
            url: "UpdateCategoryServlet",
            type: 'POST',
            data: form.serialize() ,          
            dataType: "text",
            crossDomain: true,
          //  headers: {"Access-Control-Allow-Origin" : "*" , "Access-Control-Allow-Methods" : "POST, GET"},
            success: function (data, textStatus, jqXHR) {
                
               
                   console.log(data);
                if (data.trim() == 'ss')
                {
//                    swal("Done!", "Succesfully updated", "success");
                 swal("Done!", "Succesfully updated", "success"); 
                    
                    location.reload();
                
                
                }
                
            else
                {
                    swal("Error!!", "Something went wrong try again...", "error");
                }

          
            },

            error: function (jqXHR, textStatus, errorThrown) {
                //error..
                swal("Error!!", "Something went wrong try again...", "error");
            }


        });
        
               });



































    $.fn.rowCount = function () {
        return $('tr', $(this).find('tbody')).length;
    };

    $.fn.columnCount = function () {
        return $('th', $(this).find('tbody')).length;
    };
    var
            rowctr = $('#table').rowCount();
    var colctr = $('#table').columnCount();


    $('.h2').append(rowctr);
    console.log('No of Rows:' + rowctr);
    console.log('No of Columns:' + colctr);






    var table = $('#table');

    // Table bordered
    $('#table-bordered').change(function () {
        var value = $(this).val();
        table.removeClass('table-bordered').addClass(value);
    });

    // Table striped
    $('#table-striped').change(function () {
        var value = $(this).val();
        table.removeClass('table-striped').addClass(value);
    });

    // Table hover
    $('#table-hover').change(function () {
        var value = $(this).val();
        table.removeClass('table-hover').addClass(value);
    });

    // Table color
    $('#table-color').change(function () {
        var value = $(this).val();
        table.removeClass(/^table-mc-/).addClass(value);
    });
    
    
});


(function (removeClass) {

    jQuery.fn.removeClass = function (value) {
        if (value && typeof value.test === "function") {
            for (var i = 0, l = this.length; i < l; i++) {
                var elem = this[i];
                if (elem.nodeType === 1 && elem.className) {
                    var classNames = elem.className.split(/\s+/);

                    for (var n = classNames.length; n--; ) {
                        if (value.test(classNames[n])) {
                            classNames.splice(n, 1);
                        }
                    }
                    elem.className = jQuery.trim(classNames.join(" "));
                }
            }
        } else {
            removeClass.call(this, value);
        }
        return this;
    }

})(jQuery.fn.removeClass);
</script>