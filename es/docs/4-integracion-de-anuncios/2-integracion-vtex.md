## 6. Integración con VTEX (VTEX IO App)
Para tiendas en la plataforma VTEX, Newtail ofrece una aplicación de storefront (`Newtail Media APP VTEX`) que simplifica drásticamente la implementación. La app ya incluye componentes visuales y toda la lógica para la consulta de anuncios y la notificación de eventos.

*   **Paso 1: Sincronización del Catálogo**
    *   La sincronización del catálogo de productos es un prerrequisito. Se puede realizar de dos maneras:
        1.  **Vía API:** Proporcionando a Newtail las claves de API para la lectura de su catálogo.
        2.  **Vía XML:** Proporcionando un enlace a un feed XML en formato de Google Shopping, que debe contener el campo `SKU` para la identificación del producto.

*   **Paso 2: Instalación de la App**
    1.  **Añadir como Dependencia:** En el archivo `manifest.json` de su tema, añada `"newtail.media": "0.x"` a las `peerDependencies`.
    2.  **Instalar la App:** Ejecute el comando `vtex install newtail.media@0.x` en su terminal.

*   **Paso 3: Configuración**
    1.  **ID del Publisher:** En el admin de su tienda VTEX, acceda a `Configuración de la Tienda > Newtail Media` e ingrese su `Publisher ID` proporcionado por Newtail.
    2.  **Política de Seguridad de Contenido (CSP):** Añada las siguientes directivas a su `policies.json`:
        ```json
        {
          "contentSecurityPolicy": {
            "default-src": ["'self'", "newtail-media.newtail.com.br"],
            "connect-src": ["'self'", "newtail-media.newtail.com.br"]
          }
        }
        ```

*   **Paso 4: Uso de los Bloques**
    *   Declare los bloques de la app en las plantillas de su tema para mostrar los anuncios.

    *   **Componentes Disponibles:**
        *   `newtail-media-banner`: Renderiza banners patrocinados.
        *   `newtail-media-shelf`: Renderiza una estantería de productos patrocinados.
        *   `newtail-media-search`: Añade sellos "Patrocinado" a los productos en los resultados de búsqueda.
        *   `newtail-media-conversion`: Componente esencial que gestiona el envío de eventos de conversión. **Debe ser incluido en todas las páginas.**