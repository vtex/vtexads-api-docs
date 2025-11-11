# Ventana de Atribución y Modelos de Conversión

Este documento detalla las reglas, modelos y plazos que rigen la atribución de conversiones (ventas) y la facturación de las campañas publicitarias en nuestra plataforma.

## 1. ¿Qué es la Ventana de Atribución?

La "ventana de atribución" (o ventana de conversión) es el período de tiempo _después_ de que un usuario interactúa con un anuncio (ya sea haciendo clic o visualizándolo) durante el cual una conversión puede ser acreditada a ese anuncio.

- **Ventana Predeterminada:** 14 días.
- **Flexibilidad:** Este período es el predeterminado para todas las campañas, pero puede personalizarse según las necesidades estratégicas.

**Ejemplo:** Si un usuario hace clic en un anuncio hoy, cualquier compra que realice del producto asociado en los próximos 14 días podrá atribuirse a ese anuncio.

## 2. Medición (Atribución) vs. Facturación

Es fundamental diferenciar el evento que _mide_ la atribución (lo que usamos para contar una conversión) del evento que _genera la facturación_ (lo que cobramos al anunciante).

### 2.1. Eventos de Medición (Atribución)

Esto define _cómo_ sabemos que un anuncio "funcionó" para generar una venta:

- **Campañas de Producto (Product Ads):**
  - **Evento:** Clic.
  - **Lógica:** La conversión solo se cuenta si el usuario _hizo clic_ en el anuncio antes de comprar.

- **Otras Campañas (Banner, Video y Sponsored Brands):**
  - **Evento:** Visualización (Impresión).
  - **Lógica:** La conversión puede contarse incluso si el usuario solo _vio_ el anuncio (y no necesariamente hizo clic), siguiendo las reglas de jerarquía (ver sección 3).

### 2.2. Modelos de Facturación

Esto define _por qué_ paga el anunciante:

- **CPC (Costo Por Clic):** El anunciante paga cada vez que un usuario hace clic en el anuncio.
  - _Usado en:_ Campañas de Producto, Sponsored Brands.

- **CPM (Costo Por Mil Impresiones):** El anunciante paga un valor fijo por cada 1.000 veces que se muestra el anuncio.
  - _Usado en:_ Banner, Video, Sponsored Brands.

- **Modelo Híbrido (CPC + CPM):**
  - Las campañas de **Sponsored Brands** son únicas, ya que cobran _tanto_ por los clics (CPC) como por las impresiones (CPM) generadas.

#### Ejemplo de Cálculo de Facturación (CPM)

El CPM define el valor para 1.000 impresiones, pero el cargo real es proporcional a cada impresión individual.

- **Escenario:** Una campaña de video tiene un CPM de **$10,00**.
- **Resultado:** La campaña genera **10 impresiones**.

**Cálculo:**

1. **Costo por impresión individual:** $10,00 (CPM) / 1.000 (impresiones) = **$0,01 por impresión**.
2. **Costo Total:** 10 (impresiones generadas) * $0,01 (costo por impresión) = **$0,10**.

El costo total de esta campaña sería de **diez centavos**.

## 3. Reglas de Atribución (La Jerarquía de Decisión)

Cuando un usuario interactúa con múltiples anuncios antes de comprar, un modelo de atribución decide qué campaña recibirá el crédito por la venta.

**Principio Fundamental:** La atribución es exclusiva. Un pedido vendido **nunca** se atribuye a dos campañas distintas; el crédito siempre se otorga a una sola campaña.

La decisión sigue este orden de prioridad:

1. **Prioridad 1: Campañas Offsite**
   - Si existe una campaña _offsite_ activa (trayendo tráfico externo al sitio) y fue el último punto de contacto del usuario, tendrá preferencia total en la atribución de la venta.

2. **Prioridad 2: Último Clic (Last Click)**
   - En ausencia de un clic offsite reciente, el sistema busca el _último anuncio_ (dentro de la plataforma) en el que el usuario _hizo clic_ dentro de la ventana de 14 días.

3. **Prioridad 3: Última Visualización (Last View)**
   - Si el usuario no hizo clic en ningún anuncio durante el período, el sistema atribuye la venta al _último anuncio_ que _visualizó_ (siempre que sea un tipo de campaña que mida por visualización, como Banner o Video).

**Regla de Tiempo:** Para que una conversión sea válida, el evento de interacción (clic o visualización) debe haber ocurrido _antes_ de que se finalizara el pedido.

## 4. Mapeo de Productos en la Atribución

Una campaña solo puede recibir atribución por productos que están _explícitamente vinculados a ella_.

### 4.1. Campañas de Producto (Atribución 1:1)

- **Cómo funciona:** Cada anuncio (AD) dentro de la campaña representa un producto específico.
- **Lógica:** La atribución es directa y 1 a 1. El clic en el anuncio del "Producto A" solo puede generar conversión para el "Producto A".

### 4.2. Otras Campañas (Banner, Video, etc.) (Atribución N:1)

- **Cómo funciona:** Estas campañas tienen una _lista_ de productos asociados (SKUs).
- **Lógica:** La interacción (clic o visualización) con un solo creativo (banner o video) puede generar atribución para _cualquiera_ de los productos contenidos en esa lista de la campaña.

**Observación sobre Creativos:** Dentro de una campaña (ej: Banner), cada creativo (ej: el "Banner A" y el "Banner B") mide su información de forma independiente. Esto permite analizar el rendimiento individual de cada pieza publicitaria.

## 5. Latencia de Datos (Retraso en la Atribución)

Es importante notar que existe un retraso natural entre el momento en que el cliente crea el pedido y el momento en que esa venta es asociada (atribuida) a la campaña correcta en los informes.

- **Integración vía API:** Retraso de aproximadamente **30 minutos**.
- **Plataforma VTEX:** Retraso de hasta **2 horas**.
