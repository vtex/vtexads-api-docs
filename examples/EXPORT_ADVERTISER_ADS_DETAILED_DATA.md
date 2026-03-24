# EXPORT ADVERTISER ADS DETAILED DATA - Reports Export Examples

This endpoint allows advertiser accounts to export a detailed ad report. It follows the ad-level view of `/ad/results/v2`, and for network campaigns it adds a subpublisher breakdown. Data is returned in JSON format by default, but can be exported as XLSX by including the `download=true` parameter in the query string.

## Request

```bash
curl --location 'https://api-retail-media.newtail.com.br/report/advertisers/ads-detailed?start_date=2026-03-01&end_date=2026-03-22&campaign_id=campaign-id&show_inactive=true&download=true' \
--header 'x-app-id: XXXX' \
--header 'x-api-key: YYYY' \
--header 'Content-Type: application/json'
```

## Query Parameters

| Parameter | Required | Description |
| --- | --- | --- |
| `start_date` | Yes | Start date for metrics in `YYYY-MM-DD` format. |
| `end_date` | Yes | End date for metrics in `YYYY-MM-DD` format. |
| `campaign_name` | No | Filters ads by campaign name. |
| `campaign_id` | No | Filters ads by campaign ID. |
| `publisher_id` | No | Filters ads by publisher ID. |
| `advertiser_id` | No | Filters ads by advertiser ID. In the BFF flow, this value is derived from the authenticated advertiser context. |
| `product_sku` | No | Filters ads by product SKU. |
| `ad_status` | No | Filters ads by status. |
| `ad_type` | No | Filters by ad type. |
| `targeting_type` | No | Filters by targeting type. |
| `tag_id` | No | Filters by advertiser tag ID. |
| `sub_publisher_id` | No | Filters network rows by subpublisher ID. |
| `sub_publisher_name` | No | Filters network rows by subpublisher name. |
| `show_inactive` | No | If `true`, includes paused ads. Default: `false`. |
| `hide_pending_rejected` | No | If `true`, excludes `pending_review` and `rejected` rows when `ad_status` is not provided. Default: `false`. |
| `page` | No | Page number of the results. Default: `1`. |
| `quantity` | No | Number of items per page. Default: `100`. When `download=true`, the BFF requests up to `20000` rows for XLSX generation. |
| `count` | No | If `true`, returns pagination metadata. Default: `true`. |
| `order_by` | No | Field for sorting results. Possible values include `ad_type`, `ad_status`, `impressions`, `conversion_rate`, `ctr`, `income`, `total_spent`, `roas`, `conversions`, `total_conversions_items_quantity`, `advertiser_name`, `campaign_name`, `clicks`, `adcost`, `created_at`, `sub_publisher_name`. |
| `order_direction` | No | Sort direction. Possible values: `asc` or `desc`. |
| `download` | No | If `true`, returns an XLSX file instead of JSON. |

## Notes

- This route is intended for advertiser accounts.
- Non-network campaigns return one row per ad.
- Network campaigns return one row per `ad + subpublisher`.
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
      "id": "ad-id",
      "campaign_id": "campaign-id",
      "url": "https://example.com/product",
      "status": "enabled",
      "active": true,
      "product_sku": "SKU-123",
      "campaign_name": "Campaign Name",
      "campaign_status": "running",
      "ad_type": "product",
      "publisher_id": "publisher-id",
      "publisher_name": "Publisher Name",
      "publisher_account_id": "publisher-account-id",
      "advertiser_id": "advertiser-id",
      "advertiser_name": "Advertiser Name",
      "advertiser_account_id": "advertiser-account-id",
      "sub_publisher_id": "subpublisher-id",
      "sub_publisher_name": "Subpublisher Name",
      "sub_publisher_account_id": "subpublisher-account-id",
      "metrics": {
        "clicks": "3",
        "conversions": "1",
        "total_conversions_items_quantity": "2",
        "impressions": "10691",
        "views": "0",
        "conversion_rate": "33.33",
        "ctr": "0.03",
        "roas": "2.64",
        "adcost": "37.87",
        "income": "818.00",
        "total_spent": "309.82000000",
        "ecpm": "28.98",
        "cpa": "309.82",
        "avg_cpc": "103.27",
        "avg_cpm": "28.98"
      }
    }
  ]
}
```
