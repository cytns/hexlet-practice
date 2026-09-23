DROP TABLE IF EXISTS deliveries;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS partners;

CREATE TABLE partners (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    inn VARCHAR(12) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20)
);

CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE deliveries (
    id INT PRIMARY KEY,
    partner_id INT NOT NULL,
    product_id INT NOT NULL,
    delivery_date DATE NOT NULL,
    quantity INT NOT NULL,

    FOREIGN KEY (partner_id)
        REFERENCES partners(id)
        ON DELETE RESTRICT,

    FOREIGN KEY (product_id)
        REFERENCES products(id)
        ON DELETE RESTRICT
);