## Repasse de Créditos

Fluxo que permite ao marketplace transferir créditos de anúncio para seus sellers. Para isso, o marketplace deve implementar dois endpoints e consumir um webhook da Newtail.

  * **Endpoints a serem implementados pelo Marketplace (Autenticação: Basic Auth):**
    1.  **Consulta de Saldo (`GET /checking_account`)**
        *   **Objetivo:** Verificar o saldo disponível do seller.
        *   **Parâmetros (Query):** `seller_id`, `publisher_id`.
        *   **Resposta de Sucesso (200 OK):**
            ```json
            { "total": "1111.00" }
            ```

    2.  **Solicitação de Transferência (`POST /checking_account/transfer`)**
        *   **Objetivo:** Requisitar a transferência de um valor.
        *   **Corpo da Requisição:**
            ```json
            {
              "amount": "10.00",
              "seller_id": "SELLER_ID",
              "publisher_id": "PUBLISHER_ID",
              "transfer_identity_id": "uuid"
            }
            ```
        *   **Resposta de Sucesso (201 Created):**
            ```json
            { "transaction_id": "TRANSACTION_ID" }
            ```

  * **Webhook a ser consumido pelo Marketplace:**
    *   **Objetivo:** Notificar a Newtail sobre o status final da transferência.
    *   **Endpoint:** `POST https://api-retail-media.newtail.com.br/webhook/marketplace/transfers/:publisher_id`
    *   **Autenticação:** `x-api-key` e `x-secret-key`.
    *   **Payload de Sucesso:**
        ```json
        {
          "amount": "10.00",
          "seller_id": "SELLER_ID",
          "publisher_id": "PUBLISHER_ID",
          "transfer_identity_id": "uuid",
          "status": "success"
        }
        ```
    *   **Payload de Falha:**
        ```json
        {
          "amount": "10.00",
          "seller_id": "SELLER_ID",
          "publisher_id": "PUBLISHER_ID",
          "transfer_identity_id": "uuid",
          "status": "failure",
          "message": "Descrição do problema"
        }
        ```
    *   **Lógica de Retry:** Em caso de falha na chamada do webhook, o marketplace deve realizar novas tentativas.