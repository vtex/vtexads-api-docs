## 5. Reports and Data Export

### 5.1. Export via API
REST endpoints to extract consolidated reports in JSON (or XLSX with `download=true`).

* `GET /report/v2/advertisers`: Performance by advertiser (publisher's view).
* `GET /report/v2/publishers`: Performance by publisher (advertiser's view).
* `GET /campaign/v2`: Detailed campaign report.
* `GET /ad/results/v2`: Performance report for individual ads.

### 5.2. Raw Data Export (via Storage)
We configure daily (D-1) data export to a bucket of your choice (AWS S3, Google Cloud Storage, Azure Blob).

* **Events (impressions, clicks, conversions):** `Parquet` + `Snappy` files. Deduplication using `event_id` is required.
* **Aggregated Data (campaign, advertiser reports):** `CSV` files.
