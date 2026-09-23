from discount import calculate_partner_discount


def test_discount():
    assert calculate_partner_discount(9999) == 0
    assert calculate_partner_discount(10000) == 5
    assert calculate_partner_discount(49999) == 5
    assert calculate_partner_discount(50000) == 10
    assert calculate_partner_discount(300000) == 15


test_discount()

print("Все тесты пройдены")