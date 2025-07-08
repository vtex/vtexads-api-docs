# EXPORT CAMPAIGN DATA - Reports Export Examples

This endpoint allows you to search for all the information about a campaign in detail, such as products associated with the campaign, status history, metrics, etc. The data is returned only in JSON format.

## Request

```bash
curl --location 'https://api-retail-media.newtail.com.br/campaign/{CAMPAIGN_ID}?start_date=2025-01-01&end_date=2025-01-31' \
--header 'x-app-id: XXXX' \
--header 'x-api-key: YYYY' \
--header 'Content-Type: application/json'
```

## Response

```json
{
  "id": "campaign-001",
  "advertiser_id": "advertiser-xyz",
  "name": "Sample Campaign Name",
  "status": "running",
  "type": "on_site",
  "settings": {
    "daily_budget": 10000,
    "cpm": 1000,
    "budget_type": "evenly"
  },
  "start_at": "2025-01-01T00:00:00.000Z",
  "end_at": "2025-01-31T00:00:00.000Z",
  "ad_type": "banner",
  "targeting_type": "category",
  "strategy_type": "standard",
  "total_budget": "0.0000",
  "active": true,
  "deleted_at": null,
  "description": null,
  "publisher_id": "publisher-id",
  "seller_id": null,
  "target": "target-name",
  "network_id": null,
  "audience_id": null,
  "total_budget": "0.0000",
  "advertiser_name": "advertiser-name",
  "advertiser_account_id": "advertiser-account-id",
  "publisher_name": "publisher-name",
  "publisher_account_id": "publisher-account-id",
  "active": true,
  "campaign_id": "campaign-id",
  "conversions_quantity": "82",
  "consumed_budget": "36070.0000",
  "pending": [],
  "metrics": {
    "clicks": "244",
    "conversions": "74",
    "impressions": "18440",
    "views": "17377",
    "conversion_rate": "30.33",
    "ctr": "1.32",
    "roas": "2.36",
    "total_spent": "184400.0000"
  },
  "ads": [
    {
      "id": "ad-001",
      "url": "https://example.com",
      "settings": {
        "ad_size": "example-size",
        "media_url": "https://cdn.example.com/ad-image.jpeg",
        "type": "banner"
      },
      "status": "enabled",
      "active": true,
      "metrics": {
        "clicks": "94",
        "conversions": "20",
        "impressions": "6902",
        "views": "6426",
        "roas": "1.60",
        "total_spent": "69020.00"
      }
    }
  ],
  "products": [
    {
      "id": "product-001",
      "name": "Example Product Name",
      "sku": "123456",
      "image_url": "https://example.com/product.jpg"
    }
  ],
  "status_history": [
    {
      "id": "status-001",
      "status": "running",
      "created_at": "2025-07-03T22:53:57.272Z"
    }
  ]
}
```
