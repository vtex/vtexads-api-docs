# Conversion Event — cURL

This example demonstrates how to send a conversion event using cURL.

Endpoint (production):
- `POST https://events.newtail-media.newtail.com.br/v1/beacon/conversion`

```bash
curl --location 'https://events.newtail-media.newtail.com.br/v1/beacon/conversion' \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '{
    "channel": "ecommerce",
    "publisher_id": "xxx",
    "user_id": "6f92d1e9-00b6-4f8b-9645-faeab321e1cc",
    "session_id": "5898b8d1-c250-4bb5-931b-8b9d0ee7b499",
    "order_id": "123",
    "email_hashed": "xyz",
    "items": [
      { "sku": "12221", "seller_id": "1234", "product_id": "4567", "quantity": 1, "price": 2000.00, "promotional_price": 1899.00 },
      { "sku": "12222", "seller_id": null, "product_id": "4568", "quantity": 2, "price": 500.00, "promotional_price": 400.00 }
    ],
    "created_at": "2023-01-01T09:20:00Z"
  }'
```
