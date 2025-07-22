## 8. SSO (Single Sign-On)

API para login unificado do seller. Ao chamar esta API, a Newtail gera uma URL de redirecionamento que permite ao usuário acessar a plataforma da Newtail sem a necessidade de um novo login.

* **Endpoint:** `POST /sso/marketplace`
* **Corpo da Requisição:**

| Campo | Descrição | Tipo | Obrigatório? |
| :--- | :--- | :--- | :--- |
| `sso_token` | Token de identificação do usuário gerado pelo marketplace. | String | Sim |
| `email` | E-mail do usuário (seller). | String | Sim |
| `user_id` | ID único do usuário no marketplace. | String | Sim |
| `name` | Nome do usuário. | String | Sim |
| `marketplace_name` | Nome do marketplace. | String | Sim |

* **Exemplo de Requisição:**
  ```json
  {
    "sso_token": "token-sso-12345",
    "email": "seller@exemplo.com",
    "user_id": "seller123",
    "name": "Nome do Seller",
    "marketplace_name": "Meu Marketplace"
  }
  ```

* **Resposta de Sucesso:** `HTTP 200 OK` com a URL de redirecionamento.
  ```json
  {
    "redirect_url": "https://app.ads.vtex.com/sso/auth?token=TOKEN_GERADO"
  }
  ```