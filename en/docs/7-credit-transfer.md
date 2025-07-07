## 7. Credit Transfer

![Credit Transfer Flow](../../diagrams/images/credit-transfer.png)

A flow that allows the marketplace to transfer advertising credits to its sellers. To do this, the marketplace must implement two endpoints and consume a webhook from Newtail.

  * **Endpoints to be implemented by the Marketplace (Authentication: Basic Auth):**
    1.  **Check Balance (`GET /checking_account`)**
        *   **Objective:** Check the seller's available balance.
        *   **Query Parameters:** `seller_id`, `publisher_id` (optional, only applies to cases where an entity manages multiple publishers).
        *   **Success Response (200 OK):**
            ```json
            { "total": "1111.00" }
            ```

    2.  **Request Transfer (`POST /checking_account/transfer`)**
        *   **Objective:** Request the transfer of a specific amount.
        *   **Request Body:**
            ```json
            {
              "amount": "10.00",
              "seller_id": "SELLER_ID",
              "publisher_id": "PUBLISHER_ID",
              "transfer_identity_id": "uuid"
            }
            ```
        *   **Response (201 Created):**
            ```json
            {
              "transaction_id": "TRANSACTION_ID",
              "status": "processing"
            }
            ```
            With the `processing` status, the transaction is not yet complete and a webhook will be sent.
            For synchronous transactions, the statuses can be:
            - `success`: The transaction was completed successfully.
            - `failure`: The transaction failed.
              ```json
              {
                "transaction_id": "TRANSACTION_ID",
                "status": "failure",
                "message": "Reason for refusal"
              }
              ```

  * **Webhook to be consumed by the Marketplace:**
    *   **Objective:** Notify Newtail about the final status of the transfer.
    *   **Endpoint:** `POST https://api-retail-media.newtail.com.br/webhook/marketplace/transfers/:publisher_id`
    *   **Authentication:** `x-api-key` and `x-secret-key`.
    *   **Success Payload:**
        ```json
        {
          "amount": "10.00",
          "seller_id": "SELLER_ID",
          "publisher_id": "PUBLISHER_ID",
          "transfer_identity_id": "uuid",
          "status": "success"
        }
        ```
    *   **Failure Payload:**
        ```json
        {
          "amount": "10.00",
          "seller_id": "SELLER_ID",
          "publisher_id": "PUBLISHER_ID",
          "transfer_identity_id": "uuid",
          "status": "failure",
          "message": "Problem description"
        }
        ```
    *   **Retry Logic:** In case of a webhook call failure, the marketplace must retry.