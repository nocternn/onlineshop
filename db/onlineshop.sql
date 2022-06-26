PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Customer (
Email TEXT PRIMARY KEY,
Cus_Name TEXT NOT NULL,
Address TEXT,
PhoneNumber TEXT NOT NULL UNIQUE
);
CREATE TABLE Product (
Product_ID INTEGER PRIMARY KEY,
Product_Name TEXT NOT NULL,
Image TEXT,
Description TEXT,
Price REAL NOT NULL
);
INSERT INTO Product VALUES(1,'DORAEMON VOL1','https://storage.googleapis.com/jvtc_img_storage/51M2gzuiNuL.jpeg','Doraemon, a cat robot, traveled back in time from the 22nd century to watch over Noby',17999.999999999999999);
INSERT INTO Product VALUES(2,'Fruits Jelly','https://storage.googleapis.com/jvtc_img_storage/5a70e163bb30eb13f94efff82942b779.jpeg','Jelly fruit candy bag with assorted flavors. Flavors include Strawberry, Sour Apple, Pineapple, Grape and Orange. Fruity jelly snacks soft, chewy and tasty candy',150000.0);
INSERT INTO Product VALUES(3,'Handmade Chocolate Cookies','https://storage.googleapis.com/jvtc_img_storage/classic-chocolate-chip-cookies.jpeg','Ultra thick Bakery Style Chocolate Chip Cookies feature golden brown edges with ooey and gooey centers',110000.0);
COMMIT;
