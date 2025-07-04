## 1. Resumen

Esta documentación detalla la integración con la **Retail Media API**, el punto central de conexión entre la solución de VTEX Ads y la plataforma del minorista (publisher). La solución fue desarrollada bajo el concepto **API-first**, garantizando flexibilidad total para que los minoristas integren y exhiban anuncios en cualquier canal digital: e-commerce, marketplace, aplicación o incluso en tótems y pantallas físicas (Digital Signage).

Nuestra arquitectura es **cookie-less**, lo que significa que no dependemos de cookies de terceros. La identificación y segmentación se basan en identificadores propios (`user_id`, `session_id`) y datos primarios (first-party data), garantizando una solución robusta, en conformidad con las nuevas políticas de privacidad y preparada para el futuro del retail digital.

A través de esta API REST, su plataforma podrá:
* Sincronizar el catálogo de productos e inventario.
* Solicitar anuncios relevantes en tiempo real para el contexto de navegación del usuario.
* Enviar eventos de interacción (impresión, visualización, clic, conversión) para la medición de performance.
