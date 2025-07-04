## 5. Data Export

Data export allows you to receive detailed information about events and aggregated data systematically and periodically. The integration occurs through an S3 connection, and the data is delivered in specific formats for each type of export.

### Integration Connection

The integration will always occur using an S3 (or compatible) connection that must be provided by the data recipient. The credentials must be passed to the Newtail team securely.

The integration is compatible with:

*   **AWS S3:** `Access Key Id` and `Access Key Secret`.
*   **Google Cloud Storage:** `Service Account`.
*   **Azure Blob Storage**.

### Event Export

Event export sends raw data of user interactions.

*   **Format:** `PARQUET` with `Snappy` compression.
*   **Frequency:** Daily (D-1 data).
*   **Folder Structure:** `TYPE_REPORT/YYYY/MM/DD/TIMESTAMP_NS/RANDOM_FILE_NAMES.snappy.parquet`
*   **De-duplication:** It is guaranteed that all events will be sent, but not that they will be sent only once. Therefore, events must always be de-duplicated using the `event_id` or the combination of `order_id` and `product_sku` for conversion items.

#### Event Types

*   **Impressions, Views, and Clicks:**
    *   **Fields:** `event_id` (de-duplication key), `session_id`, `user_id`, `ad_id`, `campaign_id`, `request_id`, `ad_type`, `placement_name`, `context`, `created_at`, `site`.
*   **Conversions:**
    *   **Fields:** `event_id`, `session_id`, `user_id`, `order_id` (de-duplication key), `channel`, `placed_at`, `site`.
*   **Conversion Items:**
    *   **Fields:** `event_id`, `session_id`, `user_id`, `order_id` (de-duplication key), `product_sku` (de-duplication key), `ad_id`, `campaign_id`, `request_id`, `ad_size`, `ad_type`, `placement_name`, `context`, `event_created_at`, `price`, `promotional_price`, `quantity`, `total_value`.

### Aggregated Data Export

Aggregated data export sends consolidated reports.

*   **Format:** `CSV` with `UTF-8` encoding, comma-separated, and numbers in American format (decimal point).
*   **Frequency:** Daily (D-1 data, with the publisher's timezone).
*   **Folder Structure:** `TYPE_REPORT/YYYY/MM/DD/TIMESTAMP_NS/RANDOM_FILE_NAMES.csv`

#### Report Types

*   **Advertisers:**
    *   **Fields:** `advertiser`, `advertiser_id`, `seller_id`, `wallet_balance`, `daily_budget`, `currency`.
*   **Campaigns:**
    *   **Fields:** `day`, `name`, `campaign_id`, `campaign_type`, `campaign_status`, `impressions_total`, `clicks_total`, `ctr`, `ad_revenue`, `conversions_total`, `conversion_rate`, `sales_revenue`, `start_date`, `end_date`, `advertiser_id`.
*   **Ads:**
    *   **Fields:** `day`, `ad_id`, `campaign_id`, `ad_status`, `ad_media_url`, `cpm`, `cpc`, `impressions_total`, `clicks_total`, `ctr`, `ad_revenue`, `conversions_total`, `conversion_rate`, `sales_revenue`, `product_sku`.

### Report Export via API

In addition to exporting via S3, it is possible to extract reports via the API. The routes return JSON by default, but can be exported as XLSX files by including the `download=true` parameter in the query.

*   `GET /report/v2/advertisers`: Advertiser information (publisher view).
*   `GET /report/v2/publishers`: Publisher information (advertiser view).
*   `GET /report/network/publishers`: Network publishers (for Network type accounts).
*   `GET /campaign/v2`: Campaign report.
*   `GET /ad/results/v2`: Ad report.