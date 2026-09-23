-- 1. Список партнёров и количество доставок

SELECT
    p.id,
    p.name,
    COUNT(d.id) AS deliveries_count
FROM partners p
LEFT JOIN deliveries d ON p.id = d.partner_id
GROUP BY p.id, p.name
ORDER BY p.name;


-- 2. Добавление нового партнёра и его первой доставки

BEGIN;

INSERT INTO partners (id, name, inn, email, phone)
VALUES (
    4,
    'ООО Тест',
    '7801234567',
    'test@mail.ru',
    '+79990000000'
);

INSERT INTO deliveries (
    id,
    partner_id,
    product_id,
    delivery_date,
    quantity
)
VALUES (
    106,
    4,
    1,
    '2026-09-10',
    10
);

COMMIT;


-- 3. История отгрузок партнёра за период

SELECT
    p.name AS partner_name,
    pr.name AS product_name,
    d.delivery_date,
    d.quantity,
    d.quantity * pr.price AS total_amount
FROM deliveries d
JOIN partners p ON d.partner_id = p.id
JOIN products pr ON d.product_id = pr.id
WHERE d.partner_id = 1
  AND d.delivery_date BETWEEN '2026-01-01' AND '2026-12-31'
ORDER BY d.delivery_date;