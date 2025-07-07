## 7. Transferencia de Créditos

![Flujo de Transferencia de Créditos](../../diagrams/images/credit-transfer.png)

Flujo que permite al marketplace transferir créditos de publicidad a sus sellers. Para ello, el marketplace debe implementar dos endpoints y consumir un webhook de Newtail.

  * **Endpoints a ser implementados por el Marketplace (Autenticación: Basic Auth):**
    1.  **Consulta de Saldo (`GET /checking_account`)**
        *   **Objetivo:** Verificar el saldo disponible del seller.
        *   **Parámetros (Query):** `seller_id`, `publisher_id` (opcional, utilizado solo en casos donde una entidad gestiona múltiples publishers).
        *   **Respuesta Exitosa (200 OK):**
            ```json
            { "total": "1111.00" }
            ```

    2.  **Solicitud de Transferencia (`POST /checking_account/transfer`)**
        *   **Objetivo:** Requerir la transferencia de un valor.
        *   **Cuerpo de la Solicitud:**
            ```json
            {
              "amount": "10.00",
              "seller_id": "SELLER_ID",
              "publisher_id": "PUBLISHER_ID",
              "transfer_identity_id": "uuid"
            }
            ```
        *   **Respuesta (201 Created):**
            ```json
            {
              "transaction_id": "TRANSACTION_ID",
              "status": "processing"
            }
            ```
            Con el estado `processing`, la transacción aún no está completa y se enviará el webhook.
            Para transacciones síncronas, los estados pueden ser:
            - `success`: La transacción se completó con éxito.
            - `failure`: La transacción falló.
              ```json
              {
                "transaction_id": "TRANSACTION_ID",
                "status": "failure",
                "message": "Motivo del rechazo"
              }
              ```

  * **Webhook a ser consumido por el Marketplace:**
    *   **Objetivo:** Notificar a Newtail sobre el estado final de la transferencia.
    *   **Endpoint:** `POST https://api-retail-media.newtail.com.br/webhook/marketplace/transfers/:publisher_id`
    *   **Autenticación:** `x-api-key` y `x-secret-key`.
    *   **Payload de Éxito:**
        ```json
        {
          "amount": "10.00",
          "seller_id": "SELLER_ID",
          "publisher_id": "PUBLISHER_ID",
          "transfer_identity_id": "uuid",
          "status": "success"
        }
        ```
    *   **Payload de Falla:**
        ```json
        {
          "amount": "10.00",
          "seller_id": "SELLER_ID",
          "publisher_id": "PUBLISHER_ID",
          "transfer_identity_id": "uuid",
          "status": "failure",
          "message": "Descripción del problema"
        }
        ```
    *   **Lógica de Reintentos:** En caso de falla en la llamada del webhook, el marketplace debe realizar nuevos intentos.