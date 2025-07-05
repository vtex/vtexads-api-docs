## 9. Integración de Audiencias

La integración de audiencias se puede realizar de dos maneras:

1.  **Segmentación en Tiempo Real:** Enviando los datos de la audiencia directamente en la [solicitud de anuncios](./4-integracion-via-api.md#segmentación-de-anuncios).
2.  **Envío por Lotes (Batch):** Enviando archivos con los datos de la audiencia a un S3.

### Envio por Lotes (Batch)

La conexión de integración se realizará mediante el envío periódico de las audiencias a nuestro S3. Las credenciales de acceso deben ser solicitadas a su contacto en Newtail.

*   **Formato de Archivo:** `Parquet` con compresión `Snappy`.
*   **Patrón de Directorio:** Los archivos deben ser escritos en el siguiente patrón de directorio:
    `PREFIJO/audiences/YYYY/mm/dd/TIMESTAMP.parquet.snappy`

| Atributo  | Descripción                                                                                                 | Ejemplo      |
| :-------- | :---------------------------------------------------------------------------------------------------------- | :----------- |
| `PREFIJO` | El prefijo será informado por Newtail.                                                                      | `xyz`        |
| `YYYY`    | Año de generación con 4 dígitos.                                                                            | `2023`       |
| `mm`      | Mes de generación con dos dígitos (Enero = 01 y Diciembre = 12).                                            | `09`         |
| `dd`      | Día de generación con dos dígitos (del 01 al 31).                                                           | `31`         |
| `TIMESTAMP`| Timestamp es la cantidad de segundos desde 1970 (el nombre del archivo puede ser cualquiera, el timestamp es solo una sugerencia que nunca se repetirá). | `1694812122` |

> **Recomendación para el envío:** En la integración inicial, es fundamental que se envíen todos los datos. Y estos datos se pueden enviar en múltiples archivos (dependiendo del tamaño de la base, un buen número es 1 millón de líneas por archivo). Después de la primera integración, lo ideal es que se envíe solo el delta de las filas que tuvieron alguna modificación.

### Atributos del Archivo de Audiencias

La mayoría de los atributos no son obligatorios, sin embargo, cuanto mayor sea el llenado de toda esta información, mejor será la relevancia.

> Las columnas son **case sensitive**. Mantenga el nombre de las columnas tal como se presentan.

| Columna             | Tipo   | ¿Obligatorio? | Descripción                                                                                                                                                                                                                                                          |
| :------------------ | :----- | :------------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `CUSTOMER_ID`       | String | Sí            | Identificador único del cliente.                                                                                                                                                                                                                                     |
| `EMAIL_HASHED`      | String | No            | PII basado en el correo electrónico del cliente.                                                                                                                                                                                                                     |
| `PHONE_HASHED`      | String | No            | PII basado en el número de teléfono principal del cliente.                                                                                                                                                                                                           |
| `SOCIAL_ID_HASHED`  | String | No            | PII basado en el CUIT/CUIL del cliente.                                                                                                                                                                                                                              |
| `FIRST_NAME_HASHED` | String | No            | PII basado en el Nombre del cliente.                                                                                                                                                                                                                                 |
| `LAST_NAME_HASHED`  | String | No            | PII basado en el Apellido del cliente.                                                                                                                                                                                                                               |
| `GENDER`            | String | No            | Indica el sexo del cliente (`F` para femenino, `M` para masculino, `O` para otros, `NULL` para no identificados).                                                                                                                                                   |
| `AGE`               | Int    | No            | Indica la edad del cliente.                                                                                                                                                                                                                                          |
| `CEP`               | String | No            | Indica el código postal de la dirección del cliente.                                                                                                                                                                                                                 |
| `COUNTRY`           | String | No            | Indica el país del usuario.                                                                                                                                                                                                                                          |
| `STATE`             | String | No            | Indica el estado/provincia donde reside el cliente.                                                                                                                                                                                                                  |
| `CITY`              | String | No            | Indica la ciudad donde reside el cliente.                                                                                                                                                                                                                            |
| `NEIGHBORHOOD`      | String | No            | Indica el barrio donde reside el cliente.                                                                                                                                                                                                                            |
| `AUDIENCES`         | String | No            | Una lista de audiencias, separadas por punto y coma (;).                                                                                                                                                                                                             |
| `NBO_PRODUCTS`      | String | No            | Una lista de SKU de productos, separadas por punto y coma (;).                                                                                                                                                                                                       |
| `NBO_CATEGORIES`    | String | No            | Una lista de categorías, separadas por punto y coma (;). La lista puede recibir un árbol de categorías usando " > " como separador (ej: `Tablets;Bebidas > Bebidas No Alcohólicas;Libros > Gastronomía > Guías de Bares y Restaurantes`). |

### Hash de Campos

Los datos confidenciales deben ser encriptados antes de ser enviados usando el algoritmo **SHA256**.

*   `EMAIL_HASHED`
*   `PHONE_HASHED`
*   `SOCIAL_ID_HASHED`
*   `FIRST_NAME_HASHED`
*   `LAST_NAME_HASHED`

> Antes de generar el hash de los datos es necesario remover todos los **ESPACIOS** y convertir a **MINÚSCULAS** sus valores.
> Para el atributo `PHONE_HASHED`, será necesario formatearlo al estándar **E.164** e incluir el código de país.

#### Formato E.164

1.  Remueva todos los caracteres no numéricos, como espacios, guiones, paréntesis y símbolos.
2.  Añada el código del país con el signo de suma (+) al principio.
3.  Añada el código de área (si aplica) sin el cero inicial.
4.  Incluya el número de teléfono local sin el cero inicial (si aplica).

**Ejemplo:**

*   Un número de teléfono de Argentina, con código de área 11 y número local 98765-4321, sería formateado como: `+5411987654321`

#### Creando un HASH en Python

```python
import re
import hashlib

hash_obj = hashlib.sha256()

def create_hash(x):
    cleaned = re.sub('\s+', '', x.lower())
    hash_obj.update(cleaned.encode('utf-8'))
    return hash_obj.hexdigest()

create_hash(' Allan ') #=> 8c01ade3cb71d3ac7c718ed5a0c565155a4c05a216d9e59013c5d7b49e916914
```
