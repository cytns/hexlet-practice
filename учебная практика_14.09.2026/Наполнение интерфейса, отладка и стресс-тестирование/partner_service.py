import psycopg2

from discount import calculate_partner_discount


def get_partners():
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
            p.partner_id,
            p.company_name,
            p.contact_email,
            p.phone,
            p.rating,
            COALESCE(SUM(s.quantity), 0)
        FROM partners p
        LEFT JOIN sales_history s
            ON p.partner_id = s.partner_id
        GROUP BY
            p.partner_id,
            p.company_name,
            p.contact_email,
            p.phone,
            p.rating
        ORDER BY p.company_name
        """
    )

    rows = cursor.fetchall()

    cursor.close()
    connection.close()

    partners = []

    for row in rows:
        total_quantity = int(row[5] or 0)

        partners.append({
            "id": row[0],
            "name": row[1],
            "email": row[2],
            "phone": row[3],
            "rating": row[4],
            "discount": calculate_partner_discount(total_quantity)
        })

    return partners