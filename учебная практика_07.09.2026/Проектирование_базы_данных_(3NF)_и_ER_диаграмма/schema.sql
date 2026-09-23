CREATE TABLE partners (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    inn TEXT NOT NULL UNIQUE,
    email TEXT UNIQUE,
    phone TEXT
);

CREATE TABLE products (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    price NUMERIC NOT NULL CHECK (price >= 0)
);

CREATE TABLE deliveries (
    id INTEGER PRIMARY KEY,
    partner_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    delivery_date DATE NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),

    FOREIGN KEY (partner_id) REFERENCES partners(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);