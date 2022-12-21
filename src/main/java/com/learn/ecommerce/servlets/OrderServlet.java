/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.learn.ecommerce.servlets;

import com.learn.ecommerce.dao.OrderDao;
import com.learn.ecommerce.helper.FactoryProvider;
import com.learn.ecommerce.model.Cart;
import com.learn.ecommerce.model.Order;

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
@WebServlet(name = "OrderServlet", urlPatterns = {"/OrderServlet"})
public class OrderServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            		HttpSession session = request.getSession();
		String name = request.getParameter("email");
		String email = request.getParameter("name");
		String mobile = request.getParameter("contact");
		String address= request.getParameter("address");
              String city ="null";
		int pincode = 0;
		String state ="null";
		
		// Validations
		if(name.isEmpty() || email.isEmpty() || mobile.isEmpty() || state.isEmpty() ||
				city.isEmpty() || address.isEmpty())
		{
			
			out.println("Please enter all details!!");
			return;
		}
		
		
		ArrayList<Cart> cartItemsList = new ArrayList<>();
		cartItemsList = (ArrayList<Cart>) session.getAttribute("cartItems");
		int finalPrice = 0;
		
/*		for (Cart cart : cartItemsList) {
			System.out.println("Item name: "+cart.getItemName());
			System.out.println("Item price: "+cart.getItemPrice());
			System.out.println("Item quantity: "+cart.getItemQuantity());
			System.out.println("Item total price: "+(cart.getItemPriceAfterDiscou  nt()*(cart.getItemQuantity())));
			finalPrice+=(cart.getItemPriceAfterDiscount()*(cart.getItemQuantity()));
			System.out.println();
		}	
		System.out.println("FINAL PRICE: "+finalPrice);
*/	
		// now set the above items to Order.jsp Entity class using setters & save to DB.
		// then show summary of purchase to user in order.jsp page.
			
		Order orderItems = new Order(cartItemsList,name,email,mobile,state,city,pincode,address);
		System.out.println(orderItems);
		
		OrderDao orderDao = new OrderDao(FactoryProvider.getFactory());
		orderDao.saveOrderDetails(orderItems,cartItemsList);
		HttpSession sess = request.getSession();
		sess.setAttribute("orderId", orderItems.getOrderId());
		
		response.sendRedirect("success.jsp");
          
	
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
