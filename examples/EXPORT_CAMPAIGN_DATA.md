# EXPORT CAMPAIGN DATA - Reports Export Examples

This endpoint allows you to search for all the information about a campaign in detail, such as products associated with the campaign, status history, metrics, etc. The data is returned only in JSON format.

## Request

```bash
curl --location 'https://api-retail-media.newtail.com.br/campaign/{CAMPAIGN_ID}?start_date=2025-01-01&end_date=2025-01-31' \
--header 'x-app-id: XXXX' \
--header 'x-api-key: YYYY' \
--header 'Content-Type: application/json'
```

## Route Parameters

| Parameter     | Required | Description           |
| ------------- | -------- | --------------------- |
| `campaign_id` | Yes      | Campaign ID to search |

## Query Parameters

| Parameter    | Required | Description                                    |
| ------------ | -------- | ---------------------------------------------- |
| `start_date` | Yes      | Start date for metrics in `YYYY-MM-DD` format. |
| `end_date`   | Yes      | End date for metrics in `YYYY-MM-DD` format.   |

## Response

```json
{
  "id": "campaign-001",
  "advertiser_id": "advertiser-xyz",
  "name": "Sample Campaign Name",
  "description": "Sample Campaign Description",
  "status": "running",
  "type": "on_site",
  "settings": {
    "daily_budget": 10000,
    "cpm": 1000,
    "budget_type": "evenly"
  },
  "start_at": "2025-01-01T00:00:00.000Z",
  "end_at": "2025-01-31T00:00:00.000Z",
  "created_at": "2025-07-14T17:14:56.513Z",
  "updated_at": "2025-07-14T17:14:56.513Z",
  "deleted_at": null,
  "ad_type": "banner",
  "targeting_type": "category",
  "strategy_type": "standard",
  "total_budget": "0.0000",
  "active": true,
  "publisher_id": "publisher-id",
  "seller_id": null,
  "target": "target-name",
  "network_id": null,
  "audience_id": null,
  "advertiser_name": "advertiser-name",
  "advertiser_account_id": "advertiser-account-id",
  "publisher_name": "publisher-name",
  "publisher_account_id": "publisher-account-id",
  "active": true,
  "conversions_quantity": "82",
  "consumed_budget": "36070.0000",
  "pending": [],
  "metrics": {
    "clicks": 39,
    "conversions": 4,
    "impressions": 7603,
    "views": 51,
    "conversion_rate": "10.26",
    "ctr": ".51",
    "roas": "2.64",
    "adcost": "37.87",
    "income": "25747.00",
    "total_spent": "9750.00",
    "ecpm": "3.3864",
    "cpa": "2437.50",
    "avg_cpc": "250.00",
    "avg_cpm": "1282.39"
  },
  "ads": [
    {
      "id": "ad-001",
      "campaign_id": "ab90a43b-582e-4be9-b126-2067dd8f30a3",
      "url": "https://example.com",
      "settings": {
        "ad_size": "example-size",
        "media_url": "https://cdn.example.com/ad-image.jpeg",
        "type": "banner"
      },
      "disabled_at": null,
      "created_at": "2025-07-14T17:14:56.513Z",
      "updated_at": "2025-07-14T17:14:56.513Z",
      "deleted_at": null,
      "status": "enabled",
      "aid": 255272,
      "asset_type": "image",
      "active": true,
      "campaign_name": "Sample Campaign Name",
      "ad_type": "banner",
      "campaign_status": "pending_review",
      "is_running": true,
      "campaign_settings": {
        "daily_budget": 10000,
        "cpm": 1000,
        "budget_type": "evenly"
      },
      "metrics": {
        "clicks": 39,
        "conversions": 4,
        "impressions": 7603,
        "views": 51,
        "conversion_rate": "10.26",
        "ctr": ".51",
        "roas": "2.64",
        "adcost": "37.87",
        "income": "25747.00",
        "total_spent": "9750.00",
        "ecpm": "3.3864",
        "cpa": "2437.50",
        "avg_cpc": "250.00",
        "avg_cpm": "1282.39"
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

## Response Body

| Field                   | Type        | Description                            |
| ----------------------- | ----------- | -------------------------------------- |
| `id`                    | String      | Unique campaign identifier             |
| `advertiser_id`         | String      | Advertiser identifier                  |
| `name`                  | String      | Campaign name                          |
| `description`           | String      | Campaign description                   |
| `status`                | String      | Campaign status                        |
| `type`                  | String      | Campaign type                          |
| `settings`              | Object      | Campaign settings object               |
| `start_at`              | String      | Campaign start date (ISO format)       |
| `end_at`                | String      | Campaign end date (ISO format)         |
| `created_at`            | String      | Campaign creation date (ISO format)    |
| `updated_at`            | String      | Campaign last update date (ISO format) |
| `deleted_at`            | String      | Campaign deletion date (ISO format)    |
| `ad_type`               | String      | Advertisement type                     |
| `targeting_type`        | String      | Targeting type                         |
| `strategy_type`         | String      | Campaign strategy type                 |
| `total_budget`          | String      | Total campaign budget                  |
| `active`                | Boolean     | Whether campaign is active             |
| `publisher_id`          | String      | Publisher identifier                   |
| `seller_id`             | String      | Seller identifier (if applicable)      |
| `target`                | String      | Campaign target (if applicable)        |
| `network_id`            | String      | Network identifier (if applicable)     |
| `audience_id`           | String      | Audience identifier (if applicable)    |
| `advertiser_name`       | String      | Advertiser name                        |
| `advertiser_account_id` | String      | Advertiser account identifier          |
| `publisher_name`        | String      | Publisher name                         |
| `publisher_account_id`  | String      | Publisher account identifier           |
| `conversions_quantity`  | String      | Total quantity of conversions          |
| `consumed_budget`       | String      | Amount of budget consumed              |
| `pending`               | Array       | Pending operations array               |
| `metrics`               | Object      | Performance metrics object             |
| `ads`                   | Array       | Array of ad objects                    |
| `products`              | Array       | Array of associated product objects    |
| `status_history`        | Array       | Array of status change history         |

### Settings Object Fields

| Field          | Type   | Description              |
| -------------- | ------ | ------------------------ |
| `daily_budget` | Number | Daily budget amount      |
| `cpc`          | Number | Cost per click value     |
| `cpm`          | Number | Cost per mille value     |
| `budget_type`  | String | Budget distribution type |

```
Important: This object is dynamic, depending on the type of campaign it may contain additional or different fields.
```

### Metrics Object Fields

| Field             | Type   | Description                    |
| ----------------- | ------ | ------------------------------ |
| `clicks`          | Number | Total number of clicks         |
| `conversions`     | Number | Total number of conversions    |
| `impressions`     | Number | Total number of impressions    |
| `views`           | Number | Total number of views          |
| `conversion_rate` | String | Conversion rate percentage     |
| `ctr`             | String | Click-through rate percentage  |
| `roas`            | String | Return on ad spend             |
| `adcost`          | String | Ad cost percentage             |
| `income`          | String | Total income generated         |
| `total_spent`     | String | Total amount spent             |
| `ecpm`            | String | Effective cost per mille (CPM) |
| `cpa`             | String | Cost per acquisition           |
| `avg_cpc`         | String | Average cost per click         |
| `avg_cpm`         | String | Average cost per mille         |

### Ad Object Fields

| Field               | Type        | Description                      |
| ------------------- | ----------- | -------------------------------- |
| `id`                | String      | Unique ad identifier             |
| `campaign_id`       | String      | Associated campaign identifier   |
| `url`               | String      | Ad destination URL               |
| `settings`          | Object      | Ad-specific settings object      |
| `disabled_at`       | String      | Ad disabled date (ISO format)    |
| `created_at`        | String      | Ad creation date (ISO format)    |
| `updated_at`        | String      | Ad last update date (ISO format) |
| `deleted_at`        | String      | Ad deletion date (ISO format)    |
| `status`            | String      | Ad status                        |
| `aid`               | Number      | Ad internal ID                   |
| `asset_type`        | String      | Asset type (e.g., image, video)  |
| `active`            | Boolean     | Whether ad is active             |
| `campaign_name`     | String      | Associated campaign name         |
| `ad_type`           | String      | Advertisement type               |
| `campaign_status`   | String      | Associated campaign status       |
| `is_running`        | Boolean     | Whether ad is currently running  |
| `campaign_settings` | Object      | Associated campaign settings     |
| `metrics`           | Object      | Ad-specific performance metrics  |

### Ad Settings Object Fields

| Field       | Type   | Description                      |
| ----------- | ------ | -------------------------------- |
| `ad_size`   | String | Ad dimensions/size specification |
| `media_url` | String | URL of ad media asset            |
| `type`      | String | Ad type                          |

```
Important: This object is dynamic, depending on the ad type it may contain additional or different fields.
```

### Ad Campaign Settings Object Fields

| Field          | Type   | Description              |
| -------------- | ------ | ------------------------ |
| `daily_budget` | Number | Daily budget amount      |
| `cpm`          | Number | Cost per mille value     |
| `budget_type`  | String | Budget distribution type |

```
Important: This object is dynamic, depending on the type of campaign it may contain additional or different fields.
```

### Ad Metrics Object Fields

| Field             | Type   | Description                    |
| ----------------- | ------ | ------------------------------ |
| `clicks`          | Number | Total number of clicks         |
| `conversions`     | Number | Total number of conversions    |
| `impressions`     | Number | Total number of impressions    |
| `views`           | Number | Total number of views          |
| `conversion_rate` | String | Conversion rate percentage     |
| `ctr`             | String | Click-through rate percentage  |
| `roas`            | String | Return on ad spend             |
| `adcost`          | String | Ad cost percentage             |
| `income`          | String | Total income generated         |
| `total_spent`     | String | Total amount spent             |
| `ecpm`            | String | Effective cost per mille (CPM) |
| `cpa`             | String | Cost per acquisition           |
| `avg_cpc`         | String | Average cost per click         |
| `avg_cpm`         | String | Average cost per mille         |

### Product Object Fields

| Field       | Type   | Description               |
| ----------- | ------ | ------------------------- |
| `id`        | String | Unique product identifier |
| `name`      | String | Product name              |
| `sku`       | String | Product SKU               |
| `image_url` | String | Product image URL         |

### Status History Object Fields

| Field        | Type   | Description                     |
| ------------ | ------ | ------------------------------- |
| `id`         | String | Unique status change identifier |
| `status`     | String | Status value                    |
| `created_at` | String | Status change date (ISO format) |
