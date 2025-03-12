 
package dto;
 
public class ProductStyle {
    private String style_id;
    private String style_name;

    public ProductStyle() {
    }

    public ProductStyle(String style_id, String style_name) {
        this.style_id = style_id;
        this.style_name = style_name;
    }

    public String getStyle_id() {
        return style_id;
    }

    public void setStyle_id(String style_id) {
        this.style_id = style_id;
    }

    public String getStyle_name() {
        return style_name;
    }

    public void setStyle_name(String style_name) {
        this.style_name = style_name;
    }
    
    
}
