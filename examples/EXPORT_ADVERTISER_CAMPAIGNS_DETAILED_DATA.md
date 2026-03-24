# EXPORT ADVERTISER CAMPAIGNS DETAILED DATA - Reports Export Examples

This endpoint allows advertiser accounts to export a mixed campaign report, including both regular campaigns and subpublisher information for network campaigns. Data is returned in JSON format by default, but can be exported as XLSX by including the `download=true` parameter in the query string.

## Request

```bash
curl --location 'https://api-retail-media.newtail.com.br/report/advertisers/campaigns-detailed?start_date=2026-03-01&end_date=2026-03-22&campaign_name=summer&download=true' \
--header 'x-app-id: XXXX' \
--header 'x-api-key: YYYY' \
--header 'Content-Type: application/json'
```

## Query Parameters

| Parameter | Required | Description |
| --- | --- | --- |
| `start_date` | Yes | Start date for metrics in `YYYY-MM-DD` format. |
| `end_date` | Yes | End date for metrics in `YYYY-MM-DD` format. |
| `campaign_id` | No | Filters by campaign ID. |
| `campaign_name` | No | Filters campaigns by name. |
| `campaign_status` | No | Filters by campaign status. |
| `publisher_id` | No | Filters by publisher ID. |
| `publisher_name` | No | Filters by publisher name. |
| `ad_type` | No | Filters by ad type. |
| `ad_status` | No | Filters by ad status. |
| `seller_id` | No | Filters by seller ID. |
| `tag_id` | No | Filters by advertiser tag ID. |
| `targeting_type` | No | Filters by targeting type. |
| `sub_publisher_id` | No | Filters network rows by subpublisher ID. |
| `sub_publisher_name` | No | Filters network rows by subpublisher name. |
| `page` | No | Page number of the results. Default: `1`. |
| `quantity` | No | Number of items per page. Default: `100`. When `download=true`, the BFF requests up to `20000` rows for XLSX generation. |
| `count` | No | If `true`, returns pagination metadata. Default: `true`. |
| `order_by` | No | Field for sorting results. Possible values include `advertiser_name`, `name`, `ad_type`, `status`, `sub_publisher_name`, `daily_budget`, `impressions`, `views`, `clicks`, `ctr`, `total_spent`, `conversions`, `conversion_rate`, `income`, `roas`, `created_at`, `start_at`. |
| `order_direction` | No | Sort direction. Possible values: `asc` or `desc`. |
| `download` | No | If `true`, returns an XLSX file instead of JSON. |

## Notes

- This route is intended for advertiser accounts.
- In the BFF flow, `advertiser_id` is derived from the authenticated advertiser context.
- For non white-label accounts, only non-private publisher rows are returned.
- XLSX exports include `Subpublisher ID` and `Subpublisher` columns when network rows are present.

## JSON Response Example

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
      "publisher_id": "publisher-id",
      "publisher_name": "Publisher Name",
      "advertiser_name": "Advertiser Name",
      "sub_publisher_id": "subpublisher-id",
      "sub_publisher_name": "Subpublisher Name",
      "active": true,
      "daily_budget": "10000.00",
      "consumed_budget": "1750.0000",
      "pending": [],
      "metrics": {
        "clicks": 39,
        "conversions": 4,
        "total_conversions_items_quantity": 7,
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
