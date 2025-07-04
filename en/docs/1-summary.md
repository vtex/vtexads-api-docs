## 1. Summary

This document details the integration with the **Retail Media API**, the central connection point between the VTEX Ads solution and the retailer's (publisher's) platform. The solution was developed under an **API-first** concept, ensuring total flexibility for retailers to integrate and display ads on any digital channel: e-commerce, marketplace, app, or even on physical totems and screens (Digital Signage).

Our architecture is **cookie-less**, meaning we do not rely on third-party cookies. Identification and targeting are based on proprietary identifiers (`user_id`, `session_id`) and first-party data, ensuring a robust solution that complies with new privacy policies and is prepared for the future of digital retail.

Through this REST API, your platform will be able to:
* Synchronize the product catalog and inventory.
* Request relevant ads in real-time for the user's Browse context.
* Send interaction events (impression, view, click, conversion) for performance measurement.
