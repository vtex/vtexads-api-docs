## 3. Authentication

> [!IMPORTANT]
> **This page has moved.**
>
> The VTEX Ads API documentation is now part of the official VTEX Developers Portal: [VTEX Ads API on developers.vtex.com](https://developers.vtex.com/docs/api-reference/vtex-ads-api).
>
> Please update your bookmarks. This page is no longer maintained.

Authentication is required for catalog submission, report consumption, and management. Other calls, such as ad queries and event notifications, are public and do not require authentication.

For protected endpoints, credentials must be sent via HTTP header. Request your credentials from your account manager.

| Attribute | Description |
| :--- | :--- |
| `x-app-id` | Your application's unique ID for the integration. |
| `x-api-key` | API key associated with your application. |
