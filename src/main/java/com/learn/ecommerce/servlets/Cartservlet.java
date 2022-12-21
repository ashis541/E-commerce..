/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.learn.ecommerce.servlets;

import com.learn.ecommerce.dao.ProductDao;
import com.learn.ecommerce.entities.Product;
import com.learn.ecommerce.helper.FactoryProvider;
import com.learn.ecommerce.model.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
@WebServlet(name = "Cartservlet", urlPatterns = {"/Cartservlet"})
public class Cartservlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
        ArrayList<Cart> cartList;
				Cart cart = new Cart();
				// get the id of the product of which addToCart btn is clicked
				int prodId = Integer.parseInt(request.getParameter("cart"));
				out.print("Product id is "+prodId);
				int flag=0;
                                HttpSession session = request.getSession();
				Product product=productDao.getProductById(prodId);
			
				cartList = (ArrayList<Cart>) session.getAttribute("cartItems");
				
				// if cart is empty and product is added first time
				if(cartList==null)
				{
					cart = new Cart();
					cart.setItemId(prodId);
					cart.setItemName(product.getpName());
					cart.setItemPrice(product.getpPrice());
					cart.setItemQuantity(1);
					cart.setItemDiscount(product.getpPrice());
					
					cartList = new ArrayList<Cart>();
					cartList.add(cart);
					flag=1;
				}
				
				// item is of same product id which was added before. So increase quantity
				if(flag!=1 && cartList!=null)
				{
					
						for(Cart c:cartList)
						{
							if(c.getItemId()==prodId)
							{
								int quan = c.getItemQuantity();
								quan++;
								c.setItemQuantity(quan);
								flag=1;
								break;
								
							}
						}
						
				}
								
				
				// cart is having item and the new item is also new item
				if(flag==0 && cartList!=null) 
				{
					// cart = new Cart();
					cart.setItemId(prodId);
					cart.setItemName(product.getpName());
					cart.setItemPrice(product.getpPrice());
					cart.setItemQuantity(1);
					cart.setItemDiscount(product.getpPrice());
					
					// cartList = new ArrayList<Cart>();S
					cartList.add(cart);
					//flag=1;
				}
				
				
				session.setAttribute("cartItems", cartList);
					
				response.sendRedirect("index.jsp");
				
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
