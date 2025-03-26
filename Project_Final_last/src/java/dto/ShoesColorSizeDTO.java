package dto;

public class ShoesColorSizeDTO {

    private String shoesid;
    private String colorid;
    private String sizeid;
    private int stock;

    public ShoesColorSizeDTO(String shoesid, String colorid, String sizeid, int stock) {
        this.shoesid = shoesid;
        this.colorid = colorid;
        this.sizeid = sizeid;
        this.stock = stock;
    }

    public ShoesColorSizeDTO() {
        this.stock = 0;
    }

    public String getShoesid() {
        return shoesid;
    }

    public void setShoesid(String shoesid) {
        this.shoesid = shoesid;
    }

    public String getColorid() {
        return colorid;
    }

    public void setColorid(String colorid) {
        this.colorid = colorid;
    }

    public String getSizeid() {
        return sizeid;
    }

    public void setSizeid(String sizeid) {
        this.sizeid = sizeid;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
}
