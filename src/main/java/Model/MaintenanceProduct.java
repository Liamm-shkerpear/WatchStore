package Model;

import java.util.Date;

public class MaintenanceProduct {
    private int maintenanceId;
    private int productId;
    private String maintenanceName;
    private String maintenanceDescription;
    private String maintenanceDate;
    private String maintenanceTime;
    private boolean maintenanceStatus;
    private int userId;
    private Date maintenanceCreatedDate;
    private Date maintenanceUpdatedDate;

    private String productName;
    private String img;
    private String img1;
    private String img2;
    private String img3;
    private int priceProduct;
    private int typeProductId;
    private int sizeId;
    private int trademarkId;
    private int quantity;
    private String describeProduct;
    private Date productCreatedDate;
    private Date productUpdatedDate;
    private String sizeName;
    private String trademarkName;
    private String productTypeName;
    private float discountPercentage;
    private int priceAfterDiscount;
    private boolean productStatus;

    // Constructors
    public MaintenanceProduct() {
    }

    public MaintenanceProduct(int maintenanceId, int productId, String maintenanceName, String maintenanceDescription, String maintenanceDate, String maintenanceTime, boolean maintenanceStatus, int userId, Date maintenanceCreatedDate, Date maintenanceUpdatedDate, String productName, String img, String img1, String img2, String img3, int priceProduct, int typeProductId, int sizeId, int trademarkId, int quantity, String describeProduct, Date productCreatedDate, Date productUpdatedDate, String sizeName, String trademarkName, String productTypeName, float discountPercentage, int priceAfterDiscount, boolean productStatus) {
        this.maintenanceId = maintenanceId;
        this.productId = productId;
        this.maintenanceName = maintenanceName;
        this.maintenanceDescription = maintenanceDescription;
        this.maintenanceDate = maintenanceDate;
        this.maintenanceTime = maintenanceTime;
        this.maintenanceStatus = maintenanceStatus;
        this.userId = userId;
        this.maintenanceCreatedDate = maintenanceCreatedDate;
        this.maintenanceUpdatedDate = maintenanceUpdatedDate;
        this.productName = productName;
        this.img = img;
        this.img1 = img1;
        this.img2 = img2;
        this.img3 = img3;
        this.priceProduct = priceProduct;
        this.typeProductId = typeProductId;
        this.sizeId = sizeId;
        this.trademarkId = trademarkId;
        this.quantity = quantity;
        this.describeProduct = describeProduct;
        this.productCreatedDate = productCreatedDate;
        this.productUpdatedDate = productUpdatedDate;
        this.sizeName = sizeName;
        this.trademarkName = trademarkName;
        this.productTypeName = productTypeName;
        this.discountPercentage = discountPercentage;
        this.priceAfterDiscount = priceAfterDiscount;
        this.productStatus = productStatus;
    }

    // Getters and Setters for all fields

    public int getMaintenanceId() {
        return maintenanceId;
    }

    public void setMaintenanceId(int maintenanceId) {
        this.maintenanceId = maintenanceId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getMaintenanceName() {
        return maintenanceName;
    }

    public void setMaintenanceName(String maintenanceName) {
        this.maintenanceName = maintenanceName;
    }

    public String getMaintenanceDescription() {
        return maintenanceDescription;
    }

    public void setMaintenanceDescription(String maintenanceDescription) {
        this.maintenanceDescription = maintenanceDescription;
    }

    public String getMaintenanceDate() {
        return maintenanceDate;
    }

    public void setMaintenanceDate(String maintenanceDate) {
        this.maintenanceDate = maintenanceDate;
    }

    public String getMaintenanceTime() {
        return maintenanceTime;
    }

    public void setMaintenanceTime(String maintenanceTime) {
        this.maintenanceTime = maintenanceTime;
    }

    public boolean isMaintenanceStatus() {
        return maintenanceStatus;
    }

    public void setMaintenanceStatus(boolean maintenanceStatus) {
        this.maintenanceStatus = maintenanceStatus;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getMaintenanceCreatedDate() {
        return maintenanceCreatedDate;
    }

    public void setMaintenanceCreatedDate(Date maintenanceCreatedDate) {
        this.maintenanceCreatedDate = maintenanceCreatedDate;
    }

    public Date getMaintenanceUpdatedDate() {
        return maintenanceUpdatedDate;
    }

    public void setMaintenanceUpdatedDate(Date maintenanceUpdatedDate) {
        this.maintenanceUpdatedDate = maintenanceUpdatedDate;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getImg1() {
        return img1;
    }

    public void setImg1(String img1) {
        this.img1 = img1;
    }

    public String getImg2() {
        return img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2;
    }

    public String getImg3() {
        return img3;
    }

    public void setImg3(String img3) {
        this.img3 = img3;
    }

    public int getPriceProduct() {
        return priceProduct;
    }

    public void setPriceProduct(int priceProduct) {
        this.priceProduct = priceProduct;
    }

    public int getTypeProductId() {
        return typeProductId;
    }

    public void setTypeProductId(int typeProductId) {
        this.typeProductId = typeProductId;
    }

    public int getSizeId() {
        return sizeId;
    }

    public void setSizeId(int sizeId) {
        this.sizeId = sizeId;
    }

    public int getTrademarkId() {
        return trademarkId;
    }

    public void setTrademarkId(int trademarkId) {
        this.trademarkId = trademarkId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescribeProduct() {
        return describeProduct;
    }

    public void setDescribeProduct(String describeProduct) {
        this.describeProduct = describeProduct;
    }

    public Date getProductCreatedDate() {
        return productCreatedDate;
    }

    public void setProductCreatedDate(Date productCreatedDate) {
        this.productCreatedDate = productCreatedDate;
    }

    public Date getProductUpdatedDate() {
        return productUpdatedDate;
    }

    public void setProductUpdatedDate(Date productUpdatedDate) {
        this.productUpdatedDate = productUpdatedDate;
    }

    public String getSizeName() {
        return sizeName;
    }

    public void setSizeName(String sizeName) {
        this.sizeName = sizeName;
    }

    public String getTrademarkName() {
        return trademarkName;
    }

    public void setTrademarkName(String trademarkName) {
        this.trademarkName = trademarkName;
    }

    public String getProductTypeName() {
        return productTypeName;
    }

    public void setProductTypeName(String productTypeName) {
        this.productTypeName = productTypeName;
    }

    public float getDiscountPercentage() {
        return discountPercentage;
    }

    public void setDiscountPercentage(float discountPercentage) {
        this.discountPercentage = discountPercentage;
    }

    public int getPriceAfterDiscount() {
        return priceAfterDiscount;
    }

    public void setPriceAfterDiscount(int priceAfterDiscount) {
        this.priceAfterDiscount = priceAfterDiscount;
    }

    public boolean isProductStatus() {
        return productStatus;
    }

    public void setProductStatus(boolean productStatus) {
        this.productStatus = productStatus;
    }

    @Override
    public String toString() {
        return "MaintenanceProduct{" +
                "maintenanceId=" + maintenanceId +
                ", productId=" + productId +
                ", maintenanceName='" + maintenanceName + '\'' +
                ", maintenanceDescription='" + maintenanceDescription + '\'' +
                ", maintenanceDate='" + maintenanceDate + '\'' +
                ", maintenanceTime='" + maintenanceTime + '\'' +
                ", maintenanceStatus=" + maintenanceStatus +
                ", userId=" + userId +
                ", maintenanceCreatedDate=" + maintenanceCreatedDate +
                ", maintenanceUpdatedDate=" + maintenanceUpdatedDate +
                ", productName='" + productName + '\'' +
                ", img='" + img + '\'' +
                ", img1='" + img1 + '\'' +
                ", img2='" + img2 + '\'' +
                ", img3='" + img3 + '\'' +
                ", priceProduct=" + priceProduct +
                ", typeProductId=" + typeProductId +
                ", sizeId=" + sizeId +
                ", trademarkId=" + trademarkId +
                ", quantity=" + quantity +
                ", describeProduct='" + describeProduct + '\'' +
                ", productCreatedDate=" + productCreatedDate +
                ", productUpdatedDate=" + productUpdatedDate +
                ", sizeName='" + sizeName + '\'' +
                ", trademarkName='" + trademarkName + '\'' +
                ", productTypeName='" + productTypeName + '\'' +
                ", discountPercentage=" + discountPercentage +
                ", priceAfterDiscount=" + priceAfterDiscount +
                ", productStatus=" + productStatus +
                '}';
    }
}
