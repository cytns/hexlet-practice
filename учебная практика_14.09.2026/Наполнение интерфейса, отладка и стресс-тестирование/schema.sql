DROP TABLE IF EXISTS sales_history;
DROP TABLE IF EXISTS partners;

CREATE TABLE partners (
    partner_id INT PRIMARY KEY,
    company_name VARCHAR(150) NOT NULL,
    inn VARCHAR(12) NOT NULL UNIQUE,
    contact_email VARCHAR(100),
    phone VARCHAR(30),
    rating DECIMAL(2, 1)
);

CREATE TABLE sales_history (
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

INSERT INTO partners (
    partner_id,
    company_name,
    inn,
    contact_email,
    phone,
    rating
)
VALUES
(1, 'ООО "Логистик-Экспресс"', '7701234567', 'info@logex.ru', '+7 (999) 111-22-33', 4.8),
(2, 'ИП Петров А.В.', '5001098765', 'petrov_delivery@mail.ru', NULL, 4.2),
(3, 'ТК "Быстрый Путь"', '7812345678', 'speedway@yandex.ru', '+78125554433', NULL);

INSERT INTO sales_history (
    sale_id,
    partner_id,
    product_name,
    sale_date,
    quantity,
    total_amount
)
VALUES
(101, 1, 'Стиральный порошок "Альфа"', '2026-03-01', 50, 25000.00),
(102, 2, 'Мыло жидкое "Стандарт"', '2026-03-15', 200, 18000.50),
(103, 1, 'Кондиционер для белья', '2026-03-20', 30, 10500.00),
(105, 3, 'Мыло жидкое "Стандарт"', '2026-03-25', 150, 13500.00);