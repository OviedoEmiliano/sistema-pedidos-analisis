# US-01: Confirmar un pedido cuando hay stock

**Jira:** PED-2 · **Épica:** Realizar pedido · **Prioridad:** Alta · **Puntos:** 3

## Precondiciones

- El cliente tiene la sesión iniciada.
- El cliente tiene un carrito asociado a su sesión y solicita confirmar el pedido.

## Fuera de alcance

- Avisar al cliente cuando falta stock ([US-02](US-02-ver-items-sin-stock.md)).
- Solicitar el medio de pago y cobrar ([US-03](US-03-pagar-pedido.md)).

## Historia

Como **cliente** quiero **confirmar mi pedido** para **dejar registrado mi compra y poder pagarla.**

## Criterios de aceptación

1. El sistema debe impedir la confirmación si el carrito no tiene ítems o si algún ítem tiene una cantidad que no es un número entero mayor a 0.
2. El sistema debe verificar, antes de guardar el pedido, que haya stock suficiente para cada ítem. Se acepta una cantidad igual al stock disponible.
3. El sistema debe guardar el pedido asociado al cliente, con la fecha y hora de confirmación y un detalle por cada ítem con su cantidad y el precio del ítem al momento de la confirmación.
4. El pedido debe quedar en estado "Pendiente de pago", y el sistema debe registrar ese estado en el historial con su fecha y hora.
5. El sistema no debe descontar stock ni registrar ningún cobro en esta instancia.
6. El sistema debe informar al cliente el número de su pedido y que está pendiente de pago.

## Supuestos

- El stock se descuenta recién cuando el cobro es aprobado (US-03).
- El precio de cada ítem se toma del precio vigente al confirmar.

## Preguntas abiertas

- ¿Se reserva el stock mientras el pedido está pendiente de pago? Hoy no: dos clientes podrían confirmar el último ítem y uno de ellos fallaría al pagar.
- ¿Hay una cantidad máxima por ítem?

## Casos de prueba

| ID | Caso | Resultado esperado |
|---|---|---|
| CP-01 | Confirmar un carrito con 2 ítems, ambos con stock suficiente | Pedido guardado en "Pendiente de pago", con un detalle por ítem, su historial y el número de pedido informado al cliente |
| CP-02 | Confirmar con un ítem cuya cantidad es igual al stock disponible | Se acepta la confirmación |
| CP-03 | Confirmar un pedido y revisar el stock de los ítems | El stock queda igual que antes y no se registra ningún cobro |
| CP-04 | Confirmar un pedido, cambiar después el precio de un ítem y consultar el detalle | El detalle conserva el precio original |
| CP-05 | Confirmar con el carrito sin ítems | Se rechaza la confirmación y no se guarda el pedido |
| CP-06 | Confirmar con un ítem de cantidad 0 | Se rechaza la confirmación y no se guarda el pedido |
| CP-07 | Confirmar con un ítem de cantidad negativa o decimal | Se rechaza la confirmación y no se guarda el pedido |
| CP-08 | Confirmar con un ítem de cantidad mayor al stock disponible | No se guarda el pedido (el aviso al cliente lo define la US-02) |