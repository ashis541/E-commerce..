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
@WebServlet(name = "increment", urlPatterns = {"/increment"})
public class increment extends HttpServlet {

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
         
				// get the id of the product of which addToCart btn is clicked
				
                                String action = request.getParameter("action");
			int id = Integer.parseInt(request.getParameter("id"));
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cartItems");
                        if(action != null && id >= 1){
                            if(action.equals("inc")){
                                for (Cart c : cart_list) {
						if (c.getItemId() == id) {
							int quantity = c.getItemQuantity();
							quantity++;
							c.setItemQuantity(quantity);
							response.sendRedirect("cartItems.jsp");
						}
					}
                            
                            
                            
                            }
                            if (action.equals("dec")) {
					for (Cart c : cart_list) {
						if (c.getItemId() == id && c.getItemQuantity() > 1) {
							int quantity = c.getItemQuantity();
							quantity--;
							c.setItemQuantity(quantity);
							break;
						}
					}
					response.sendRedirect("cartItems.jsp");
				}
                        
                        
                        }
                         else {
				response.sendRedirect("cartItems.jsp");
			}

				 
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
