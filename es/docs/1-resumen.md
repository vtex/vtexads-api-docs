## 1. Resumen

> [!IMPORTANT]
> **Esta página se ha movido.**
>
> La documentación de la API de VTEX Ads ahora forma parte del Portal de Desarrolladores oficial de VTEX: [VTEX Ads API en developers.vtex.com](https://developers.vtex.com/docs/api-reference/vtex-ads-api).
>
> Actualiza tus marcadores. Esta página ya no recibe mantenimiento.

Esta documentación detalla la integración con la **Retail Media API**, el punto central de conexión entre la solución de VTEX Ads y la plataforma del minorista (publisher). La solución fue desarrollada bajo el concepto **API-first**, garantizando flexibilidad total para que los minoristas integren y exhiban anuncios en cualquier canal digital: e-commerce, marketplace, aplicación o incluso en tótems y pantallas físicas (Digital Signage).

Nuestra arquitectura es **cookie-less**, lo que significa que no dependemos de cookies de terceros. La identificación y segmentación se basan en identificadores propios (`user_id`, `session_id`) y datos primarios (first-party data), garantizando una solución robusta, en conformidad con las nuevas políticas de privacidad y preparada para el futuro del retail digital.

A través de esta API REST, su plataforma podrá:
* Sincronizar el catálogo de productos e inventario.
* Solicitar anuncios relevantes en tiempo real para el contexto de navegación del usuario.
* Enviar eventos de interacción (impresión, visualización, clic, conversión) para la medición de performance.

Adoptamos el principio de **Extensibilidad Progresiva** para garantizar la máxima estabilidad y seguridad en las operaciones de nuestros socios.

Nuestra política formal de compatibilidad garantiza:
* **Evolución sin rupturas:** todas las actualizaciones de API se realizan de forma incremental. Se agregan nuevos campos, funcionalidades y opciones sin alterar ni eliminar el comportamiento de los contratos existentes.
* **Preservación de integraciones:** las integraciones actuales permanecen plenamente operativas tras nuevos lanzamientos, reduciendo el retrabajo técnico recurrente.
* **Continuidad del negocio:** al preservar la integridad de los contratos anteriores, evitamos interrupciones operativas y permitimos adoptar nuevas capacidades al ritmo de su negocio.

Este enfoque refleja nuestro compromiso con una plataforma robusta y escalable, donde la innovación tecnológica y la previsibilidad operativa evolucionan juntas.
