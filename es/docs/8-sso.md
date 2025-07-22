## 8. SSO (Single Sign-On)

API para el inicio de sesión unificado del seller. Al llamar a esta API, Newtail genera una URL de redireccionamiento que permite al usuario acceder a la plataforma de Newtail sin necesidad de un nuevo inicio de sesión.

* **Endpoint:** `POST /sso/marketplace`
* **Cuerpo de la Solicitud:**

| Campo | Descrição | Tipo | ¿Obligatorio? |
| :--- | :--- | :--- | :--- |
| `sso_token` | Token de identificación del usuario generado por el marketplace. | String | Sí |
| `email` | E-mail del usuario (seller). | String | Sí |
| `user_id` | ID único del usuario en el marketplace. | String | Sí |
| `name` | Nombre del usuario. | String | Sí |
| `marketplace_name` | Nombre del marketplace. | String | Sí |

* **Ejemplo de Solicitud:**
  ```json
  {
    "sso_token": "token-sso-12345",
    "email": "seller@ejemplo.com",
    "user_id": "seller123",
    "name": "Nombre del Seller",
    "marketplace_name": "Mi Marketplace"
  }
  ```

* **Respuesta Exitosa:** `HTTP 200 OK` con la URL de redireccionamiento.
  ```json
  {
    "redirect_url": "https://app.ads.vtex.com/sso/auth?token=TOKEN_GENERADO"
  }
  ```