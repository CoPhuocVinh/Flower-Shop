/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.shopping.BillsDAO;
import sample.shopping.Cart;
import sample.shopping.Product;
import sample.shopping.ProductDAO;
import sample.user.UserDTO;

/**
 *
 * @author Jio
 */
public class CheckOutController extends HttpServlet {

    private static final String ERROR = "ViewCart.jsp";
    private static final String SUCCESS = "CheckOut.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");

            if (loginUser == null) {
                request.setAttribute("ERROR", "Vui lòng login để Check Out!");
                url = "login.jsp";
            } else {
                boolean checkDB = false;
                ProductDAO dao = new ProductDAO();
                Product proDB = null;
                for (Product pro : cart.getCart().values()) {
                    proDB = dao.checkFlowerDB(pro.getId());
                    int quantityDB = proDB.getQuantity();
                    if (quantityDB > 0) {
                        checkDB = true;
                    } else {
                        checkDB = false;
                    }

                }
                if (checkDB) {

                    String userID = loginUser.getUserID();
                    int kq = BillsDAO.insertBill(userID, cart);

                    boolean check = dao.CheckOutQuantity(cart);
                    if (kq > 0 && check) {
                        url = SUCCESS;
                        session.removeAttribute("CART");
                    }
                }else{
                    request.setAttribute("MESSAGE", "Quantity max: "
                        + "" + proDB.getQuantity());
                    url = ERROR;
                }

            }

        } catch (Exception e) {
            log("ERROR AT CHECKOUTCONTROLLER" + e.toString());
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
