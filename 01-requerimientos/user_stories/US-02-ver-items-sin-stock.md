# US-02: Ver qué ítems no tienen stock al confirmar el pedido

**Jira:** PED-3 · **Épica:** Realizar pedido · **Prioridad:** Media · **Puntos:** 2

## Precondiciones

- El cliente tiene la sesión iniciada.
- El cliente tiene un carrito asociado a su sesión y solicita confirmar el pedido.
- Al menos un ítem del carrito tiene una cantidad mayor al stock disponible.

## Fuera de alcance

- Confirmación del pedido cuando hay stock en todos los ítems ([US-01](US-01-confirmar-pedido.md)).
- Modificación del carrito para ajustar cantidades (queda fuera de esta épica).

## Historia

Como **cliente** quiero **saber qué ítems de mi pedido no tienen stock suficiente** para **decidir cómo ajustar mi pedido antes de pagar**.

## Criterios de aceptación

1. El sistema debe impedir la confirmación del pedido si algún ítem tiene una cantidad mayor al stock disponible.
2. El sistema debe informar al cliente cada ítem sin stock suficiente, con su nombre, la cantidad solicitada y el stock disponible.
3. El sistema debe informar únicamente los ítems sin stock suficiente, y no los que sí tienen stock.
4. El sistema no debe guardar el pedido ni sus detalles, ni registrar ningún estado en el historial.
5. El sistema no debe modificar el stock ni el carrito del cliente.

## Supuestos

- El stock informado es el vigente al momento de confirmar el pedido.
- El cliente ajusta su carrito con las funciones del carrito, que están fuera de esta épica.

## Preguntas abiertas

- ¿Se permite confirmar parcialmente el pedido solo con los ítems que tienen stock?
- ¿Se avisa al cliente cuando un ítem sin stock vuelve a estar disponible?

## Casos de prueba

| ID | Caso | Resultado esperado |
|---|---|---|
| CP-01 | Confirmar un carrito con 2 ítems, uno de ellos con cantidad mayor al stock | No se confirma el pedido. Se informa ese ítem con su nombre, la cantidad solicitada y el stock disponible |
| CP-02 | Confirmar un carrito con 3 ítems, dos de ellos sin stock suficiente | Se informan los dos ítems sin stock y no el tercero |
| CP-03 | Confirmar con un ítem cuyo stock es 0 | Se informa el ítem con stock disponible 0 |
| CP-04 | Confirmar con un ítem cuya cantidad es el stock disponible más 1 | Se informa la falta de stock y no se confirma el pedido |
| CP-05 | Revisar los datos guardados después del aviso | No existe el pedido, ni sus detalles, ni filas nuevas en el historial |
| CP-06 | Revisar el stock y el carrito después del aviso | El stock y el carrito quedan igual que antes |
| CP-07 | Ajustar la cantidad al stock disponible y confirmar de nuevo | El pedido se confirma según la US-01 |
