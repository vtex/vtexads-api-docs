# Attribution Window and Conversion Models

This document details the rules, models, and timelines that govern the attribution of conversions (sales) and the billing of advertising campaigns on our platform.

## 1. What is the Attribution Window?

The "attribution window" (or conversion window) is the time period _after_ a user interacts with an ad (either by clicking or viewing) during which a conversion can be credited to that ad.

- **Default Window:** 14 days.
- **Flexibility:** This period is the default for all campaigns, but can be customized according to strategic needs.

**Example:** If a user clicks on an ad today, any purchase they make of the associated product in the next 14 days can be attributed to that ad.

## 2. Measurement (Attribution) vs. Billing (Invoicing)

It is essential to differentiate the event that _measures_ attribution (what we use to count a conversion) from the event that _generates billing_ (what we charge the advertiser).

### 2.1. Measurement Events (Attribution)

This defines _how_ we know that an ad "worked" to generate a sale:

- **Product Campaigns (Product Ads):**
  - **Event:** Click.
  - **Logic:** The conversion is only counted if the user _clicked_ on the ad before purchasing.

- **Other Campaigns (Banner, Video, and Sponsored Brands):**
  - **Event:** View (Impression).
  - **Logic:** The conversion can be counted even if the user only _saw_ the ad (and did not necessarily click), following the hierarchy rules (see section 3).

### 2.2. Billing Models (Invoicing)

This defines _what_ the advertiser pays for:

- **CPC (Cost Per Click):** The advertiser pays each time a user clicks on the ad.
  - _Used in:_ Product Campaigns, Sponsored Brands.

- **CPM (Cost Per Thousand Impressions):** The advertiser pays a fixed amount for every 1,000 times the ad is displayed.
  - _Used in:_ Banner, Video, Sponsored Brands.

- **Hybrid Model (CPC + CPM):**
  - **Sponsored Brands** campaigns are unique, as they charge for _both_ clicks (CPC) and impressions (CPM) generated.

#### Billing Calculation Example (CPM)

CPM defines the value for 1,000 impressions, but the actual charge is proportional to each individual impression.

- **Scenario:** A video campaign has a CPM of **$10.00**.
- **Result:** The campaign generates **10 impressions**.

**Calculation:**

1. **Cost per individual impression:** $10.00 (CPM) / 1,000 (impressions) = **$0.01 per impression**.
2. **Total Cost:** 10 (impressions generated) * $0.01 (cost per impression) = **$0.10**.

The total cost of this campaign would be **ten cents**.

## 3. Attribution Rules (The Decision Hierarchy)

When a user interacts with multiple ads before purchasing, an attribution model decides which campaign will receive credit for the sale.

**Fundamental Principle:** Attribution is exclusive. A sold order is **never** attributed to two different campaigns; credit is always given to a single campaign.

The decision follows this priority order:

1. **Priority 1: Offsite Campaigns**
   - If there is an active _offsite_ campaign (bringing external traffic to the site) and it was the user's last point of contact, it will have total preference in the sale attribution.

2. **Priority 2: Last Click**
   - In the absence of a recent offsite click, the system looks for the _last ad_ (within the platform) that the user _clicked_ within the 14-day window.

3. **Priority 3: Last View**
   - If the user did not click on any ad during the period, the system attributes the sale to the _last ad_ they _viewed_ (as long as it is a campaign type that measures by view, such as Banner or Video).

**Time Rule:** For a conversion to be valid, the interaction event (click or view) must have occurred _before_ the order was finalized.

## 4. Product Mapping in Attribution

A campaign can only receive attribution for products that are _explicitly linked to it_.

### 4.1. Product Campaigns (1:1 Attribution)

- **How it works:** Each ad (AD) within the campaign represents a specific product.
- **Logic:** Attribution is direct and 1-to-1. A click on the "Product A" ad can only generate a conversion for "Product A".

### 4.2. Other Campaigns (Banner, Video, etc.) (N:1 Attribution)

- **How it works:** These campaigns have a _list_ of associated products (SKUs).
- **Logic:** Interaction (click or view) with a single creative (banner or video) can generate attribution for _any_ of the products contained in that campaign list.

**Note on Creatives:** Within a campaign (e.g., Banner), each creative (e.g., "Banner A" and "Banner B") tracks its information independently. This allows analysis of the individual performance of each ad piece.

## 5. Data Latency (Attribution Delay)

It is important to note that there is a natural delay between the moment the customer creates the order and the moment that sale is associated (attributed) to the correct campaign in the reports.

- **API Integration:** Delay of approximately **30 minutes**.
- **VTEX Platform:** Delay of up to **2 hours**.
