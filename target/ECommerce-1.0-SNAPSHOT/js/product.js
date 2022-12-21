/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function deletepod(data){
    //alert(data);
    console.log(data);
    
    swal({
  title: "Are you sure?",
  text: "Once deleted, you will not be able to recover this imaginary product file!",
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

      
                    
                    
                    
                    
                    
      
      
   
