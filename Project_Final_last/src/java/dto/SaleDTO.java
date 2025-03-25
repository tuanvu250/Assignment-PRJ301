/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author ADMIN
 */
public class SaleDTO {
    private String sale_id;
    private double sale_num;

    public SaleDTO() {
    }

    public SaleDTO(String sale_id, double sale_num) {
        this.sale_id = sale_id;
        this.sale_num = sale_num;
    }

    public String getSale_id() {
        return sale_id;
    }

    public void setSale_id(String sale_id) {
        this.sale_id = sale_id;
    }

    public double getSale_num() {
        return sale_num;
    }

    public void setSale_num(double sale_num) {
        this.sale_num = sale_num;
    }
    
}
