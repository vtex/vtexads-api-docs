# EXPORT CAMPAIGNS LIST DATA - Reports Export Examples

This endpoint allows you to fetch all available campaigns, applying filters as needed. Data is returned in JSON format by default, but can be exported as XLSX by including the `download=true` parameter in the query string.

## Request

```bash
curl --location 'https://api-retail-media.newtail.com.br/campaign/v2?start_date=2025-01-01&end_date=2025-01-31' \
--header 'x-app-id: XXXX' \
--header 'x-api-key: YYYY' \
--header 'Content-Type: application/json'
```
## Query Parameters

| Parameter         | Required | Description                                                                 |
|-------------------|----------|-------------------------------------------------------------------------|
| `start_date`      | Yes      | Start date for metrics in `YYYY-MM-DD` format.                          |
| `end_date`        | Yes      | End date for metrics in `YYYY-MM-DD` format.                            |
| `status`          | No       | Filters by campaign status.                                             |
| `advertiser_id`   | No       | Filters campaigns by advertiser ID.                                     |
| `ad_type`         | No       | Filters by ad type.                                                      |
| `name`            | No       | Searches campaigns by name.                                              |
| `account_info`    | No       | If `true`, includes detailed account information in the result. Default: `false`. |
| `page`            | No       | Page number of the results. Default: `1`.                               |
| `quantity`        | No       | Number of items per page. Default: `100`.                               |
| `count`           | No       | If `true`, returns the total number of available records. Default: `false`. |
| `order_by`        | No       | Field for sorting results. Possible values: `name`, `impressions`, `clicks`, `ctr`, `conversions`, `conversion_rate`, `income`, `roas`, `created_at`, `start_at`, `daily_budget`, `ad_type`, `advertiser_name`, `status`. |
| `order_direction` | No       | Sort direction. Possible values: `asc` (ascending) or `desc` (descending). |
| `download`        | No       | If `true`, returns an XLSX file buffer for download instead of JSON. |

## Response

```json
{
  "total": 1,
  "pages": 1,
  "currentPage": 1,
  "data": [
    {
      "id": "campaign-id",
      "advertiser_id": "advertiser-id",
      "name": "Campaign Name",
      "status": "partial_running",
      "type": "on_site",
      "settings": {
        "daily_budget": 10000,
        "cpc": 250,
        "budget_type": "evenly"
      },
      "start_at": "2025-01-01T00:00:00.000Z",
      "end_at": "2025-01-31T00:00:00.000Z",
      "disabled_at": null,
      "created_at": "2025-01-01T07:33:08.482Z",
      "updated_at": "2025-01-26T16:16:08.482Z",
      "deleted_at": null,
      "description": null,
      "publisher_id": "publisher-id",
      "ad_type": "product",
      "cid": 16674,
      "seller_id": null,
      "target": "target-name",
      "network_id": null,
      "audience_id": null,
      "targeting_type": null,
      "strategy_type": "standard",
      "total_budget": "0.0000",
      "active": true,
      "advertiser_name": "advertiser name",
      "advertiser_account_id": "advertiser-account-id",
      "publisher_name": "publisher-name",
      "publisher_account_id": "publisher-account-id",
      "consumed_budget": "1750.0000",
      "daily_budget": "10000.00",
      "campaign_status": 1,
      "advertiser_tags": null,
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
      }
    }
  ]
}
```

## Response Body

| Field         | Type   | Description                          |
| ------------- | ------ | ------------------------------------ |
| `total`       | Number | Total number of campaigns            |
| `pages`       | Number | Total number of pages for pagination |
| `currentPage` | Number | Current page number                  |
| `data`        | Array  | Array of campaign objects            |

### Campaign Object Fields

| Field                   | Type        | Description                            |
| ----------------------- | ----------- | -------------------------------------- |
| `id`                    | String      | Unique campaign identifier             |
| `advertiser_id`         | String      | Advertiser identifier                  |
| `name`                  | String      | Campaign name                          |
| `status`                | String      | Campaign status                        |
| `type`                  | String      | Campaign type                          |
| `settings`              | Object      | Campaign settings object               |
| `start_at`              | String      | Campaign start date (ISO format)       |
| `end_at`                | String      | Campaign end date (ISO format)         |
| `disabled_at`           | String      | Campaign disabled date (ISO format)    |
| `created_at`            | String      | Campaign creation date (ISO format)    |
| `updated_at`            | String      | Campaign last update date (ISO format) |
| `deleted_at`            | String      | Campaign deletion date (ISO format)    |
| `description`           | String      | Campaign description                   |
| `publisher_id`          | String      | Publisher identifier                   |
| `ad_type`               | String      | Advertisement type                     |
| `cid`                   | Number      | Campaign internal ID                   |
| `seller_id`             | String      | Seller identifier (if applicable)      |
| `target`                | String      | Campaign target (if applicable)        |
| `network_id`            | String      | Network identifier (if applicable)     |
| `audience_id`           | String      | Audience identifier (if applicable)    |
| `targeting_type`        | String      | Targeting type                         |
| `strategy_type`         | String      | Campaign strategy type                 |
| `total_budget`          | String      | Total campaign budget                  |
| `active`                | Boolean     | Whether campaign is active             |
| `advertiser_name`       | String      | Advertiser name                        |
| `advertiser_account_id` | String      | Advertiser account identifier          |
| `publisher_name`        | String      | Publisher name                         |
| `publisher_account_id`  | String      | Publisher account identifier           |
| `consumed_budget`       | String      | Amount of budget consumed              |
| `daily_budget`          | String      | Daily budget amount                    |
| `campaign_status`       | Number      | Campaign status code                   |
| `advertiser_tags`       | Array       | Tags associated with advertiser        |
| `pending`               | Array       | Pending operations array               |
| `metrics`               | Object      | Performance metrics object             |

### Settings Object Fields

| Field          | Type   | Description              |
| -------------- | ------ | ------------------------ |
| `daily_budget` | Number | Daily budget amount      |
| `cpc`          | Number | Cost per click value     |
| `cpm`          | Number | Cost per mille           |
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
