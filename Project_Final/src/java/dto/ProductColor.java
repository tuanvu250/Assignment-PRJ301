 
package dto;

 
public class ProductColor {
    private String color_id;
    private String color_name;

    public ProductColor() {
    }

    public ProductColor(String color_id, String color_name) {
        this.color_id = color_id;
        this.color_name = color_name;
    }

    public String getColor_id() {
        return color_id;
    }

    public void setColor_id(String color_id) {
        this.color_id = color_id;
    }

    public String getColor_name() {
        return color_name;
    }

    public void setColor_name(String color_name) {
        this.color_name = color_name;
    }
    
}
