## 5. Reportes y Exportación de Datos

### 5.1. Exportación vía API
Endpoints REST para extraer reportes consolidados en JSON (o XLSX con `download=true`).

* `GET /report/v2/advertisers`: Rendimiento por anunciante (visión del publisher) [[Ejemplo]](../../examples/EXPORT_ADVERTISER_DATA.md)
* `GET /report/v2/publishers`: Rendimiento por publisher (visión del anunciante) [[Ejemplo]](../../examples/EXPORT_PUBLISHER_DATA.md)
* `GET /report/network/publishers`: Publishers de red (para cuentas de tipo red) [[Ejemplo]](../../examples/EXPORT_NETWORK_PUBLISHERS_DATA.md)
* `GET /campaign/v2`: Reporte listado de campañas [[Ejemplo]](../../examples/EXPORT_CAMPAIGNS_LIST_DATA.md)
* `GET /campaign/:id`: Reporte detallado de la campaña [[Ejemplo]](../../examples/EXPORT_CAMPAIGN_DATA.md)
* `GET /ad/results/v2`: Reporte de performance de anuncios individuales [[Ejemplo]](../../examples/EXPORT_ADS_DATA.md)

### 5.2. Exportación de Datos Crudos (vía Storage)
Configuramos la exportación diaria (D-1) de datos a un bucket de su preferencia (AWS S3, Google Cloud Storage, Azure Blob).

* **Eventos (impresiones, clics, conversiones):** Archivos `Parquet` + `Snappy`. Es necesario hacer la deduplicación usando el `event_id`.
* **Datos Agregados (reportes de campañas, anunciantes):** Archivos `CSV`.
