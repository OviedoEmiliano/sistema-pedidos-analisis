-- Consultas de ejemplo sobre el modelo de pedidos. Motor: PostgreSQL 16.
-- Cargar antes schema.sql y seed.sql.

-- 1. Órdenes con fecha, cliente y estado actual, de la más reciente a la más antigua.

SELECT o.order_id, o.order_date, concat(c.first_name, ' ', c.last_name) AS fullname, os.name status_name
FROM orders o
         JOIN customers c ON o.customer_id = c.customer_id
         JOIN order_statuses os ON o.order_status_id = os.order_status_id
ORDER BY o.order_date DESC;

-- 2. Clientes que viven en Córdoba, con su tipo y número de documento.

SELECT concat(c.first_name, ' ', c.last_name) fullname, a.city, d.document_number, dt.name document_type
FROM customers c
         JOIN documents d ON c.document_id = d.document_id
         JOIN document_types dt ON d.document_type_id = dt.document_type_id
         JOIN addresses a ON c.address_id = a.address_id
WHERE a.city = 'Córdoba';

-- 3. Total de cada orden (suma de cantidad por precio unitario de sus detalles),
-- de mayor a menor.

SELECT o.order_id, SUM(od.quantity * od.unit_price) total_price, o.order_date
FROM orders o
         JOIN order_details od ON o.order_id = od.order_id
GROUP BY o.order_id, o.order_date
ORDER BY total_price DESC;

-- 4. Clientes con más de 3 órdenes, con la cantidad de órdenes de cada uno.

SELECT CONCAT(c.first_name, ' ', c.last_name) fullname, COUNT(o.order_id) total_orders
FROM customers c
         JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(o.order_id) > 3
ORDER BY total_orders DESC;

-- 5a. Ítems que nunca se vendieron (versión con NOT EXISTS).

SELECT i.name
FROM items i
WHERE NOT EXISTS(SELECT 1
                 FROM order_details od
                 WHERE i.item_code = od.item_code);

-- 5b. Ítems que nunca se vendieron (versión con LEFT JOIN).
-- Devuelve lo mismo que la 5a.

SELECT i.name
FROM items i
         LEFT JOIN order_details od ON i.item_code = od.item_code
WHERE od.item_code IS NULL;

-- 6. Ítems cuyo precio supera el promedio de su misma marca.

SELECT i.name, i.price
FROM items i
WHERE i.price > (SELECT AVG(it.price)
                 FROM items it
                 WHERE i.brand = it.brand);

-- 7. Órdenes con saldo pendiente: total de la orden, total pagado y lo que falta.
-- Solo se cuentan los pagos en estado APPROVED.


WITH order_totals AS (SELECT order_id, SUM(quantity * unit_price) AS total
                      FROM order_details
                      GROUP BY order_id),
     paid_totals AS (SELECT p.order_id, SUM(p.amount) AS paid
                     FROM payments p
                              JOIN payment_statuses ps ON ps.payment_status_id = p.payment_status_id
                     WHERE ps.name = 'APPROVED'
                     GROUP BY p.order_id)
SELECT o.order_id,
       ot.total,
       COALESCE(pt.paid, 0)            AS paid,
       ot.total - COALESCE(pt.paid, 0) AS balance
FROM orders o
         JOIN order_totals ot ON ot.order_id = o.order_id
         LEFT JOIN paid_totals pt ON pt.order_id = o.order_id
WHERE ot.total - COALESCE(pt.paid, 0) > 0
ORDER BY balance DESC;


-- 8. Los 5 ítems más vendidos por unidades, con su marca y la recaudación total.
-- Ante un empate de unidades, se ordena por recaudación.

SELECT i.name, i.brand, SUM(od.quantity) total_sold_units, SUM(od.quantity * od.unit_price) total_revenue
FROM items i
         JOIN order_details od ON i.item_code = od.item_code
GROUP BY od.item_code, i.name, i.brand
ORDER BY total_sold_units DESC, total_revenue DESC
LIMIT 5;

-- 9a. Historial completo de estados de una orden (la 1), en orden cronológico.

SELECT osh.order_id, osh.changed_at, os.name AS status_name
FROM order_status_history osh
         JOIN order_statuses os ON osh.order_status_id = os.order_status_id
WHERE osh.order_id = 1
ORDER BY osh.changed_at;

-- 9b. Control de consistencia: órdenes cuyo estado actual en orders no coincide
-- con el último estado registrado en order_status_history.
-- Con el trigger activo debe devolver cero filas. Si devuelve alguna,
-- hay datos cargados sin pasar por el trigger.

SELECT o.order_id
FROM orders o
WHERE o.order_status_id IS DISTINCT FROM (SELECT osh.order_status_id
                                          FROM order_status_history osh
                                          WHERE osh.order_id = o.order_id
                                          ORDER BY osh.changed_at DESC
                                          LIMIT 1);

-- 10. Facturación mensual (suma de los detalles por año y mes de la orden),
-- sin órdenes canceladas. Solo se muestran los meses que superan el promedio mensual.

WITH monthly AS (SELECT EXTRACT(YEAR FROM o.order_date)  AS year,
                        EXTRACT(MONTH FROM o.order_date) AS month,
                        SUM(od.quantity * od.unit_price) AS total_earnings
                 FROM orders o
                          JOIN order_details od ON o.order_id = od.order_id
                          JOIN order_statuses os ON o.order_status_id = os.order_status_id
                 WHERE os.name <> 'CANCELLED'
                 GROUP BY year, month)
SELECT year, month, total_earnings
FROM monthly
WHERE total_earnings > (SELECT AVG(total_earnings) FROM monthly)
ORDER BY year, month;



