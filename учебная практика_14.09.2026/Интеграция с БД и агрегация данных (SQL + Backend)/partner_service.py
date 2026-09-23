import psycopg2


def calculate_partner_discount(total_quantity: int) -> int:
    if total_quantity < 10000:
        return 0
    if total_quantity < 50000:
        return 5
    if total_quantity < 300000:
        return 10
    return 15


def get_partner(partner_id: int) -> dict:
    connection = psycopg2.connect(
        dbname="practice",
        user="postgres",
        password="postgres",
        host="localhost",
        port="5432"
    )

    cursor = connection.cursor()

    cursor.execute(
        """
        SELECT
            p.id,
            p.name,
            COALESCE(SUM(s.quantity), 0)
        FROM partners p
        LEFT JOIN sales_history s ON p.id = s.partner_id
        WHERE p.id = %s
        GROUP BY p.id, p.name
        """,
        (partner_id,)
    )

    row = cursor.fetchone()

    cursor.close()
    connection.close()

    total_quantity = int(row[2])

    return {
        "id": row[0],
        "name": row[1],
        "total_quantity": total_quantity,
        "discount": calculate_partner_discount(total_quantity)
    }


partner = get_partner(1)

print(partner)