# EXPORT PUBLISHER DATA - Reports Export Examples

This endpoint allows you to retrieve information about the publisher. The data is returned in JSON format by default, but can be exported as XLSX by including the `download=true` parameter in the query string.

🔹 Important: Only available in the advertiser view (advertiser account).

## Request

```bash
curl --location 'https://api-retail-media.newtail.com.br/report/v2/publishers?start_date=2025-01-01&end_date=2025-01-31' \
--header 'x-app-id: XXXX' \
--header 'x-api-key: YYYY' \
--header 'Content-Type: application/json'
```

## Query Parameters

| Parameter         | Required    | Description                                                                 |
|-------------------|-------------|-----------------------------------------------------------------------------|
| `start_date`      | Yes         | Start date for metrics in YYYY-MM-DD format.                                |
| `end_date`        | Yes         | End date for metrics in YYYY-MM-DD format.                                  |
| `publisher_name`  | No          | Filters results by publisher name.                                          |
| `account_info`    | No          | If `true`, includes detailed account information in the result. Default: `false`. |
| `page`            | No          | Page number of results. Default: `1`.                                       |
| `quantity`        | No          | Number of items per page. Default: `100`. |
| `count`           | No          | If `true`, returns the total number of records available. Default: `false`. |
| `order_by`        | No          | Field for sorting results. Possible values: `name`, `balance`, `total_daily_budget`, `total_campaigns`, `impressions`, `clicks`, `ctr`, `total_spent`, `conversions`, `conversion_rate`, `income`, `roas`. |
| `order_direction` | No          | Sort direction. Possible values: `asc` (ascending) or `desc` (descending).  |
| `download`        | No          | If `true`, returns an XLSX file buffer for download instead of JSON.        |

## Response

```json
{
  "total": 1,
  "pages": 1,
  "currentPage": 1,
  "data": [
    {
      "id": "publisher-id",
      "name": "publisher-name",
      "account_id": "publisher-account-name",
      "checking_account_id": "checking-account-id",
      "metrics": {
          "total_campaigns": "560",
          "total_daily_budget": "00999.00",
          "balance": "60001.29",
          "publisher_id": "publisher-id",
          "impressions": "999999",
          "views": "0",
          "clicks": "4954",
          "conversions": "214",
          "conversion_rate": "4.32",
          "total_conversions_items_quantity": "214",
          "ctr": "0.09",
          "income": "581620.1500",
          "ecpm": "0.11",
          "total_spent": "1340.4000",
          "cpa": "6.26",
          "avg_cpc": "0.27",
          "avg_cpm": "0.25",
          "conversions_quantity": "214",
          "roas": "433.92",
          "adcost": "0.23"
      },
      "account_logo": "https://cdn.newtail.com.br/accounts/4852asd4q-3b0a-11ef-b7a2-014ea2680b7e/assets/publisher-logo.png",
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

| Field         | Type   | Description                          |
| ------------- | ------ | ------------------------------------ |
| `total`       | Number | Total number of publishers available |
| `pages`       | Number | Total number of pages for pagination |
| `currentPage` | Number | Current page number                  |
| `data`        | Array  | Array of publisher objects           |

### Publisher Object Fields

| Field                 | Type   | Description                 |
| --------------------- | ------ | --------------------------- |
| `id`                  | String | Unique publisher identifier |
| `name`                | String | Publisher name              |
| `account_id`          | String | Account identifier          |
| `checking_account_id` | String | Checking account identifier |
| `metrics`             | Object | Performance metrics object  |
| `account_logo`        | String | URL of the publisher's logo |
| `account_theme`       | Object | Theme configuration object  |

### Metrics Object Fields

| Field                              | Type   | Description                       |
| ---------------------------------- | ------ | --------------------------------- |
| `total_campaigns`                  | String | Total number of campaigns         |
| `total_daily_budget`               | String | Total daily budget amount         |
| `balance`                          | String | Account balance                   |
| `publisher_id`                     | String | Publisher identifier              |
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

### Account Theme Object Fields

| Field           | Type   | Description                       |
| --------------- | ------ | --------------------------------- |
| `primary_color` | String | Primary color code (hex format)   |
| `header_color`  | String | Header color code (hex format)    |
| `second_color`  | String | Secondary color code (hex format) |
| `dark_color`    | String | Dark color code (hex format)      |
