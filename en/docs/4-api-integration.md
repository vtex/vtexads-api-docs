## 4. Main Integration

The integration is based on three pillars that ensure the solution's functionality.

### Integration Pillars

1.  **Catalog:** Keep VTEX Ads synchronized with your product catalog and inventory (price and stock). Essential for product ads.
2.  **Ad Query:** Your platform requests from the API the ads that should be displayed on different pages and contexts.
3.  **Events:** Your platform notifies the API of all user interactions with the ads and, crucially, of conversions (sales).

### Ad Types

| Ad Type | API Type | Description |
| :--- | :--- |:------------------------------------------------|
| **Sponsored Products** | `product` | Ads for individual products. |
| **Display Banner** | `banner` | Visual ads (static image or video). |
| **Sponsored Brands** | `sponsored_brand` | Brand ads with a title, logo, and products. (static image or video) |
| **Digital Signage** | `digital_signage`| Content for physical screens and totems. |

### 4.1. Catalog

The first step is synchronization, which occurs on two fronts:

> **Note for VTEX stores:** For stores on the VTEX platform, catalog synchronization occurs transparently, with no additional integration required for this purpose.

#### **Product Synchronization**
Sends product registration information. Requires authentication.

* **Endpoint:** `POST https://api-retail-media.newtail.com.br/product/bulk/products`
* **Limits:** 500 products per request; 3 simultaneous requests.

| Field | Description | Type | Required? |
| :--- | :--- | :--- | :--- |
| `product_sku` | Unique product ID/SKU. | String | Yes |
| `parent_sku` | Parent product SKU (for variations). | String | No |
| `name` | Product name. | String | Yes |
| `url` | Canonical URL of the product page. | String | Yes |
| `image_url`| URL of the main product image. | String | No |
| `categories` | List of categories. | Array[String] | Yes |
| `brand` | Product brand. | String | No |
| `gtins` | Barcodes (EAN). **Required for campaigns on the VTEX Ads Network.**| Array[String] | No/Yes |
| `tags` | "Tags" to contextualize searches. Max 10 per SKU, 64 chars per tag. Only for `product` campaigns. | Array[String] | No |
| `sellers` | List of sellers who sell the product (in a marketplace). | Array[String] | No |
| `metadata` | Object for additional information (key-value). | Object | No |

**Request Example:**

```bash
curl --location 'https://api-retail-media.newtail.com.br/product/bulk/products' \
--header 'x-app-id: XXXX' \
--header 'x-api-key: YYYY' \
--header 'Content-Type: application/json' \
--data '[
    {
        "product_sku": "allan",
        "name": "allan",
        "url": "https://www.panvel.com/panvel/eau-de-dali-salvador-dali-eau-de-toilette-perfume-feminino-30ml/p-10007616",
        "image_url": "https://panvelprd.vteximg.com.br/arquivos/ids/177629",
        "categories": [
            "Beauty",
            "Beauty > Fragrances",
            "Beauty > Fragrances > Perfume",
            "Beauty > Fragrances > Perfume > For Women"
        ],
        "brand": "SALVADOR DALÍ",
        "profit_margin": null,
        "gtins": [
            "3331438450103"
        ],
        "sellers": [],
        "skus": []
    },
    {
        "product_sku": "allan2",
        "name": "allan2",
        "url": "https://www.panvel.com/panvel/eau-de-dali-salvador-dali-eau-de-toilette-perfume-feminino-30ml/p-10007616",
        "image_url": "https://panvelprd.vteximg.com.br/arquivos/ids/177629",
        "categories": [
            "Beauty",
            "Beauty > Fragrances",
            "Beauty > Fragrances > Perfume",
            "Beauty > Fragrances > Perfume > For Women"
        ],
        "brand": "SALVADOR DALÍ",
        "profit_margin": null,
        "gtins": [
            "3331438450103"
        ],
        "sellers": [],
        "skus": [],
        "tags": ["Abart", "Mega Maio"]
    }
]'
```

**Success Response Example:**

```
Status: 202 Accepted
Content-Type: application/json

{
    "messages": [
        "products will be processed soon"
    ]
}
```

**Error Response Example:**

For validations, we use the format of [RFC 8927](https://datatracker.ietf.org/doc/rfc8927/).
The request response will have HTTP code 422.

```
Status: 422 Unprocessable Entity
Content-Type: application/json

[
  {
    instancePath: '/0',
    schemaPath: '#/items/required',
    keyword: 'required',
    params: { missingProperty: 'product_sku' },
    message: "must have required property 'product_sku'",
  },
  {
    instancePath: '/0',
    schemaPath: '#/items/required',
    keyword: 'required',
    params: { missingProperty: 'url' },
    message: "must have required property 'url'",
  },
  {
    instancePath: '/0',
    schemaPath: '#/items/required',
    keyword: 'required',
    params: { missingProperty: 'image_url' },
    message: "must have required property 'image_url'",
  },
  {
    instancePath: '/1',
    schemaPath: '#/items/required',
    keyword: 'required',
    params: { missingProperty: 'name' },
    message: "must have required property 'name'",
  },
  {
    instancePath: '/1',
    schemaPath: '#/items/required',
    keyword: 'required',
    params: { missingProperty: 'url' },
    message: "must have required property 'url'",
  },
  {
    instancePath: '/1',
    schemaPath: '#/items/required',
    keyword: 'required',
    params: { missingProperty: 'image_url' },
    message: "must have required property 'image_url'",
  },
]
```

#### **Inventory Synchronization**
Updates price, promotional price, and availability. Requires authentication.

* **Endpoint:** `POST https://api-retail-media.newtail.com.br/product/bulk/inventories`
* **Limits:** Identical to product synchronization.

> **Note:** If inventory is not sent, all products will be considered always available.

| Field | Description | Type | Required? |
| :--- | :--- | :--- | :--- |
| `product_sku` | ID/SKU of the product to be updated. | String | Yes |
| `store_id` | Physical store/DC ID. If null, applies to all. | String | No |
| `price` | Product's "list" price. | Number | Yes |
| `promotional_price`| "Sale" price. Send 0 to remove. | Number | Yes |
| `is_available` | Indicates if the product is available (`true`/`false`). | Boolean | Yes |

**Request Example:**

```bash
curl --location 'https://api-retail-media.newtail.com.br/product/bulk/inventories' \
--header 'x-app-id: XXXX' \
--header 'x-api-key: YYYY' \
--header 'Content-Type: application/json' \
--data '[
    {
        "product_sku": "allan",
        "price": 129.90,
        "promotional_price": 99.90,
        "is_available": true
    },
    {
        "product_sku": "allan2",
        "store_id": "store-downtown",
        "price": 149.90,
        "promotional_price": 119.90,
        "is_available": true
    }
]'
```

#### **Alternative Catalog Integration Methods**

In addition to the REST API, we offer other ways to integrate the catalog:

* **Client's Elasticsearch:** We can connect directly to your Elasticsearch instance.
* **Algolia:** Integration with your existing Algolia account.
* **Google XML:** Support for the standard Google Shopping XML format.

> **Important:** Regardless of the chosen method, all mandatory catalog information must be available in the data source.

### 4.2. Ad Query

With the catalog synchronized, your platform requests ads to fill the ad spaces (`placements`). The request is a `POST` and the `publisher_id` must be provided in the URL.

* **Endpoint:** `POST https://newtail-media.newtail.com.br/v1/rma/:publisher_id`
* **Content-Type:** All requests must include the `Content-Type: application/json` header.

#### **Request Parameters**

| Field | Description | Type | Required? |
| :--- | :--- | :--- | :--- |
| `session_id` | Unique user session ID (alphanumeric). | String | Yes |
| `user_id` | Unique ID of the logged-in user (alphanumeric). | String | No |
| `store_id` | Filters ads by a specific store's stock. | String | No |
| `channel` | Access channel: `site`, `msite`, `app`. | String | Yes |
| `context` | Context: `home`, `category`, `search`, `product_page`, `brand_page`, `digital_signage`.| String | Yes |
| `term` | Term searched by the user. | String | Only `context: 'search'` |
| `category_name` | Browsed category (full breadcrumb).| String | Only `context: 'category'`|
| `product_sku` | SKU of the product being viewed. | String | Only `context: 'product_page'` |
| `brand_name` | Name of the brand being viewed. | String | Only `context: 'brand_page'` |
| `device_id` | Unique device ID (screen, totem). | String | Only `context: 'digital_signage'` |
| `store_name` | Name of the store where the device is located. | String | Only `context: 'digital_signage'` |
| `placements` | Object defining the ad `placements`. | Object | Yes |
| `placements.{name}.quantity` | Desired number of ads. | Integer | Yes |
| `placements.{name}.size` | Expected size (e.g., `desktop`). | String | Only `types: ['banner', 'sponsored_brand']` |
| `placements.{name}.types` | Allowed types (`product`, `banner`, etc.). | Array[String] | Yes |
| `placements.{name}.assets_type`| Accepted media (`image`, `video`). Default: `["image"]`. | Array[String] | Only `types: ['banner', 'sponsored_brand']` |
| `userAgent` | Client environment identification string. | String | No |
| `segmentation` | Data for real-time targeting. | Array[Object] | No |

#### **Query Response**
The response is a JSON where each key is a `placement` name. For ads of type `sponsored_brand` and `digital_signage`, the internal structure varies (see specific sections).

| Field in Response (`product`, `banner`) | Description |
| :--- | :--- |
| `{placementName}.#.ad_id` | Unique ad ID. |
| `{placementName}.#.type` | Ad type (`banner`, `product`). |
| `{placementName}.#.media_url`| URL of the image or video to be displayed. |
| `{placementName}.#.click_url`| **URL to notify the click event.** |
| `{placementName}.#.impression_url`| **URL to notify the impression event.**|
| `{placementName}.#.view_url` | **URL to notify the view event.** |
| `{placementName}.#.product_sku`| SKU (for ads of type `product`). |

### 4.3. Events

Event notification is **crucial** for attribution and measurement.

#### Best Practices

* **HTTP Persistence:** Use persistent HTTP connections (`Connection: keep-alive` in the header) to optimize performance.
* **Timeout:** Implement a timeout of 500-600ms on ad query calls to avoid harming the user experience.
* **Placement Naming:** Adopt a clear standard, such as `{channel}_{context}_{position}_{type}` (e.g., `msite_search_top-shelf_product`).

#### **User and Session Identification**

* **`session_id`:** User session ID. Required in all events. Must be consistent throughout the Browse session.
* **`user_id`:** Unique customer ID on the platform, consistent across channels. Required in the conversion event.

#### **Impression, View, and Click Notification**

Send a `POST` request to the respective event URL (`impression_url`, `view_url`, `click_url`) provided in the ad query, with a JSON body containing `user_id` and `session_id`.

* **Content-Type:** All requests must include the `Content-Type: application/json` header.
* **Recommended Method (Browser):** Use `navigator.sendBeacon()` to ensure asynchronous sending without blocking navigation.
* **Success Response:** `HTTP 202 Accepted`.

#### **Conversion Notification**

When a purchase is completed, send the order data.

* **Endpoint:** `POST https://events.newtail-media.newtail.com.br/v1/beacon/conversion`
* **Content-Type:** All requests must include the `Content-Type: application/json` header.
* **Request Body:** The object must contain the order data. The item price should not be multiplied by the quantity.

| Order Field | Description | Type | Required? |
| :--- | :--- | :--- | :--- |
| `publisher_id` | Publisher ID. | String | Yes |
| `user_id` | ID of the user who made the purchase. | String | Yes |
| `session_id` | Session ID of the purchase. | String | Yes |
| `order_id` | Order ID. | String | Yes |
| `email_hashed` | User's email in hash format (SHA256). | String | Yes |
| `created_at` | Order date/time (ISO 8601 in UTC). | String | Yes |
| `items` | List of order items. | Array[Item] | Yes |
| `phone_hashed`| User's phone in hash (SHA256). | String | No (Recommended) |
| `social_id_hashed`| User's Tax ID (CPF/CNPJ) in hash (SHA256). | String | No (Recommended) |

#### **Attribution and Deduplication Rules**

* **Conversion Window:** The period after an interaction during which a sale can be attributed to the ad.
    * **Click (for `product`):** 14 days.
    * **View (for `display`/`video`):** 14 days.
* **Event Deduplication:** For the same user and ad, events are ignored for a period.
    * **Impressions:** 1 minute.
    * **Clicks:** 1 hour.
    * **Conversions:** Are not deduplicated (unless the same `order_id` is sent again within 30 days).

### 4.4. Ad Targeting

Target ads to specific audiences to increase relevance.

#### **Real-Time Targeting**
Send demographic or audience data directly in the body of the **ad query**, in the `segmentation` field.

The `segmentation` field is an array of objects, where each object contains:
- `key`: The type of segmentation (e.g., "STATE", "CITY", "GENDER")
- `values`: Array of values for the segmentation

**Segmentation Example:**

```json
"segmentation": [
    {
        "key": "STATE",
        "values": [
            "CA"
        ]
    },
    {
        "key": "CITY",
        "values": [
            "San Francisco"
        ]
    },
    {
        "key": "NEIGHBOURHOOD",
        "values": [
            "Mission District",
            "SoMa"
        ]
    }
]
```

**Available Segmentation Types:**

| Key | Description | Example Values |
| :--- | :--- | :--- |
| `STATE` | User's state | "CA", "NY", "TX" |
| `CITY` | User's city | "San Francisco", "New York" |
| `NEIGHBOURHOOD` | User's neighborhood | "Mission District", "Manhattan" |
| `GENDER` | User's gender | "M", "F" |
| `AGE_RANGE` | User's age range | "18-24", "25-34", "35-44" |
| `INCOME_RANGE` | Income bracket | "A", "B1", "B2", "C1", "C2", "DE" |
| `INTEREST` | User's interests | "Sports", "Technology", "Fashion" |
| `CUSTOM_AUDIENCE` | Custom audience | "high_value_customers", "cart_abandoners" |

#### **Audience Data Submission (Batch)**
To create persistent audiences associated with a `user_id`, send data files to an S3 bucket.

* **Format:** `Parquet` with `Snappy` compression.
* **Security (Hashing):** PII data (email, Tax ID, phone, name) must be encrypted with **SHA256** after cleaning (no spaces, lowercase) and normalization (phone in E.164 standard, e.g., `+14155552671`).
* **Attributes:** `CUSTOMER_ID`, `EMAIL_HASHED`, `PHONE_HASHED`, `SOCIAL_ID_HASHED`, `GENDER`, `AGE`, `CITY`, `STATE`, `AUDIENCES`, `NBO_CATEGORIES` (purchase intent categories), etc.


