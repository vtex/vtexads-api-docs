## 4. Main Integration

The integration is based on three pillars that ensure the solution's functionality.

### Integration Pillars

1.  **[Catalog](./4.1-catalog-synchronization.md):** Keep VTEX Ads synchronized with your product catalog and inventory (price and stock). Essential for product ads.
2.  **[Ad Query](./4.2-ad-query.md):** Your platform requests from the API the ads that should be displayed on different pages and contexts.
3.  **[Events](./4.3-events.md):** Your platform notifies the API of all user interactions with the ads and, crucially, of conversions (sales).

### Ad Types

| Ad Type | API Type | Description |
| :--- | :--- |:------------------------------------------------|
| **Sponsored Products** | `product` | Ads for individual products. |
| **Display Banner** | `banner` | Visual ads (static image or video). |
| **Sponsored Brands** | `sponsored_brand` | Brand ads with a title, logo, and products. (static image or video) |
| **Digital Signage** | `digital_signage`| Content for physical screens and totems. |

### Ad Targeting

Target ads to specific audiences to increase relevance. See more in [Ad Targeting](./4.4-ad-targeting.md).


