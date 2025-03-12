 
package dto;
 
public class ProductMaterial {
    private String mat_id;
    private String mat_name;

    public ProductMaterial() {
    }

    public ProductMaterial(String mat_id, String mat_name) {
        this.mat_id = mat_id;
        this.mat_name = mat_name;
    }

    public String getMat_id() {
        return mat_id;
    }

    public void setMat_id(String mat_id) {
        this.mat_id = mat_id;
    }

    public String getMat_name() {
        return mat_name;
    }

    public void setMat_name(String mat_name) {
        this.mat_name = mat_name;
    }
   
}
