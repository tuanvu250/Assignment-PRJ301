/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.math.BigDecimal;
import java.time.LocalDate;

/**
 *
 * @author ADMIN
 */
public class ShoesProductDTO {

    private String shoes_id;
    private String shoes_name;
    private LocalDate produce_date;
    private BigDecimal price;
    private int quantity;
    private String gender;
    private String description;
    private String status;
    private String style_id;
    private String line_id;
    private String mat_id;
    private String sale_id;

    public ShoesProductDTO() {
        this.shoes_name = "";
        this.price = BigDecimal.valueOf(0);
        this.quantity = 0;
        this.description = "";
    }

    public ShoesProductDTO(String shoes_id, String shoes_name, LocalDate produce_date, BigDecimal price, int quantity, String gender, String description, String status, String style_id, String line_id, String mat_id, String sale_id) {
        this.shoes_id = shoes_id;
        this.shoes_name = shoes_name;
        this.produce_date = produce_date;
        this.price = price;
        this.quantity = quantity;
        this.gender = gender;
        this.description = description;
        this.status = status;
        this.style_id = style_id;
        this.line_id = line_id;
        this.mat_id = mat_id;
        this.sale_id = sale_id;
    }

    public ShoesProductDTO(String shoes_name, LocalDate produce_date, BigDecimal price, int quantity, String gender, String description, String status, String style_id, String line_id, String mat_id, String sale_id) {
        this.shoes_name = shoes_name;
        this.produce_date = produce_date;
        this.price = price;
        this.quantity = quantity;
        this.gender = gender;
        this.description = description;
        this.status = status;
        this.style_id = style_id;
        this.line_id = line_id;
        this.mat_id = mat_id;
        this.sale_id = sale_id;
    }

    public String getShoes_id() {
        return shoes_id;
    }

    public void setShoes_id(String shoes_id) {
        this.shoes_id = shoes_id;
    }

    public String getShoes_name() {
        return shoes_name;
    }

    public void setShoes_name(String shoes_name) {
        this.shoes_name = shoes_name;
    }

    public LocalDate getProduce_date() {
        return produce_date;
    }

    public void setProduce_date(LocalDate produce_date) {
        this.produce_date = produce_date;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStyle_id() {
        return style_id;
    }

    public void setStyle_id(String style_id) {
        this.style_id = style_id;
    }

    public String getLine_id() {
        return line_id;
    }

    public void setLine_id(String line_id) {
        this.line_id = line_id;
    }

    public String getMat_id() {
        return mat_id;
    }

    public void setMat_id(String mat_id) {
        this.mat_id = mat_id;
    }

    public String getSale_id() {
        return sale_id;
    }

    public void setSale_id(String sale_id) {
        this.sale_id = sale_id;
    }

}
