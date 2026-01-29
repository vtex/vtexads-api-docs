# EXPORT ADS DATA - Reports Export Examples

This endpoint allows you to fetch all available listings, applying filters as needed. Data is returned in JSON format by default, but can be exported as XLSX by including the `download=true` parameter in the query string.

## Request

```bash
curl --location 'https://api-retail-media.newtail.com.br/ad/results/v2?start_date=2025-01-01&end_date=2025-01-31' \
--header 'x-app-id: XXXX' \
--header 'x-api-key: YYYY' \
--header 'Content-Type: application/json'
```

## Query Parameters

| Parameter               | Required | Description                                                                 |
|-------------------------|----------|-------------------------------------------------------------------------|
| `start_date`            | Yes      | Start date for metrics in `YYYY-MM-DD` format.                          |
| `end_date`              | Yes      | End date for metrics in `YYYY-MM-DD` format.                            |
| `campaign_name`         | No       | Filters ads by campaign name.                                           |
| `campaign_id`           | No       | Filters ads by campaign ID.                                             |
| `advertiser_id`         | No       | Filters ads by advertiser ID.                                           |
| `product_sku`           | No       | Filters ads by product SKU.                                             |
| `ad_status`             | No       | Filters ads by status. Possible values: `enabled`, `paused`, `rejected`, `pending_review`, `stock_out`, `invalid_cost`. |
| `ad_type`               | No       | Filters by ad type. Possible values: `banner`, `product`, `sponsored_brand`, `digital_signage`, `banner_video`, `sponsored_brand_video` . |
| `targeting_type`        | No       | Filters by targeting type.                                              |
| `show_inactive`         | No       | If `true`, includes paused ads.                                         |
| `account_info`          | No       | If `true`, includes detailed account information in the result. Default: `false`. |
| `page`                  | No       | Page number of the results. Default: `1`.                               |
| `quantity`              | No       | Number of items per page. Default: `100`.                               |
| `count`                 | No       | If `true`, returns the total number of available records. Default: `false`. |
| `order_by`              | No       | Field for sorting results. Possible values: `ad_type`, `ad_status`, `impressions`, `conversion_rate`, `ctr`, `income`, `total_spent`, `roas`, `conversions`, `total_conversions_item_quantity`. |
| `order_direction`       | No       | Sort direction. Possible values: `asc` (ascending) or `desc` (descending). |
| `download`              | No       | If `true`, returns an XLSX file buffer for download instead of JSON. |

```
Important: Paused ads are excluded from the default response. To include paused ads in your query, use the following parameter: `"show_inactive": true`
```

## Response

```json
{
  "total": 1,
  "pages": 1,
  "currentPage": 1,
  "data": [
    {
      "id": "ad-id",
      "campaign_id": "campaign-id",
      "url": "ad-url",
      "settings": {
        "cpc": 1.50,
        "type": "banner",
        "categories": [],
        "keywords": [
            "keyword",
            "other keyword"
        ],
      },
      "disabled_at": null,
      "created_at": "2025-01-27T23:18:16.330Z",
      "updated_at": "2025-01-27T23:18:16.330Z",
      "deleted_at": null,
      "status": "enabled",
      "aid": 1234,
      "asset_type": "image",
      "active": true,
      "product_id": null,
      "product_sku": null,
      "name": null,
      "image_url": null,
      "categories": [
          "Cervejas nacionais",
          "Cervejas nacionais > Bebidas"
      ],
      "campaign_name": "Campaign Name",
      "ad_type": "banner",
      "campaign_status": "running",
      "campaign_settings": {
        "daily_budget": 185000,
        "cpm": 10000,
        "budget_type": "evenly"
      },
      "publisher_id": "publisher-id",
      "advertiser_id": "advertiser-id",
      "advertiser_name": "Advertiser Name",
      "advertiser_account_id": "advertiser-account-id",
      "publisher_name": "Publisher Name",
      "publisher_account_id": "publisher-account-id",
      "ad_id": "ad-id",
      "conversions_quantity": "1",
      "is_running": true,
      "advertiser_tags": null,
      "pending": [],
      "metrics": {
        "clicks": "53",
        "conversions": "1",
        "total_conversions_items_quantity": "1",
        "impressions": "2900",
        "views": "2689",
        "conversion_rate": "1.89",
        "ctr": "1.83",
        "roas": "0.18",
        "adcost": "540.94",
        "income": "5361.00",
        "total_spent": "29000.0000",
        "ecpm": "1.85",
        "cpa": "29000.00",
        "avg_cpc": "547.17",
        "avg_cpm": "10000.00"
      }
    }
  ]
}
```


## Response Body

| Field         | Type   | Description                          |
| ------------- | ------ | ------------------------------------ |
| `total`       | Number | Total number of ads                  |
| `pages`       | Number | Total number of pages for pagination |
| `currentPage` | Number | Current page number                  |
| `data`        | Array  | Array of ad objects                  |

### Ad Object Fields

| Field                   | Type    | Description                                   |
| ----------------------- | ------- | --------------------------------------------- |
| `id`                    | String  | Unique ad identifier                          |
| `campaign_id`           | String  | Associated campaign identifier                |
| `url`                   | String  | Ad destination URL                            |
| `settings`              | Object  | Ad-specific settings object                   |
| `disabled_at`           | String  | Ad disabled date (ISO format)                 |
| `created_at`            | String  | Ad creation date (ISO format)                 |
| `updated_at`            | String  | Ad last update date (ISO format)              |
| `deleted_at`            | String  | Ad deletion date (ISO format)                 |
| `status`                | String  | Ad status                                     |
| `aid`                   | Number  | Ad internal ID                                |
| `asset_type`            | String  | Asset type (e.g., image, video)               |
| `active`                | Boolean | Whether ad is active                          |
| `product_id`            | String  | Associated product identifier (if applicable) |
| `product_sku`           | String  | Associated product SKU (if applicable)        |
| `name`                  | String  | Product name (if applicable)                  |
| `image_url`             | String  | Product image URL (if applicable)             |
| `categories`            | Array   | Ad categories array (if applicable)           |
| `campaign_name`         | String  | Associated campaign name                      |
| `ad_type`               | String  | Advertisement type                            |
| `campaign_status`       | String  | Associated campaign status                    |
| `campaign_settings`     | Object  | Associated campaign settings                  |
| `publisher_id`          | String  | Publisher identifier                          |
| `advertiser_id`         | String  | Advertiser identifier                         |
| `advertiser_name`       | String  | Advertiser name                               |
| `advertiser_account_id` | String  | Advertiser account identifier                 |
| `publisher_name`        | String  | Publisher name                                |
| `publisher_account_id`  | String  | Publisher account identifier                  |
| `conversions_quantity`  | String  | Total quantity of conversions                 |
| `is_running`            | Boolean | Whether ad is currently running               |
| `advertiser_tags`       | Array   | Tags associated with advertiser               |
| `pending`               | Array   | Pending operations array                      |
| `metrics`               | Object  | Ad performance metrics object                 |

### Ad Settings Object Fields

| Field        | Type   | Description               |
| ------------ | ------ | ------------------------- |
| `cpc`        | Number | Cost per click value      |
| `cpm`        | Number | Cost per mille value      |
| `type`       | String | Ad type                   |
| `categories` | Array  | Targeted categories array |
| `keywords`   | Array  | Targeted keywords array   |

```
Important: This object is dynamic, depending on the ad type it may contain additional or different fields.
```

### Campaign Settings Object Fields

| Field          | Type   | Description              |
| -------------- | ------ | ------------------------ |
| `daily_budget` | Number | Daily budget amount      |
| `cpm`          | Number | Cost per mille value     |
| `budget_type`  | String | Budget distribution type |

```
Important: This object is dynamic, depending on the type of campaign it may contain additional or different fields.
```

### Metrics Object Fields

| Field                              | Type   | Description                       |
| ---------------------------------- | ------ | --------------------------------- |
| `clicks`                           | String | Total number of clicks            |
| `conversions`                      | String | Total number of conversions       |
| `total_conversions_items_quantity` | String | Total quantity of converted items |
| `impressions`                      | String | Total number of impressions       |
| `views`                            | String | Total number of views             |
| `conversion_rate`                  | String | Conversion rate percentage        |
| `ctr`                              | String | Click-through rate percentage     |
| `roas`                             | String | Return on ad spend                |
| `adcost`                           | String | Ad cost percentage                |
| `income`                           | String | Total income generated            |
| `total_spent`                      | String | Total amount spent                |
| `ecpm`                             | String | Effective cost per mille (CPM)    |
| `cpa`                              | String | Cost per acquisition              |
| `avg_cpc`                          | String | Average cost per click            |
| `avg_cpm`                          | String | Average cost per mille            |
