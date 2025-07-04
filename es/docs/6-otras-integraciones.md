## 6. Otras Integraciones

### 6.1. Integración con Marketplace
Ofrecemos un conjunto de APIs para la integración completa con plataformas de Marketplace.

* **Autenticación:** Mutua, con el Marketplace usando Basic Auth para recibir llamadas de Newtail, y Newtail usando `x-app-id`/`x-api-key` para recibir llamadas del Marketplace.
* **API de Catálogo:** El Marketplace debe exponer un endpoint `GET /search` para que Newtail pueda consultar productos por `seller_id`, `name`, `skus`, etc.
* **APIs de Gestión:** Newtail expone endpoints para que el Marketplace gestione Anunciantes (`/api/v1/advertisers`), Campañas (`/api/v1/campaigns`), Métricas (`/api/v1/metrics`) y Créditos (`/api/v1/checking_accounts`).




### 6.3. Integración vía Agent
Una alternativa de implementación vía script. Consiste en incluir un script en el HTML y agregar una etiqueta `<newtailad>` donde el anuncio debe ser exhibido.

### 6.4. Integración con Digital Signage
Utilice la misma API de consulta de anuncios con `context: 'digital_signage'` y el `device_id` obligatorio.

* **Pantallas Genéricas:** Solicite anuncios sin identificar un usuario.
* **Pantallas con Usuario Identificado (PDV):** Envíe el `user_id` para recibir anuncios personalizados.
* **Respuesta:** La respuesta para `digital_signage` contiene un array de `assets` con `url`, `type` y `duration`, además del `impression_url`.
