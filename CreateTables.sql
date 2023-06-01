drop TABLE customer CASCADE CONSTRAINTS;
drop TABLE article CASCADE CONSTRAINTS;
drop TABLE SHOPPING_CART CASCADE CONSTRAINTS;
drop TABLE PRODUCT_GROUP CASCADE CONSTRAINTS;
drop TABLE DISCOUNT CASCADE CONSTRAINTS;
drop TABLE BILL CASCADE CONSTRAINTS;
drop TABLE SUPPLIER CASCADE CONSTRAINTS;
drop TABLE REORDER CASCADE CONSTRAINTS;
drop TABLE ORDERITEMS CASCADE CONSTRAINTS;
drop TABLe "Order" CASCADE CONSTRAINTS;

CREATE TABLE Customer (
  id number PRIMARY KEY,
  customername varchar(255),
  addresse varchar(255)
);

CREATE TABLE article (
  id number PRIMARY KEY,
  articlename varchar(255),
  price number,
  amount number,
  pkgsize1 number,
  pkgsize2 number,
  pkgsize3 number,
  product_group_id number
);

CREATE TABLE Shopping_cart (
  id number PRIMARY KEY,
  customer_id number
);

CREATE TABLE product_group (
  id number PRIMARY KEY,
  groupname varchar(255),
  description varchar(255),
  article_id number
);

CREATE TABLE Discount (
  id number PRIMARY KEY,
  discount number,
  customer_id number,
  product_group_id number
);

CREATE TABLE OrderItems (
  id number PRIMARY KEY,
  articleid number,
  quantity number,
  shopping_cart_id number
);

CREATE TABLE "Order" (
  id number PRIMARY KEY,
  customer_id number,
  shopping_cart_id number
);

CREATE TABLE Bill (
  id number PRIMARY KEY,
  cutomer_id number
);

CREATE TABLE Reorder (
  id number,
  supplier_id number,
  article_id number
);            

CREATE TABLE Supplier (
  id NUMBER,
  suppliername varchar(255),
  customer_id number
);

ALTER TABLE shopping_cart ADD FOREIGN KEY (customer_Id) REFERENCES customer (id);

ALTER TABLE article ADD FOREIGN KEY (id) REFERENCES product_group (article_id);

ALTER TABLE discount ADD FOREIGN KEY (product_group_id) REFERENCES product_group (id);

ALTER TABLE discount ADD FOREIGN KEY (customer_Id) REFERENCES customer (id);

ALTER TABLE OrderItems ADD FOREIGN KEY (Warekorb_id) REFERENCES shopping_cart (id);

ALTER TABLE article ADD FOREIGN KEY (id) REFERENCES OrderItems (article_id);

ALTER TABLE shopping_cart ADD FOREIGN KEY (id) REFERENCES "order" (shopping_cart_id);

ALTER TABLE "order" ADD FOREIGN KEY (customer_Id) REFERENCES customer (id);

ALTER TABLE bill ADD FOREIGN KEY (customer_Id) REFERENCES customer (id);

ALTER TABLE article ADD FOREIGN KEY (id) REFERENCES reorder (article_id);

ALTER TABLE supplier ADD FOREIGN KEY (id) REFERENCES reorder (supplier_id);

ALTER TABLE customer ADD FOREIGN KEY (id) REFERENCES supplier (customer_id);
