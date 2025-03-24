/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.math.BigDecimal;

/**
 *
 * @author ADMIN
 */
public class CartDTO {
    private String cart_id;
    private String shoes_id;
    private String color_id;
    private String size_id;
    private int quantity;
    private BigDecimal price;

    public String getCart_id() {
        return cart_id;
    }

    public void setCart_id(String cart_id) {
        this.cart_id = cart_id;
    }

    public String getShoes_id() {
        return shoes_id;
    }

    public void setShoes_id(String shoes_id) {
        this.shoes_id = shoes_id;
    }

    public String getColor_id() {
        return color_id;
    }

    public void setColor_id(String color_id) {
        this.color_id = color_id;
    }

    public String getSize_id() {
        return size_id;
    }

    public void setSize_id(String size_id) {
        this.size_id = size_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public CartDTO(String cart_id, String shoes_id, String color_id, String size_id, int quantity, BigDecimal price) {
        this.cart_id = cart_id;
        this.shoes_id = shoes_id;
        this.color_id = color_id;
        this.size_id = size_id;
        this.quantity = quantity;
        this.price = price;
    }

    public CartDTO() {
    }
    
}
