# US-05: Liberar los pedidos que no se pagaron en 24 h

**Jira:** PED-6 · **Épica:** Realizar pedido · **Prioridad:** Media · **Puntos:** 3

## Precondiciones

- Existe un pedido en estado "Pendiente de pago".

## Fuera de alcance

- Aprobación del pago ([US-03](US-03-pagar-pedido.md)).
- Reintento del pago tras un rechazo ([US-04](US-04-reintentar-pago.md)).
- Reintegro de pagos aprobados (un pedido pendiente no tiene pagos aprobados).

## Historia

Como **administrador de la tienda** quiero **que los pedidos que no se pagan en 24 h se cancelen automáticamente** para **no tener pedidos pendientes abiertos indefinidamente**.

## Criterios de aceptación

1. El sistema debe cancelar automáticamente todo pedido que siga en estado "Pendiente de pago" 24 h después de su confirmación.
2. El pedido debe pasar a estado "Cancelado", y el sistema debe registrar ese estado en el historial con su fecha y hora.
3. El sistema no debe cancelar pedidos que estén en un estado distinto de "Pendiente de pago".
4. El sistema debe conservar los pagos rechazados registrados del pedido cancelado.
5. El sistema debe impedir que un pedido cancelado pueda pagarse.
6. El sistema debe enviar un mail al cliente avisando que su pedido fue cancelado por falta de pago.
7. El sistema no debe modificar el stock de los ítems al cancelar el pedido.

## Supuestos

- El plazo de 24 h se cuenta desde la confirmación del pedido y no se reinicia con los intentos de pago.
- Como el stock no se reserva al confirmar, la cancelación no tiene que devolver stock.
- Un pedido cancelado por falta de pago puede no tener ningún pago registrado.

## Preguntas abiertas

- ¿Con qué frecuencia el sistema revisa los pedidos vencidos? Un pedido podría cancelarse unos minutos después de cumplir las 24 h.
- Si el plazo vence mientras el cliente está pagando, ¿qué ocurre con el pago en curso?
- ¿Se envía un recordatorio al cliente antes de que venza el plazo?

## Casos de prueba

| ID | Caso | Resultado esperado |
|---|---|---|
| CP-01 | Pedido en "Pendiente de pago" que cumple 24 h desde su confirmación, sin pagos | Pasa a "Cancelado" y se registra en el historial con fecha y hora |
| CP-02 | Pedido pendiente con pagos rechazados que cumple 24 h | Pasa a "Cancelado" y los pagos rechazados siguen registrados |
| CP-03 | Pedido pendiente con menos de 24 h desde su confirmación | No se cancela |
| CP-04 | Pedido en "Confirmado" con más de 24 h desde su confirmación | No se cancela |
| CP-05 | Intentar pagar un pedido cancelado | Se impide el pago y no se comunica con la pasarela |
| CP-06 | Cancelación de un pedido por vencimiento | El cliente recibe un mail avisando la cancelación por falta de pago |
| CP-07 | Cancelación de un pedido por vencimiento y revisión del stock | El stock de los ítems queda igual que antes |
| CP-08 | Pedido con un reintento de pago rechazado a las 23 h | Se cancela igualmente a las 24 h desde la confirmación, sin reiniciar el plazo |
