## 6. Other Integrations

### 6.1. Marketplace Integration
We offer a set of APIs for full integration with Marketplace platforms.

* **Authentication:** Mutual, with the Marketplace using Basic Auth to receive calls from Newtail, and Newtail using `x-app-id`/`x-api-key` to receive calls from the Marketplace.
* **Catalog API:** The Marketplace must expose a `GET /search` endpoint so Newtail can query products by `seller_id`, `name`, `skus`, etc.
* **Management APIs:** Newtail exposes endpoints for the Marketplace to manage Advertisers (`/api/v1/advertisers`), Campaigns (`/api/v1/campaigns`), Metrics (`/api/v1/metrics`), and Credits (`/api/v1/checking_accounts`).




### 6.3. Integration via Agent
An alternative implementation via script. It consists of including a script in the HTML and adding a `<newtailad>` tag where the ad should be displayed.

### 6.4. Digital Signage Integration
Use the same ad query API with `context: 'digital_signage'` and the mandatory `device_id`.

* **Generic Screens:** Request ads without identifying a user.
* **Screens with Identified User (POS):** Send the `user_id` to receive personalized ads.
* **Response:** The response for `digital_signage` contains an array of `assets` with `url`, `type`, and `duration`, in addition to the `impression_url`.
