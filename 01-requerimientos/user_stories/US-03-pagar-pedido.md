# US-03: Pagar el pedido con un medio de pago

**Jira:** PED-4 · **Épica:** Realizar pedido · **Prioridad:** Alta · **Puntos:** 5

## Precondiciones

- El cliente tiene la sesión iniciada.
- El cliente tiene un pedido en estado "Pendiente de pago" asociado a su sesión.

## Fuera de alcance

- Qué ocurre cuando el pago es rechazado y el reintento del pago ([US-04](US-04-reintentar-pago.md)).
- Cancelación del pedido si no se paga en 24 h ([US-05](US-05-liberar-pedidos-impagos.md)).
- Envío de la factura por mail y preparación del pedido (no se cubren en esta épica).

## Historia

Como **cliente** quiero **pagar mi pedido con un medio de pago** para **completar mi compra**.

## Criterios de aceptación

1. El sistema debe permitir pagar únicamente pedidos en estado "Pendiente de pago".
2. El cliente debe seleccionar el medio de pago: tarjeta de débito o tarjeta de crédito.
3. El cliente debe ingresar el número de tarjeta, el nombre completo del titular, el código de seguridad (CVV) y la fecha de vencimiento.
4. El sistema debe rechazar los datos antes de procesar el pago si la fecha de vencimiento es anterior al mes actual o si el CVV no tiene 3 o 4 dígitos.
5. Si el medio de pago es tarjeta de crédito, el cliente debe seleccionar la cantidad de cuotas. Para débito no se solicita.
6. El sistema debe enviar a la pasarela de pago el monto total del pedido y los datos de la tarjeta, y esperar su respuesta.
7. Si la pasarela aprueba el pago, el sistema debe registrar el pago asociado al pedido, con estado "Aprobado", el monto total y la fecha y hora del pago.
8. El pedido debe pasar a estado "Confirmado", y el sistema debe registrar ese estado en el historial con su fecha y hora.
9. El sistema debe descontar del stock de cada ítem la cantidad indicada en el pedido.
10. El sistema no debe almacenar el CVV ni el número completo de la tarjeta.
11. El sistema debe informar al cliente el número de su pedido y que su pago fue aprobado.

## Supuestos

- Los medios de pago aceptados son tarjeta de débito y tarjeta de crédito.
- El monto a cobrar es el total del pedido, calculado con las cantidades y los precios guardados en sus detalles.
- La pasarela de pago responde siempre con un resultado: aprobado o rechazado.
- Los datos de la tarjeta se envían a la pasarela y no se guardan en el sistema.

## Preguntas abiertas

- ¿Con qué pasarela de pago se integra el sistema (por ejemplo, Mercado Pago)?
- Si entre la confirmación y el pago el stock de un ítem ya no alcanza, ¿se rechaza el pago o se aprueba y luego se reintegra? Con el diseño actual el stock no se reserva.
- ¿Qué ve el cliente si la pasarela no responde?

## Casos de prueba

| ID | Caso | Resultado esperado |
|---|---|---|
| CP-01 | Pagar con débito, con datos válidos y aprobación de la pasarela | Pago registrado como "Aprobado", con monto total y fecha y hora. Pedido en "Confirmado" con su historial. Se informa el número de pedido y que el pago fue aprobado |
| CP-02 | Pagar con crédito en 3 cuotas, con datos válidos y aprobación de la pasarela | Mismo resultado que CP-01 |
| CP-03 | Intentar pagar un pedido que está en estado "Confirmado" o "Cancelado" | Se impide el pago y no se comunica con la pasarela |
| CP-04 | Continuar sin seleccionar el medio de pago | Se impide el pago y se pide seleccionar el medio |
| CP-05 | Dejar vacío, de a uno por vez, el número de tarjeta, el titular, el CVV o la fecha de vencimiento | Se impide el pago y no se comunica con la pasarela |
| CP-06 | Ingresar una tarjeta con fecha de vencimiento anterior al mes actual | Se rechaza antes de procesar el pago |
| CP-07 | Ingresar un CVV de 2 dígitos | Se rechaza antes de procesar el pago |
| CP-08 | Pagar con crédito sin indicar la cantidad de cuotas | Se impide el pago |
| CP-09 | Pagar con débito | No se solicita la cantidad de cuotas |
| CP-10 | Pagar con aprobación y revisar el stock de los ítems | El stock de cada ítem disminuye en la cantidad indicada en el pedido |
| CP-11 | Pagar con aprobación y revisar los datos guardados | No hay CVV ni número completo de tarjeta almacenados |
| CP-12 | Pagar con aprobación y comparar el monto registrado | El monto coincide con la suma de cantidad por precio unitario de los detalles |