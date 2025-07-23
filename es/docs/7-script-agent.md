# 7. VTEX Ads - Script Agent

## 7.1. Objetivo

Este documento detalla el procedimiento para la instalación del script de seguimiento de **VTEX Ads** en todas las páginas de un sitio web (excepto las páginas de checkout) a través de Google Tag Manager (GTM). La correcta implementación de este script es fundamental para la recopilación de datos de navegación que permiten la optimización y el direccionamiento de campañas de Retail Media.

## 7.2. Datos Recopilados

El script de VTEX Ads fue desarrollado para recopilar exclusivamente datos de navegación no sensibles, con el objetivo de personalizar la experiencia del usuario y optimizar campañas.

**Datos Recopilados:**

-   **Para campañas off-site:**
    -   `session_id`: Identificador anónimo de la sesión de navegación.
    -   `ad_id`: Identificador del anuncio que originó el tráfico.
-   **Para segmentación de audiencia (Page View):**
    -   `session_id`: Identificador anónimo de la sesión de navegación.
    -   **Información de la Página:** URL, título (`<title>`) y descripción (`<meta name="description">`).

> **Importante:** El script **no recopila** ninguna información de identificación personal (PII), como nombre, correo electrónico, CPF, teléfono, dirección o datos de pago. La recopilación de datos cumple con las principales leyes de protección de datos.

## 7.3. Datos del Script

El script debe cargarse de forma asíncrona para no afectar el tiempo de carga de la página.

-   **URL del Script:** `https://cdn.newtail.com.br/retail-media/scripts/vtexads-agent.1.0.0.js`

## 7.4. Paso a Paso para la Implementación a través de Google Tag Manager (GTM)

Para garantizar que el script se ejecute lo antes posible en la carga de la página, recomendamos utilizar el activador de **Inicialización (Initialization)**.

### Paso 7.4.1: Crear la Etiqueta de HTML Personalizado

1.  Acceda a su contenedor de GTM y vaya a la sección **"Etiquetas"**.
2.  Haga clic en **"Nueva"** para crear una nueva etiqueta.
3.  Dé un nombre claro a la etiqueta, por ejemplo: **"Custom HTML - VTEX Ads Agent"**.
4.  Haga clic en **"Configuración de la etiqueta"** y seleccione el tipo de etiqueta **"HTML personalizado"**.
5.  En el campo de HTML, inserte el siguiente código:
    ```html
    <script type="text/javascript" async src="https://cdn.newtail.com.br/retail-media/scripts/vtexads-agent.1.0.0.js"></script>
    ```

### Paso 7.4.2: Configurar el Activador Principal

1.  Debajo de la configuración de la etiqueta, haga clic en **"Activación"**.
2.  Seleccione el activador **"Initialization - All Pages"** (Inicialización - Todas las Páginas). Este activador garantiza que el script se dispare antes que la mayoría de las otras etiquetas, en todas las páginas.

### Paso 7.4.3: Crear y Añadir una Excepción de Activación

Para evitar que el script se ejecute en las páginas de checkout, crearemos una excepción.

1.  Aún en la configuración de la etiqueta, en la sección **"Activación"**, haga clic en **"Añadir excepción"**.
2.  Haga clic en el ícono de **"+"** en la esquina superior derecha para crear un nuevo activador de excepción.
3.  Dé un nombre al activador, por ejemplo: **"Trigger Exception - Checkout Pages"**.
4.  Haga clic en **"Configuración del activador"** y elija el tipo **"Inicialización"**.
5.  En **"Este activador se dispara en"**, seleccione **"Algunas inicializaciones"**.
6.  Configure la condición para identificar las páginas de checkout. La condición puede variar dependiendo de la estructura de la URL de su sitio. Ejemplos comunes:
    -   `Page Path` | `contiene` | `/checkout`
    -   `Page URL` | `coincide con RegEx (sin distinguir mayúsculas y minúsculas)` | `/checkout/|/orderPlaced/`
7.  Guarde el nuevo activador de excepción. Se agregará automáticamente a su etiqueta.

### Paso 7.4.4: Guardar y Publicar

1.  Guarde la etiqueta recién creada.
2.  Envíe y publique los cambios en su contenedor de GTM.

## 7.5. Configuración de la Sesión del Usuario

Para que la plataforma VTEX Ads pueda correlacionar correctamente las interacciones del usuario, es necesario informar cuál es el identificador de sesión utilizado por su e-commerce.

**Acción Necesaria:**

El equipo responsable del e-commerce debe informar al equipo de VTEX Ads cuál es el **nombre del atributo en la `cookie` o `sessionStorage`** que almacena el ID de la sesión del usuario.

-   **Ejemplo:** Si el ID de la sesión se almacena en una cookie llamada `vtex_session`, esta información debe ser comunicada.

Esta configuración permite que el script lea el identificador correcto y lo asocie a los eventos de navegación.
