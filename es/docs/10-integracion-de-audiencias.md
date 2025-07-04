## Integración de Audiencias

Para segmentar campañas utilizando PII (Información de Identificación Personal), debe proporcionar un archivo CSV que contenga los datos de los usuarios.

### Requisitos del Archivo y de los Datos:

1.  **Formato del Archivo**: El archivo debe ser un CSV codificado en UTF-8.
2.  **Envío**: El archivo CSV debe ser comprimido en un archivo ZIP y enviado por correo electrónico a su contacto en Newtail.
3.  **Columnas de Datos**:
    *   `CUSTOMER_ID` (String, **Obligatorio**): Un identificador único para el cliente.
    *   `EMAIL_HASHED` (String, Opcional): Correo electrónico del cliente hasheado.
    *   `PHONE_HASHED` (String, Opcional): Número de teléfono principal hasheado.
    *   `SOCIAL_ID_HASHED` (String, Opcional): Número de identificación fiscal (CUIT/CUIL) hasheado.
    *   `FIRST_NAME_HASHED` (String, Opcional): Nombre hasheado.
    *   `LAST_NAME_HASHED` (String, Opcional): Apellido hasheado.

### Reglas de Hashing:

Todos los campos de datos sensibles deben ser hasheados utilizando el algoritmo **SHA256**. Antes del hasheo, los datos deben ser pre-procesados de la siguiente manera:

1.  **Normalización**: Convierta la cadena a minúsculas y elimine todos los espacios.
2.  **Números de Teléfono**: El número de teléfono debe ser formateado al estándar **E.164** (ej: `+5411987654321`) *antes* de la normalización y el hasheo.