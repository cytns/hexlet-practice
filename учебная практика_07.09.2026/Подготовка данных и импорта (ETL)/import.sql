DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS partners;

CREATE TABLE partners (
    partner_id INT PRIMARY KEY,
    company_name VARCHAR(150) NOT NULL,
    inn VARCHAR(12) NOT NULL UNIQUE,
    contact_email VARCHAR(100),
    phone VARCHAR(30),
    rating DECIMAL(2, 1)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    partner_id INT NOT NULL,
    product_name VARCHAR(150) NOT NULL,
    sale_date DATE NOT NULL,
    quantity INT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,

    FOREIGN KEY (partner_id)
        REFERENCES partners(partner_id)
        ON DELETE RESTRICT
);