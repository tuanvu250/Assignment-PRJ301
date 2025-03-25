/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.math.BigDecimal;
import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class OrderDTO {
    private String order_id;
    private String fullName;
    private String phone;
    private String email;
    private Date date_ordered;
    private String status;
    private String address;
    private String method_pay;
    private BigDecimal subtotal;
    private BigDecimal discount;
    private BigDecimal total_price;
    private String username;

    public OrderDTO(String order_id, String fullName, String phone, String email, Date date_ordered, String status, String address, String method_pay, BigDecimal subtotal, BigDecimal discount, BigDecimal total_price, String username) {
        this.order_id = order_id;
        this.fullName = fullName;
        this.phone = phone;
        this.email = email;
        this.date_ordered = date_ordered;
        this.status = status;
        this.address = address;
        this.method_pay = method_pay;
        this.subtotal = subtotal;
        this.discount = discount;
        this.total_price = total_price;
        this.username = username;
    }

    public OrderDTO() {
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDate_ordered() {
        return date_ordered;
    }

    public void setDate_ordered(Date date_ordered) {
        this.date_ordered = date_ordered;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMethod_pay() {
        return method_pay;
    }

    public void setMethod_pay(String method_pay) {
        this.method_pay = method_pay;
    }

    public BigDecimal getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(BigDecimal subtotal) {
        this.subtotal = subtotal;
    }

    public BigDecimal getDiscount() {
        return discount;
    }

    public void setDiscount(BigDecimal discount) {
        this.discount = discount;
    }

    public BigDecimal getTotal_price() {
        return total_price;
    }

    public void setTotal_price(BigDecimal total_price) {
        this.total_price = total_price;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
}
