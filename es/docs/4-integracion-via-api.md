## 4. Integración Principal

La integración se fundamenta en tres pilares que garantizan el funcionamiento de la solución.

### Pilares de la Integración

1.  **[Catálogo](./4.1-sincronizacion-de-catalogo.md):** Mantener a VTEX Ads sincronizado con su catálogo de productos e inventario (precio y stock). Esencial para anuncios de producto.
2.  **[Consulta de Anuncios](./4.2-consulta-de-anuncios.md):** Su plataforma solicita a la API los anuncios que deben ser exhibidos en diferentes páginas y contextos.
3.  **[Eventos](./4.3-eventos.md):** Su plataforma notifica a la API sobre todas las interacciones del usuario con los anuncios y, crucialmente, sobre las conversiones (ventas).

### Tipos de Anuncios

| Tipo de Anuncio | API Type | Descripción |
| :--- | :--- |:------------------------------------------------|
| **Sponsored Products** | `product` | Anuncios de productos individuales. |
| **Display Banner** | `banner` | Anuncios visuales (imagen estática o video). |
| **Sponsored Brands** | `sponsored_brand` | Anuncios de marca con título, logo y productos. (imagen estática o video) |
| **Digital Signage** | `digital_signage`| Contenido para pantallas y tótems físicos. |

### Segmentación de Anuncios

Dirija anuncios a públicos específicos para aumentar la relevancia. Vea más en [Segmentación de Anuncios](./4.4-segmentacion-de-anuncios.md).


