## 3. Autenticación

> [!IMPORTANT]
> **Esta página se ha movido.**
>
> La documentación de la API de VTEX Ads ahora forma parte del Portal de Desarrolladores oficial de VTEX: [VTEX Ads API en developers.vtex.com](https://developers.vtex.com/docs/api-reference/vtex-ads-api).
>
> Actualiza tus marcadores. Esta página ya no recibe mantenimiento.

La autenticación es necesaria para el envío de catálogos, el consumo de informes y la gestión. Las demás llamadas, como consulta de anuncios y notificación de eventos, son públicas y no requieren autenticación.

Para los endpoints protegidos, las credenciales deben ser enviadas vía encabezado (header) HTTP. Solicite sus credenciales al gerente de cuenta.

| Atributo | Descripción |
| :--- | :--- |
| `x-app-id` | ID exclusivo de su aplicación para la integración. |
| `x-api-key` | Clave de API asociada a su aplicación. |
