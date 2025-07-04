## 6. Outras Integrações

### 6.1. Integração com Marketplace
Oferecemos um conjunto de APIs para a integração completa com plataformas de Marketplace.

* **Autenticação:** Mútua, com o Marketplace usando Basic Auth para receber chamadas da Newtail, e a Newtail usando `x-app-id`/`x-api-key` para receber chamadas do Marketplace.
* **API de Catálogo:** O Marketplace deve expor um endpoint `GET /search` para que a Newtail possa consultar produtos por `seller_id`, `name`, `skus`, etc.
* **APIs de Gestão:** A Newtail expõe endpoints para o Marketplace gerenciar Anunciantes (`/api/v1/advertisers`), Campanhas (`/api/v1/campaigns`), Métricas (`/api/v1/metrics`) e Créditos (`/api/v1/checking_accounts`).




### 6.3. Integração via Agent
Uma alternativa de implementação via script. Consiste em incluir um script no HTML e adicionar uma tag `<newtailad>` onde o anúncio deve ser exibido.

### 6.4. Integração com Digital Signage
Utilize a mesma API de consulta de anúncios com `context: 'digital_signage'` e o `device_id` obrigatório.

* **Telas Genéricas:** Solicite anúncios sem identificar um usuário.
* **Telas com Usuário Identificado (PDV):** Envie o `user_id` para receber anúncios personalizados.
* **Resposta:** A resposta para `digital_signage` contém um array de `assets` com `url`, `type` e `duration`, além do `impression_url`.
