/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Jio
 */
public class Cart {

    Map<String, Product> cart;

    public Cart() {
    }

    public Cart(Map<String, Product> cart) {
        this.cart = cart;
    }

    public Map<String, Product> getCart() {
        return cart;
    }

    public int getCartQuantity(Product p) throws SQLException {
        int Quantity = 0;
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        
        if (this.cart.containsKey(p.getId())) {
            Quantity = this.cart.get(p.getId()).getQuantity();
        }
        return Quantity;
    }

    public void setCart(Map<String, Product> cart) {
        this.cart = cart;
    }

    public boolean add(Product p) throws SQLException {
        boolean check = false;

        if (this.cart == null) {
            this.cart = new HashMap<>();
        }

        if (this.cart.containsKey(p.getId())) {
            int curentQuantity = this.cart.get(p.getId()).getQuantity();
            p.setQuantity(curentQuantity + p.getQuantity());
        }
        
        this.cart.put(p.getId(), p);
        check = true;

        return check;
    }

    public boolean edit(String id, Product p) {
        boolean checkEdit = false;
        if (this.cart != null) {
            if (this.cart.containsKey(id)) {
                cart.replace(id, p);
                checkEdit = true;
            }
        }
        return checkEdit;
    }

    public boolean remove(String id) {
        boolean checkRemove = false;
        if (this.cart != null) {
            if (this.cart.containsKey(id)) {
                cart.remove(id);
                checkRemove = true;
            }
        }
        return checkRemove;
    }

}
