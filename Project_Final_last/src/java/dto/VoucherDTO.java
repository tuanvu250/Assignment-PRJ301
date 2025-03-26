/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class VoucherDTO {
    private String id;
    private String code;
    private double discount;
    private int quantity;
    private Date start_date;
    private Date end_date;
    private String status;

    @Override
    public String toString() {
        return "VoucherDTO{" + "id=" + id + ", code=" + code + ", discount=" + discount + ", quantity=" + quantity + ", start_date=" + start_date + ", end_date=" + end_date + ", status=" + status + '}';
    }

    public VoucherDTO() {
    }

    public VoucherDTO(String id, String code, double discount, int quantity, Date start_date, Date end_date, String status) {
        this.id = id;
        this.code = code;
        this.discount = discount;
        this.quantity = quantity;
        this.start_date = start_date;
        this.end_date = end_date;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
}
