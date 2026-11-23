# US-06: Consultar el detalle de un pedido

**Jira:** PED-7 · **Épica:** Realizar pedido · **Prioridad:** Baja · **Puntos:** 2

## Precondiciones

- El cliente tiene la sesión iniciada.

## Fuera de alcance

- Listado de todos los pedidos del cliente.
- Modificación o cancelación del pedido por parte del cliente.
- Exportación del detalle a PDF.

## Historia

Como **cliente** quiero **consultar el detalle de un pedido** para **conocer su estado y los ítems que compré**.

## Criterios de aceptación

1. El cliente debe ingresar el número del pedido que quiere consultar.
2. El sistema debe mostrar el número, la fecha en formato dd/mm/aaaa, el estado actual y el total del pedido.
3. El sistema debe mostrar, por cada ítem del pedido, su nombre, la cantidad, el precio unitario al momento de la compra y el subtotal.
4. El sistema debe calcular el total del pedido como la suma de cantidad por precio unitario de sus ítems.
5. El sistema debe permitir consultar únicamente los pedidos del cliente que inició sesión.
6. Si el pedido no existe o no pertenece al cliente, el sistema debe informar que no se encontró el pedido, sin revelar si existe para otro cliente.

## Supuestos

- Los precios mostrados son los guardados en el detalle del pedido y no cambian si el ítem cambia de precio.
- La fecha se almacena con fecha y hora, y se muestra solo con la fecha.

## Preguntas abiertas

- ¿Se muestra también el historial de estados del pedido?
- ¿Se muestran los intentos de pago, incluidos los rechazados?

## Casos de prueba

| ID | Caso | Resultado esperado |
|---|---|---|
| CP-01 | Consultar un pedido propio existente | Se muestran el número, la fecha en formato dd/mm/aaaa, el estado, los ítems y el total |
| CP-02 | Consultar un pedido con 2 ítems | Por cada ítem se muestran nombre, cantidad, precio unitario y subtotal |
| CP-03 | Consultar un pedido y comparar el total mostrado | El total coincide con la suma de los subtotales |
| CP-04 | Consultar un pedido cuyo ítem cambió de precio después de la compra | Se muestra el precio unitario original |
| CP-05 | Consultar un número de pedido que no existe | Se informa que no se encontró el pedido |
| CP-06 | Consultar un pedido de otro cliente | Se informa que no se encontró el pedido, sin mostrar sus datos |
| CP-07 | Consultar sin ingresar el número de pedido | Se impide la consulta y se pide ingresar el número |
| CP-08 | Consultar un pedido en estado "Cancelado" | Se muestra el pedido con su estado "Cancelado" |
