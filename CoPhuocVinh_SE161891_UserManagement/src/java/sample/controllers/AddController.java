/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.shopping.Cart;
import sample.shopping.Product;
import sample.shopping.ProductDAO;

/**
 *
 * @author Jio
 */
public class AddController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "shopping.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            

            String pString = request.getParameter("cmbProduct");
            String[] tmp = pString.split("-");
            String id = tmp[0];
            String name = tmp[1];
            double price = Double.parseDouble(tmp[2]);
            int quantity = Integer.parseInt(request.getParameter("cmbQuantity"));

            Cart cart = (Cart) session.getAttribute("CART");
            if (cart == null) {
                cart = new Cart();

            }
            Product p = new Product(id, name, price, quantity);
            ProductDAO dao = new ProductDAO();
            Product proDB = dao.checkFlowerDB(id);
            int curentQuantity = cart.getCartQuantity(p);
            if (proDB.getQuantity() < (curentQuantity + quantity)) {
                request.setAttribute("MESSAGE", "Quantity max: "
                        + "" + proDB.getQuantity()
                        + " You added: " +  (curentQuantity));
                url = SUCCESS;

            } else {
                cart.add(p);
                session.setAttribute("CART", cart);
                session.setAttribute("curentQuantity", curentQuantity);
                request.setAttribute("MESSAGE", "Message: added     " + name + ".Quantity: " + quantity + ".");
                url = SUCCESS;
            }

        } catch (Exception e) {
            log("Error at AddController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
