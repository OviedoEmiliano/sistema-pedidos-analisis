# UML

## Casos de uso

Actores Cliente y Administrador, que heredan de User las funciones de sesión y perfil.
La Pasarela de pago participa como actor externo en el cobro.

- `«include»`: Realizar pedido siempre requiere Procesar pago.
- `«extend»`: Exportar PDF es opcional sobre Visualizar pedidos.

![Casos de uso](diagrama_casos_de_uso_pedidos.svg)

## Secuencia: consultar pedido

Camino feliz con estereotipos Boundary, Control y Entity.
El gestor coordina la búsqueda y la pantalla recibe los datos ya formateados.

![Secuencia consultar pedido](Diagrama_secuencia_pedidos.svg)

Fuente editable de ambos diagramas: [diagramas_uml](../fuentes/diagramas_uml)