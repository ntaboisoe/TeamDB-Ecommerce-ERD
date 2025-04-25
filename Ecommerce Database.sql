CREATE TABLE brand (
  brand_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  description TEXT
);

CREATE TABLE product_category (
  category_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  description TEXT
);

CREATE TABLE product (
  product_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  description TEXT,
  brand_id INT,
  category_id INT,
  base_price DECIMAL(10,2),
  FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
  FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

CREATE TABLE product_image (
  image_id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  image_url VARCHAR(1024),
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE color (
  color_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  hex_code VARCHAR(7)
);

CREATE TABLE product_item (
  item_id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  sku VARCHAR(100),
  price DECIMAL(10,2),
  stock_quantity INT,
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE product_variation (
  variation_id INT PRIMARY KEY AUTO_INCREMENT,
  product_item_id INT,
  color_id INT,
  size_option_id INT,
  FOREIGN KEY (product_item_id) REFERENCES product_item(item_id),
  FOREIGN KEY (color_id) REFERENCES color(color_id),
  FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

CREATE TABLE size_category (
  size_category_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100)
);

CREATE TABLE size_option (
  size_option_id INT PRIMARY KEY AUTO_INCREMENT,
  size_category_id INT,
  value VARCHAR(50),
  FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

CREATE TABLE attribute_category (
  attribute_category_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255)
);

CREATE TABLE attribute_type (
  attribute_type_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  data_type VARCHAR(50)
);

CREATE TABLE product_attribute (
  attribute_id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  attribute_category_id INT,
  attribute_type_id INT,
  name VARCHAR(255),
  value TEXT,
  FOREIGN KEY (product_id) REFERENCES product(product_id),
  FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
  FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);
