# Sistema de pedidos: documentación de análisis

Análisis y diseño funcional de una tienda online (pedidos, cobros y stock): requerimientos, procesos, modelos UML, base de datos y API.
El foco está en **analizar y documentar antes de programar**.

> Estado: en construcción. Lo marcado con ⏳ está pendiente.

## Contenido

| Carpeta | Qué muestra | Estado |
|---|---|---|
| [01-requerimientos](01-requerimientos) | Historias de usuario con criterios de aceptación y casos de prueba, requerimientos funcionales y no funcionales, y caso de uso textual | ✅ 6 historias de usuario / ⏳ requerimientos y caso de uso textual |
| [02-procesos](02-procesos) | BPMN del proceso "Realizar pedido con pago" | ✅ |
| [03-uml](03-uml) | Casos de uso y diagrama de secuencia (Boundary, Control, Entity) | ✅ |
| [04-base-de-datos](04-base-de-datos) | Modelo entidad-relación, schema, datos de prueba y consultas SQL | ✅ |
| [05-api](05-api) | Diseño de endpoints REST | ⏳ |
| [06-gestion-agil](06-gestion-agil) | Backlog y sprint de ejemplo en Jira (capturas) | ✅ |
| [07-gestion](07-gestion) | Backlog priorizado y matriz de riesgos | ⏳ |

## Decisiones de diseño

- **Cobros 1 a N con pedido (`0..n` del lado de cobros):** el pedido se guarda como *pendiente de pago* y cada intento de cobro queda registrado. Permite auditar rechazos, detectar fraude y recuperar ventas.
- **Cancelación a las 24 h:** si el pedido no se paga dentro de las 24 h desde su confirmación, se cancela automáticamente. El plazo no se reinicia con los reintentos de pago.
- **Cobro y stock:** el stock se verifica al confirmar el pedido y se descuenta solo tras un cobro aprobado.
- **Reintento tras rechazo:** el cliente recibe un aviso y el pedido sigue pendiente mientras no venza el plazo.
- **Estado del pedido:** el historial guarda cada cambio de estado y un trigger mantiene sincronizado el estado actual (detalle en [04-base-de-datos](04-base-de-datos)).

## Alcance y simplificaciones

- El proceso modelado empieza con un carrito ya armado. El inicio de sesión y la gestión del carrito quedan fuera de esta épica.
- En el BPMN, el pool del Cliente está simplificado a propósito: los avisos llegan al borde del pool sin detallar su reacción.
- La pasarela de pago se modela como participante externo.
- El sprint de Jira es un ejemplo armado para ilustrar la planificación.

## Próximos pasos

- Implementación en Java y Spring Boot, con frontend en React.

## Herramientas

draw.io, bpmn.io, Mermaid, PostgreSQL y Jira.