Aquí está la traducción del documento a español de Argentina, manteniendo el formato Markdown original.

# **Documentación de la API de Retail Media**

## 1. Resumen

Esta documentación detalla la integración con la **Retail Media API**, el punto central de conexión entre la solución de VTEX Ads y la plataforma del minorista (publisher). La solución fue desarrollada bajo el concepto **API-first**, garantizando flexibilidad total para que los minoristas integren y exhiban anuncios en cualquier canal digital: e-commerce, marketplace, aplicación o incluso en tótems y pantallas físicas (Digital Signage).

Nuestra arquitectura es **cookie-less**, lo que significa que no dependemos de cookies de terceros. La identificación y segmentación se basan en identificadores propios (`user_id`, `session_id`) y datos primarios (first-party data), garantizando una solución robusta, en conformidad con las nuevas políticas de privacidad y preparada para el futuro del retail digital.

A través de esta API REST, su plataforma podrá:
* Sincronizar el catálogo de productos e inventario.
* Solicitar anuncios relevantes en tiempo real para el contexto de navegación del usuario.
* Enviar eventos de interacción (impresión, visualización, clic, conversión) para la medición de performance.

## 2. Glosario

| Término | Descripción |
| :--- | :--- |
| **Advertiser (Anunciante)** | Empresas, sellers o individuos que promocionan sus productos, servicios o ideas a través de campañas. |
| **Publisher (Minorista)** | La entidad que posee y opera la plataforma digital (sitio, app) y pone a disposición los espacios para la exhibición de anuncios. |
| **Campaña** | Acción creada por un anunciante para promocionar productos y generar conversiones (ventas). |
| **Impresión** | Se contabiliza cada vez que un anuncio se exhibe en la pantalla del usuario. |
| **Visualización (View)**| Se contabiliza cuando una impresión se vuelve visible en la pantalla del usuario por un tiempo determinado. |
| **Clic** | Interacción del usuario al hacer clic en un anuncio para ser dirigido a la página de destino. |
| **Conversión** | Acción de valor generada por un anuncio, típicamente una venta. |
| **Ingresos por Anuncios** | Valor obtenido por los minoristas al monetizar sus espacios publicitarios. |
| **Ingresos por Ventas** | Valor total obtenido por una empresa a partir de las ventas de productos o servicios. |
| **CTR (Click-Through Rate)** | Tasa de Clics. Fórmula: `(Clics / Impresiones) * 100`. Mide el atractivo de un anuncio. |
| **ROAS (Return on Ad Spend)**| Retorno de la Inversión Publicitaria. Fórmula: `Ingresos Generados por Anuncios / Costo de la Publicidad`. |
| **Tasa de Conversión** | Porcentaje de conversiones en relación con el total de clics o visitas. |

## 3. Autenticación

La autenticación es necesaria **solo para los endpoints de sincronización del catálogo de productos**. Las demás llamadas, como consulta de anuncios y notificación de eventos, son públicas y no requieren autenticación.

Para los endpoints protegidos, las credenciales deben ser enviadas vía encabezado (header) HTTP. Solicite sus credenciales al gerente de cuenta.

| Atributo | Descripción |
| :--- | :--- |
| `x-app-id` | ID exclusivo de su aplicación para la integración. |
| `x-api-key` | Clave de API asociada a su aplicación. |

## 4. Integración Principal

La integración se fundamenta en tres pilares que garantizan el funcionamiento de la solución.

### Pilares de la Integración

1.  **Catálogo:** Mantener a VTEX Ads sincronizado con su catálogo de productos e inventario (precio y stock). Esencial para anuncios de producto.
2.  **Consulta de Anuncios:** Su plataforma solicita a la API los anuncios que deben ser exhibidos en diferentes páginas y contextos.
3.  **Eventos:** Su plataforma notifica a la API sobre todas las interacciones del usuario con los anuncios y, crucialmente, sobre las conversiones (ventas).

### Tipos de Anuncios

| Tipo de Anuncio | API Type | Descripción |
| :--- | :--- |:------------------------------------------------|
| **Sponsored Products** | `product` | Anuncios de productos individuales. |
| **Display Banner** | `banner` | Anuncios visuales (imagen estática o video). |
| **Sponsored Brands** | `sponsored_brand` | Anuncios de marca con título, logo y productos. (imagen estática o video) |
| **Digital Signage** | `digital_signage`| Contenido para pantallas y tótems físicos. |

### 4.1. Catálogo

El primer paso es la sincronización, que ocurre en dos frentes:

> **Nota para tiendas VTEX:** Para tiendas en la plataforma VTEX, la sincronización del catálogo ocurre de forma transparente, no siendo necesaria ninguna integración adicional para este fin.

#### **Sincronización de Productos**
Envío de la información de registro de los productos. Requiere autenticación.

* **Endpoint:** `POST https://api-retail-media.newtail.com.br/product/bulk/products`
* **Límites:** 500 productos por solicitud; 3 solicitudes simultáneas.

| Campo | Descripción | Tipo | ¿Obligatorio? |
| :--- | :--- | :--- | :--- |
| `product_sku` | ID/SKU único del producto. | String | Sí |
| `parent_sku` | SKU del producto padre (para variaciones). | String | No |
| `name` | Nombre del producto. | String | Sí |
| `url` | URL canónica de la página del producto. | String | Sí |
| `image_url`| URL de la imagen principal del producto. | String | No |
| `categories` | Lista de categorías. | Array[String] | Sí |
| `brand` | Marca del producto. | String | No |
| `gtins` | Códigos de barras (EAN). **Obligatorio para campañas en la VTEX Ads Network.**| Array[String] | No/Sí |
| `tags` | "Etiquetas" para contextualizar búsquedas. Máx. 10 por SKU, 64 caracteres por tag. Solo para campañas de `product`. | Array[String] | No |
| `sellers` | Lista de sellers que venden el producto (en un marketplace). | Array[String] | No |
| `metadata` | Objeto para información adicional (clave-valor). | Object | No |

**Ejemplo de Solicitud:**

```bash
curl --location 'https://api-retail-media.newtail.com.br/product/bulk/products' \
--header 'x-app-id: XXXX' \
--header 'x-api-key: YYYY' \
--header 'Content-Type: application/json' \
--data '[
    {
        "product_sku": "allan",
        "name": "allan",
        "url": "https://www.panvel.com/panvel/eau-de-dali-salvador-dali-eau-de-toilette-perfume-feminino-30ml/p-10007616",
        "image_url": "https://panvelprd.vteximg.com.br/arquivos/ids/177629",
        "categories": [
            "Belleza",
            "Belleza > Fragancias",
            "Belleza > Fragancias > Perfume",
            "Belleza > Fragancias > Perfume > Para Mujer"
        ],
        "brand": "SALVADOR DALÍ",
        "profit_margin": null,
        "gtins": [
            "3331438450103"
        ],
        "sellers": [],
        "skus": []
    },
    {
        "product_sku": "allan2",
        "name": "allan2",
        "url": "https://www.panvel.com/panvel/eau-de-dali-salvador-dali-eau-de-toilette-perfume-feminino-30ml/p-10007616",
        "image_url": "https://panvelprd.vteximg.com.br/arquivos/ids/177629",
        "categories": [
            "Belleza",
            "Belleza > Fragancias",
            "Belleza > Fragancias > Perfume",
            "Belleza > Fragancias > Perfume > Para Mujer"
        ],
        "brand": "SALVADOR DALÍ",
        "profit_margin": null,
        "gtins": [
            "3331438450103"
        ],
        "sellers": [],
        "skus": [],
        "tags": ["Abart", "Mega Maio"]
    }
]'
```

**Ejemplo de Respuesta Exitosa:**

```
Status: 202 Accepted
Content-Type: application/json

{
    "messages": [
        "products will be processed soon"
    ]
}
```

**Ejemplo de Respuesta con Error:**

Para las validaciones, utilizamos el formato de [RFC 8927](https://datatracker.ietf.org/doc/rfc8927/).
La respuesta de la solicitud tendrá código HTTP 422.

```
Status: 422 Unprocessable Entity
Content-Type: application/json

[
  {
    instancePath: '/0',
    schemaPath: '#/items/required',
    keyword: 'required',
    params: { missingProperty: 'product_sku' },
    message: "must have required property 'product_sku'",
  },
  {
    instancePath: '/0',
    schemaPath: '#/items/required',
    keyword: 'required',
    params: { missingProperty: 'url' },
    message: "must have required property 'url'",
  },
  {
    instancePath: '/0',
    schemaPath: '#/items/required',
    keyword: 'required',
    params: { missingProperty: 'image_url' },
    message: "must have required property 'image_url'",
  },
  {
    instancePath: '/1',
    schemaPath: '#/items/required',
    keyword: 'required',
    params: { missingProperty: 'name' },
    message: "must have required property 'name'",
  },
  {
    instancePath: '/1',
    schemaPath: '#/items/required',
    keyword: 'required',
    params: { missingProperty: 'url' },
    message: "must have required property 'url'",
  },
  {
    instancePath: '/1',
    schemaPath: '#/items/required',
    keyword: 'required',
    params: { missingProperty: 'image_url' },
    message: "must have required property 'image_url'",
  },
]
```

#### **Sincronización de Inventario**
Actualización de precio, precio promocional y disponibilidad. Requiere autenticación.

* **Endpoint:** `POST https://api-retail-media.newtail.com.br/product/bulk/inventories`
* **Límites:** Idénticos a la sincronización de productos.

> **Nota:** Si el inventario no se envía, todos los productos serán considerados siempre disponibles.

| Campo | Descripción | Tipo | ¿Obligatorio? |
| :--- | :--- | :--- | :--- |
| `product_sku` | ID/SKU del producto a ser actualizado. | String | Sí |
| `store_id` | ID de la tienda física/CD. Si es nulo, se aplica a todos. | String | No |
| `price` | Precio "de" del producto (precio de lista). | Number | Sí |
| `promotional_price`| Precio "por" (precio de oferta). Envíe 0 para remover. | Number | Sí |
| `is_available` | Indica si el producto está disponible (`true`/`false`). | Boolean | Sí |

**Ejemplo de Solicitud:**

```bash
curl --location 'https://api-retail-media.newtail.com.br/product/bulk/inventories' \
--header 'x-app-id: XXXX' \
--header 'x-api-key: YYYY' \
--header 'Content-Type: application/json' \
--data '[
    {
        "product_sku": "allan",
        "price": 129.90,
        "promotional_price": 99.90,
        "is_available": true
    },
    {
        "product_sku": "allan2",
        "store_id": "tienda-centro",
        "price": 149.90,
        "promotional_price": 119.90,
        "is_available": true
    }
]'
```

#### **Métodos Alternativos de Integración de Catálogo**

Además de la API REST, ofrecemos otras formas de integración del catálogo:

* **Elasticsearch del Cliente:** Podemos conectarnos directamente a su instancia de Elasticsearch.
* **Algolia:** Integración con su cuenta Algolia existente.
* **Google XML:** Soporte para el formato XML estándar de Google Shopping.

> **Importante:** Independientemente del método elegido, toda la información obligatoria del catálogo debe estar disponible en la fuente de datos.

### 4.2. Consulta de Anuncios

Con el catálogo sincronizado, su plataforma solicita anuncios para completar los espacios publicitarios (`placements`). La solicitud es un `POST` y el `publisher_id` debe ser informado en la URL.

* **Endpoint:** `POST https://newtail-media.newtail.com.br/v1/rma/:publisher_id`
* **Content-Type:** Todas las solicitudes deben incluir el encabezado `Content-Type: application/json`

#### **Parámetros de la Solicitud**

| Campo | Descripción | Tipo | Obligatoriedad |
| :--- | :--- | :--- | :--- |
| `session_id` | ID único de la sesión del usuario (alfanumérico). | String | Sí |
| `user_id` | ID único del usuario logueado (alfanumérico). | String | No |
| `store_id` | Filtra anuncios por stock de una tienda específica. | String | No |
| `channel` | Canal de acceso: `site`, `msite`, `app`. | String | Sí |
| `context` | Contexto: `home`, `category`, `search`, `product_page`, `brand_page`, `digital_signage`.| String | Sí |
| `term` | Término buscado por el usuario. | String | Solo `context: 'search'` |
| `category_name` | Categoría navegada (breadcrumb completo).| String | Solo `context: 'category'`|
| `product_sku` | SKU del producto que se está visualizando. | String | Solo `context: 'product_page'` |
| `brand_name` | Nombre de la marca que se está visualizando. | String | Solo `context: 'brand_page'` |
| `device_id` | ID único del dispositivo (pantalla, tótem). | String | Solo `context: 'digital_signage'` |
| `store_name` | Nombre de la tienda donde está ubicado el dispositivo. | String | Solo `context: 'digital_signage'` |
| `placements` | Objeto que define los espacios (`placements`) de anuncio. | Object | Sí |
| `placements.{name}.quantity` | Cantidad de anuncios deseada. | Integer | Sí |
| `placements.{name}.size` | Tamaño esperado (ej: `desktop`). | String | Solo `types: ['banner', 'sponsored_brand']` |
| `placements.{name}.types` | Tipos permitidos (`product`, `banner`, etc.). | Array[String] | Sí |
| `placements.{name}.assets_type`| Medios aceptados (`image`, `video`). Por defecto: `["image"]`. | Array[String] | Solo `types: ['banner', 'sponsored_brand']` |
| `userAgent` | String de identificación del entorno del cliente. | String | No |
| `segmentation` | Datos para segmentación en tiempo real. | Array[Object] | No |

#### **Respuesta de la Consulta**
La respuesta es un JSON donde cada clave es un nombre de `placement`. Para anuncios del tipo `sponsored_brand` y `digital_signage`, la estructura interna varía (ver secciones específicas).

| Campo en la Respuesta (`product`, `banner`) | Descripción |
| :--- | :--- |
| `{placementName}.#.ad_id` | ID único del anuncio. |
| `{placementName}.#.type` | Tipo del anuncio (`banner`, `product`). |
| `{placementName}.#.media_url`| URL de la imagen o video a ser exhibido. |
| `{placementName}.#.click_url`| **URL para notificar el evento de clic.** |
| `{placementName}.#.impression_url`| **URL para notificar el evento de impresión.**|
| `{placementName}.#.view_url` | **URL para notificar el evento de visualización.** |
| `{placementName}.#.product_sku`| SKU (para anuncios del tipo `product`). |

### 4.3. Eventos

La notificación de eventos es **crucial** para la atribución y la medición.

#### **Identificación de Usuario y Sesión**

* **`session_id`:** ID de la sesión del usuario. Obligatorio en todos los eventos. Debe ser consistente durante la navegación.
* **`user_id`:** ID único del cliente en la plataforma, consistente entre canales. Obligatorio en el evento de conversión.

#### **Notificación de Impresión, Visualización y Clic**

Envíe una solicitud `POST` a la respectiva URL de evento (`impression_url`, `view_url`, `click_url`) proporcionada en la consulta de anuncios, con un cuerpo JSON que contenga `user_id` y `session_id`.

* **Content-Type:** Todas las solicitudes deben incluir el encabezado `Content-Type: application/json`
* **Método Recomendado (Navegador):** Use `navigator.sendBeacon()` para garantizar el envío asíncrono sin bloquear la navegación.
* **Respuesta Exitosa:** `HTTP 202 Accepted`.

#### **Notificación de Conversión**

Cuando una compra es finalizada, envíe los datos del pedido.

* **Endpoint:** `POST https://events.newtail-media.newtail.com.br/v1/beacon/conversion`
* **Content-Type:** Todas las solicitudes deben incluir el encabezado `Content-Type: application/json`
* **Cuerpo de la Solicitud:** El objeto debe contener los datos del pedido. El precio del artículo no debe ser multiplicado por la cantidad.

| Campo del Pedido | Descripción | Tipo | ¿Obligatorio? |
| :--- | :--- | :--- | :--- |
| `publisher_id` | ID del publisher. | String | Sí |
| `user_id` | ID del usuario que realizó la compra. | String | Sí |
| `session_id` | ID de la sesión de la compra. | String | Sí |
| `order_id` | ID del pedido. | String | Sí |
| `email_hashed` | E-mail del usuario en formato hash (SHA256). | String | Sí |
| `created_at` | Fecha/hora del pedido (ISO 8601 en UTC). | String | Sí |
| `items` | Lista de artículos del pedido. | Array[Item] | Sí |
| `phone_hashed`| Teléfono del usuario en hash (SHA256). | String | No (Recomendado) |
| `social_id_hashed`| ID social/fiscal del usuario (CUIT/CUIL) en hash (SHA256). | String | No (Recomendado) |

#### **Reglas de Atribución y Deduplicación**

* **Ventana de Conversión:** Período después de una interacción en el que una venta puede ser atribuida al anuncio.
    * **Clic (para `product`):** 7 días.
    * **Visualización (para `display`/`video`):** 14 días.
* **Deduplicación de Eventos:** Para el mismo usuario y anuncio, los eventos se ignoran durante un período.
    * **Impresiones:** 1 minuto.
    * **Clics:** 1 hora.
    * **Conversiones:** No se deduplican (excepto si el mismo `order_id` se envía nuevamente dentro de los 30 días).

### 4.4. Segmentación de Anuncios

Dirija anuncios a públicos específicos para aumentar la relevancia.

#### **Segmentación en Tiempo Real**
Envíe datos demográficos o de audiencia directamente en el cuerpo de la **consulta de anuncios**, en el campo `segmentation`.

#### **Envío de Datos de Audiencia (Batch)**
Para crear audiencias persistentes asociadas a un `user_id`, envíe archivos de datos a un bucket S3.

* **Formato:** `Parquet` con compresión `Snappy`.
* **Seguridad (Hashing):** Los datos PII (e-mail, CUIT/CUIL, teléfono, nombre) deben ser encriptados con **SHA256** después de la limpieza (sin espacios, en minúsculas) y normalización (teléfono en el estándar E.164, ej: `+5411987654321`).
* **Atributos:** `CUSTOMER_ID`, `EMAIL_HASHED`, `PHONE_HASHED`, `SOCIAL_ID_HASHED`, `GENDER`, `AGE`, `CITY`, `STATE`, `AUDIENCES`, `NBO_CATEGORIES` (categorías de intención de compra), etc.

### 4.5. Buenas Prácticas

* **Persistencia HTTP:** Utilice conexiones HTTP persistentes (`Connection: keep-alive` en el encabezado) para optimizar la performance.
* **Timeout:** Implemente un timeout de 500-600ms en las llamadas de consulta de anuncios para no perjudicar la experiencia del usuario.
* **Nomenclatura de Placements:** Adopte un estándar claro, como `{canal}_{contexto}_{posicion}_{tipo}` (ej: `msite_search_top-shelf_product`).

## 5. Reportes y Exportación de Datos

### 5.1. Exportación vía API
Endpoints REST para extraer reportes consolidados en JSON (o XLSX con `download=true`).

* `GET /report/v2/advertisers`: Rendimiento por anunciante (visión del publisher).
* `GET /report/v2/publishers`: Rendimiento por publisher (visión del anunciante).
* `GET /campaign/v2`: Reporte detallado de campañas.
* `GET /ad/results/v2`: Reporte de performance de anuncios individuales.

### 5.2. Exportación de Datos Crudos (vía Storage)
Configuramos la exportación diaria (D-1) de datos a un bucket de su preferencia (AWS S3, Google Cloud Storage, Azure Blob).

* **Eventos (impresiones, clics, conversiones):** Archivos `Parquet` + `Snappy`. Es necesario hacer la deduplicación usando el `event_id`.
* **Datos Agregados (reportes de campañas, anunciantes):** Archivos `CSV`.

## 6. Otras Integraciones

### 6.1. Integración con Marketplace
Ofrecemos un conjunto de APIs para la integración completa con plataformas de Marketplace.

* **Autenticación:** Mutua, con el Marketplace usando Basic Auth para recibir llamadas de Newtail, y Newtail usando `x-app-id`/`x-api-key` para recibir llamadas del Marketplace.
* **API de Catálogo:** El Marketplace debe exponer un endpoint `GET /search` para que Newtail pueda consultar productos por `seller_id`, `name`, `skus`, etc.
* **APIs de Gestión:** Newtail expone endpoints para que el Marketplace gestione Anunciantes (`/api/v1/advertisers`), Campañas (`/api/v1/campaigns`), Métricas (`/api/v1/metrics`) y Créditos (`/api/v1/checking_accounts`).
* **Transferencia de Créditos:** Flujo de APIs para consultar saldo y solicitar la transferencia de créditos del seller para inversión en anuncios.
* **SSO (Single Sign-On):** API (`POST /sso/marketplace`) que recibe datos del usuario/seller y devuelve una URL de redireccionamiento para el inicio de sesión automático en la plataforma de Newtail.

### 6.2. Integración con VTEX (VTEX IO App)
Para tiendas en la plataforma VTEX, ofrecemos una aplicación que simplifica la implementación.

* **Instalación:** Agregue `vendor.newtail-media` como dependencia en el `manifest.json`, configure su ID de publisher en el admin y declare los bloques en el tema.
* **Componentes:**
    * `newtail-media-banner`: Renderiza banners.
    * `newtail-media-shelf`: Renderiza una góndola de productos patrocinados.
    * `newtail-media-search`: Agrega sellos "Patrocinado" en los resultados de búsqueda.
    * `newtail-media-conversion`: Gestiona el envío de eventos de conversión.

### 6.3. Integración vía Agent
Una alternativa de implementación vía script. Consiste en incluir un script en el HTML y agregar una etiqueta `<newtailad>` donde el anuncio debe ser exhibido.

### 6.4. Integración con Digital Signage
Utilice la misma API de consulta de anuncios con `context: 'digital_signage'` y el `device_id` obligatorio.

* **Pantallas Genéricas:** Solicite anuncios sin identificar un usuario.
* **Pantallas con Usuario Identificado (PDV):** Envíe el `user_id` para recibir anuncios personalizados.
* **Respuesta:** La respuesta para `digital_signage` contiene un array de `assets` con `url`, `type` y `duration`, además del `impression_url`.
