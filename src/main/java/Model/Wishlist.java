package Model;

import java.sql.Date;

public class Wishlist {
//    CREATE wishlist (
//       wishlistId INT IDENTITY(1,1) PRIMARY KEY,
//       userId INT,
//       createdDate DATETIME DEFAULT GETDATE(),
//       FOREIGN KEY (userId) REFERENCES users(userID)
//);
    private int wishlistId;
    private int userId;
    private Date createdDate;

    public Wishlist() {
    }

    public Wishlist(int wishlistId, int userId, Date createdDate) {
        this.wishlistId = wishlistId;
        this.userId = userId;
        this.createdDate = createdDate;
    }

    public int getWishlistId() {
        return wishlistId;
    }

    public void setWishlistId(int wishlistId) {
        this.wishlistId = wishlistId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public String toString() {
        return "Wishlist{" + "wishlistId=" + wishlistId + ", userId=" + userId + ", createdDate=" + createdDate + '}';
    }
}
