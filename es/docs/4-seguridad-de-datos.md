# 4. Seguridad de Datos

La seguridad de los datos es un pilar fundamental de nuestra plataforma. Desde el principio, nuestra arquitectura fue diseñada para garantizar que no se recopile información sensible y que los datos de los usuarios permanezcan siempre protegidos y no identificables.

## Datos No Identificables

No recopilamos datos sensibles de los usuarios, como nombre, correo electrónico o documentos. La información que recibimos, como correos electrónicos o números de identificación (PII - *Personally Identifiable Information*), ya llega a nuestra plataforma con un hash criptográfico irreversible.

Esto significa que el dato original nunca viaja o se almacena en nuestros sistemas. El resultado es un identificador anónimo que nos permite agrupar comportamientos y audiencias sin saber nunca quién es el usuario real.

**¿Por qué es esto seguro?**

*   **Irreversibilidad:** El proceso de hashing es de una sola vía. Incluso si alguien tuviera acceso al hash, no podría descubrir el dato original.
*   **Anonimato:** Como no almacenamos el dato original, no tenemos forma de identificar al usuario. A todos los efectos, los datos son anónimos.

## Cifrado en Tránsito y en Reposo

Todos los datos, ya sean identificadores anónimos o información sobre campañas y anuncios, se tratan con los más altos estándares de seguridad:

*   **Cifrado en Tránsito:** Toda la comunicación entre nuestros sistemas y con socios se realiza utilizando protocolos seguros como TLS 1.2+, garantizando que los datos no puedan ser interceptados durante la transferencia.
*   **Cifrado en Reposo:** Los datos almacenados en nuestras bases de datos y sistemas de archivos están cifrados. Utilizamos soluciones robustas y reconocidas en el mercado, como **Amazon RDS**, **Amazon S3**, **Amazon Redshift** y **Snowflake**, que aplican cifrado AES-256, uno de los algoritmos más seguros que existen.

## Acceso Restringido

El acceso a los datos está rigurosamente controlado y limitado a un grupo selecto de ingenieros y analistas senior. Cada acceso es auditado y monitoreado, y los permisos se conceden con base en el principio del menor privilegio, es decir, cada persona tiene acceso solo a lo estrictamente necesario para realizar su trabajo.

Esta combinación de datos no identificables, cifrado de extremo a extremo y control de acceso riguroso garantiza que su información y la de sus clientes estén siempre seguras.
