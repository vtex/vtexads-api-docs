# EXPORT ADVERTISER DATA - Reports Export Examples

This endpoint allows you to retrieve information from all advertisers associated with a publisher account. The data is returned in JSON format by default, but can be exported in XLSX by adding the `download=true` parameter to the query string.

🔹 Important: Only available in the publisher view (publisher account).

## Request

```bash
curl --location 'https://api-retail-media.newtail.com.br/report/v2/advertisers?start_date=2025-01-01&end_date=2025-01-31' \
--header 'x-app-id: XXXX' \
--header 'x-api-key: YYYY' \
--header 'Content-Type: application/json'
```

## Query Parameters

| Parameter      | Required | Description                                                                       |
| -------------- | -------- | --------------------------------------------------------------------------------- |
| `start_date`   | Yes      | Start date for metrics in YYYY-MM-DD format.                                      |
| `end_date`     | Yes      | End date for metrics in YYYY-MM-DD format.                                        |
| `account_info` | No       | If `true`, includes detailed account information in the result. Default: `false`. |
| `page`         | No       | Page number of the results. Default: `1`.                                         |
| `quantity`     | No       | Number of items per page. Default: `100`.                                         |
| `count`        | No       | If `true`, returns the total number of available records. Default: `false`.       |
| `download`     | No       | If `true`, returns an XLSX file buffer for download instead of JSON.              |

## Response

```json
{
  "total": 1,
  "pages": 1,
  "currentPage": 1,
  "data": [
    {
      "id": "id",
      "name": "name",
      "account_id": "account-id",
      "checking_account_id": "checking-account-id",
      "seller_id": null,
      "advertiser_tags": null,
      "metrics": {
        "total_campaigns": "100",
        "total_daily_budget": "50000.00",
        "balance": "6756756.40",
        "advertiser_id": "advertiser-id",
        "impressions": "395696",
        "views": "323720",
        "clicks": "1237",
        "conversions": "0",
        "conversion_rate": "0.00",
        "total_conversions_items_quantity": "0",
        "ctr": "0.31",
        "income": "0.0000",
        "ecpm": "0.00",
        "total_spent": "213122.6000",
        "cpa": "0",
        "avg_cpc": "31.99",
        "avg_cpm": "100.00",
        "conversions_quantity": "0",
        "roas": "0.00",
        "adcost": "0.0",
        "consumed_daily_budget": "4407.70"
      },
      "account_logo": "https://cdn.newtail.com.br/accounts/4852asd4q-3b0a-11ef-b7a2-014ea2680b7e/assets/advertiser-logo.png",
      "account_theme": {
        "primary_color": "#00B941",
        "header_color": "#00B941",
        "second_color": "#00B941",
        "dark_color": "#00B941"
      }
    }
  ]
}
```

## Response Body

| Field         | Type   | Description                           |
| ------------- | ------ | ------------------------------------- |
| `total`       | Number | Total number of advertisers available |
| `pages`       | Number | Total number of pages for pagination  |
| `currentPage` | Number | Current page number                   |
| `data`        | Array  | Array of advertiser objects           |

### Advertiser Object Fields

| Field                 | Type        | Description                         |
| --------------------- | ----------- | ----------------------------------- |
| `id`                  | String      | Unique advertiser identifier        |
| `name`                | String      | Advertiser name                     |
| `account_id`          | String      | Account identifier                  |
| `checking_account_id` | String      | Checking account identifier         |
| `seller_id`           | String/Null | Seller identifier (if applicable)   |
| `advertiser_tags`     | Array/Null  | Tags associated with the advertiser |
| `metrics`             | Object      | Performance metrics object          |
| `account_logo`        | String      | URL of the advertiser's logo        |
| `account_theme`       | Object      | Theme configuration object          |

### Metrics Object Fields

| Field                              | Type   | Description                       |
| ---------------------------------- | ------ | --------------------------------- |
| `total_campaigns`                  | String | Total number of campaigns         |
| `total_daily_budget`               | String | Total daily budget amount         |
| `balance`                          | String | Account balance                   |
| `advertiser_id`                    | String | Advertiser identifier             |
| `impressions`                      | String | Total number of ad impressions    |
| `views`                            | String | Total number of ad views          |
| `clicks`                           | String | Total number of ad clicks         |
| `conversions`                      | String | Total number of conversions       |
| `conversion_rate`                  | String | Conversion rate percentage        |
| `total_conversions_items_quantity` | String | Total quantity of converted items |
| `ctr`                              | String | Click-through rate percentage     |
| `income`                           | String | Total income generated            |
| `ecpm`                             | String | Effective cost per mille (CPM)    |
| `total_spent`                      | String | Total amount spent                |
| `cpa`                              | String | Cost per acquisition              |
| `avg_cpc`                          | String | Average cost per click            |
| `avg_cpm`                          | String | Average cost per mille            |
| `conversions_quantity`             | String | Total quantity of converted items |
| `roas`                             | String | Return on ad spend                |
| `adcost`                           | String | Ad cost                           |
| `consumed_daily_budget`            | String | Amount of daily budget consumed   |

### Account Theme Object Fields

| Field           | Type   | Description                       |
| --------------- | ------ | --------------------------------- |
| `primary_color` | String | Primary color code (hex format)   |
| `header_color`  | String | Header color code (hex format)    |
| `second_color`  | String | Secondary color code (hex format) |
| `dark_color`    | String | Dark color code (hex format)      |
