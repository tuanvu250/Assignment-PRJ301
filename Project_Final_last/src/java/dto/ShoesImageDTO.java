package dto;

public class ShoesImageDTO {

    private int imageid;
    private String shoesid;
    private String imgUrl;
    private int order;

    public int getImageid() {
        return imageid;
    }

    public void setImageid(int imageid) {
        this.imageid = imageid;
    }

    public String getShoesid() {
        return shoesid;
    }

    public void setShoesid(String shoesid) {
        this.shoesid = shoesid;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }

    public ShoesImageDTO(int imageid, String shoesid, String imgUrl, int order) {
        this.imageid = imageid;
        this.shoesid = shoesid;
        this.imgUrl = imgUrl;
        this.order = order;
    }

    public ShoesImageDTO() {
    }

}
