# Base de datos

## Modelo entidad-relación

Modelo de la tienda: clientes, pedidos, detalle de pedidos, ítems, cobros y estados.

![Modelo entidad-relación](er.svg)

Fuente editable: [er.drawio](../fuentes/er.drawio)

## Decisiones de modelado

- **Pedido y cobros (1 a 0..n):** cada intento de cobro queda registrado, aprobado o rechazado, para auditoría y detección de fraude. Un pedido cancelado por falta de pago puede no tener ningún cobro.
- **Estados en tablas separadas:** `order_statuses` y `payment_statuses` son catálogos distintos, para que un cobro no pueda tener un estado de pedido.
- **Historial de estados del pedido:** `order_status_history` guarda cuándo entró el pedido en cada estado. El fin de un estado es el inicio del siguiente, por lo que no se guarda una segunda fecha.
- **Estado actual en `orders`:** se guarda para no buscar la última fila del historial en cada consulta.
- **`unit_price` en `order_details`:** conserva el precio al momento de la compra, y los pedidos viejos no cambian si el ítem cambia de precio.
- **Total del pedido:** no se almacena, se calcula con `quantity * unit_price`.
- **Cliente y dirección (1 a 1):** cada cliente tiene una única dirección, que se registra con el alta. Lo mismo con su documento.
- **Clientes sin pedidos:** se permiten, para futuras comunicaciones y ofertas.

## Glosario

| Español | Tabla |
|---|---|
| Cliente | `customers` |
| Dirección | `addresses` |
| Documento y tipo de documento | `documents`, `document_types` |
| Ítem | `items` |
| Pedido y detalle de pedido | `orders`, `order_details` |
| Cobro | `payments` |
| Estado de pedido y de cobro | `order_statuses`, `payment_statuses` |
| Historial de estados | `order_status_history` |

## Pendiente

- Script de creación de tablas (`schema.sql`)
- Datos de prueba
- Consultas SQL comentadas (`consultas.sql`)