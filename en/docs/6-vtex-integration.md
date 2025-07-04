## 6. VTEX Integration (VTEX IO App)
For stores on the VTEX platform, Newtail offers a storefront app (`Newtail Media APP VTEX`) that drastically simplifies implementation. The app includes visual components and all the logic for ad queries and event notifications.

*   **Step 1: Catalog Synchronization**
    *   Synchronizing the product catalog is a prerequisite. It can be done in two ways:
        1.  **Via API:** By providing Newtail with API keys to read your catalog.
        2.  **Via XML:** By providing a link to a Google Shopping format XML feed, which must contain the `SKU` field for product identification.

*   **Step 2: App Installation**
    1.  **Add as Dependency:** In your theme's `manifest.json` file, add `"newtail.media": "0.x"` to the `peerDependencies`.
    2.  **Install the App:** Run the command `vtex install newtail.media@0.x` in your terminal.

*   **Step 3: Configuration**
    1.  **Publisher ID:** In your VTEX store's admin, go to `Store Settings > Newtail Media` and enter your `Publisher ID` provided by Newtail.
    2.  **Content Security Policy (CSP):** Add the following directives to your `policies.json`:
        ```json
        {
          "contentSecurityPolicy": {
            "default-src": ["'self'", "newtail-media.newtail.com.br"],
            "connect-src": ["'self'", "newtail-media.newtail.com.br"]
          }
        }
        ```

*   **Step 4: Using the Blocks**
    *   Declare the app's blocks in your theme's templates to display the ads.

    *   **Available Components:**
        *   `newtail-media-banner`: Renders sponsored banners.
        *   `newtail-media-shelf`: Renders a shelf of sponsored products.
        *   `newtail-media-search`: Adds "Sponsored" badges to products in search results.
        *   `newtail-media-conversion`: An essential component that manages the sending of conversion events. **Must be included on all pages.**