## 5. Reports and Data Export

### 5.1. Export via API
REST endpoints to extract consolidated reports in JSON (or XLSX with `download=true`).

* `GET /report/v2/advertisers`: Performance by advertiser (publisher's view) [[Example]](../../examples/EXPORT_ADVERTISER_DATA.md)
* `GET /report/v2/publishers`: Performance by publisher (advertiser's view) [[Example]](../../examples/EXPORT_PUBLISHER_DATA.md)
* `GET /report/network/publishers`: Network Publishers (for Network type accounts) [[Example]](../../examples/EXPORT_NETWORK_PUBLISHERS_DATA.md)
* `GET /campaign/v2`: Detailed campaign report [[Example]](../../examples/EXPORT_CAMPAIGNS_LIST_DATA.md)
* `GET /campaign/:id`: Detailed campaign report [[Example]](../../examples/EXPORT_CAMPAIGN_DATA.md)
* `GET /ad/results/v2`: Performance report for individual ads [[Example]](../../examples/EXPORT_ADS_DATA.md)

### 5.2. Raw Data Export (via Storage)
We configure daily (D-1) data export to a bucket of your choice (AWS S3, Google Cloud Storage, Azure Blob).

* **Events (impressions, clicks, conversions):** `Parquet` + `Snappy` files. Deduplication using `event_id` is required.
* **Aggregated Data (campaign, advertiser reports):** `CSV` files.
