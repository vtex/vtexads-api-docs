## 3. Autenticación

La autenticación es necesaria para el envío de catálogos, el consumo de informes y la gestión. Las demás llamadas, como consulta de anuncios y notificación de eventos, son públicas y no requieren autenticación.

Para los endpoints protegidos, las credenciales deben ser enviadas vía encabezado (header) HTTP. Solicite sus credenciales al gerente de cuenta.

| Atributo | Descripción |
| :--- | :--- |
| `x-app-id` | ID exclusivo de su aplicación para la integración. |
| `x-api-key` | Clave de API asociada a su aplicación. |
