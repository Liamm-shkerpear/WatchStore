package Model;

public class WishlistProducts {
//    CREATE TABLE wishlist_products (
//       wishlistItemId INT IDENTITY(1,1) PRIMARY KEY,
//       wishlistId INT,
//       productId INT,
//       createdDate DATETIME DEFAULT GETDATE(),
//       FOREIGN KEY (wishlistId) REFERENCES wishlist(wishlistId),
//       FOREIGN KEY (productId) REFERENCES products(productId)
//);
    private int wishlistItemId;
    private int wishlistId;
    private int productId;
    private String createdDate;

    public WishlistProducts() {
    }

    public WishlistProducts(int wishlistItemId, int wishlistId, int productId, String createdDate) {
        this.wishlistItemId = wishlistItemId;
        this.wishlistId = wishlistId;
        this.productId = productId;
        this.createdDate = createdDate;
    }

    public int getWishlistItemId() {
        return wishlistItemId;
    }

    public void setWishlistItemId(int wishlistItemId) {
        this.wishlistItemId = wishlistItemId;
    }

    public int getWishlistId() {
        return wishlistId;
    }

    public void setWishlistId(int wishlistId) {
        this.wishlistId = wishlistId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

}
