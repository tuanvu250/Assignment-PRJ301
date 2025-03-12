 
package dto;
 
public class ProductSize {
    private String size_id;
    private double size_num;

    public ProductSize() {
    }

    public ProductSize(String size_id, double size_num) {
        this.size_id = size_id;
        this.size_num = size_num;
    }

    public String getSize_id() {
        return size_id;
    }

    public void setSize_id(String size_id) {
        this.size_id = size_id;
    }

    public double getSize_num() {
        return size_num;
    }

    public void setSize_num(double size_num) {
        this.size_num = size_num;
    }
    
}
