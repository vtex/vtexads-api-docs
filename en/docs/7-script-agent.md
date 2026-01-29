# 7. VTEX Ads - Script Agent

## 7.1. Objective

This document details the procedure for installing the **VTEX Ads** tracking script on all pages of a website (except for checkout pages) using Google Tag Manager (GTM). The correct implementation of this script is essential for collecting browsing data that allows for the optimization and targeting of Retail Media campaigns.

## 7.2. Data Collected

The VTEX Ads script was developed to exclusively collect non-sensitive browsing data, with the aim of personalizing the user experience and optimizing campaigns.

**Data Collected:**

-   **For off-site campaigns:**
    -   `session_id`: Anonymous identifier for the browsing session.
    -   `ad_id`: Identifier of the ad that originated the traffic.
-   **For audience segmentation (Page View):**
    -   `session_id`: Anonymous identifier for the browsing session.
    -   **Page Information:** URL, title (`<title>`), and description (`<meta name="description">`).

> **Important:** The script **does not collect** any personally identifiable information (PII), such as name, email, CPF, phone number, address, or payment data. Data collection complies with major data protection laws.

## 7.3. Script Details

The script should be loaded asynchronously so as not to impact the page load time.

-   **Script URL:** `https://cdn.newtail.com.br/retail-media/scripts/vtexrma-agent.1.0.0.js`

## 7.4. Step-by-Step Guide for Implementation via Google Tag Manager (GTM)

To ensure the script runs as early as possible during page load, we recommend using the **Initialization** trigger.

### Step 7.4.1: Create the Custom HTML Tag

1.  Access your GTM container and go to the **"Tags"** section.
2.  Click **"New"** to create a new tag.
3.  Give the tag a clear name, for example: **"Custom HTML - VTEX Ads Agent"**.
4.  Click on **"Tag Configuration"** and select the **"Custom HTML"** tag type.
5.  In the HTML field, insert the following code:
    ```html
    <script type="text/javascript" async src="https://cdn.newtail.com.br/retail-media/scripts/vtexrma-agent.1.0.0.js"></script>
    ```

### Step 7.4.2: Configure the Main Trigger

1.  Below the tag configuration, click on **"Triggering"**.
2.  Select the **"Initialization - All Pages"** trigger. This trigger ensures that the script is fired before most other tags on all pages.

### Step 7.4.3: Create and Add a Trigger Exception

To prevent the script from running on checkout pages, we will create an exception.

1.  Still in the tag configuration, in the **"Triggering"** section, click **"Add Exception"**.
2.  Click the **"+"** icon in the upper right corner to create a new exception trigger.
3.  Give the trigger a name, for example: **"Trigger Exception - Checkout Pages"**.
4.  Click on **"Trigger Configuration"** and choose the **"Initialization"** type.
5.  Under **"This trigger fires on"**, select **"Some Initializations"**.
6.  Configure the condition to identify the checkout pages. The condition may vary depending on your site's URL structure. Common examples:
    -   `Page Path` | `contains` | `/checkout`
    -   `Page URL` | `matches RegEx (ignore case)` | `/checkout/|/orderPlaced/`
7.  Save the new exception trigger. It will be automatically added to your tag.

### Step 7.4.4: Save and Publish

1.  Save the newly created tag.
2.  Submit and publish the changes in your GTM container.

## 7.5. User Session Configuration

For the VTEX Ads platform to correctly correlate user interactions, it is necessary to inform which session identifier is used by your e-commerce.

**Action Required:**

The team responsible for the e-commerce must inform the VTEX Ads team of the **name of the attribute in the `cookie` or `sessionStorage`** that stores the user's session ID.

-   **Example:** If the session ID is stored in a cookie named `vtex_session`, this information must be passed on.

This configuration allows the script to read the correct identifier and associate it with browsing events.
