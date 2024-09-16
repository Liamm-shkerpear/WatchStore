IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'swp_projects')
BEGIN
    CREATE DATABASE swp_projects;
END

USE swp_projects;

CREATE TABLE typeAccount (
                             typeAccountId INT IDENTITY(1,1) PRIMARY KEY,
                             typeAccountName NVARCHAR(255) NOT NULL
);

-- Insert initial data into typeAccount
INSERT INTO typeAccount (typeAccountName) VALUES
                                              ('user'),
                                              ('admin'),
                                              ('employee');

-- Create users table
CREATE TABLE users (
                       userID INT IDENTITY(1,1) PRIMARY KEY,
                       name NVARCHAR(255) NOT NULL,
                       userDOB NVARCHAR(255) DEFAULT '1999-01-01',
                       password NVARCHAR(255),
                       email NVARCHAR(255) NOT NULL UNIQUE,
                       phoneNumber NVARCHAR(20),
                       gender BIT DEFAULT 1,
                       address NVARCHAR(255),
                       avatar NVARCHAR(255) DEFAULT '/assets/img/img_avatar.png',
                       description NVARCHAR(MAX),
                       typeAccountId INT DEFAULT 1,
                       idFacebook NVARCHAR(255),
                       idGoogle NVARCHAR(255),
                       status BIT DEFAULT 0,
                       token NVARCHAR(255),
                       createdDate DATETIME DEFAULT GETDATE(),
                       updatedDate DATETIME DEFAULT GETDATE(),
                       isBan BIT DEFAULT 0,
                       FOREIGN KEY (typeAccountId) REFERENCES typeAccount(typeAccountId)
);

INSERT INTO users (name, password, email, typeAccountId, status)
VALUES ('admin', '05343d1adf0dea29063e8f0c83d95d5d5f953cd0aa16c1eb581e77f0db432833',
        'admin@gmail.com', (SELECT typeAccountId FROM typeAccount WHERE typeAccountName = 'admin'), 1);

CREATE TABLE typeProduct (
                             typeProductId INT IDENTITY(1,1) PRIMARY KEY,
                             typeProductName NVARCHAR(255) NOT NULL,
                             describeType NVARCHAR(MAX),
                             createdDate DATETIME DEFAULT GETDATE(),
                             updatedDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE size (
                      sizeId INT IDENTITY(1,1) PRIMARY KEY,
                      sizeName NVARCHAR(255) NOT NULL,
                      describeSize NVARCHAR(MAX),
                      weight NVARCHAR(255),
                      createdDate DATETIME DEFAULT GETDATE(),
                      updatedDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE trademark (
                           trademarkId INT IDENTITY(1,1) PRIMARY KEY,
                           trademarkName NVARCHAR(255) NOT NULL,
                           logo NVARCHAR(255),
                           descriptionTrademark NVARCHAR(MAX),
                           createdDate DATETIME DEFAULT GETDATE(),
                           updatedDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE products (
                          productId INT IDENTITY(1,1) PRIMARY KEY,
                          productName NVARCHAR(255) NOT NULL,
                          img NVARCHAR(255),
                          img1 NVARCHAR(255),
                          img2 NVARCHAR(255),
                          img3 NVARCHAR(255),
                          priceProduct INT DEFAULT 0,
                          typeProductId INT,
                          sizeId INT,
                          trademarkId INT,
                          quantity INT DEFAULT 0,
                          describeProduct NVARCHAR(MAX),
                          createdDate DATETIME DEFAULT GETDATE(),
                          updatedDate DATETIME DEFAULT GETDATE(),
                          status BIT DEFAULT 1,
                          FOREIGN KEY (typeProductId) REFERENCES typeProduct(typeProductId),
                          FOREIGN KEY (sizeId) REFERENCES size(sizeId),
                          FOREIGN KEY (trademarkId) REFERENCES trademark(trademarkId)
);

CREATE TABLE product_sizes (
                               productId INT,
                               sizeId INT,
                               PRIMARY KEY (productId, sizeId),
                               FOREIGN KEY (productId) REFERENCES products(productId),
                               FOREIGN KEY (sizeId) REFERENCES size(sizeId)
);

CREATE TABLE discount (
                          discountId INT PRIMARY KEY IDENTITY(1,1),
                          discountPercentage DECIMAL(5, 2) NOT NULL CHECK (discountPercentage BETWEEN 0 AND 100),
                          startDate DATE,
                          endDate DATE,
                          status BIT DEFAULT 1,
                          createdAt DATETIME DEFAULT GETDATE(),
                          updatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE product_discount (
                                  productId INT,
                                  discountId INT,
                                  PRIMARY KEY (productId, discountId),
                                  FOREIGN KEY (productId) REFERENCES products(productId),
                                  FOREIGN KEY (discountId) REFERENCES discount(discountId)
);

CREATE TABLE payment (
                         paymentId INT IDENTITY(1,1) PRIMARY KEY,
                         typePayment NVARCHAR(255) NOT NULL
);

CREATE TABLE voucher (
                         voucherId INT IDENTITY(1,1) PRIMARY KEY,
                         code NVARCHAR(255) NOT NULL UNIQUE,
                         value INT,
                         typeSale BIT DEFAULT 0,
                         status BIT DEFAULT 1,
                         describeVoucher NVARCHAR(255),
                         maxSale INT,
                         startDate DATE,
                         endDate DATE,
                         createdDate DATETIME DEFAULT GETDATE(),
                         updatedDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE transport (
                           transportId INT IDENTITY(1,1) PRIMARY KEY,
                           transportName NVARCHAR(255) NOT NULL,
                           priceTransPort INT NOT NULL,
                           descriptionTransport NVARCHAR(MAX)
);

CREATE TABLE bill (
                      billId INT IDENTITY(1,1) PRIMARY KEY,
                      userId INT,
                      userName NVARCHAR(255),
                      email NVARCHAR(255),
                      city NVARCHAR(255),
                      district NVARCHAR(255),
                      phone NVARCHAR(20),
                      address NVARCHAR(255),
                      note NVARCHAR(MAX),
                      statusBill NVARCHAR(255) NOT NULL DEFAULT 'Waiting for confirmation',
                      voucherCode NVARCHAR(255),
                      vat DECIMAL(5, 2) DEFAULT 0,
                      transportId INT,
                      paymentId INT,
                      employeeId INT,
                      totalPrice INT,
                      createdDate DATETIME DEFAULT GETDATE(),
                      updatedDate DATETIME DEFAULT GETDATE(),
                      FOREIGN KEY (employeeId) REFERENCES users(userID),
                      FOREIGN KEY (userId) REFERENCES users(userID),
                      FOREIGN KEY (voucherCode) REFERENCES voucher(code),
                      FOREIGN KEY (transportId) REFERENCES transport(transportId),
                      FOREIGN KEY (paymentId) REFERENCES payment(paymentId)
);

CREATE TABLE billDetail (
                            billDetailId INT IDENTITY(1,1) PRIMARY KEY,
                            productId INT,
                            quantity INT NOT NULL,
                            billId INT,
                            priceBillDetail INT,
                            createdDate DATETIME DEFAULT GETDATE(),
                            updatedDate DATETIME DEFAULT GETDATE(),
                            FOREIGN KEY (productId) REFERENCES products(productId),
                            FOREIGN KEY (billId) REFERENCES bill(billId)
);

CREATE TABLE review (
                        reviewId INT IDENTITY(1,1) PRIMARY KEY,
                        productId INT,
                        userID INT,
                        starQuantity INT NOT NULL,
                        content NVARCHAR(MAX),
                        createdDate DATETIME DEFAULT GETDATE(),
                        updatedDate DATETIME DEFAULT GETDATE(),
                        FOREIGN KEY (productId) REFERENCES products(productId),
                        FOREIGN KEY (userID) REFERENCES users(userID)
);

CREATE TABLE carts (
                       cartId INT IDENTITY(1,1) PRIMARY KEY,
                       userId INT,
                       createdAt DATETIME DEFAULT GETDATE(),
                       FOREIGN KEY (userId) REFERENCES users(userID)
);

CREATE TABLE cart_products (
                               cartItemId INT IDENTITY(1,1) PRIMARY KEY,
                               cartId INT,
                               productId INT,
                               quantity INT NOT NULL,
                               discountId INT,
                               createdDate DATETIME DEFAULT GETDATE(),
                               FOREIGN KEY (cartId) REFERENCES carts(cartId),
                               FOREIGN KEY (productId) REFERENCES products(productId),
                               FOREIGN KEY (discountId) REFERENCES discount(discountId)
);

CREATE TABLE wishlist (
       wishlistId INT IDENTITY(1,1) PRIMARY KEY,
       userId INT,
       createdDate DATETIME DEFAULT GETDATE(),
       FOREIGN KEY (userId) REFERENCES users(userID)
);

CREATE TABLE wishlist_products (
       wishlistItemId INT IDENTITY(1,1) PRIMARY KEY,
       wishlistId INT,
       productId INT,
       createdDate DATETIME DEFAULT GETDATE(),
       FOREIGN KEY (wishlistId) REFERENCES wishlist(wishlistId),
       FOREIGN KEY (productId) REFERENCES products(productId)
);


CREATE TABLE maintenance (
        maintenanceId INT IDENTITY(1,1) PRIMARY KEY,
        maintenanceName NVARCHAR(255) NOT NULL,
        maintenanceDescription NVARCHAR(MAX),
        maintenanceDate DATE,
        maintenanceTime TIME,
        maintenanceStatus BIT DEFAULT 0,
        userId INT,
        createdDate DATETIME DEFAULT GETDATE(),
        updatedDate DATETIME DEFAULT GETDATE(),
        FOREIGN KEY (userId) REFERENCES users(userID)
);

CREATE TABLE maintenance_products (
       maintenanceId INT,
       productId INT,
       PRIMARY KEY (maintenanceId, productId),
       FOREIGN KEY (maintenanceId) REFERENCES maintenance(maintenanceId),
       FOREIGN KEY (productId) REFERENCES products(productId)
);

CREATE TABLE chat_rooms (
    chatRoomID INT IDENTITY(1,1) PRIMARY KEY,
    status BIT DEFAULT 1,
    createdAt DATETIME DEFAULT GETDATE(),
    userID INT,
    adminID INT,
    FOREIGN KEY (userID) REFERENCES users(userID),
    FOREIGN KEY (adminID) REFERENCES users(userID)
);

CREATE TABLE message (
    messageID INT IDENTITY(1,1) PRIMARY KEY,
    content NVARCHAR(MAX),
    timestamp DATETIME DEFAULT GETDATE(),
    chatRoomID INT,
    userID INT,
    FOREIGN KEY (userID) REFERENCES users(userID),
    FOREIGN KEY (chatRoomID) REFERENCES chat_rooms(chatRoomID)
)
--
-- INSERT INTO maintenance (maintenanceName, maintenanceDescription, maintenanceDate, maintenanceTime, userId) VALUES
-- ('Maintenance 1', 'Description 1', '2024-10-01', '10:00:00', 1),
-- ('Maintenance 2', 'Description 2', '2024-11-01', '11:00:00', 1);

-- INSERT INTO maintenance_products (maintenanceId, productId) VALUES
-- (1, 1), (2, 2);
--
-- -- Use the database
-- USE swp_pshop;
--
-- -- Insert sample data into typeAccount
-- INSERT INTO typeAccount (typeAccountName) VALUES ('user'), ('admin'), ('employee');
--
-- -- Insert sample data into users
-- INSERT INTO users (name, password, email, phoneNumber, address, typeAccountId, status)
-- VALUES
--    ('Alice', 'password_hash_1', 'alice@example.com', '1234567890', '123 Main St', 1, 1),
--    ('Bob', 'password_hash_2', 'bob@example.com', '0987654321', '456 Market St', 2, 1),
--    ('Charlie', 'password_hash_3', 'charlie@example.com', '1122334455', '789 Broadway', 3, 1);
--
-- -- Insert sample data into typeProduct
-- INSERT INTO typeProduct (typeProductName, describeType) VALUES
 --                                                           ('Men', 'Watches for men'),
 --                                                         ('Women', 'Watches for women'),
 --                                                         ('Luxury ', 'Luxury watches');
--
-- -- Insert sample data into size
-- INSERT INTO size (sizeName, describeSize, weight) VALUES
--                                                       ('Small', 'Small size product', '0.5kg'),
--                                                       ('Medium', 'Medium size product', '1kg'),
--                                                       ('Large', 'Large size product', '1.5kg');
--
-- -- Insert sample data into trademark
-- INSERT INTO trademark (trademarkName, logo, descriptionTrademark) VALUES
--                                                                       ('Rolex', '/assets/images/logo_rolex.png', 'A Crown for Every Achievement'),
--                                                                      ('Hublot', '/assets/images/logo_hublot.png', 'Exact time for life'),
--                                                                      ('Omega', '/assets/images/logo_omega.png', 'The Art of Fusion');
--
-- -- Insert sample data into products
-- INSERT INTO products (productName, img, priceProduct, typeProductId, sizeId, trademarkId, quantity, describeProduct)
-- VALUES
--     ('Rolex Datejust 41 126331', '/assets/images/rolex1.png', 15000000, 1, 1, 1, 10, 'High-quality wireless headphones'),
--    ('Hublot Classic Fusion 581.CM.1171.RX', '/assets/images/hublot1.png', 10000000, 2, 2, 2, 20, 'Comfortable running shoes'),
--    ('Omega Constellation 39mm 131.53.39.20.03.001', '/assets/images/omega1.png', 20000000, 3, 3, 3, 5, 'Efficient microwave oven');
--
-- -- Insert sample data into discount
-- INSERT INTO discount (discountPercentage, startDate, endDate)
-- VALUES
--     (10.00, '2024-10-01', '2024-10-31'),
--     (15.00, '2024-11-01', '2024-11-30');
--
-- -- Insert sample data into product_discount
-- INSERT INTO product_discount (productId, discountId)
-- VALUES
--     (1, 1), (2, 2);
--
-- -- Insert sample data into payment
-- INSERT INTO payment (typePayment) VALUES
--                                       ('Credit Card'),
--                                       ('PayPal'),
--                                       ('Cash on Delivery');
--
-- -- Insert sample data into voucher
-- INSERT INTO voucher (code, value, typeSale, maxSale, startDate, endDate)
-- VALUES
--     ('SAVE10', 10000, 0, 50, '2024-10-01', '2024-10-31'),
--     ('BLACKFRIDAY', 20000, 1, 100, '2024-11-29', '2024-11-29');
--
-- -- Insert sample data into transport
-- INSERT INTO transport (transportName, priceTransPort, descriptionTransport)
-- VALUES
--     ('Standard Shipping', 20000, 'Delivery within 5-7 business days'),
--     ('Express Shipping', 50000, 'Delivery within 2-3 business days');
--
-- -- Insert sample data into bill
-- INSERT INTO bill (userId, userName, email, city, district, phone, address, note, transportId, paymentId, totalPrice)
-- VALUES
--     (1, 'Alice', 'alice@example.com', 'New York', 'Manhattan', '1234567890', '123 Main St', 'Please leave at the door', 1, 1, 200);
--
-- -- Insert sample data into billDetail
-- INSERT INTO billDetail (productId, quantity, billId, priceBillDetail)
-- VALUES
--     (1, 2, 1, 30000),
--     (2, 1, 1, 10000);
--
-- -- Insert sample data into review
-- INSERT INTO review (productId, userID, starQuantity, content)
-- VALUES
--     (1, 1, 5, 'Great watch, excellent quality!'),
--     (2, 2, 4, 'Comfortable thing, but size runs small.');
--
-- -- Insert sample data into carts
-- INSERT INTO carts (userId) VALUES
--                                (1), (2);
--
-- -- Insert sample data into cart_products
-- INSERT INTO cart_products (cartId, productId, quantity)
-- VALUES
--     (1, 1, 1),
--     (2, 2, 2);
--
-- -- Insert sample data into wishlist
-- INSERT INTO wishlist (userId) VALUES
--                                   (1), (3);
--
-- -- Insert sample data into wishlist_products
-- INSERT INTO wishlist_products (wishlistId, productId)
-- VALUES
--     (1, 1), (2, 3);
-- Removed comments for sample data insertion
