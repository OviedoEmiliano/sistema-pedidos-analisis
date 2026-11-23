# US-04: Reintentar el pago tras un rechazo

**Jira:** PED-5 · **Épica:** Realizar pedido · **Prioridad:** Media · **Puntos:** 3

## Precondiciones

- El cliente tiene la sesión iniciada.
- El cliente tiene un pedido en estado "Pendiente de pago" asociado a su sesión.
- El cliente ya intentó pagar y la pasarela de pago rechazó el pago.

## Fuera de alcance

- Aprobación del pago, incluso cuando ocurre en un reintento ([US-03](US-03-pagar-pedido.md)).
- Cancelación del pedido si no se paga en 24 h ([US-05](US-05-liberar-pedidos-impagos.md)).

## Historia

Como **cliente** quiero **reintentar el pago de mi pedido** para **no perder mi compra cuando mi pago es rechazado**.

## Criterios de aceptación

1. El sistema debe informar al cliente que el pago fue rechazado.
2. El sistema debe registrar el pago rechazado asociado al pedido, con estado "Rechazado", el monto y la fecha y hora del intento.
3. El pedido debe permanecer en estado "Pendiente de pago", y el sistema no debe registrar un nuevo estado en el historial.
4. El sistema no debe descontar stock ni confirmar el pedido.
5. El sistema debe informar al cliente el número de su pedido y que sigue pendiente de pago.
6. El sistema debe enviar un mail al cliente avisando que su pedido sigue pendiente de pago.
7. El sistema debe permitir un nuevo intento de pago mientras el pedido siga en estado "Pendiente de pago", solicitando nuevamente los datos de pago.
8. El sistema debe impedir el reintento si el pedido ya no está en estado "Pendiente de pago".

## Supuestos

- Cada intento rechazado se registra como un pago nuevo, y el pedido acumula todos sus intentos.
- El plazo de 24 h para pagar se cuenta desde la confirmación del pedido y no se reinicia con un rechazo.
- Un rechazo no cambia el estado del pedido, por lo que no genera una fila en el historial de estados.
- El stock se descuenta recién cuando el pago es aprobado (US-03).

## Preguntas abiertas

- ¿Cuántos intentos se permiten? Hoy no hay límite, y muchos rechazos seguidos pueden indicar un uso fraudulento de tarjetas.
- ¿Se le informa al cliente el motivo del rechazo? La pasarela puede devolverlo, pero la tabla de pagos no lo guarda y habría que agregar un campo.
- Si el plazo de 24 h vence mientras el cliente reintenta, ¿qué sucede con el pago en curso?

## Casos de prueba

| ID | Caso | Resultado esperado |
|---|---|---|
| CP-01 | La pasarela rechaza el pago de un pedido pendiente | Se informa el rechazo. Se registra un pago "Rechazado" con monto y fecha y hora. El pedido sigue en "Pendiente de pago" y no se agrega una fila al historial |
| CP-02 | Revisar el stock y el estado del pedido después de un rechazo | El stock queda igual y el pedido no pasa a "Confirmado" |
| CP-03 | Rechazo de pago y revisión de lo que ve el cliente | Se muestra el número de pedido y que sigue pendiente de pago |
| CP-04 | Rechazo de pago y revisión del mail | El cliente recibe un mail avisando que su pedido sigue pendiente de pago |
| CP-05 | Reintentar luego de un rechazo | Se solicitan nuevamente los datos de pago y no se reutilizan los del intento anterior |
| CP-06 | Reintentar con datos válidos y aprobación de la pasarela | El pedido pasa a "Confirmado" (US-03) y queda con dos pagos: uno "Rechazado" y uno "Aprobado" |
| CP-07 | Reintentar y recibir un segundo rechazo | Se registra un segundo pago "Rechazado" y el pedido sigue en "Pendiente de pago" |
| CP-08 | Intentar reintentar con un pedido en estado "Cancelado" | Se impide el pago y no se comunica con la pasarela |