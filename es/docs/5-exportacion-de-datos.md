## 5. Exportación de Datos

La exportación de datos le permite recibir información detallada sobre eventos y datos agregados de forma sistemática y periódica. La integración se realiza a través de una conexión S3, y los datos se entregan en formatos específicos para cada tipo de exportación.

### Conexión de Integración

La integración siempre se realizará mediante una conexión S3 (o compatible) que deberá ser proporcionada por el receptor de los datos. Las credenciales deben ser entregadas al equipo de Newtail de forma segura.

La integración es compatible con:

*   **AWS S3:** `Access Key Id` y `Access Key Secret`.
*   **Google Cloud Storage:** `Service Account`.
*   **Azure Blob Storage**.

### Exportación de Eventos

La exportación de eventos envía datos brutos de las interacciones de los usuarios.

*   **Formato:** `PARQUET` con compresión `Snappy`.
*   **Frecuencia:** Diaria (datos de D-1).
*   **Estructura de Carpetas:** `TYPE_REPORT/YYYY/MM/DD/TIMESTAMP_NS/RANDOM_FILE_NAMES.snappy.parquet`
*   **De-duplicación:** Se garantiza que todos los eventos serán enviados, pero no que se enviarán una única vez. Por lo tanto, los eventos siempre deben ser de-duplicados usando el `event_id` o la combinación de `order_id` y `product_sku` para los artículos de conversión.

#### Tipos de Eventos

*   **Impresiones, Visualizaciones y Clics:**
    *   **Campos:** `event_id` (clave de de-duplicación), `session_id`, `user_id`, `ad_id`, `campaign_id`, `request_id`, `ad_type`, `placement_name`, `context`, `created_at`, `site`.
*   **Conversiones:**
    *   **Campos:** `event_id`, `session_id`, `user_id`, `order_id` (clave de de-duplicación), `channel`, `placed_at`, `site`.
*   **Artículos de Conversión:**
    *   **Campos:** `event_id`, `session_id`, `user_id`, `order_id` (clave de de-duplicación), `product_sku` (clave de de-duplicación), `ad_id`, `campaign_id`, `request_id`, `ad_size`, `ad_type`, `placement_name`, `context`, `event_created_at`, `price`, `promotional_price`, `quantity`, `total_value`.

### Exportación de Datos Agregados

La exportación de datos agregados envía informes consolidados.

*   **Formato:** `CSV` con codificación `UTF-8`, separado por comas, y números en formato americano (punto decimal).
*   **Frecuencia:** Diaria (datos de D-1, con la zona horaria del publisher).
*   **Estructura de Carpetas:** `TYPE_REPORT/YYYY/MM/DD/TIMESTAMP_NS/RANDOM_FILE_NAMES.csv`

#### Tipos de Informes

*   **Anunciantes:**
    *   **Campos:** `advertiser`, `advertiser_id`, `seller_id`, `wallet_balance`, `daily_budget`, `currency`.
*   **Campañas:**
    *   **Campos:** `day`, `name`, `campaign_id`, `campaign_type`, `campaign_status`, `impressions_total`, `clicks_total`, `ctr`, `ad_revenue`, `conversions_total`, `conversion_rate`, `sales_revenue`, `start_date`, `end_date`, `advertiser_id`.
*   **Anuncios:**
    *   **Campos:** `day`, `ad_id`, `campaign_id`, `ad_status`, `ad_media_url`, `cpm`, `cpc`, `impressions_total`, `clicks_total`, `ctr`, `ad_revenue`, `conversions_total`, `conversion_rate`, `sales_revenue`, `product_sku`.

### Exportación de Informes a través de la API

Además de la exportación a través de S3, es posible extraer informes a través de la API. Las rutas devuelven JSON por defecto, pero se pueden exportar como archivos XLSX incluyendo el parámetro `download=true` en la consulta.

*   `GET /report/v2/advertisers`: Información de anunciantes (vista del publisher).
*   `GET /report/v2/publishers`: Información del publisher (vista del anunciante).
*   `GET /report/network/publishers`: Publishers de la red (para cuentas de tipo Red).
*   `GET /campaign/v2`: Informe de campañas.
*   `GET /ad/results/v2`: Informe de anuncios.