## 3. Authentication

Authentication is required for catalog submission, report consumption, and management. Other calls, such as ad queries and event notifications, are public and do not require authentication.

For protected endpoints, credentials must be sent via HTTP header. Request your credentials from your account manager.

| Attribute | Description |
| :--- | :--- |
| `x-app-id` | Your application's unique ID for the integration. |
| `x-api-key` | API key associated with your application. |
