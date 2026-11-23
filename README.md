# Sistema de pedidos: documentación de análisis

Análisis y diseño funcional de una tienda online (pedidos, cobros y stock): requerimientos, procesos, modelos UML, base de datos y API.
El foco está en **analizar y documentar antes de programar**.

> Estado: en construcción. Lo marcado con ⏳ está pendiente.

## Contenido

| Carpeta | Qué muestra | Estado |
|---|---|---|
| [01-requerimientos](01-requerimientos) | Requerimientos funcionales y no funcionales, historias de usuario con criterios de aceptación, caso de uso textual | ✅ |
| [02-procesos](02-procesos) | Diagrama de flujo y BPMN del proceso "Realizar pedido con pago" | ✅ BPMN  
| [03-uml](03-uml) | Casos de uso, diagrama de secuencia (BCE) | ✅ CU, Diagrama de Secuencia
| [04-base-de-datos](04-base-de-datos) | Modelo entidad-relación, script de tablas y consultas SQL comentadas | ✅ ER,  schema y consultas |
| [05-api](05-api) | Diseño de endpoints REST y colección de Postman | ⏳ |
| [06-gestion-agil](06-gestion-agil) | Backlog y sprint en Jira, documentación en Confluence (capturas) | ⏳ |
| [07-gestion](07-gestion) | Backlog priorizado, roadmap, matriz de riesgos y diseño de solución | ⏳ |
    
## Decisiones de diseño

- **Cobros 1 a N con pedido (`0..n` del lado de cobros):** el pedido se guarda como *pendiente de pago* y cada intento de cobro queda registrado. Permite auditar rechazos, detectar fraude y recuperar ventas.
- **Cancelación por timeout de 24 h:** si el cliente no ingresa un medio de pago, el pedido pasa a *cancelado*. Se distingue de un cobro rechazado porque son causas de negocio distintas.
- **Cobro y stock:** el stock se verifica antes de cobrar y se descuenta solo tras un cobro aprobado.
- **Reintento tras rechazo:** el cliente recibe un aviso y el pedido sigue pendiente mientras no venza el plazo.

## Alcance y simplificaciones

- En el BPMN, el pool del Cliente está simplificado a propósito: los avisos llegan al borde del pool sin detallar su reacción.
- La pasarela de pago se modela como participante externo.


## Herramientas

draw.io, bpmn.io, Mermaid, Jira y Confluence.
