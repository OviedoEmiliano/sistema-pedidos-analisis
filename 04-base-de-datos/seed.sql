-- =============================================================
-- Datos de prueba del modelo de pedidos (ciudades argentinas)
-- Motor: PostgreSQL 16. Ejecutar después de schema.sql.
-- =============================================================

INSERT INTO addresses (address_id, street, number, floor, apartment, city) VALUES
                                                                               (1, 'Av. Corrientes', 1234, 5, 'B', 'Buenos Aires'),
                                                                               (2, 'Av. Santa Fe', 2450, 8, 'A', 'Buenos Aires'),
                                                                               (3, 'Bv. San Juan', 680, 3, 'C', 'Córdoba'),
                                                                               (4, 'Av. Colón', 1520, NULL, NULL, 'Córdoba'),
                                                                               (5, 'Obispo Trejo', 345, 0, 'A', 'Córdoba'),
                                                                               (6, 'Bv. Oroño', 950, 2, 'D', 'Rosario'),
                                                                               (7, 'Calle Córdoba', 1850, NULL, NULL, 'Rosario'),
                                                                               (8, 'Av. San Martín', 1100, 4, 'A', 'Mendoza'),
                                                                               (9, 'Calle 7', 820, 1, 'B', 'La Plata'),
                                                                               (10, 'Av. Colón', 2300, 6, 'C', 'Mar del Plata'),
                                                                               (11, '24 de Septiembre', 540, NULL, NULL, 'San Miguel de Tucumán'),
                                                                               (12, 'Av. Belgrano', 410, 0, 'B', 'Salta');

INSERT INTO document_types (document_type_id, name) VALUES
                                                        (1, 'DNI'),
                                                        (2, 'LE'),
                                                        (3, 'LC'),
                                                        (4, 'Pasaporte');

INSERT INTO documents (document_id, document_number, document_type_id) VALUES
                                                                           (1, '30123456', 1),
                                                                           (2, '32456789', 1),
                                                                           (3, '35789012', 1),
                                                                           (4, '38901234', 1),
                                                                           (5, '4567890', 2),
                                                                           (6, '40112233', 1),
                                                                           (7, '29334455', 1),
                                                                           (8, '41556677', 1),
                                                                           (9, '3987654', 3),
                                                                           (10, '36778899', 1),
                                                                           (11, '33990011', 1),
                                                                           (12, '42223344', 1);

-- Diego (11) y Agustina (12) no tienen órdenes
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_id, document_id) VALUES
                                                                                                      (1, 'Juan', 'Pérez', 'juan.perez@mail.com', '+5491145678901', 1, 1),
                                                                                                      (2, 'María', 'González', 'maria.gonzalez@mail.com', '+5491156789012', 2, 2),
                                                                                                      (3, 'Lucas', 'Fernández', 'lucas.fernandez@mail.com', '+5493514567890', 3, 3),
                                                                                                      (4, 'Sofía', 'Rodríguez', 'sofia.rodriguez@mail.com', '+5493515678901', 4, 4),
                                                                                                      (5, 'Carlos', 'López', 'carlos.lopez@mail.com', '+5493516789012', 5, 5),
                                                                                                      (6, 'Valentina', 'Martínez', 'vale.martinez@mail.com', '+5493414567890', 6, 6),
                                                                                                      (7, 'Martín', 'Gómez', 'martin.gomez@mail.com', '+5493415678901', 7, 7),
                                                                                                      (8, 'Camila', 'Díaz', 'camila.diaz@mail.com', '+5492614567890', 8, 8),
                                                                                                      (9, 'Roberto', 'Sánchez', 'roberto.sanchez@mail.com', '+5492214567890', 9, 9),
                                                                                                      (10, 'Florencia', 'Romero', 'flor.romero@mail.com', '+5492234567890', 10, 10),
                                                                                                      (11, 'Diego', 'Álvarez', 'diego.alvarez@mail.com', '+5493814567890', 11, 11),
                                                                                                      (12, 'Agustina', 'Torres', 'agus.torres@mail.com', '+5493874567890', 12, 12);

INSERT INTO order_statuses (order_status_id, name) VALUES
                                                       (1, 'PENDING_PAYMENT'),
                                                       (2, 'CONFIRMED'),
                                                       (3, 'CANCELLED');

INSERT INTO payment_statuses (payment_status_id, name) VALUES
                                                           (1, 'APPROVED'),
                                                           (2, 'REJECTED'),
                                                           (3, 'REFUNDED');

-- SAM-MON27, MOT-EDGE y BGH-AA3000 nunca se venden
INSERT INTO items (item_code, name, brand, price, stock_quantity) VALUES
                                                                      ('SAM-TV55', 'Smart TV 55 4K', 'Samsung', 899999.0, 12),
                                                                      ('SAM-A55', 'Galaxy A55', 'Samsung', 649999.0, 20),
                                                                      ('SAM-BUDS', 'Galaxy Buds FE', 'Samsung', 129999.0, 35),
                                                                      ('SAM-MON27', 'Monitor 27 FHD', 'Samsung', 289999.0, 0),
                                                                      ('MOT-G84', 'Moto G84', 'Motorola', 429999.0, 15),
                                                                      ('MOT-E14', 'Moto E14', 'Motorola', 189999.0, 25),
                                                                      ('MOT-EDGE', 'Edge 50 Fusion', 'Motorola', 599999.0, 8),
                                                                      ('LOG-MX3', 'MX Master 3S', 'Logitech', 149999.0, 30),
                                                                      ('LOG-K380', 'Teclado K380', 'Logitech', 59999.0, 40),
                                                                      ('LOG-C920', 'Webcam C920', 'Logitech', 99999.0, 10),
                                                                      ('PHI-AF', 'Freidora de Aire', 'Philips', 189999.0, 18),
                                                                      ('PHI-PLANCHA', 'Plancha a Vapor', 'Philips', 49999.0, 22),
                                                                      ('NOB-PAR', 'Parlante Bluetooth', 'Noblex', 79999.0, 14),
                                                                      ('NOB-TV32', 'Smart TV 32 HD', 'Noblex', 249999.0, 6),
                                                                      ('BGH-AA3000', 'Aire Acondicionado 3000F', 'BGH', 999999.0, 5);

-- Juan (1) tiene 5 órdenes; María (2) y Lucas (3), 4; Valentina (6), 3 (justo en el límite de la consulta 4)
INSERT INTO orders (order_id, order_date, customer_id, order_status_id) VALUES
                                                                            (1, TIMESTAMP '2026-01-08 10:00:00', 1, 2),
                                                                            (2, TIMESTAMP '2026-01-15 10:00:00', 2, 2),
                                                                            (3, TIMESTAMP '2026-01-22 10:00:00', 3, 2),
                                                                            (4, TIMESTAMP '2026-01-29 10:00:00', 6, 2),
                                                                            (5, TIMESTAMP '2026-02-03 10:00:00', 1, 2),
                                                                            (6, TIMESTAMP '2026-02-10 10:00:00', 4, 2),
                                                                            (7, TIMESTAMP '2026-02-18 10:00:00', 3, 3),
                                                                            (8, TIMESTAMP '2026-02-25 10:00:00', 8, 2),
                                                                            (9, TIMESTAMP '2026-03-04 10:00:00', 2, 2),
                                                                            (10, TIMESTAMP '2026-03-11 10:00:00', 1, 2),
                                                                            (11, TIMESTAMP '2026-03-19 10:00:00', 6, 2),
                                                                            (12, TIMESTAMP '2026-03-27 10:00:00', 5, 2),
                                                                            (13, TIMESTAMP '2026-04-02 10:00:00', 3, 2),
                                                                            (14, TIMESTAMP '2026-04-09 10:00:00', 7, 2),
                                                                            (15, TIMESTAMP '2026-04-16 10:00:00', 1, 2),
                                                                            (16, TIMESTAMP '2026-04-24 10:00:00', 9, 2),
                                                                            (17, TIMESTAMP '2026-05-05 10:00:00', 2, 2),
                                                                            (18, TIMESTAMP '2026-05-12 10:00:00', 10, 2),
                                                                            (19, TIMESTAMP '2026-05-20 10:00:00', 4, 2),
                                                                            (20, TIMESTAMP '2026-05-28 10:00:00', 8, 2),
                                                                            (21, TIMESTAMP '2026-06-03 10:00:00', 3, 2),
                                                                            (22, TIMESTAMP '2026-06-10 10:00:00', 1, 1),
                                                                            (23, TIMESTAMP '2026-06-17 10:00:00', 2, 1),
                                                                            (24, TIMESTAMP '2026-06-24 10:00:00', 6, 2);

INSERT INTO order_details (order_detail_id, item_code, order_id, quantity, unit_price) VALUES
                                                                                           (1, 'SAM-TV55', 1, 1, 849999),
                                                                                           (2, 'LOG-K380', 1, 2, 54999),
                                                                                           (3, 'MOT-G84', 2, 1, 399999),
                                                                                           (4, 'SAM-BUDS', 2, 1, 119999),
                                                                                           (5, 'PHI-AF', 3, 1, 179999),
                                                                                           (6, 'PHI-PLANCHA', 3, 1, 45999),
                                                                                           (7, 'LOG-MX3', 4, 2, 139999),
                                                                                           (8, 'SAM-A55', 5, 1, 619999),
                                                                                           (9, 'NOB-PAR', 5, 1, 74999),
                                                                                           (10, 'MOT-E14', 6, 2, 179999),
                                                                                           (11, 'NOB-TV32', 7, 1, 239999),
                                                                                           (12, 'LOG-C920', 8, 1, 94999),
                                                                                           (13, 'LOG-K380', 8, 1, 56999),
                                                                                           (14, 'SAM-TV55', 9, 1, 869999),
                                                                                           (15, 'LOG-MX3', 10, 1, 144999),
                                                                                           (16, 'SAM-BUDS', 10, 2, 124999),
                                                                                           (17, 'PHI-AF', 11, 1, 184999),
                                                                                           (18, 'NOB-PAR', 12, 3, 77999),
                                                                                           (19, 'SAM-A55', 13, 2, 639999),
                                                                                           (20, 'MOT-E14', 13, 1, 184999),
                                                                                           (21, 'PHI-PLANCHA', 14, 2, 47999),
                                                                                           (22, 'MOT-G84', 15, 1, 419999),
                                                                                           (23, 'NOB-TV32', 16, 1, 244999),
                                                                                           (24, 'NOB-PAR', 16, 1, 78999),
                                                                                           (25, 'SAM-TV55', 17, 1, 889999),
                                                                                           (26, 'LOG-C920', 17, 1, 97999),
                                                                                           (27, 'LOG-K380', 18, 3, 58999),
                                                                                           (28, 'PHI-AF', 19, 1, 189999),
                                                                                           (29, 'PHI-PLANCHA', 19, 1, 49999),
                                                                                           (30, 'SAM-BUDS', 20, 1, 129999),
                                                                                           (31, 'SAM-A55', 21, 1, 649999),
                                                                                           (32, 'MOT-G84', 22, 1, 429999),
                                                                                           (33, 'LOG-MX3', 23, 1, 149999),
                                                                                           (34, 'NOB-TV32', 24, 1, 249999),
                                                                                           (35, 'LOG-C920', 24, 1, 99999);

-- Inconsistencias a propósito para la consulta 9: órdenes 15 y 19
INSERT INTO order_status_history (history_id, changed_at, order_id, order_status_id) VALUES
                                                                                         (1, TIMESTAMP '2026-01-08 10:00:00', 1, 1),
                                                                                         (2, TIMESTAMP '2026-01-10 13:00:00', 1, 2),
                                                                                         (3, TIMESTAMP '2026-01-15 10:00:00', 2, 1),
                                                                                         (4, TIMESTAMP '2026-01-17 13:00:00', 2, 2),
                                                                                         (5, TIMESTAMP '2026-01-22 10:00:00', 3, 1),
                                                                                         (6, TIMESTAMP '2026-01-24 13:00:00', 3, 2),
                                                                                         (7, TIMESTAMP '2026-01-29 10:00:00', 4, 1),
                                                                                         (8, TIMESTAMP '2026-01-31 13:00:00', 4, 2),
                                                                                         (9, TIMESTAMP '2026-02-03 10:00:00', 5, 1),
                                                                                         (10, TIMESTAMP '2026-02-05 13:00:00', 5, 2),
                                                                                         (11, TIMESTAMP '2026-02-10 10:00:00', 6, 1),
                                                                                         (12, TIMESTAMP '2026-02-12 13:00:00', 6, 2),
                                                                                         (13, TIMESTAMP '2026-02-18 10:00:00', 7, 1),
                                                                                         (14, TIMESTAMP '2026-02-20 13:00:00', 7, 3),
                                                                                         (15, TIMESTAMP '2026-02-25 10:00:00', 8, 1),
                                                                                         (16, TIMESTAMP '2026-02-27 13:00:00', 8, 2),
                                                                                         (17, TIMESTAMP '2026-03-04 10:00:00', 9, 1),
                                                                                         (18, TIMESTAMP '2026-03-06 13:00:00', 9, 2),
                                                                                         (19, TIMESTAMP '2026-03-11 10:00:00', 10, 1),
                                                                                         (20, TIMESTAMP '2026-03-13 13:00:00', 10, 2),
                                                                                         (21, TIMESTAMP '2026-03-19 10:00:00', 11, 1),
                                                                                         (22, TIMESTAMP '2026-03-21 13:00:00', 11, 2),
                                                                                         (23, TIMESTAMP '2026-03-27 10:00:00', 12, 1),
                                                                                         (24, TIMESTAMP '2026-03-29 13:00:00', 12, 2),
                                                                                         (25, TIMESTAMP '2026-04-02 10:00:00', 13, 1),
                                                                                         (26, TIMESTAMP '2026-04-04 13:00:00', 13, 2),
                                                                                         (27, TIMESTAMP '2026-04-09 10:00:00', 14, 1),
                                                                                         (28, TIMESTAMP '2026-04-11 13:00:00', 14, 2),
                                                                                         (29, TIMESTAMP '2026-04-16 10:00:00', 15, 1),
                                                                                         (30, TIMESTAMP '2026-04-24 10:00:00', 16, 1),
                                                                                         (31, TIMESTAMP '2026-04-26 13:00:00', 16, 2),
                                                                                         (32, TIMESTAMP '2026-05-05 10:00:00', 17, 1),
                                                                                         (33, TIMESTAMP '2026-05-07 13:00:00', 17, 2),
                                                                                         (34, TIMESTAMP '2026-05-12 10:00:00', 18, 1),
                                                                                         (35, TIMESTAMP '2026-05-14 13:00:00', 18, 2),
                                                                                         (36, TIMESTAMP '2026-05-20 10:00:00', 19, 1),
                                                                                         (37, TIMESTAMP '2026-05-28 10:00:00', 20, 1),
                                                                                         (38, TIMESTAMP '2026-05-30 13:00:00', 20, 2),
                                                                                         (39, TIMESTAMP '2026-06-03 10:00:00', 21, 1),
                                                                                         (40, TIMESTAMP '2026-06-05 13:00:00', 21, 2),
                                                                                         (41, TIMESTAMP '2026-06-10 10:00:00', 22, 1),
                                                                                         (42, TIMESTAMP '2026-06-17 10:00:00', 23, 1),
                                                                                         (43, TIMESTAMP '2026-06-24 10:00:00', 24, 1),
                                                                                         (44, TIMESTAMP '2026-06-26 13:00:00', 24, 2),
                                                                                         (45, TIMESTAMP '2026-04-18 13:00:00', 15, 2),
                                                                                         (46, TIMESTAMP '2026-05-22 13:00:00', 19, 2);

-- Saldo pendiente: 9, 17, 21, 22, 23. La 13 se paga en 3 cuotas, la 20 tiene un rechazo previo
-- y la 7 (cancelada) se cobró y se reintegró.
INSERT INTO payments (payment_id, amount, payment_datetime, payment_status_id, order_id) VALUES
                                                                                             (1, 959997, TIMESTAMP '2026-01-09 14:30:00', 1, 1),
                                                                                             (2, 519998, TIMESTAMP '2026-01-16 14:30:00', 1, 2),
                                                                                             (3, 225998, TIMESTAMP '2026-01-23 14:30:00', 1, 3),
                                                                                             (4, 279998, TIMESTAMP '2026-01-30 14:30:00', 1, 4),
                                                                                             (5, 694998, TIMESTAMP '2026-02-04 14:30:00', 1, 5),
                                                                                             (6, 359998, TIMESTAMP '2026-02-11 14:30:00', 1, 6),
                                                                                             (7, 151998, TIMESTAMP '2026-02-26 14:30:00', 1, 8),
                                                                                             (8, 500000, TIMESTAMP '2026-03-05 14:30:00', 1, 9),
                                                                                             (9, 369999, TIMESTAMP '2026-03-07 14:30:00', 2, 9),
                                                                                             (10, 394997, TIMESTAMP '2026-03-12 14:30:00', 1, 10),
                                                                                             (11, 184999, TIMESTAMP '2026-03-20 14:30:00', 1, 11),
                                                                                             (12, 233997, TIMESTAMP '2026-03-28 14:30:00', 1, 12),
                                                                                             (13, 500000, TIMESTAMP '2026-04-03 14:30:00', 1, 13),
                                                                                             (14, 500000, TIMESTAMP '2026-04-17 14:30:00', 1, 13),
                                                                                             (15, 464997, TIMESTAMP '2026-05-02 14:30:00', 1, 13),
                                                                                             (16, 95998, TIMESTAMP '2026-04-10 14:30:00', 1, 14),
                                                                                             (17, 419999, TIMESTAMP '2026-04-17 14:30:00', 1, 15),
                                                                                             (18, 323998, TIMESTAMP '2026-04-25 14:30:00', 1, 16),
                                                                                             (19, 500000, TIMESTAMP '2026-05-06 14:30:00', 1, 17),
                                                                                             (20, 487998, TIMESTAMP '2026-05-09 14:30:00', 2, 17),
                                                                                             (21, 176997, TIMESTAMP '2026-05-13 14:30:00', 1, 18),
                                                                                             (22, 239998, TIMESTAMP '2026-05-21 14:30:00', 1, 19),
                                                                                             (23, 129999, TIMESTAMP '2026-05-29 14:30:00', 2, 20),
                                                                                             (24, 129999, TIMESTAMP '2026-05-30 14:30:00', 1, 20),
                                                                                             (25, 649999, TIMESTAMP '2026-06-04 14:30:00', 2, 21),
                                                                                             (26, 349998, TIMESTAMP '2026-06-25 14:30:00', 1, 24),
                                                                                             (27, 239999, TIMESTAMP '2026-02-18 14:30:00', 1, 7),
                                                                                             (28, 239999, TIMESTAMP '2026-02-20 14:30:00', 3, 7);

-- =============================================================
-- Sincronizar las secuencias de los ids autogenerados.
-- Los INSERT de arriba usan ids manuales, y la secuencia no se entera.
-- Sin esto, el primer INSERT sin id intentaría usar el 1 y chocaría.
-- =============================================================
SELECT setval(pg_get_serial_sequence('addresses', 'address_id'), (SELECT MAX(address_id) FROM addresses));
SELECT setval(pg_get_serial_sequence('document_types', 'document_type_id'), (SELECT MAX(document_type_id) FROM document_types));
SELECT setval(pg_get_serial_sequence('documents', 'document_id'), (SELECT MAX(document_id) FROM documents));
SELECT setval(pg_get_serial_sequence('customers', 'customer_id'), (SELECT MAX(customer_id) FROM customers));
SELECT setval(pg_get_serial_sequence('order_statuses', 'order_status_id'), (SELECT MAX(order_status_id) FROM order_statuses));
SELECT setval(pg_get_serial_sequence('payment_statuses', 'payment_status_id'), (SELECT MAX(payment_status_id) FROM payment_statuses));
SELECT setval(pg_get_serial_sequence('orders', 'order_id'), (SELECT MAX(order_id) FROM orders));
SELECT setval(pg_get_serial_sequence('order_details', 'order_detail_id'), (SELECT MAX(order_detail_id) FROM order_details));
SELECT setval(pg_get_serial_sequence('order_status_history', 'history_id'), (SELECT MAX(history_id) FROM order_status_history));
SELECT setval(pg_get_serial_sequence('payments', 'payment_id'), (SELECT MAX(payment_id) FROM payments));